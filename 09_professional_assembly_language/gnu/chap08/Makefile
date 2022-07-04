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

TARGETS = aaatest \
	addtest1 \
	addtest3 \
	cpuidtest \
	divtest \
	imultest \
	multest \
	sbbtest \
	subtest2 \
	adctest \
	addtest2 \
	addtest4 \
	dastest \
	imultest2 \
	saltest \
	subtest1 \
	subtest3


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

aaatest: $(UTILITIES) aaatest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
#	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
addtest1: $(UTILITIES) addtest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
addtest3: $(UTILITIES) addtest3.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
cpuidtest: $(UTILITIES) cpuidtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
divtest: $(UTILITIES) divtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
imultest: $(UTILITIES) imultest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
multest: $(UTILITIES) multest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
sbbtest: $(UTILITIES) sbbtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
subtest2: $(UTILITIES) subtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
adctest: $(UTILITIES) adctest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
addtest2: $(UTILITIES) addtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
addtest4: $(UTILITIES) addtest4.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
dastest: $(UTILITIES) dastest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
imultest2: $(UTILITIES) imultest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
saltest: $(UTILITIES) saltest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
subtest1: $(UTILITIES) subtest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
subtest3: $(UTILITIES) subtest3.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/aaatest
	$(Q)-$(PWD)/addtest1
	$(Q)-$(PWD)/addtest3
	$(Q)-$(PWD)/cpuidtest
	$(Q)-$(PWD)/divtest
	$(Q)-$(PWD)/imultest
	$(Q)-$(PWD)/multest
	$(Q)-$(PWD)/sbbtest
	$(Q)-$(PWD)/subtest2
	$(Q)-$(PWD)/adctest
	$(Q)-$(PWD)/addtest2
	$(Q)-$(PWD)/addtest4
	$(Q)-$(PWD)/dastest
	$(Q)-$(PWD)/imultest2
	$(Q)-$(PWD)/saltest
	$(Q)-$(PWD)/subtest1
	$(Q)-$(PWD)/subtest3
	$(Q)echo "[leave]run examples"
