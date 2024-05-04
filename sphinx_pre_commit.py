#!/usr/bin/env python
import subprocess
import sys


def get_git_status():
    return subprocess.run(
        ["git", "status", "-s", "-v", "*.rst"], capture_output=True, text=True
    ).stdout


def main():
    prestatus = get_git_status()

    subprocess.run(["sphinx-apidoc"] + sys.argv[1:])

    poststatus = get_git_status()

    if prestatus == poststatus:
        sys.exit(0)
    else:
        print("Sphinx docs were not complete.", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()
