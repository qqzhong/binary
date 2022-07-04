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

TARGETS = calctest2 \
calctestc \
calctests \
condtest2 \
condtestc \
condtests \
csetestc \
sums2 \
sumsc \
sumss \
tempconvc \
tempconvs \
vartest2 \
vartestc \
vartests


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

calctest2: $(UTILITIES) calctest2.o
#	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
calctestc: $(UTILITIES) calctestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
calctests: $(UTILITIES) calctests.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
condtest2: $(UTILITIES) condtest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
condtestc: $(UTILITIES) condtestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
condtests: $(UTILITIES) condtests.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
csetestc: $(UTILITIES) csetestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
sums2: $(UTILITIES) sums2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
sumsc: $(UTILITIES) sumsc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
sumss: $(UTILITIES) sumss.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
tempconvc: $(UTILITIES) tempconvc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
tempconvs: $(UTILITIES) tempconvs.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
vartest2: $(UTILITIES) vartest2.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
vartestc: $(UTILITIES) vartestc.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
vartests: $(UTILITIES) vartests.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)


run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/calctest2
	$(Q)-$(PWD)/calctestc
	$(Q)-$(PWD)/calctests
	$(Q)-$(PWD)/condtest2
	$(Q)-$(PWD)/condtestc
	$(Q)-$(PWD)/condtests
	$(Q)-$(PWD)/csetestc
	$(Q)-$(PWD)/sums2
	$(Q)-$(PWD)/sumsc
	$(Q)-$(PWD)/sumss
	$(Q)-$(PWD)/tempconvc
	$(Q)-$(PWD)/tempconvs
	$(Q)-$(PWD)/vartest2
	$(Q)-$(PWD)/vartestc
	$(Q)-$(PWD)/vartests
	$(Q)echo "[leave]run examples"
