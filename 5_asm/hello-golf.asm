global _start
_start:
  mov  al,  1    ; __NR_write
  mov  edi, eax     ; save 1 byte vs  mov dil, 1
  mov  dl,  msglen
  mov  esi, msg     ; 32-bit absolute addressing saves 1 byte vs. 5-byte CALL + 1-byte POP
  syscall

  mov  al,60      ; __NR_exit
  syscall
msg: db "Hello, World!"
msglen equ $ - msg
