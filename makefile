# Makefile for aarch64-none-elf bare-metal program with QEMU run
TARGET = os
SRC = main.c
ARCH = aarch64
CROSS_COMPILE = aarch64-none-elf

# Compiler and linker
CC = clang
LD = ld.lld

# Compilation flags
CFLAGS = -target $(CROSS_COMPILE) -nostdlib -ffreestanding -fno-builtin -Wall -O2
LDFLAGS = -T linker.ld

# QEMU run command
QEMU = qemu-system-aarch64
QEMU_FLAGS = -M virt -cpu cortex-a72 -kernel $(TARGET).img -m 4G -serial mon:stdio -nographic

# Build rules
all: $(TARGET).img

$(TARGET).img: $(SRC)
	$(CC) $(CFLAGS) -c $(SRC) -o $(TARGET).o
	$(LD) $(LDFLAGS) $(TARGET).o -o $(TARGET).img

# Run the program using QEMU
run: all
	@echo "\nIO:\n"
	$(QEMU) $(QEMU_FLAGS)

# Clean up build files
clean:
	rm -f $(TARGET).o $(TARGET).img
