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
 test00 test01 test02 test03 test04 test05 test06 test07 test08 test09 test10 test11 test12 test13 test14 test15 test16 \
 test17 test18 test19 test20 test21

define TARGET_template =
$(1): $(UTILITIES) $(1).o
	$(Q)echo "$(1):$$^ -> $$@"
	$(Q)echo "LDFLAGS = $(LDFLAGS)"
	$(Q)$(GCC) $(CFLAGS) $$^ $(LDFLAGS) -o $$@ -static $(LIBS)
endef
$(foreach target,$(TARGETS),$(eval $(call TARGET_template,$(target))))

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

