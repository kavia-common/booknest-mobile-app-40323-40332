import 'dart:io';

// PUBLIC_INTERFACE
/// ci_main.dart - CI entrypoint to run Flutter commands inside the nested app.
/// Usage:
///   dart run tool/ci_main.dart analyze
///   dart run tool/ci_main.dart test
///   dart run tool/ci_main.dart pubget
///
/// Returns the same exit code as the underlying Flutter command.
Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run tool/ci_main.dart <analyze|test|pubget>');
    exit(2);
  }

  final cmd = args.first.toLowerCase();
  final repoRoot = Directory.current.path;
  final flutterDir = Directory(
    '$repoRoot/booknest-mobile-app-40323-40332/booknest_mobile_frontend',
  );
  if (!flutterDir.existsSync()) {
    stderr.writeln('Nested Flutter app not found: ${flutterDir.path}');
    exit(1);
  }
  Directory.current = flutterDir;

  Future<int> runFlutter(List<String> a) async {
    stdout.writeln('[CI] flutter ${a.join(" ")}');
    final p = await Process.start('flutter', a);
    await stdout.addStream(p.stdout);
    await stderr.addStream(p.stderr);
    return await p.exitCode;
  }

  // Always ensure dependencies are fetched
  final getCode = await runFlutter(['pub', 'get']);
  if (getCode != 0) {
    exit(getCode);
  }

  switch (cmd) {
    case 'analyze':
      exit(await runFlutter(['analyze']));
    case 'test':
      exit(await runFlutter(['test']));
    case 'pubget':
      exit(0);
    default:
      stderr.writeln('Unknown command: $cmd');
      exit(2);
  }
}
