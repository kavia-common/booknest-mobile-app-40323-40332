# Assets Notes

The `.env` file was removed from `flutter: assets:` in pubspec.yaml because:
- We no longer import `flutter_dotenv` at runtime.
- Including `.env` as an asset can cause CI analyzers to look for a project-root-relative file during bootstrap, which may fail in some environments.

Current assets:
- assets/
- assets/images/

Place images under assets/images/ and reference them as:
assets/images/<name>.png
