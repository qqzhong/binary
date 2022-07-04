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


# Contents
# List of tables
# List of figures
# Preface
names[${#names[@]}]="Chapter 1: Introduction"
# 1.1 Reasons to learn assembly
# 1.2 The ARM processor
# 1.3 Computer data
# 1.4 Memory layout of an executing program
# 1.5 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 2: GNU assembly syntax"
# 2.1 Structure of an assembly program
# 2.2 What the assembler does
# 2.3 GNU assembly directives
# 2.4 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 3: Load/store and branch instructions"
# 3.1 CPU components and data paths
# 3.2 AArch64 user registers
# 3.3 Instruction components
# 3.4 Load and store instructions
# 3.5 Branch instructions
# 3.6 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 4: Data processing and other instructions"
# 4.1 Operand2
# 4.2 Data processing instructions
# 4.3 Special instructions
# 4.4 Alphabetized list of AArch64 instructions
# 4.5 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 5: Structured programming"
# 5.1 Sequencing
# 5.2 Selection
# 5.3 Iteration
# 5.4 Subroutines
# 5.5 Aggregate data types
# 5.6 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 6: Abstract data types"
# 6.1 ADTs in assembly language
# 6.2 Word frequency counts
# 6.3 Ethics case study: Therac-25
# 6.4 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 7: Integer mathematics"
# 7.1 Subtraction by addition
# 7.2 Binary multiplication
# 7.3 Binary division
# 7.4 Big integer ADT
# 7.5 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 8: Non-integral mathematics"
# 8.1 Base conversion of fractional numbers
# 8.2 Fractions and bases
# 8.3 Fixed point numbers
# 8.4 Fixed point operations
# 8.5 Fixed point input and output
# 8.6 Computing sine and cosine
# 8.7 Floating point numbers
# 8.8 Floating point operations
# 8.9 Ethics case study: patriot missile failure
# 8.10 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 9: Floating point"
# 9.1 Floating point overview
# 9.2 Register usage rules
# 9.3 Floating point control and status registers
# 9.4 Load/store instructions
# 9.5 Data movement instructions
# 9.6 Data conversion instructions
# 9.7 Data processing instructions
# 9.8 Floating point sine function
# 9.9 Alphabetized list of FP/NEON instructions
# 9.10 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 10: Advanced SIMD instructions"
# 10.1 Instruction syntax
# 10.2 Load and store instructions
# 10.3 Data movement instructions
# 10.4 Data conversion
# 10.5 Bitwise logical operations
# 10.6 Basic arithmetic instructions
# 10.7 Multiplication and division
# 10.8 Shift instructions
# 10.9 Unary arithmetic
# 10.10 Vector reduce instructions
# 10.11 Comparison operations
# 10.12 Performance mathematics: a final look at sine
# 10.13 Alphabetized list of advanced SIMD instructions
# 10.14 Advanced SIMD intrinsics
# 10.15 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 11: Devices"
# 11.1 Accessing devices directly under Linux
# 11.2 General purpose digital input/output
# 11.3 Pulse modulation
# 11.4 Common system devices
# 11.5 Serial communications
# 11.6 Chapter summary
# Exercises
names[${#names[@]}]="Chapter 12: Running without an operating system"
# 12.1 Exception processing
# 12.2 AArch64 execution and exception states
# 12.3 AArch64 vector table
# 12.4 The boot process
# 12.5 Writing a bare metal program
# 12.6 Using an interrupt
# 12.7 ARM processor profiles
# 12.8 Chapter summary
# Exercises
# Index



COUNT=12


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
	chapter=$*
	for ((i = 1; i <= COUNT; i++))
	do
		# echo "${i}"
		align=$(printf "%02d" ${i})
{
cat <<CXX > "example${align}.S"
// This file is generated automatically by example.sh
// @date: ${DATE}
#include "asm.h"

// ${names[${chapter}]}

.section .text
.global main
.type main, % function
main:
  stp x29, x30, [sp, #-16]! // Push FP and LR onto the stack
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)

  mov x0, #0 // return 0
  ldp x29, x30, [sp], #16 // Pop FP and LR from the stack
  ret
  .size main, (. - main)


.section ".rodata"
enter:
.asciz "[enter][arm 64bit assembly]example${align}\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 64bit assembly]example${align}\n"
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

	echo "CURRENT_DIR=\$(shell pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch64 GNU/Linux target
TARGET=aarch64-none-linux-gnu
TOOL_DIR=\$(CURRENT_DIR)/../../../tools/gcc-arm-\$(VERSION)-\$(HOST)-\$(TARGET)
BIN=\$(TOOL_DIR)/bin
INCLUDE=\$(TOOL_DIR)/\$(TARGET)/include/c++/10.3.1
GCC=\$(BIN)/\$(TARGET)-gcc
AS=\$(BIN)/\$(TARGET)-as
LD=\$(BIN)/\$(TARGET)-ld
OBJDUMP=\$(BIN)/\$(TARGET)-objdump

ASFLAGS = -g -Wall -I \$(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I \$(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L \$(TOOL_DIR)/\$(TARGET)/lib64
LDFLAGS += -L \$(TOOL_DIR)/\$(TARGET)/libc/usr/lib64
LIBS = -lc

Q = @
LINK = \$(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_arm.o
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
	echo "	align=\$(printf \"%02d\" \${i})"
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

	echo "CURRENT_DIR=\$(pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch64 GNU/Linux target
TARGET=aarch64-none-linux-gnu
TOOL_DIR=\${CURRENT_DIR}/../../../tools/gcc-arm-\${VERSION}-\${HOST}-\${TARGET}
BIN=\${TOOL_DIR}/bin
OBJDUMP=\${BIN}/\${TARGET}-objdump
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

	echo 'run(){'
	echo '	ELF="$*"'
	echo '	[ -f "${ELF}" ] || { echo "${ELF}: No such file or directory"; exit 0; }'
	echo "	adb devices | awk '{if(\"device\"==\$2){print \$1}}' | while read -r device"
	echo '	do'
	echo '		echo "run ${ELF} on ${device}"'
	echo '		export ANDROID_SERIAL="${device}"'
	echo '		adb push "${ELF}" "/data/app/${ELF}" &&'
	echo '		adb shell "killall ${ELF}; /data/app/${ELF}; echo $?" &'
	echo '	done'
	echo '}'
	echo "COUNT=${COUNT}"
	echo 'if [ 0 -eq $# ]; then'
	echo '	for ((i = 1; i <= COUNT; i++))'
	echo '	do'
	echo '		align=$(printf "%02d" ${i})'
	echo '		run "example${align}"'
	echo '	done'
	echo 'else'
	echo '	run "$*"'
	echo 'fi'
	} > "run.sh"
	chmod u+x "run.sh"
	shellcheck -s bash "run.sh"
}

function main() {
	echo "write examples into ${OUTPUT}"
	rm -fr "${OUTPUT}" && mkdir -p "${OUTPUT}"

	for ((n = 1; n <= COUNT; n++))
	do
		echo "${n}"
		balign=$(printf "%02d" ${n})
		mkdir -p "${OUTPUT}/chapter${balign}"

		pushd "${OUTPUT}/chapter${balign}" > /dev/null
		header && \
		examples ${n} && \
		makefile && \
		fmt_sh && \
		objdump_sh && \
		run_sh
		popd > /dev/null

		pushd "${WORK_DIR}" > /dev/null
		clang-format-11 -i asm.h
		cp -f asm.h set_errno.c syscall_arm.S "${OUTPUT}/chapter${balign}"
		popd > /dev/null
	done
}

main "$@"

log "# Done"
# do some work( or time yourscript.sh)
duration=${SECONDS}
log "# $((duration / 60)) minutes and $((duration % 60)) seconds elapsed."
exit ${EX_OK}
# -------------------------------- exit --------------------------------

# #shellcheck -s bash /data/data/bin/arm_64bit_assembly_language/example.sh

