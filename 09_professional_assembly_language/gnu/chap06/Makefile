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

TARGETS = betterloop \
 calltest \
 cmptest \
 forc fors \
 ifthenc  ifthens \
 jumptest \
 loop \
 paritytest \
 signtest


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

betterloop: $(UTILITIES) betterloop.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
calltest: $(UTILITIES) calltest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cmptest: $(UTILITIES) cmptest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
forc: $(UTILITIES) forc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
fors: $(UTILITIES) fors.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
ifthenc: $(UTILITIES) ifthenc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
ifthens: $(UTILITIES) ifthens.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
jumptest: $(UTILITIES) jumptest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
loop: $(UTILITIES) loop.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
paritytest: $(UTILITIES) paritytest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
signtest: $(UTILITIES) signtest.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/betterloop
	$(Q)-$(PWD)/calltest
	$(Q)-$(PWD)/cmptest
	$(Q)-$(PWD)/forc > /dev/null
	$(Q)-$(PWD)/fors > /dev/null
	$(Q)-$(PWD)/ifthenc
	$(Q)-$(PWD)/ifthens
	$(Q)-$(PWD)/jumptest
	$(Q)-$(PWD)/loop
	$(Q)-$(PWD)/paritytest
	$(Q)-$(PWD)/signtest
	$(Q)echo "[leave]run examples"
