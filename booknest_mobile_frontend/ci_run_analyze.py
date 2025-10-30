#!/usr/bin/env python3
import os
import subprocess
import sys

APP_DIR = os.path.join("booknest-mobile-app-40323-40332", "booknest_mobile_frontend")

def run(cmd, cwd=None, check=True):
    print(f"[ci_run_analyze] RUN: {' '.join(cmd)} (cwd={cwd or os.getcwd()})", flush=True)
    proc = subprocess.Popen(cmd, cwd=cwd)
    proc.wait()
    if check and proc.returncode != 0:
        sys.exit(proc.returncode)
    return proc.returncode

def main():
    # Verify paths
    root = os.getcwd()
    app_path = os.path.join(root, APP_DIR)
    if not os.path.isdir(app_path):
        print(f"[ci_run_analyze] FATAL: App dir not found: {app_path}", file=sys.stderr)
        sys.exit(2)
    pubspec = os.path.join(app_path, "pubspec.yaml")
    if not os.path.isfile(pubspec):
        print(f"[ci_run_analyze] FATAL: pubspec.yaml missing at {pubspec}", file=sys.stderr)
        sys.exit(2)

    # Diagnostics
    print(f"[ci_run_analyze] Root: {root}", flush=True)
    print(f"[ci_run_analyze] App:  {app_path}", flush=True)

    # Show flutter version if available
    try:
        run(["flutter", "--version"], check=False)
    except Exception:
        print("[ci_run_analyze] WARN: Flutter not on PATH; ensure SDK is installed.", flush=True)

    # Run pub get and analyze in the app directory
    run(["flutter", "pub", "get"], cwd=app_path)
    run(["flutter", "analyze"], cwd=app_path)

if __name__ == "__main__":
    main()
