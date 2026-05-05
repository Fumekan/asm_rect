
global _start
section .data
	star db 42
	space db 32
	newline db 10

	STDOUT equ 1
	WRITE equ 1
	EXIT equ 60

section .text

_start:
	mov rdi, 15			;; columns
	mov rsi, 5			;; rows
	call print_rectangle

	mov rax, EXIT
	xor rdi, rdi
	syscall

print_rectangle:
	push r12
	push r13

	mov r12, rdi		;; total columns
	mov r13, rsi		;; total rows
	mov r8, 1			;; current row

row_loop:
	mov r9, 1			;; current column

column_loop:
	mov rsi, star

	cmp r8, 1			;; first row
	je print_char
	cmp r8, r13			;; last row
	je print_char
	cmp r9, 1			;; first column
	je print_char
	cmp r9, r12			;; last column
	je print_char

	mov rsi, space

print_char:
	mov rax, WRITE		;; sys_write
	mov rdi, STDOUT		;; stdout
	mov rdx, 1			;; one byte
	syscall

	add r9, 1			;; next column
	cmp r9, r12			;; compare with total columns
	jbe column_loop		;; if current column <= total columns, repeat

	mov rsi, newline
	mov rax, WRITE
	mov rdi, STDOUT
	mov rdx, 1
	syscall

	add r8, 1			;; next row
	cmp r8, r13			;; compare with total rows
	jbe row_loop		;; if current row <= total rows, repeat

	pop r13
	pop r12
	ret
