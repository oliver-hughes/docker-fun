        BITS 32
        SECTION .data       ; DATA
msg:    db "Hello World",10 ; This is the text we want to print.
                            ; The 10 at the end means "next line" (see
                            ; http://www.asciitable.com/)
len:    equ $-msg           ; We calculate the length of the text by
                            ; subtracting the memory address of msg
                            ; from the current address ("$")

        SECTION .text       ; PROGRAM CODE
        global _start       ; Program starts at _start
_start:
                            ; We use the Linux syscall "write"
                            ; (see http://man7.org/linux/man-pages/man2/write.2.html)
        mov edx, len        ; edx receives the length of the string
                            ; edx is a so called "register" (Details see
                            ; https://en.wikipedia.org/wiki/Processor_register)
        mov ecx, msg        ; ecx receives the address of the text
        mov ebx, 1          ; 1 means "stdout" = screen
        mov eax, 4          ; 4 identifies the syscall "write"
        int 0x80            ; Call Linux kernel with interrupt 0x80

                            ; To exit, we use the syscall "exit"
                            ; (see http://man7.org/linux/man-pages/man2/exit.2.html)
        mov ebx, 0          ; 0 means "no error"
        mov eax, 1          ; 1 identifies the syscall "exit"
        int 0x80
