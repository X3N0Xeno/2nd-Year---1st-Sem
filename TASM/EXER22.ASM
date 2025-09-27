; Filename: Exer22.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get a character input then Identify if its the letter 'A'. 

.MODEL small
.STACK 100h
.DATA
    charInput db 'Enter a character: $'
    isA db 13,10,'Yes, you have entered the letter A.',13,10,'$'
    isNotA db 13,10,'No, you have not entered letter A. You entered character $'
    inputChar db ?                   ; to store the input character

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax

    ; Display prompt message
    mov ah, 09h
    lea dx, charInput
    int 21h

    ; Read a character from keyboard
    mov ah, 01h
    int 21h
    mov inputChar, al                ; store input

    ; Compare input with 'A'
    cmp al, 'A'
    je PrintIsA

    ; Not 'A'
    mov ah, 09h
    lea dx, isNotA
    int 21h

    ; Print the entered character in the message
    mov ah, 02h
    mov dl, inputChar
    int 21h

    mov ah, 02h
    mov dl, "."
    int 21h

    jmp EndProgram

PrintIsA:
    mov ah, 09h
    lea dx, isA
    int 21h

EndProgram:
    mov ah, 4ch
    int 21h

END ProgramStart