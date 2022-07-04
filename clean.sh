#!/bin/bash
# @generator          :  template.sh
# @filename           :  /data/data/bin/clean.sh
# @author             :  Copyright (C) Church.Zhong
# @date               :  Wed 09 Feb 2022 02:20:06 PM HKT
# @function           :  automatically do something what you want by shell.
# @see                :  GNU bash, version 5.0.17
# @require            :  OpenSSL 1.1.1f  31 Mar 2020/Ubuntu 20.04.2 LTS/
#set -x
SECONDS=0
EX_OK=0
#EX_USAGE=64

# set -o errexit
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

# -------------------------------- main --------------------------------
function main() {
	find "${WORK_DIR}" -type d -not -path '*/\.git/*' | while read -r dir
	do
		# echo "${dir}"
		if [[ -f "${dir}/arm.mk" ]]; then
			echo "${dir}" && cd "${dir}" && make -f arm.mk -s clean
		elif [[ -f "${dir}/Makefile" ]]; then
			echo "${dir}" && cd "${dir}" && make -f Makefile -s clean
		elif [[ -f "${dir}/makefile" ]]; then
			echo "${dir}" && cd "${dir}" && make -f makefile -s clean
		else
			continue
		fi
	done
}

main "$@"

log "# Done"
# do some work( or time yourscript.sh)
duration=${SECONDS}
log "# $((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
exit ${EX_OK}
# -------------------------------- exit --------------------------------

# #shellcheck -s bash /data/data/bin/clean.sh

