# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

VERSION=10.3-2021.07
HOST=x86_64
#AArch32 target with hard float
TARGET=arm-none-linux-gnueabihf
TOOL_DIR=/data/data/bin/tools/gcc-arm-$(VERSION)-$(HOST)-$(TARGET)
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/$(TARGET)/include/c++/10.3.1
GCC=$(BIN)/$(TARGET)-gcc
AS=$(BIN)/$(TARGET)-as
LD=$(BIN)/$(TARGET)-ld
OBJDUMP=$(BIN)/$(TARGET)-objdump

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/lib
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/libc/usr/lib
LIBS = -lc

Q = @
LINK = $(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_arm.o \
 add_digit_strings.o clearbytes.o compare.o copybytes.o \
 divide_by_10.o divide.o factorial.o ispalindromic.o isprime.o long_divide.o \
 mul_64to64.o mul_digit_string.o mul_int_string.o prime_vector.o printbytes.o

TARGETS = \
 pe001 \
 pe002 \
 pe003 \
 pe004 \
 pe005 \
 pe006 \
 pe007 \
 pe008 \
 pe009 \
 pe010 \
 pe011 \
 pe012 \
 pe013 \
 pe014 \
 pe015 \
 pe016 \
 pe017 \
 pe018 \
 pe019 \
 pe020 \
 pe021 \
 pe022 \
 pe023 \
 pe024 \
 pe025


define TARGET_template =
$(1): $(UTILITIES) $(1).o
#	echo "$(1):$$^ -> $$@"
#	echo "$(LDFLAGS)"
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

