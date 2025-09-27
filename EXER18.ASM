; Filename: Exer18.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get character input and determine if input is 'y' or 'Y' to display good morning message else display good afternoon message.

.MODEL small
.STACK 100h
.DATA
    TimePrompt db 'Is it morning? (y/Y): $'
    GoodMorningMsg db 13,10,'Good Morning, WORLD!',13,10,'$'
    GoodAfternoonMsg db 13,10,'Good Afternoon, WORLD!',13,10,'$'
.code
ProgramStart:
    mov ax,@data
    mov ds,ax                       ; set ds to point to data segment

    ; prompt user for input
    mov dx, offset TimePrompt       ; load address of prompt message
    mov ah, 09h                     ; DOS print string function
    int 21h                         ; display time prompt

    ; get character input
    mov ah, 01h                     ; DOS get character function
    int 21h                         ; get single character response

    ; check if input is 'y' or 'Y'
    cmp al, 'y'                     ; typed lowercase 'y'
    je PrintMorning                 ; je = jump if equal, if char equals 'y' jump to PrintMorning
    cmp al, 'Y'                     ; typed uppercase 'Y'
    je PrintMorning                 ; je = jump if equal, if char equals 'y' jump to PrintMorning

    ; else print afternoon
    mov dx, offset GoodAfternoonMsg ; point to good afternoon message
    mov ah, 09h
    int 21h
    jmp EndProgram

    PrintMorning:
    mov dx, offset GoodMorningMsg   ; point to good morning message
    mov ah, 09h
    int 21h

    EndProgram:
    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart