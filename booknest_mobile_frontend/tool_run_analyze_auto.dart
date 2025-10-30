import 'dart:io';

/// PUBLIC_INTERFACE
/// Discovers the nested Flutter project root automatically by scanning
/// subdirectories for a pubspec.yaml that declares a Flutter SDK dependency,
/// then runs `flutter pub get` and `flutter analyze` in that directory.
/// This avoids relying on CI working-directory assumptions.
///
/// Exit codes:
///  2 - No Flutter project found
///  127 - Flutter not on PATH
Future<void> main() async {
  final start = Directory.current;
  final flutter = await Process.run('which', ['flutter']);
  if (flutter.exitCode != 0) {
    stderr.writeln('[tool_run_analyze_auto] FATAL: Flutter SDK not on PATH');
    exit(127);
  }

  Directory? projectRoot;

  // Quick check: is current directory a Flutter project?
  if (await _looksLikeFlutterProject(start)) {
    projectRoot = start;
  }

  // Otherwise, scan depth-2 for a Flutter project (covers nested app folders).
  projectRoot ??= await _scanForFlutterProject(start, maxDepth: 3);

  if (projectRoot == null) {
    stderr.writeln('[tool_run_analyze_auto] FATAL: Could not determine project root directory for Flutter project');
    stderr.writeln('Hint: Ensure your Flutter app directory contains pubspec.yaml with `flutter:` sdk.');
    exit(2);
  }

  stdout.writeln('[tool_run_analyze_auto] Found Flutter project at: ${projectRoot.path}');

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(
      cmd,
      args,
      workingDirectory: projectRoot!.path,
      mode: ProcessStartMode.inheritStdio,
    );
    return p.exitCode;
  }

  stdout.writeln('[tool_run_analyze_auto] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) {
    exit(getCode);
  }

  stdout.writeln('[tool_run_analyze_auto] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}

Future<bool> _looksLikeFlutterProject(Directory dir) async {
  final pubspec = File('${dir.path}/pubspec.yaml');
  if (!pubspec.existsSync()) return false;
  try {
    final content = await pubspec.readAsString();
    return content.contains('\nflutter:\n') || content.contains('sdk: flutter');
  } catch (_) {
    return false;
  }
}

Future<Directory?> _scanForFlutterProject(Directory root, {int maxDepth = 2}) async {
  Directory? found;

  Future<void> walk(Directory dir, int depth) async {
    if (found != null || depth > maxDepth) return;
    if (await _looksLikeFlutterProject(dir)) {
      found = dir;
      return;
    }
    try {
      await for (final entity in dir.list(followLinks: false)) {
        if (found != null) return;
        if (entity is Directory) {
          // Skip hidden/system & build dirs
          final name = entity.uri.pathSegments.isNotEmpty ? entity.uri.pathSegments.last : '';
          if (name.startsWith('.') || name == 'build' || name == '.dart_tool' || name == '.git') continue;
          await walk(entity, depth + 1);
        }
      }
    } catch (_) {
      // Ignore permission or IO errors during scan
    }
  }

  await walk(root, 0);
  return found;
}
