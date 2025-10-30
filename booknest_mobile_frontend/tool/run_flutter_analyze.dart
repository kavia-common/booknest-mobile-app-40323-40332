import 'dart:io';

/// PUBLIC_INTERFACE
/// Runs `flutter pub get` and `flutter analyze` from the app root.
/// Use this when CI cannot reliably set working directory.
Future<void> main() async {
  final appDir = Directory.current;
  final pubspec = File('${appDir.path}/pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('[tool/run_flutter_analyze.dart] ERROR: pubspec.yaml not found in ${appDir.path}');
    exit(2);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(cmd, args, mode: ProcessStartMode.inheritStdio, workingDirectory: appDir.path);
    return p.exitCode;
  }

  stdout.writeln('[tool/run_flutter_analyze.dart] flutter pub get');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[tool/run_flutter_analyze.dart] flutter analyze');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
