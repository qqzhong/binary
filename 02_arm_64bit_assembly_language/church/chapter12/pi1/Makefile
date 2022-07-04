# source files
SOURCES_ASM := main.S RPI_GPIO.S start.S handlers.S RasPiIC.S RasPi_timer.S
SOURCES_C :=

# object files
OBJS := $(patsubst %.s,%.o,$(SOURCES_ASM))
OBJS += $(patsubst %.c,%.o,$(SOURCES_C))

# Build flags
INCLUDES := -I.
ASFLAGS :=
CFLAGS := $(INCLUDES)

# build targets
all: kernel8.img

# Build image for Raspberry Pi
kernel8.img: bare.elf
	objcopy bare.elf -O binary kernel8.img

# Build the ELF file
bare.elf: $(OBJS) bare_metal.ld
	ld $(OBJS) -Tbare_metal.ld -o $@

# Compile C to object file
%.o: %.c
	gcc $(CFLAGS) -c $< -o $@

# Compile Assembly to object file
%.o: %.s
	gcc $(ASFLAGS) -c $< -o $@

# Clean up the build directory
clean:
	rm -f $(OBJS) kernel.elf kernel8.img uImage

dist-clean: clean
	rm -f *~
