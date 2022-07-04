#!/bin/bash
# @generator          :  template.sh
# @filename           :  /data/data/bin/run.sh
# @author             :  Copyright (C) Church.Zhong
# @date               :  Wed 26 Jan 2022 03:50:05 PM HKT
# @function           :  automatically do something what you want by shell.
# @see                :  GNU bash, version 5.0.17
# @require            :  OpenSSL 1.1.1f  31 Mar 2020/Ubuntu 20.04.2 LTS/
#set -x
SECONDS=0
EX_OK=0
EX_USAGE=64

set -o errexit
set -o nounset
set -o pipefail

# get absolute path of a path name
function abspath() {
	[[ -n  "$1" ]] && ( cd "$1" 2>/dev/null && pwd;)
}

function err() {
	echo "# [$(date +'%Y-%m-%dT%H:%M:%S%z')]: $*" >&2
}

function log() {
	echo "$*" >&2
}

WORK_DIR=$(abspath "$(dirname "$0")")
echo "# WORK_DIR = ${WORK_DIR}"
OS_DATE_DAY=$(date +%Y-%m-%d)
echo "# OS_DATE_DAY = ${OS_DATE_DAY}"
OS_DATE_SECOND=$(date "+%Y_%m_%d_%H%M%S")
echo "# OS_DATE_SECOND = ${OS_DATE_SECOND}"

# -------------------------------- usage --------------------------------
# -------------------------------- usage --------------------------------

device=""
count=$(adb devices | awk 'BEGIN{n=0}{if(2==NF)n=n+1}END{print n}')
devices=$(adb devices | awk '{if("device"==$2){print $1}}')
if [[ 0 -eq ${count} ]]; then
	err "No devices!"
	exit ${EX_USAGE}
elif [[ 1 -eq ${count} ]]; then
	device="${devices}"
	echo "Select first default device ${device}"
else
	select device in ${devices}
	do
		break
	done
	if [ -z "${device}" ];then
		err "No devices!"
		exit ${EX_USAGE}
	else
		echo -e "\n You have selected \"\033[31m${device}\033[0m\" \n"
	fi
fi

export ANDROID_SERIAL="${device}"

# -------------------------------- main --------------------------------
function main() {
	echo "make -f arm.mk clean"
	make -f arm.mk clean
	echo "make -f arm.mk all"
	make -f arm.mk all
}

main "$@"

log "# Done"
# do some work( or time yourscript.sh)
duration=${SECONDS}
log "# $((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
exit ${EX_OK}
# -------------------------------- exit --------------------------------

# #shellcheck -s bash /data/data/bin/run.sh

