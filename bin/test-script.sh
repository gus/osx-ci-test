#!/bin/bash

# This is a fake python3 meant to mimic ...

BINDIR=$(dirname $(realpath ${BASH_SOURCE[0]}))

ts_fmt="%Y-%m-%dT%H:%M:%S%z"

function err() {
	echo -en "[$(date +"${ts_fmt}")]\t" >> ${BINDIR}/../install.err.log
	# print the arg on its own in case there are chars that should not be escaped
	echo ${1} >> ${BINDIR}/../install.err.log
}

function die () {
	echo -e "! ${1}"
	exit 1
}

function log() {
	echo -en "[$(date +"${ts_fmt}")]\t" >> ${BINDIR}/../install.log
	# print the arg on its own in case there are chars that should not be escaped
	echo ${1} >> ${BINDIR}/../install.log
}

ran_script="no"

while getopts ":c:" opt; do
	case ${opt} in
	c ) # someone wants to run some python code
		ran_script="yes"
		# log the script
		log "script\t'${OPTARG}'"
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

