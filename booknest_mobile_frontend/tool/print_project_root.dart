import 'dart:io';

/// PUBLIC_INTERFACE
/// Prints the absolute path to the current Flutter project's root directory.
/// Intended for CI scripts to resolve and cd into before running analyze.
Future<void> main() async {
  final dir = Directory.current.absolute.path;
  stdout.writeln(dir);
}
