; Filename: Exer15.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will display multiple string variables on separate line.

.MODEL small
.STACK 200h
.DATA
String1 db '1 Mississipi ',0dh,0ah,'$'
String2 db '2 Mississipi ',0dh,0ah,'$' 
String3 db '3 Mississipi ',0dh,0ah,'$'     ; carriage return (ASCII code 0Dh) positions the cursor to the left side of the current line of characters
                                           ; line feed (ASCII code 0Ah) moves the cursor down one line on the output device.

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

    mov ah, 4ch
    int 21h

END ProgramStart