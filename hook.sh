#!/bin/sh
sphinx-apidoc $@

tracked=$(git diff --name-only *.rst)
untracked=$(git ls-files --other --exclude-standard)

if [ -z "$tracked" ]; then
    if [ -z "$untracked" ]; then
        exit 0
    fi
fi

exit 1