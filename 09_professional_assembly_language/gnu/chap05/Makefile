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

TARGETS = bubble cmovtest cmpxchg8btest cmpxchgtest \
 movtest1 movtest2 movtest3 movtest4 \
 pushpop sizetest1 sizetest2 sizetest3 swaptest


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

bubble: $(UTILITIES) bubble.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
cmovtest: $(UTILITIES) cmovtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cmpxchg8btest: $(UTILITIES) cmpxchg8btest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
cmpxchgtest: $(UTILITIES) cmpxchgtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movtest1: $(UTILITIES) movtest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movtest2: $(UTILITIES) movtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movtest3: $(UTILITIES) movtest3.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
movtest4: $(UTILITIES) movtest4.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
pushpop: $(UTILITIES) pushpop.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sizetest1: $(UTILITIES) sizetest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sizetest2: $(UTILITIES) sizetest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sizetest3: $(UTILITIES) sizetest3.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
swaptest: $(UTILITIES) swaptest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/bubble
	$(Q)-$(PWD)/cmovtest
	$(Q)-$(PWD)/cmpxchg8btest
	$(Q)-$(PWD)/cmpxchgtest
	$(Q)-$(PWD)/movtest1 
	$(Q)-$(PWD)/movtest2
	$(Q)-$(PWD)/movtest3
	$(Q)-$(PWD)/movtest4
	$(Q)-$(PWD)/pushpop
	$(Q)-$(PWD)/sizetest1
	$(Q)-$(PWD)/sizetest2
	$(Q)-$(PWD)/sizetest3
	$(Q)-$(PWD)/swaptest
	$(Q)echo "[leave]run examples"
