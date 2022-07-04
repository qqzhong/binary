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

TARGETS = cmpstest1 \
  cmpstest2 \
  convert \
  movstest1 \
  movstest2 \
  movstest3 \
  reptest1 \
  reptest2 \
  reptest3 \
  reptest4 \
  scastest1 \
  scastest2 \
  stostest1 \
  strcomp \
  strsize


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

cmpstest1: $(UTILITIES) cmpstest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
#	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
cmpstest2: $(UTILITIES) cmpstest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
convert: $(UTILITIES) convert.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
movstest1: $(UTILITIES) movstest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movstest2: $(UTILITIES) movstest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movstest3: $(UTILITIES) movstest3.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
reptest1: $(UTILITIES) reptest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
reptest2: $(UTILITIES) reptest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
reptest3: $(UTILITIES) reptest3.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
reptest4: $(UTILITIES) reptest4.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
scastest1: $(UTILITIES) scastest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
scastest2: $(UTILITIES) scastest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
stostest1: $(UTILITIES) stostest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
strcomp: $(UTILITIES) strcomp.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
strsize: $(UTILITIES) strsize.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/cmpstest1
	$(Q)-$(PWD)/cmpstest2
	$(Q)-$(PWD)/convert
	$(Q)-$(PWD)/movstest1
	$(Q)-$(PWD)/movstest2
	$(Q)-$(PWD)/movstest3
	$(Q)-$(PWD)/reptest1
	$(Q)-$(PWD)/reptest2
	$(Q)-$(PWD)/reptest3
	$(Q)-$(PWD)/reptest4
	$(Q)-$(PWD)/scastest1
	$(Q)-$(PWD)/scastest2
	$(Q)-$(PWD)/stostest1
	$(Q)-$(PWD)/strcomp
	$(Q)-$(PWD)/strsize
	$(Q)echo "[leave]run examples"
