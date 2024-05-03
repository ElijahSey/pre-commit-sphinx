#!/usr/bin/env sh

prediff=$(git diff *.rst)
prefiles=$(git status -s)

sphinx-apidoc $@

postdiff=$(git diff *.rst)
postfiles=$(git status -s)

if [ "$prediff" = "$postdiff" ]; then
    if [ "$prefiles" = "$postfiles" ]; then
        exit 0
    fi
fi

exit 1
