# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

CURRENT_DIR=$(pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch32 target with hard float
TARGET=arm-none-linux-gnueabihf
TOOL_DIR=${CURRENT_DIR}/../../tools/gcc-arm-${VERSION}-${HOST}-${TARGET}
BIN=${TOOL_DIR}/bin
OBJDUMP=${BIN}/${TARGET}-objdump
ELF=$*

echo "${OBJDUMP}"
[ -f "${ELF}" ] && ${OBJDUMP} -d "${ELF}" > "${ELF}.objdump"

