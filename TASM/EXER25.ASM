; Filename: Exer25.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will create an Automated Teller Machine. Get user input. Display the chosen option.

.MODEL small
.STACK 100h
.DATA
    university db 'Cebu Institute of Technology - University',13,10,'$'
    formTitle db 'Automated Teller Machine',13,10,'$'
    promptStart db 13,10,'Menu',13,10,'$'
    option1 db '1 Balance Inquiry',13,10,'$'
    option2 db '2 Withdrawal',13,10,'$'
    option3 db '3 Deposit',13,10,'$'
    option4 db '4 Transfer',13,10,'$'
    option5 db '5 Bills Payment',13,10,'$'
    option6 db '6 Change PIN',13,10,'$'
    option7 db '7 Exit',13,10,'$'
    InvalidMsg db 'Invalid option selected.',13,10,'$'
    promptOption db 'Enter number of your choice: $'
    userInput db 2, 0, 2 dup(?)
    optionSelected db 'You have chosen $'
    thankYou db 'Thank you for banking with us!',13,10,'$'
    copyright db 'Copyright 2025',13,10,'$'
    programmerName db 'Programmer: Joseph Xeno O. Banzon',13,10,'$'
    newline db 13,10,'$'


.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax

    ; Display university
    mov ah, 09h
    lea dx, university
    int 21h

    ; Display form title
    mov ah, 09h
    lea dx, formTitle
    int 21h

    ; Prompt form input
    mov ah, 09h
    lea dx, promptStart
    int 21h

    ; Display options
    mov ah, 09h
    lea dx, option1
    int 21h

    mov ah, 09h
    lea dx, option2
    int 21h

    mov ah, 09h
    lea dx, option3
    int 21h

    mov ah, 09h
    lea dx, option4
    int 21h

    mov ah, 09h
    lea dx, option5
    int 21h

    mov ah, 09h
    lea dx, option6
    int 21h

    mov ah, 09h
    lea dx, option7    
    int 21h

    ; Prompt for option
    mov ah, 09h
    lea dx, promptOption
    int 21h
    mov ah, 01h
    int 21h
    mov userInput+2, al ; store input character in buffer (simulate 0Ah buffer)
    mov userInput+1, 1  ; set length to 1

    mov ah, 09h
    lea dx, newline
    int 21h

    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display option selected message
    mov ah, 09h
    lea dx, optionSelected
    int 21h

    ; Get the first character of user input (the option number)
    lea si, userInput
    mov al, [si+2]      ; skip length and CR, get first char entered

    ; Compare and display the corresponding option
    cmp al, '1'
    je ShowOpt1
    cmp al, '2'
    je ShowOpt2
    cmp al, '3'
    je ShowOpt3
    cmp al, '4'
    je ShowOpt4
    cmp al, '5'
    je ShowOpt5
    cmp al, '6'
    je ShowOpt6
    cmp al, '7'
    je ShowOpt7
    jmp ShowInvalid

    ShowOpt1:
        mov ah, 09h
        lea dx, option1
        int 21h
        jmp AfterOption
    ShowOpt2:
        mov ah, 09h
        lea dx, option2
        int 21h
        jmp AfterOption
    ShowOpt3:
        mov ah, 09h
        lea dx, option3
        int 21h
        jmp AfterOption
    ShowOpt4:
        mov ah, 09h
        lea dx, option4
        int 21h
        jmp AfterOption
    ShowOpt5:
        mov ah, 09h
        lea dx, option5
        int 21h
        jmp AfterOption
    ShowOpt6:
        mov ah, 09h
        lea dx, option6
        int 21h
        jmp AfterOption
    ShowOpt7:
        mov ah, 09h
        lea dx, option7
        int 21h
        jmp AfterOption
    ShowInvalid:
        mov ah, 09h
        lea dx, InvalidMsg
        int 21h
    AfterOption:
    
    mov ah, 09h
    lea dx, newline
    int 21h

    ; thank you message
    mov ah, 09h
    lea dx, thankYou
    int 21h

    ; copyright message
    mov ah, 09h
    lea dx, copyright
    int 21h

    ; programmer name
    mov ah, 09h
    lea dx, programmerName
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