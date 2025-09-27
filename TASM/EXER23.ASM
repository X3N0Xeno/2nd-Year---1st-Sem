; Filename: Exer23.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get your first name, middle name, and last name. Then display "Hello, FIRSTNAME MIDDLENAME LASTNAME!".

.MODEL small
.STACK 100h
.DATA
    formTitle db 'REGISTRATION FORM',13,10,'$'
    inputMsg1 db 13,10,'Enter First Name: $'
    inputMsg2 db 13,10,'Enter Middle Name: $'
    inputMsg3 db 13,10,'Enter Family Name: $'
    firstName db 50, 0, 49 dup(?)
    middleName db 50, 0, 49 dup(?)
    familyName db 50, 0, 49 dup(?)
    greetMsg db 13,10,'Hello, $'
    newline db 13,10,'$'

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax

    ; Display form title
    mov ah, 09h
    lea dx, formTitle
    int 21h

    ; Prompt for First Name
    mov ah, 09h
    lea dx, inputMsg1
    int 21h
    mov ah, 0Ah
    lea dx, firstName
    int 21h

    ; Prompt for Middle Name
    mov ah, 09h
    lea dx, inputMsg2
    int 21h
    mov ah, 0Ah
    lea dx, middleName
    int 21h

    ; Prompt for Family Name
    mov ah, 09h
    lea dx, inputMsg3
    int 21h
    mov ah, 0Ah
    lea dx, familyName
    int 21h

    ; Display greeting
    mov ah, 09h
    lea dx, greetMsg
    int 21h

    ; Print first name
    lea si, firstName
    call PrintInput

    ; Print space
    mov dl, ' '
    mov ah, 02h
    int 21h

    ; Print middle name
    lea si, middleName
    call PrintInput

    ; Print space
    mov dl, ' '
    mov ah, 02h
    int 21h

    ; Print family name
    lea si, familyName
    call PrintInput

    ; Print exclamation and newline
    mov dl, '!'
    mov ah, 02h
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Terminate program
    mov ah, 4Ch
    int 21h

; PrintInput: prints string from DOS 0Ah buffer (skip length byte, print until CR)
PrintInput proc
    mov bx, si
    mov cl, [bx+1]         ; get input length (includes CR)
    xor ch, ch
    cmp cl, 0
    jbe DonePrint          ; if length <= 1 (only CR or nothing), skip printing
    add bx, 2              ; point to first char
PrintLoop:
    mov dl, [bx]
    mov ah, 02h
    int 21h
    inc bx
    loop PrintLoop
DonePrint:
    ret
PrintInput endp

END ProgramStart