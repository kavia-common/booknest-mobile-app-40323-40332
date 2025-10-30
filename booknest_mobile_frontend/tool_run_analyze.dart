import 'dart:io';

/// PUBLIC_INTERFACE
/// A repo-root Dart entry that runs `flutter pub get` and `flutter analyze`
/// within the nested Flutter app directory. Useful for CI systems that run
/// `dart run` from the repository root.
Future<void> main() async {
  const appDir = 'booknest-mobile-app-40323-40332/booknest_mobile_frontend';
  final pubspec = File('$appDir/pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('[tool_run_analyze] FATAL: Missing $appDir/pubspec.yaml');
    exit(2);
  }

  if (await Process.run('which', ['flutter']).then((p) => p.exitCode != 0)) {
    stderr.writeln('[tool_run_analyze] FATAL: Flutter SDK not on PATH');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(cmd, args,
        mode: ProcessStartMode.inheritStdio, workingDirectory: appDir);
    return p.exitCode;
  }

  stdout.writeln('[tool_run_analyze] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[tool_run_analyze] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
