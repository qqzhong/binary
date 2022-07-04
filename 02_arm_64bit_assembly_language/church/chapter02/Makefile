# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

CURRENT_DIR=$(shell pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch64 GNU/Linux target
TARGET=aarch64-none-linux-gnu
TOOL_DIR=$(CURRENT_DIR)/../../../tools/gcc-arm-$(VERSION)-$(HOST)-$(TARGET)
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/$(TARGET)/include/c++/10.3.1
GCC=$(BIN)/$(TARGET)-gcc
AS=$(BIN)/$(TARGET)-as
LD=$(BIN)/$(TARGET)-ld
OBJDUMP=$(BIN)/$(TARGET)-objdump

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/lib64
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/libc/usr/lib64
LIBS = -lc

Q = @
LINK = $(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_arm.o

TARGETS = \
 example01 example02 example03 example04 example05 example06 example07 example08 example09 example10 example11 example12 \
 test00 test01 test02 testE8


all: hook $(TARGETS)

hook:
	$(Q)echo "GCC = $(GCC)"
	$(Q)echo "AS = $(AS)"
	$(Q)echo "LD = $(LD)"
	$(Q)echo "OBJDUMP = $(OBJDUMP)"
	$(Q)echo "INCLUDE = $(INCLUDE)"
	$(Q)echo "LIBS = $(LIBS)"
	$(Q)echo "OBJS = $(OBJS)"
	$(Q)echo "LDFLAGS = $(LDFLAGS)"


%.o : %.c
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) -c $< -o $@

%.o : %.S
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) -c $< -o $@

.PRONY:clean
clean:
	$(Q)echo "clean all"
	$(Q)rm -rf $(TARGETS) *.o *.d *.a *.exe *.map *.objdump

example01: $(UTILITIES) example01.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example02: $(UTILITIES) example02.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example03: $(UTILITIES) example03.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example04: $(UTILITIES) example04.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example05: $(UTILITIES) example05.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example06: $(UTILITIES) example06.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example07: $(UTILITIES) example07.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example08: $(UTILITIES) example08.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example09: $(UTILITIES) example09.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example10: $(UTILITIES) example10.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example11: $(UTILITIES) example11.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example12: $(UTILITIES) example12.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
test00: $(UTILITIES) test00.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
test01: $(UTILITIES) test01.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
test02: $(UTILITIES) test02.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
testE8: $(UTILITIES) testE8.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
