# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT


TOOL_DIR=/usr
BIN=${TOOL_DIR}/bin
OBJDUMP=${BIN}/objdump
ELF=$*

echo "${OBJDUMP}"
[ -f "${ELF}" ] && ${OBJDUMP} -d "${ELF}" > "${ELF}.objdump"

