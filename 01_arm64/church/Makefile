# This file is generated automatically by example.sh
# @date: Tue 08 Feb 2022 01:08:05 PM HKT

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
LINK = $(GCC)
#VERBOSE = --verbose

UTILITIES = set_errno.o syscall_arm.o

SLIDES = \
 examples38 examples38a examples38b examples38c examples39 \
 examples40 examples41 examples42 examples43 examples45 \
 examples60 examples61 examples68 examples68a examples69 \
 examples70 examples72 examples73 examples79 \
 examples81 examples81a \
 examplessp


TARGETS = \
 example001 example002 example003 example004 example005 example006 example007 example008 example009 example010 example011 example012 example013 example014 example015 example016 \
 example017 example018 example019 example020 example021 example022 example023 example024 example025 example026 example027 example028 example029 example030 example031 example032 \
 example033 example034 example035 example036 example037 example038 example039 example040 example041 example042 example043 example044 example045 example046 example047 example048 \
 example049 example050 example051 example052 example053 example054 example055 example056 example057 example058 example059 example060 example061 example062 example063 example064 \
 example065 example066 example067 example068 example069 example070 example071 example072 example073 example074 example075 example076 example077 example078 example079 example080 \
 example081 example082 example083 example084 example085 example086 example087 example088 example089 example090 example091 example092 example093 example094 example095 example096 \
 example097 example098 example099 example100 example101 example102 example103 example104 example105 example106 example107 example108 example109 $(SLIDES)

define TARGET_template =
$(1): $(UTILITIES) $(1).o
#	echo "$(1):$$^ -> $$@"
#	echo "$(LDFLAGS)"
	$(Q)$(GCC) $(CFLAGS) $$^ $(LDFLAGS) -o $$@ -static $(LIBS)
endef
$(foreach target,$(TARGETS),$(eval $(call TARGET_template,$(target))))

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

