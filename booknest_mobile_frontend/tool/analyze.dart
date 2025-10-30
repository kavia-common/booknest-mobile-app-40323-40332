import 'dart:io';

/// PUBLIC_INTERFACE
/// tool/analyze.dart — Canonical analyzer entrypoint to run within the Flutter app root.
/// Usage (from app root):
///   dart run tool/analyze.dart
/// It will run `flutter pub get` and `flutter analyze`.
Future<void> main() async {
  final here = Directory.current.path;
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('[tool/analyze.dart] Not in Flutter app root (pubspec.yaml missing at $here).');
    stderr.writeln('cd booknest-mobile-app-40323-40332/booknest_mobile_frontend and re-run.');
    exit(2);
  }

  if (await Process.run('which', ['flutter']).then((p) => p.exitCode != 0)) {
    stderr.writeln('[tool/analyze.dart] Flutter SDK not on PATH');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(
      cmd,
      args,
      mode: ProcessStartMode.inheritStdio,
      workingDirectory: here,
    );
    return p.exitCode;
  }

  stdout.writeln('[tool/analyze.dart] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[tool/analyze.dart] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
