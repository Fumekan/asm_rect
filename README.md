# Rectangle

This program prints a hollow rectangle made of asterisks.

The rectangle size is set in `_start`:

```asm
mov rdi, 15     ;; columns
mov rsi, 5      ;; rows
call print_rectangle
```

```text
***************
*             *
*             *
*             *
***************
```

##Build and run

Requirements:

- `nasm`
- `ld`
- `make`
- Linux x86-64

From this directory:

```sh
make run
```
