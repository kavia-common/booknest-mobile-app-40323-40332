import 'dart:io';

/// PUBLIC_INTERFACE
/// Delegates analysis to tool/analyze.dart for CI environments that call
/// `dart analyze.dart` from repository root.
Future<void> main() async {
  final script = File('tool/analyze.dart');
  if (!await script.exists()) {
    stderr.writeln('[analyze.dart] tool/analyze.dart not found');
    exit(2);
  }
  // Execute the tool script using this same Dart VM.
  final result = await Process.start(
    Platform.resolvedExecutable,
    [script.path],
    mode: ProcessStartMode.inheritStdio,
  );
  exit(await result.exitCode);
}
