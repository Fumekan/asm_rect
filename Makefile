ASM := nasm
LD := ld

TARGET := rect
SRC := rect.asm
OBJ := $(SRC:.asm=.o)

ASMFLAGS := -f elf64
LDFLAGS :=

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $<

%.o: %.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJ) $(TARGET)
