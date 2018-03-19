#!/usr/bin/env bash

# script:  watch
# author:  Mike Smullin <mike@smullindesign.com>
# updated: Alex Hinds <alex.hinds141@gmail.com>

# license: GPLv3
# description:
#   watches the given path for changes
#   and executes a given command when changes occur
# usage:
#   watch <path> <cmd...>
#

path=$1
shift
UPDATE_INTERVAL=$1
shift
cmd=$*
sha=0

# recursive calls sha on all files in path
update_sha() {
  sha=$(ls -lRT $path | shasum)
}
update_sha
previous_sha=$sha

# runs the command passed in
build() {
  echo -en " building...\n\n"
  echo "$cmd $path"
  $cmd "$path"
  echo -en "\n--> resumed watching."
}

# compares the shasum to the old sum if different run build
compare() {
  update_sha
  if [[ $sha != $previous_sha ]] ; then
    echo -n "change detected,"
    build
    previous_sha=$sha
  else
    echo -n .
  fi
}
#trap build SIGINT
#trap exit SIGQUIT

echo -e  "--> Press Ctrl+C to force build, Ctrl+\\ to exit."
echo -en "--> watching \"$path\"."
while true; do
  compare
  sleep $UPDATE_INTERVAL
done
