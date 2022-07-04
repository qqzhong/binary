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

TARGETS = features \
mmxadd \
mmxcomp \
mmx \
sse2math \
ssecomp \
ssemath


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

features: $(UTILITIES) features.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
mmxadd: $(UTILITIES) mmxadd.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
mmxcomp: $(UTILITIES) mmxcomp.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
mmx: $(UTILITIES) mmx.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sse2math: $(UTILITIES) sse2math.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
ssecomp: $(UTILITIES) ssecomp.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
ssemath: $(UTILITIES) ssemath.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)


run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/features
	$(Q)-$(PWD)/mmxadd
	$(Q)-$(PWD)/mmxcomp
	$(Q)-$(PWD)/mmx
	$(Q)-$(PWD)/sse2math
	$(Q)-$(PWD)/ssecomp
	$(Q)-$(PWD)/ssemath
	$(Q)echo "[leave]run examples"
