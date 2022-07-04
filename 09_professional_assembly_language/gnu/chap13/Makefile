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

TARGETS = alttest areatest asmtestc asmtests \
badregtest cfunctest changedtest globaltestc globaltests \
jmptest2 jmptest mactest1 mactest2 memtest movstest \
regtest1 regtest2 regtest3 sincostest


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

alttest: $(UTILITIES) alttest.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
areatest: $(UTILITIES) areatest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
asmtestc: $(UTILITIES) asmtestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
asmtests: $(UTILITIES) asmtests.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
badregtest: $(UTILITIES) badregtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cfunctest: $(UTILITIES) cfunctest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
changedtest: $(UTILITIES) changedtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
globaltestc: $(UTILITIES) globaltestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
globaltests: $(UTILITIES) globaltests.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
jmptest2: $(UTILITIES) jmptest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
jmptest: $(UTILITIES) jmptest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
mactest1: $(UTILITIES) mactest1.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
mactest2: $(UTILITIES) mactest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
memtest: $(UTILITIES) memtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
movstest: $(UTILITIES) movstest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
regtest1: $(UTILITIES) regtest1.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
regtest2: $(UTILITIES) regtest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
regtest3: $(UTILITIES) regtest3.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
sincostest: $(UTILITIES) sincostest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)


run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/alttest
	$(Q)-$(PWD)/areatest
	$(Q)-$(PWD)/asmtestc
	$(Q)-$(PWD)/asmtests
	$(Q)-$(PWD)/badregtest
	$(Q)-$(PWD)/cfunctest
	$(Q)-$(PWD)/changedtest
	$(Q)-$(PWD)/globaltestc
	$(Q)-$(PWD)/globaltests
	$(Q)-$(PWD)/jmptest2
	$(Q)-$(PWD)/jmptest
	$(Q)-$(PWD)/mactest1
	$(Q)-$(PWD)/mactest2
	$(Q)-$(PWD)/memtest
	$(Q)-$(PWD)/movstest
	$(Q)-$(PWD)/regtest1
	$(Q)-$(PWD)/regtest2
	$(Q)-$(PWD)/regtest3
	$(Q)-$(PWD)/sincostest
	$(Q)echo "[leave]run examples"
