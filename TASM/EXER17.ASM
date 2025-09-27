; Filename: Exer17.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will continuously get character input and display back character input until Enter key is pressed.

.MODEL small
.STACK 200h
.DATA
.code
ProgramStart:
    EchoLoop:
        mov ah, 01h       ; function 01h - input character with echo
        int 21h           ; DOS interrupt
        cmp al, 0dh       ; compare input character with Enter key (carriage return)
        je EndProgram     ; if Enter key is pressed, jump to EndProgram
        mov dl, al        ; move input character to DL for output
        mov ah, 02h       ; function 02h - output character in DL
        int 21h           ; DOS interrupt
        jmp EchoLoop      ; repeat the loop
    EndProgram:
    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart