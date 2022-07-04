CURRENT_DIR=$(shell pwd)
VERSION=10.3-2021.07
HOST=x86_64
#bare-metal target
TARGET=arm-none-eabi
TOOL_DIR=$(CURRENT_DIR)/../../tools/gcc-arm-$(VERSION)-$(HOST)-$(TARGET)
BIN=$(TOOL_DIR)/bin
INCLUDE=$(TOOL_DIR)/$(TARGET)/include/
GCC=$(BIN)/$(TARGET)-gcc
AS=$(BIN)/$(TARGET)-as
LD=$(BIN)/$(TARGET)-ld
OBJDUMP=$(BIN)/$(TARGET)-objdump

ASFLAGS = -g -Wall -I $(INCLUDE)
CFLAGS += -g -O0 -Wall -Werror -fPIC -I $(INCLUDE)
LDFLAGS += -Wl,--no-fatal-warnings,-Map,output.map
LDFLAGS += -L $(TOOL_DIR)/$(TARGET)/lib
#LIBS = -lc

Q = @
LINK = $(LD)
#VERBOSE = --verbose=9

OBJS = hello0.o
#OBJS = shellcode.o
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
