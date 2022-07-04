#!/bin/bash
# @generator          :  template.sh
# @filename           :  /data/data/bin/arm_64bit_assembly_language/example.sh
# @author             :  Copyright (C) Church.Zhong
# @date               :  Tue 08 Feb 2022 11:29:15 AM HKT
# @function           :  automatically do something what you want by shell.
# @see                :  GNU bash, version 5.0.17
# @require            :  OpenSSL 1.1.1f  31 Mar 2020/Ubuntu 20.04.2 LTS/
#set -x
SECONDS=0
EX_OK=0
#EX_USAGE=64

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
OUTPUT=${WORK_DIR}/${OS_DATE_SECOND}
OUTPUT=${WORK_DIR}/debug
echo "# OUTPUT = ${OUTPUT}"

# awk '{s=$0;if(/^names/) {s=s"\""}print s}' array.sh
# awk '{s=$0;if(/^#/) {}else{s="names[${#names[@]}]=\""s"\""}print s}' array.sh > x.sh

declare -a names
names=()
names[${#names[@]}]="zero"


names[${#names[@]}]="x86 example"
names[${#names[@]}]="x86 example"


COUNT=2


# -------------------------------- main --------------------------------
#DATE=$(date)
DATE="Tue 08 Feb 2022 01:08:05 PM HKT"
function header() {
cat <<HEADER > "asm.h"
// This file is generated automatically by example.sh
// @date: ${DATE}
#pragma once
#ifndef _ASM_H
#define _ASM_H

#endif // _ASM_H

HEADER
}

function examples() {
	for ((i = 1; i <= COUNT; i++))
	do
		# echo "${i}"
		align=$(printf "%02d" ${i})
{
cat <<CXX > "example${align}.S"
// This file is generated automatically by example.sh
// @date: ${DATE}
#include "asm.h"

// ${names[${i}]}

.section .text
.global main
.type main, @ function
main:
  FRAME_BEGIN

  cout(enter, enterLen)
  cout(msg, msgLen)
  bPrint(b)
  sPrint(s)
  iPrint(x)
  iiPrint(x,y)
  iiiPrint(x,y,z)
  cout(leave, leaveLen)

  FRAME_END
  movq \$0, %rax
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][x86 64bit assembly]example${align}\n"
enterLen = . - enter

leave:
.asciz "[leave][x86 64bit assembly]example${align}\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"

.data
b: .byte 98
s: .2byte 254
x: .4byte 10000000
y: .4byte 10000001
z: .4byte 10000002
.end
CXX
}
	done
}

function entry() {
	{
echo "// This file is generated automatically by example.sh"
echo "// @date: ${DATE}"
echo '#include "_wrap.h"'

	for ((i = 1; i <= COUNT; i++))
	do
		# echo "${i}"
		align=$(printf "%02d" ${i})
		cat << DECLARATION
namespace example${align} {
void test();
}
DECLARATION
	done

	echo "int main(int argc, char *argv[]) {"
	echo "  auto start = std::chrono::steady_clock::now();"

	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%02d" ${i})
		echo "  example${align}::test();"
	done

	echo "  auto end = std::chrono::steady_clock::now();"
	echo "  std::chrono::duration<double> elapsed_seconds = std::chrono::duration<double>(end - start);"
	echo '  std::string time("# elapsed time: ");'
	echo '  time += std::to_string(elapsed_seconds.count());'
	echo '  time += "s";'
	echo '  std::cout << time << std::endl;'
	echo "  return 0;"
	echo "}"
	} > "${OUTPUT}/main.cpp"
}

function makefile() {
	{
	echo "# This file is generated automatically by example.sh"
	echo -e "# @date: ${DATE}\n"

	echo "
TOOL_DIR=/usr
BIN=\$(TOOL_DIR)/bin
INCLUDE=\$(TOOL_DIR)/include
GCC=\$(BIN)/gcc
AS=\$(BIN)/as
LD=\$(BIN)/ld
OBJDUMP=\$(BIN)/objdump

ASFLAGS = -g -Wall -I \$(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I \$(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L \$(TOOL_DIR)/lib
LIBS = -lc

Q = @
LINK = \$(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_x86.o
"

	echo "TARGETS = \\"
	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%02d" ${i})
		echo -n " example${align}"
		if ((0 == i%16)); then
		echo " \\"
		fi
	done

	echo -e "\n\n\nall: hook \$(TARGETS)\n"
	echo "hook:
	\$(Q)echo \"GCC = \$(GCC)\"
	\$(Q)echo \"AS = \$(AS)\"
	\$(Q)echo \"LD = \$(LD)\"
	\$(Q)echo \"OBJDUMP = \$(OBJDUMP)\"
	\$(Q)echo \"INCLUDE = \$(INCLUDE)\"
	\$(Q)echo \"LIBS = \$(LIBS)\"
	\$(Q)echo \"OBJS = \$(OBJS)\"
	\$(Q)echo \"LDFLAGS = \$(LDFLAGS)\"
"

	echo "
%.o : %.c
	\$(Q)\$(GCC) \$(VERBOSE) \$(CFLAGS) -c \$< -o \$@

%.o : %.S
	\$(Q)\$(GCC) \$(VERBOSE) \$(CFLAGS) -c \$< -o \$@
"

	echo ".PRONY:clean"
	echo "clean:"
	echo "	\$(Q)echo \"clean all\""
	echo -e "	\$(Q)rm -rf \$(TARGETS) *.o *.d *.a *.exe *.map *.objdump\n"

	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%02d" ${i})
		echo "example${align}: \$(UTILITIES) example${align}.o"
		echo "	\$(Q)\$(GCC) \$(CFLAGS) \$^ \$(LDFLAGS) -o \$@ -static \$(LIBS)"
	done
	} > "Makefile"
}

function fmt_sh() {
	{
	echo "# This file is generated automatically by example.sh"
	echo -e "# @date: ${DATE}\n"

	echo "clang-format-11 -i asm.h"
	echo "COUNT=${COUNT}"

	echo "for ((i = 1; i <= COUNT; i++))"
	echo "do"
	echo "	align=\$(printf \"%03d\" \${i})"
	echo "	echo example\"\${align}\".S"
	echo "	trim_files.bash example\"\${align}\".S"
	echo "done"

	} > "fmt.sh"
	chmod u+x "fmt.sh"
	shellcheck -s bash "fmt.sh"
}

function objdump_sh() {
	{
	echo "# This file is generated automatically by example.sh"
	echo -e "# @date: ${DATE}\n"

	echo "
TOOL_DIR=/usr
BIN=\${TOOL_DIR}/bin
OBJDUMP=\${BIN}/objdump
ELF=\$*

echo \"\${OBJDUMP}\"
[ -f \"\${ELF}\" ] && \${OBJDUMP} -d \"\${ELF}\" > \"\${ELF}.objdump\"
"
	} > "objdump.sh"
	chmod u+x "objdump.sh"
	shellcheck -s bash "objdump.sh"
}

function run_sh() {
	{
	echo "# This file is generated automatically by example.sh"
	echo -e "# @date: ${DATE}\n"

	echo 'ELF="$*"'
	echo "COUNT=${COUNT}"
	echo 'if [ 0 -eq $# ]; then'
	echo '	for ((i = 1; i <= COUNT; i++))'
	echo '	do'
	echo '		align=$(printf "%02d" ${i})'
	echo '		"$(pwd)/example${align}"'
	echo '	done'
	echo 'else'
	echo '	"$(pwd)/${ELF}"'
	echo 'fi'
	} > "run.sh"
	chmod u+x "run.sh"
	shellcheck -s bash "run.sh"
}

function main() {
	echo "write examples into ${OUTPUT}"
	rm -fr "${OUTPUT}" && mkdir -p "${OUTPUT}"

	pushd "${OUTPUT}" > /dev/null
	header && \
	examples && \
	makefile && \
	fmt_sh && \
	objdump_sh && \
	run_sh
	popd > /dev/null

	pushd "${WORK_DIR}" > /dev/null
	clang-format-11 -i asm.h
	cp -f macro.h asm.h set_errno.c syscall_x86.S "${OUTPUT}/"
	popd > /dev/null
}

main "$@"

log "# Done"
# do some work( or time yourscript.sh)
duration=${SECONDS}
log "# $((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
exit ${EX_OK}
# -------------------------------- exit --------------------------------

# #shellcheck -s bash /data/data/bin/arm_64bit_assembly_language/example.sh

