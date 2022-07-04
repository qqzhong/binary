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

TARGETS = ctest \
 functest1 \
 functest2 \
 functest3 \
 functest4 \
 paramtest1 \
 paramtest2 \
 paramtest3


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

ctest: $(UTILITIES) ctest.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
functest1: $(UTILITIES) functest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
functest2: $(UTILITIES) functest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
functest3: $(UTILITIES) functest3.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
functest4: $(UTILITIES) functest4.o area.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
paramtest1: $(UTILITIES) paramtest1.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
paramtest2: $(UTILITIES) paramtest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
paramtest3: $(UTILITIES) paramtest3.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/ctest
	$(Q)-$(PWD)/functest1
	$(Q)-$(PWD)/functest2
	$(Q)-$(PWD)/functest3
	$(Q)-$(PWD)/functest4
	$(Q)-$(PWD)/paramtest1 1 2 3 a b c
	$(Q)-$(PWD)/paramtest2 1 2 3 a b c
	$(Q)-$(PWD)/paramtest3 1 2 3 a b c
	$(Q)echo "[leave]run examples"
