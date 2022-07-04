# @date: Fri 11 Mar 2022 09:43:55 AM HKT


TOOL_DIR=/usr
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/include
GCC=$(BIN)/gcc
AS=$(BIN)/as
LD=$(BIN)/ld
OBJDUMP=$(BIN)/objdump
PWD=$(shell pwd)

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/lib
LIBS = -lc

Q = @
LINK = $(LD)
#VERBOSE = --verbose

UTILITIES = 

TARGETS = \
 hello hola fib \
 callmaxofthree \
 echo power \
 callsum average \
 callfactorial


all: hook $(TARGETS)

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

%.o : %.S
	$(Q)$(GCC) $(VERBOSE) $(CFLAGS) -c $< -o $@

.PRONY:clean
clean:
	$(Q)echo "clean all"
	$(Q)rm -rf $(TARGETS) *.o *.d *.a *.exe *.map *.objdump

hello: $(UTILITIES) hello.o
	$(Q)$(LINK) $^ -o $@ -static $(LIBS)
hola: $(UTILITIES) hola.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
fib: $(UTILITIES) fib.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
callmaxofthree: $(UTILITIES) callmaxofthree.o maxofthree.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
echo: $(UTILITIES) echo.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
power: $(UTILITIES) power.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
callsum: $(UTILITIES) callsum.o sum.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
average: $(UTILITIES) average.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)
callfactorial: $(UTILITIES) callfactorial.o factorial.o
	$(Q)$(GCC) $(CFLAGS) $^ $(LDFLAGS) -o $@ -static $(LIBS)

run: $(TARGETS)
	@echo "[enter]run examples"
	-$(PWD)/hello
	-$(PWD)/hola
	-$(PWD)/fib
	-$(PWD)/callmaxofthree
	-$(PWD)/echo 25782 dog huh $$$$
	-$(PWD)/echo 25782 dog huh '$$$$'
	-$(PWD)/power 2 19
	-$(PWD)/power 3 -8
	-$(PWD)/power 1 500
	-$(PWD)/callsum
	-$(PWD)/average 1.11111 2.2222 3.3333
	-$(PWD)/callfactorial
	@echo "[leave]run examples"
