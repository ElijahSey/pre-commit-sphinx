#!/usr/bin/env sh

prediff=$(git diff *.rst)
prefiles=$(git ls-files --other --exclude-standard)

sphinx-apidoc $@

postdiff=$(git diff *.rst)
postfiles=$(git ls-files --other --exclude-standard)

if [ "$prediff" = "$postdiff" ]; then
    if [ "$prefiles" = "$postfiles"]; then
        exit 0
    fi
fi

exit 1
