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

TARGETS = fcmovtest \
 fcomitest \
 fcomtest \
 fpmath1 \
 fpmath2 \
 fpuenv \
 fpusave \
 fscaletest \
 getstatus \
 logtest \
 premtest \
 roundtest \
 setprec \
 stacktest \
 trigtest1 \
 trigtest2


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

fcmovtest: $(UTILITIES) fcmovtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
#	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
fcomitest: $(UTILITIES) fcomitest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fcomtest: $(UTILITIES) fcomtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fpmath1: $(UTILITIES) fpmath1.o
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
fpmath2: $(UTILITIES) fpmath2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fpuenv: $(UTILITIES) fpuenv.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fpusave: $(UTILITIES) fpusave.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
fscaletest: $(UTILITIES) fscaletest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
getstatus: $(UTILITIES) getstatus.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
logtest: $(UTILITIES) logtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
premtest: $(UTILITIES) premtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
roundtest: $(UTILITIES) roundtest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
setprec: $(UTILITIES) setprec.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
stacktest: $(UTILITIES) stacktest.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
trigtest1: $(UTILITIES) trigtest1.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)
trigtest2: $(UTILITIES) trigtest2.o
	$(Q)$(LINK) $(VERBOSE) $^ -o $@ -static $(LIBS)

run: $(TARGETS)
	$(Q)echo "[enter]run examples"
	$(Q)-$(PWD)/fcmovtest
	$(Q)-$(PWD)/fcomitest
	$(Q)-$(PWD)/fcomtest
	$(Q)-$(PWD)/fpmath1
	$(Q)-$(PWD)/fpmath2
	$(Q)-$(PWD)/fpuenv
	$(Q)-$(PWD)/fpusave
	$(Q)-$(PWD)/fscaletest
	$(Q)-$(PWD)/getstatus
	$(Q)-$(PWD)/logtest
	$(Q)-$(PWD)/premtest
	$(Q)-$(PWD)/roundtest
	$(Q)-$(PWD)/setprec
	$(Q)-$(PWD)/stacktest
	$(Q)-$(PWD)/trigtest1
	$(Q)-$(PWD)/trigtest2
	$(Q)echo "[leave]run examples"
