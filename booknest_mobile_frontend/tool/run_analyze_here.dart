import 'dart:io';

/// PUBLIC_INTERFACE
/// Run from the Flutter app root:
///   dart run tool/run_analyze_here.dart
/// This will execute `flutter pub get` and `flutter analyze` in this directory.
Future<void> main() async {
  if (!File('pubspec.yaml').existsSync()) {
    stderr.writeln('[run_analyze_here] Not in Flutter app root.');
    exit(2);
  }
  final hasFlutter = await Process.run('which', ['flutter']).then((p) => p.exitCode == 0);
  if (!hasFlutter) {
    stderr.writeln('[run_analyze_here] Flutter SDK not on PATH');
    exit(127);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(cmd, args, mode: ProcessStartMode.inheritStdio);
    return p.exitCode;
  }

  stdout.writeln('[run_analyze_here] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[run_analyze_here] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
