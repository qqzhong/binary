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

TARGETS = bcdtest \
 convtest \
 floattest \
 fpuvals \
 inttest \
 mmxtest \
 movsxtest2 \
 movsxtest \
 movzxtest \
 quadtest \
 sse2float \
 ssefloat \
 ssetest

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

bcdtest: $(UTILITIES) bcdtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
#	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
convtest: $(UTILITIES) convtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
floattest: $(UTILITIES) floattest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fpuvals: $(UTILITIES) fpuvals.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
inttest: $(UTILITIES) inttest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
mmxtest: $(UTILITIES) mmxtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movsxtest2: $(UTILITIES) movsxtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movsxtest: $(UTILITIES) movsxtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
movzxtest: $(UTILITIES) movzxtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
quadtest: $(UTILITIES) quadtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
sse2float: $(UTILITIES) sse2float.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
ssefloat: $(UTILITIES) ssefloat.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
ssetest: $(UTILITIES) ssetest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/bcdtest
	$(Q)-$(PWD)/convtest
	$(Q)-$(PWD)/floattest
	$(Q)-$(PWD)/fpuvals
	$(Q)-$(PWD)/inttest
	$(Q)-$(PWD)/mmxtest
	$(Q)-$(PWD)/movsxtest2
	$(Q)-$(PWD)/movsxtest
	$(Q)-$(PWD)/movzxtest
	$(Q)-$(PWD)/quadtest
	$(Q)-$(PWD)/sse2float
	$(Q)-$(PWD)/ssefloat
	$(Q)-$(PWD)/ssetest
	$(Q)echo "[leave]run examples"
