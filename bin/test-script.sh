#!/bin/bash

# This is a fake python3 meant to mimic ...

ts_fmt="%Y-%m-%dT%H:%M:%S%z"

function err() {
	>&2 echo -en "[$(date +"${ts_fmt}")]\t"
	# print the arg on its own in case there are chars that should not be escaped
	>&2 echo ${1}
}

function die () {
	>&2 echo -e "! ${1}"
	exit 1
}

function log() {
	echo -en "[$(date +"${ts_fmt}")]\t"
	# print the arg on its own in case there are chars that should not be escaped
	echo ${1}
}

ran_script="no"

while getopts ":c:" opt; do
	case ${opt} in
	c ) # someone wants to run some python code
		ran_script="yes"
		# log the script
		log "script:'${OPTARG}'"
		# return prefixes since we're nice and this is the point
		echo "/path/to/replaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaace"
		echo "/path/also/to/replaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaace"
		;;
	\? )
		die "Usage: $0 -c '<python code>'"
		;;
	esac
done

[ "${ran_script}" = "yes" ] || die "expected to run a provided script"

log "success"

exit 0

