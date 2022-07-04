CURRENT_DIR=$(shell pwd)
VERSION=10.3-2021.07
HOST=x86_64
#AArch64 GNU/Linux target
TARGET=aarch64-none-linux-gnu
TOOL_DIR=$(CURRENT_DIR)/../../tools/gcc-arm-$(VERSION)-$(HOST)-$(TARGET)
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/$(TARGET)/include/c++/10.3.1
GCC=$(BIN)/$(TARGET)-gcc
AS=$(BIN)/$(TARGET)-as
LD=$(BIN)/$(TARGET)-ld
OBJDUMP=$(BIN)/$(TARGET)-objdump

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/lib64
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/libc/usr/lib64
LIBS = -lc

Q = @
LINK = $(LD)
VERBOSE = --verbose

#OBJS = hello5.o
OBJS = tic_tac.o
MODULE = zelfbinary

all: hook $(MODULE) objdump run
hook:
	$(Q)echo "GCC = $(GCC)"
	$(Q)echo "AS = $(AS)"
	$(Q)echo "LD = $(LD)"
	$(Q)echo "OBJDUMP = $(OBJDUMP)"
	$(Q)echo "INCLUDE = $(INCLUDE)"
	$(Q)echo "LIBS = $(LIBS)"
	$(Q)echo "OBJS = $(OBJS)"
	$(Q)echo "LDFLAGS = $(LDFLAGS)"

$(MODULE): $(OBJS)
	$(Q)$(LINK) $(VERBOSE) $(LDLAGS) $^ -o $@ -static $(LIBS)

%.o : %.c
	$(Q)$(GCC) $(CFLAGS) -c $< -o $@

%.o : %.S
	$(Q)$(AS) $(ASFLAGS) -c $< -o $@

objdump: $(MODULE)
	$(Q)$(OBJDUMP) -d $(MODULE) > $(MODULE).objdump

run: $(OUTPUT)
	$(Q)adb root
	$(Q)adb push $(MODULE) /data/app/$(MODULE)
	$(Q)adb shell /data/app/$(MODULE)

.PRONY: clean
clean:
	$(Q)echo "clean all"
	$(Q)rm -rf $(MODULE) *.o *.d *.a *.exe
