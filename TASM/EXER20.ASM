; Filename: Exer20.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will get string input and display the reverse of the string.

.MODEL small
.STACK 100h
.DATA
    MAXIMUM_STRING_LENGTH EQU 1000
    StringInput db MAXIMUM_STRING_LENGTH DUP (?)    ; Reserves a buffer of size MAXIMUM_STRING_LENGTH bytes for storing a string input.
                                                    ; Each byte is initialized with an undefined value (?). The buffer can be used to read or store
    ReverseString db MAXIMUM_STRING_LENGTH DUP (?)
.code
ProgramStart:
    mov ax,@data
    mov ds,ax                       ; set ds to point to data segment

    mov ah, 3fh                     ; DOS read from handle function
    mov bx, 0                       ; Stantard input handle
    mov cx, MAXIMUM_STRING_LENGTH   ; read up to maximum number of characters

    mov dx, offset StringInput      ; store the string input here
    int 21h                         ; get the string
    and ax,ax                       ; were any characters read?
    jz Done                         ; jz = jump if zero. No, then jump to done
    mov cx, ax                      ; put the sting length in cx where you can us it as a counter

    push cx                         ; save the string length
    mov bx, offset StringInput
    mov si, offset ReverseString    ; points to reverse string in the SI register
    add si, cx                      ; adds the value in the CX register to SI
    dec si                          ; decrements SI by 1, so now SI points exactly to the last character of the string
    ReverseLoop:
        mov al,[bx]                 ; Load character from StringInput
        mov [si],al                 ; Store it in ReverseString (in reverse order)
        inc bx                      ; Move to next character in StringInput
        dec si                      ; Move to previous position in ReverseString
        loop ReverseLoop            ; Repeat for all characters

    pop cx                          ; get back the string length
    mov ah, 40h                     ; DOS write form handle function
    mov bx,1                        ; standard output handle
    mov dx, offset ReverseString    ; point to string input
    int 21h                         ; print the string

    Done:
    ; terminate program
    mov ah, 4ch
    int 21h

END ProgramStart