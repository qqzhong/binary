# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT


TOOL_DIR=/usr
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/include
GCC=$(BIN)/gcc
AS=$(BIN)/as
LD=$(BIN)/ld
OBJDUMP=$(BIN)/objdump

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/lib
LIBS = -lc

Q = @
LINK = $(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o

TARGETS = \
 example001 example002


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

example001: $(UTILITIES) example001.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
example002: $(UTILITIES) example002.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
