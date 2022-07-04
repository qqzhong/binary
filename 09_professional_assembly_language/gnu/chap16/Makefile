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

TARGETS = cpuidfile2 \
cpuidfile \
fileconvert \
readtest1 \
readtest2 \
readtest3


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
	$(Q)rm -rf $(TARGETS) *.o *.d *.a *.exe *.map *.objdump cpuid.txt

cpuidfile2: $(UTILITIES) cpuidfile2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
#	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cpuidfile: $(UTILITIES) cpuidfile.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fileconvert: $(UTILITIES) fileconvert.o sizefunc.o convert.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
readtest1: $(UTILITIES) readtest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
readtest2: $(UTILITIES) readtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
readtest3: $(UTILITIES) readtest3.o convert.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)


run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/cpuidfile2
	$(Q)-$(PWD)/cpuidfile
	$(Q)-$(PWD)/fileconvert
	$(Q)-$(PWD)/readtest1
	$(Q)-$(PWD)/readtest2
	$(Q)-$(PWD)/readtest3
	$(Q)echo "[leave]run examples"
