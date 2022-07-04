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


names[${#names[@]}]="CS255/abc.html"
names[${#names[@]}]="CS255/access-linked-list.html"
names[${#names[@]}]="CS255/access-list-field.html"
names[${#names[@]}]="CS255/adv-pass-with-stack.html"
names[${#names[@]}]="CS255/align.html"
names[${#names[@]}]="CS255/arithm.html"
names[${#names[@]}]="CS255/array-asm.html"
names[${#names[@]}]="CS255/array-define.html"
names[${#names[@]}]="CS255/array-ld+st.html"
names[${#names[@]}]="CS255/array-store.html"
names[${#names[@]}]="CS255/array-theory.html"
names[${#names[@]}]="CS255/asm-prog-struct.html"
names[${#names[@]}]="CS255/assembler.html"
names[${#names[@]}]="CS255/behavior.html"
names[${#names[@]}]="CS255/bl.html"
names[${#names[@]}]="CS255/bl+rts.html"
names[${#names[@]}]="CS255/bra-impl.html"
names[${#names[@]}]="CS255/branch.html"
names[${#names[@]}]="CS255/bra-sub2.html"
names[${#names[@]}]="CS255/bra-sub.html"
names[${#names[@]}]="CS255/bsr+rts.html"
names[${#names[@]}]="CS255/cmp+bra.html"
names[${#names[@]}]="CS255/comp-program.html"
names[${#names[@]}]="CS255/copy.html"
names[${#names[@]}]="CS255/cpu1.html"
names[${#names[@]}]="CS255/cpu2.html"
names[${#names[@]}]="CS255/cpu3.html"
names[${#names[@]}]="CS255/cpu.html"
names[${#names[@]}]="CS255/data-section.html"
names[${#names[@]}]="CS255/directives.html"
names[${#names[@]}]="CS255/do.html"
names[${#names[@]}]="CS255/endian.html"
names[${#names[@]}]="CS255/fac.html"
names[${#names[@]}]="CS255/fib2.html"
names[${#names[@]}]="CS255/fib-ARM.html"
names[${#names[@]}]="CS255/for.html"
names[${#names[@]}]="CS255/general.html"
names[${#names[@]}]="CS255/hanoi.html"
names[${#names[@]}]="CS255/head.html"
names[${#names[@]}]="CS255/hello.html"
names[${#names[@]}]="CS255/if-and.html"
names[${#names[@]}]="CS255/if-else.html"
names[${#names[@]}]="CS255/if.html"
names[${#names[@]}]="CS255/if-or.html"
names[${#names[@]}]="CS255/implement-passing-tech.html"
names[${#names[@]}]="CS255/impl-stack.html"
names[${#names[@]}]="CS255/impl-sub2.html"
names[${#names[@]}]="CS255/impl-sub.html"
names[${#names[@]}]="CS255/index.html"
names[${#names[@]}]="CS255/insert-head-list.html"
names[${#names[@]}]="CS255/interrupted-computation.html"
names[${#names[@]}]="CS255/intro.html"
names[${#names[@]}]="CS255/intro-if.html"
names[${#names[@]}]="CS255/intro-pass-param.html"
names[${#names[@]}]="CS255/intro-recursion.html"
names[${#names[@]}]="CS255/intro-sub.html"
names[${#names[@]}]="CS255/juicy-example.html"
names[${#names[@]}]="CS255/ldr.html"
names[${#names[@]}]="CS255/leaf-return.html"
names[${#names[@]}]="CS255/leaf-sub.html"
names[${#names[@]}]="CS255/linked-list.html"
names[${#names[@]}]="CS255/linked-list-OLD.html"
names[${#names[@]}]="CS255/ll-insert-at-start.html"
names[${#names[@]}]="CS255/ll-insert-at-tail1.html"
names[${#names[@]}]="CS255/ll-insert-at-tail2.html"
names[${#names[@]}]="CS255/ll-insert-at-tail-ARM.html"
names[${#names[@]}]="CS255/ll-insert-at-tail.html"
names[${#names[@]}]="CS255/ll-search-ARM.html"
names[${#names[@]}]="CS255/ll-search.html"
names[${#names[@]}]="CS255/motivation.html"
names[${#names[@]}]="CS255/mov-1a.html"
names[${#names[@]}]="CS255/mov-1.html"
names[${#names[@]}]="CS255/mov-2.html"
names[${#names[@]}]="CS255/mov-3.html"
names[${#names[@]}]="CS255/nested-if.html"
names[${#names[@]}]="CS255/new-how-to.html"
names[${#names[@]}]="CS255/new-local-with-regs.html"
names[${#names[@]}]="CS255/new-local-with-stack.html"
names[${#names[@]}]="CS255/new-pass-with-regs1.html"
names[${#names[@]}]="CS255/new-pass-with-regs2.html"
names[${#names[@]}]="CS255/new-pass-with-regs3.html"
names[${#names[@]}]="CS255/new-pass-with-regs.html"
names[${#names[@]}]="CS255/new-pass-with-stack2.html"
names[${#names[@]}]="CS255/new-pass-with-stack.html"
names[${#names[@]}]="CS255/new-problem-with-regs.html"
names[${#names[@]}]="CS255/note.html"
names[${#names[@]}]="CS255/object.html"
names[${#names[@]}]="CS255/OLD:asm-prog-struct.html"
names[${#names[@]}]="CS255/organization.html"
names[${#names[@]}]="CS255/param-on-stack-1.html"
names[${#names[@]}]="CS255/param-on-stack-3.html"
names[${#names[@]}]="CS255/param-on-stack-4.html"
names[${#names[@]}]="CS255/pass-by-reference.html"
names[${#names[@]}]="CS255/pass-by-value.html"
names[${#names[@]}]="CS255/pass-param.html"
names[${#names[@]}]="CS255/prog-org.html"
names[${#names[@]}]="CS255/push-pop-stack.html"
names[${#names[@]}]="CS255/recur-list.html"
names[${#names[@]}]="CS255/recurse.html"
names[${#names[@]}]="CS255/skel-pass-with-stack.html"
names[${#names[@]}]="CS255/str.html"
names[${#names[@]}]="CS255/sub+local-var.html"
names[${#names[@]}]="CS255/summary-pass-with-stack.html"
names[${#names[@]}]="CS255/teardown-frame.html"
names[${#names[@]}]="CS255/text-section.html"
names[${#names[@]}]="CS255/traverse-lists.html"
names[${#names[@]}]="CS255/var-directives.html"
names[${#names[@]}]="CS255/while.html"
names[${#names[@]}]="CS255/wrong-instr.html"


COUNT=109


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
		align=$(printf "%03d" ${i})
{
cat <<CXX > "example${align}.S"
// This file is generated automatically by example.sh
// @date: ${DATE}
#include "asm.h"

// ${names[${i}]}

/* -------------------------------------------------------------
   Define required labels for EGTAPI
   ------------------------------------------------------------- */
  .global Stop, CodeEnd
  .global DataStart, DataEnd
  .global k, bingo

/* -------------------------------------------------------------
   Begin of the program instructions
   ------------------------------------------------------------- */

.section .text
.global main
.type main, % function
main:
  /* Function Prelude: complete the stack frame structure */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  cout(enter, enterLen)
  cout(msg, msgLen)
  cout(leave, leaveLen)


  iiPrint(k, bingo)
  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  /*ldr     r0, [r0]*/    // Pass k by reference (pass k's address)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byRef(k)
     ------------------------------------------------------------- */
  bl      byRef
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  movw    r0, #:lower16:k
  movt    r0, #:upper16:k // r0 = address of k
  ldr     r0, [r0]        // r0 = value of k
                          // Pass k by value (pass k's value)
  /* -------------------------------------------------------------
     Pass parameter k (using stack)
     ------------------------------------------------------------- */
  push    {r0}            // Pass k using the program stack
  /* -------------------------------------------------------------
     call byVal(k)
     ------------------------------------------------------------- */
  bl      byVal
  add     sp, sp, #4      // Clean up the parameter k
  iiPrint(k, bingo)


  b work


Stop:
CodeEnd:
  nop


  /* Function Postlude: de-allocate local variable and restore FP */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller
  .size main, (. - main)


byRef:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]    // r0 = address of k
  mov     r1, #33
  str     r1, [r0]        // k = r1

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


byVal:
  /* =============================================================
     Function Prelude: complete the stack frame structure
     ============================================================= */
  push    {lr}      // Save LR (return address)
  push    {fp}      // Save FP (used by caller)
  mov     fp, sp    // Mark the stack top location before
                    // allocating any local variables
  sub     sp, sp, #0      // I create 0 local variables in stack

  ldr     r0, [fp, #8]         // r0 = address of k
  movw    r1, #:lower16:bingo
  movt    r1, #:upper16:bingo  // r1 = address of bingo
  str     r0, [r1]             // bingo = k

  /* -------------------------------------------------------------
     Assign return value (in r0) to variable result
     ------------------------------------------------------------- */
  // This will store return value in result

  /* =============================================================
     Function Postlude: de-allocate local variable and restore FP
     ============================================================= */
  mov     sp, fp    // De-allocate local variables
  pop     {fp}      // Restore FP
  pop     {pc}      // Return to the caller


work:

  b Stop


.section ".rodata"
enter:
.asciz "[enter][arm 32bit assembly]example${align}\n"
enterLen = . - enter

leave:
.asciz "[leave][arm 32bit assembly]example${align}\n"
leaveLen = . - leave

msg: .asciz "Hello World\n" // Define null-terminated string
msgLen = . - msg

bFormat: .asciz "c=%d\n"
sFormat: .asciz "s=%d\n"
iFormat: .asciz "i=%d\n"
iiFormat: .asciz "i=%d,%d\n"
iiiFormat: .asciz "i=%d,%d,%d\n"


/* -------------------------------------------------------------
   Begin of the permanent program variables
   ------------------------------------------------------------- */
  .data
k:.4byte 22
bingo:.4byte 255
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
		align=$(printf "%03d" ${i})
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
		align=$(printf "%03d" ${i})
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
#AArch32 target with hard float
TARGET=arm-none-linux-gnueabihf
TOOL_DIR=\$(CURRENT_DIR)/../../tools/gcc-arm-\$(VERSION)-\$(HOST)-\$(TARGET)
BIN=\$(TOOL_DIR)/bin
INCLUDE=\$(TOOL_DIR)/\$(TARGET)/include/c++/10.3.1
GCC=\$(BIN)/\$(TARGET)-gcc
AS=\$(BIN)/\$(TARGET)-as
LD=\$(BIN)/\$(TARGET)-ld
OBJDUMP=\$(BIN)/\$(TARGET)-objdump

ASFLAGS = -g -Wall -I \$(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I \$(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L \$(TOOL_DIR)/\$(TARGET)/lib
LDFLAGS += -L \$(TOOL_DIR)/\$(TARGET)/libc/usr/lib
LIBS = -lc

Q = @
LINK = \$(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_arm.o
"

	echo "TARGETS = \\"
	for ((i = 1; i <= COUNT; i++))
	do
		align=$(printf "%03d" ${i})
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
		align=$(printf "%03d" ${i})
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

	echo "CURRENT_DIR=\$(pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch32 target with hard float
TARGET=arm-none-linux-gnueabihf
TOOL_DIR=\${CURRENT_DIR}/../../tools/gcc-arm-\${VERSION}-\${HOST}-\${TARGET}
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
	cp -f asm.h set_errno.c syscall_arm.S "${OUTPUT}/"
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

