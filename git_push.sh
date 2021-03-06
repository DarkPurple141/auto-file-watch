#!/usr/bin/env bash -e

# script:  watch
# updated: Alex Hinds <alex.hinds141@gmail.com>

# license: GPLv3
# description: get path being pushed, and message

path=$1
shift
commit=$(basename $path)

GIT_BASE=$(git rev-parse --show-toplevel)

cd $GIT_BASE

git add $path
git commit -m "Auto generated commit related to: $commit" --quiet
git push origin master --quiet

echo "Successfully pushed."
