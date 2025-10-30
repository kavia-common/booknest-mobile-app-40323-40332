import 'dart:io';

/// PUBLIC_INTERFACE
/// bin/analyze.dart — Runs `flutter pub get` and `flutter analyze` from this
/// Flutter project root. Use: `dart run bin/analyze.dart`.
Future<void> main() async {
  // Verify we are in the Flutter app root by ensuring pubspec.yaml exists here.
  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('[bin/analyze.dart] Not in Flutter app root (pubspec.yaml missing).');
    stderr.writeln('cd booknest-mobile-app-40323-40332/booknest_mobile_frontend and re-run.');
    exit(2);
  }

  if (await Process.run('which', ['flutter']).then((p) => p.exitCode != 0)) {
    stderr.writeln('[bin/analyze.dart] Flutter not on PATH');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(
      cmd,
      args,
      mode: ProcessStartMode.inheritStdio,
      workingDirectory: Directory.current.path,
    );
    return p.exitCode;
  }

  stdout.writeln('[bin/analyze.dart] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[bin/analyze.dart] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
