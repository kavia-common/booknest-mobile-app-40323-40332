import 'dart:io';

/// PUBLIC_INTERFACE
/// Dispatches analysis by invoking the nested app's tool/run_flutter_analyze.dart
/// Ensures the working directory is set to the nested Flutter app before running.
Future<void> main() async {
  final appPath = 'booknest-mobile-app-40323-40332/booknest_mobile_frontend';
  final toolPath = '$appPath/tool/run_flutter_analyze.dart';

  if (!File(toolPath).existsSync()) {
    stderr.writeln('[dispatch_analyze.dart] Tool not found at $toolPath');
    exit(2);
  }

  // Use the current Dart executable to run the tool in the app directory
  final proc = await Process.start(
    Platform.resolvedExecutable,
    [toolPath],
    workingDirectory: appPath,
    mode: ProcessStartMode.inheritStdio,
  );
  final code = await proc.exitCode;
  exit(code);
}
