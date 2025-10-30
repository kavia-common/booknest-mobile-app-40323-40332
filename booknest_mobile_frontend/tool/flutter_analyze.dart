import 'dart:io';

/// PUBLIC_INTERFACE
/// Runs `flutter pub get` and `flutter analyze` from the Flutter app root.
/// Exit codes:
///  2 - pubspec/lib missing
///  127 - flutter not on PATH
///  other - pass-through from flutter commands.
Future<void> main() async {
  final cwd = Directory.current;
  final pubspec = File('pubspec.yaml');
  final lib = Directory('lib');

  if (!pubspec.existsSync() || !lib.existsSync()) {
    stderr.writeln('[tool/flutter_analyze.dart] Not in Flutter app root (missing pubspec.yaml or lib/).');
    stderr.writeln('cd booknest-mobile-app-40323-40332/booknest_mobile_frontend then re-run.');
    exit(2);
  }

  if (await Process.run('which', ['flutter']).then((p) => p.exitCode != 0)) {
    stderr.writeln('[tool/flutter_analyze.dart] Flutter not on PATH. Install Flutter or run repo-root: bash run_ci.sh');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(cmd, args, mode: ProcessStartMode.inheritStdio, workingDirectory: cwd.path);
    return p.exitCode;
  }

  stdout.writeln('[tool/flutter_analyze.dart] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[tool/flutter_analyze.dart] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
