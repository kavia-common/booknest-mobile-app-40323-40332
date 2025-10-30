import 'dart:io';

/// PUBLIC_INTERFACE
/// CI entrypoint that deterministically runs `flutter pub get` and `flutter analyze`
/// inside the nested Flutter app directory by setting the workingDirectory on each process.
Future<void> main() async {
  final appDir = Directory('booknest-mobile-app-40323-40332/booknest_mobile_frontend');
  if (!appDir.existsSync()) {
    stderr.writeln('[dart_dispatch_analyze] ERROR: App directory not found: ${appDir.path}');
    exit(2);
  }
  final pubspec = File('${appDir.path}/pubspec.yaml');
  if (!pubspec.existsSync()) {
    stderr.writeln('[dart_dispatch_analyze] ERROR: pubspec.yaml missing at ${pubspec.path}');
    exit(2);
  }

  Future<int> run(String cmd, List<String> args) async {
    final p = await Process.start(
      cmd,
      args,
      workingDirectory: appDir.path,
      mode: ProcessStartMode.inheritStdio,
    );
    return p.exitCode;
  }

  stdout.writeln('[dart_dispatch_analyze] flutter pub get in ${appDir.path}');
  final getCode = await run('flutter', ['pub', 'get']);
  if (getCode != 0) exit(getCode);

  stdout.writeln('[dart_dispatch_analyze] flutter analyze in ${appDir.path}');
  final analyzeCode = await run('flutter', ['analyze']);
  exit(analyzeCode);
}
