#!/usr/bin/env python
import subprocess
import sys


def get_git_diff():
    return subprocess.run(
        ["git", "diff", "*.rst"], capture_output=True, text=True
    ).stdout


def get_git_status():
    return subprocess.run(
        ["git", "status", "-s"], capture_output=True, text=True
    ).stdout


def main():
    prediff = get_git_diff()
    prestatus = get_git_status()

    subprocess.run(["sphinx-apidoc"] + sys.argv[1:])

    postdiff = get_git_diff()
    poststatus = get_git_status()

    if prediff == postdiff and prestatus == poststatus:
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == "__main__":
    main()
