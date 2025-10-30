import 'dart:io';

/// PUBLIC_INTERFACE
/// Runs `flutter pub get` and `flutter analyze` in the nested Flutter app.
/// Execute from repository root:
///   dart run ci_flutter_analyze.dart
Future<void> main() async {
  final repoRoot = Directory.current.absolute.path;
  final appDirPath = '$repoRoot/booknest-mobile-app-40323-40332/booknest_mobile_frontend';
  final pubspec = File('$appDirPath/pubspec.yaml');

  if (!pubspec.existsSync()) {
    stderr.writeln('[ci_flutter_analyze.dart] FATAL: pubspec.yaml not found at $appDirPath');
    exit(2);
  }

  if (await Process.run('which', ['flutter']).then((p) => p.exitCode != 0)) {
    stderr.writeln('[ci_flutter_analyze.dart] FATAL: Flutter SDK not on PATH');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(cmd, args,
        workingDirectory: appDirPath, mode: ProcessStartMode.inheritStdio);
    return p.exitCode;
  }

  stdout.writeln('[ci_flutter_analyze.dart] flutter pub get in $appDirPath');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[ci_flutter_analyze.dart] flutter analyze in $appDirPath');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
