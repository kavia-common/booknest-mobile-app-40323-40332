# FVM Configuration

This project includes a minimal FVM config to help analyzers locate a Flutter SDK.

If your environment uses FVM:
- Install FVM: `dart pub global activate fvm`
- Use SDK: `fvm use stable`
- Run analyzer: `fvm flutter pub get && fvm flutter analyze`

In CI without FVM, ensure Flutter is installed and run:
- `flutter pub get && flutter analyze` from this directory
