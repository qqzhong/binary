# Change this to whereever you keep NDK
NDK       = /data/tools/android-sdk-linux_x86/ndk/21.2.6472646
SRCDIR    = .
OBJDIR    = .
DBG      ?= 0

# Debug/Release configuration
ifeq ($(DBG),1)
MODE_FLAGS     = -DDEBUG -g -O0 -Wall -Werror
else
MODE_FLAGS     = -Os -fdata-sections -ffunction-sections
endif

## NDK configuration (clang)

# NDK Version
NDK_TARGETVER  = 29

# Target arch - here aarch64 for android
NDK_TARGETARCH = aarch64-linux-android

# Target CPU (ARMv8)
NDK_TARGETSHORTARCH = arm64

# Toolchain version
NDK_TOOLVER  = 4.9

# Architecture of a machine that does cross compilation
NDK_HOSTARCH = linux-x86_64

# Set needed preprocessor symbols
NDK_TOOLS    = $(NDK)/toolchains/llvm/prebuilt/$(NDK_HOSTARCH)/bin
NDK_SYSROOT  = $(NDK)/sysroot
NDK_TOOL     = $(NDK_TOOLS)/clang
NDK_LIBS     = $(NDK)/toolchains/$(NDK_TARGETARCH)-$(NDK_TOOLVER)/prebuilt/linux-x86_64/lib/gcc/$(NDK_TARGETARCH)/4.9.x
NDK_INCLUDES = -I$(NDK)/sysroot/usr/include \
               -I$(NDK)/sysroot/usr/include/$(NDK_TARGETARCH)
NDK_SYSROOT  = $(NDK)/platforms/android-$(NDK_TARGETVER)/arch-$(NDK_TARGETSHORTARCH)
NDK_AS       = $(NDK_TOOLS)/llvm-as

# Options common to compiler and linker
OPT          = $(MODE_FLAGS) \
    -std=c99 \
    -fPIE \
    -Wall \
    -target $(NDK_TARGETARCH)

# Compiler options
CFLAGS       = $(OPT) \
    $(NDK_INCLUDES)

# Linker options
LDFLAGS      = $(OPT) \
    $(MODE_FLAGS) \
    -pie \
    --sysroot=$(NDK_SYSROOT) \
    -B $(ANDROID_NDK)/toolchains/$(NDK_TARGETARCH)-$(NDK_TOOLVER)/prebuilt/linux-x86_64/$(NDK_TARGETARCH)/bin \
    -L$(NDK_LIBS)

#NAME = hello
NAME = example01
OUTPUT = zelfbinary

all:
	rm -f $(NAME).o $(OUTPUT)
	$(NDK_TOOL) -c $(SRCDIR)/$(NAME).c -o $(OBJDIR)/$(NAME).o $(CFLAGS)
	$(NDK_TOOL) -o $(OUTPUT) $(OBJDIR)/$(NAME).o $(LDFLAGS)

clean:
	rm -f $(NAME).o $(OUTPUT)

adb-prepare:
	adb devices
	adb root
#	adb remount

push: adb-prepare
	adb push $(OUTPUT) /data/app/

run: adb-prepare push
	adb shell /data/app/$(OUTPUT)
