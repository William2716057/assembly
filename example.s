# example.s
.section .data
message:
    .ascii "Hello, World!\n"
.section .text
.globl _start
_start:
    mov $4, %eax         # System call number for 'write'
    mov $1, %ebx         # File descriptor 1 (stdout)
    mov $message, %ecx   # Message address
    mov $14, %edx        # Message length
    int $0x80            # Interrupt to invoke system call

    mov $1, %eax         # System call number for 'exit'
    xor %ebx, %ebx       # Exit status 0
    int $0x80            # Interrupt to invoke system call
