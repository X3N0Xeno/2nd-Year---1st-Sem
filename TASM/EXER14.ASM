; Filename: Exer14.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will display multiple string variables on a single line.

.MODEL small
.STACK 200h
.DATA
String1 db '1 Mississipi ','$'     ; db = define byte string1 vaiable and assign 'Line1' value.
String2 db '2 Mississipi ','$' 
String3 db '3 Mississipi ','$'     ; $ is a string terminator or end of string

.code
ProgramStart:
    mov ax,@data
    mov ds,ax
    mov ah,9                ; DOS print string function
    mov dx, offset String1  ; 1st string to print
    int 21h                 ; invoke DOS to print string
                            ; OFFSET means put address of String1 into register dx.
    mov dx, offset String2
    int 21h

    mov dx, offset String3
    int 21h

    mov ah, 4ch             ; DOS terminate program function
    int 21h                 ; invoke DOS to end program

END ProgramStart