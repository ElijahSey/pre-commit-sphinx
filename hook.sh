#!/usr/bin/env sh
prediff=$(git diff *.rst)
sphinx-apidoc $@
postdiff=$(git diff *.rst)

if [ "$prediff" = "$postdiff" ]; then
    exit 0
fi

exit 1
