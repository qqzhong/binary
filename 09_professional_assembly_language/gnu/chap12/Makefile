# @date: Fri 11 Mar 2022 09:43:55 AM HKT


TOOL_DIR=/usr
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/include
GCC=$(BIN)/gcc
AS=$(BIN)/as
LD=$(BIN)/ld
OBJDUMP=$(BIN)/objdump
PWD=$(shell pwd)

ASFLAGS = --32 -g -Wall -I $(INCLUDE)
CFLAGS += -m32 -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/lib
LIBS = -lc

Q = @
LINK = $(LD) -m elf_i386
#VERBOSE = --verbose

UTILITIES =

TARGETS = cfunctest2 \
 cfunctest \
 nanotest \
 syscalltest1 \
 syscalltest2 \
 sysinfo


all: hook $(TARGETS) run

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

%.o : %.s
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) -c $< -o $@

.PRONY:clean
clean:
	$(Q)echo "clean all"
	$(Q)rm -rf $(TARGETS) *.o *.d *.a *.exe *.map *.objdump

cfunctest2: $(UTILITIES) cfunctest2.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cfunctest: $(UTILITIES) cfunctest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
nanotest: $(UTILITIES) nanotest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
syscalltest1: $(UTILITIES) syscalltest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
syscalltest2: $(UTILITIES) syscalltest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sysinfo: $(UTILITIES) sysinfo.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)


run: $(TARGETS)
	$(Q)echo "[enter]run examples"
#	$(Q)-$(PWD)/cfunctest2
#	$(Q)-$(PWD)/cfunctest
#	$(Q)-$(PWD)/nanotest
	$(Q)-$(PWD)/syscalltest1
	$(Q)-$(PWD)/syscalltest2
	$(Q)-$(PWD)/sysinfo
	$(Q)echo "[leave]run examples"
