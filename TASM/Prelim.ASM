; Filename: PRELIM.asm
; Create user interface 
; Name: Joseph Xeno O. Banzon
; Date: September 4, 2025

.model small
.stack 100h
.data
msgDetails  db 'Please enter your details',0
msgWelcome  db 'Welcome back',0

; === Email box ===
msgEmailTop db 0C9h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BBh,0
msgEmailMid db 0BAh,' Email address                                                      ',0BAh,0
msgEmailBot db 0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0

; === Password box ===
msgPassTop db 0C9h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BBh,0
msgPassMid db 0BAh,' Password                                                           ',0BAh,0
msgPassBot db 0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0

; === Checkbox and Remember text =
msgCheckBox      db 254,0
msgRememberText  db 'Remember for 30 days',0

msgForgot        db 'Forgot password',0

msgSignUpText    db 'Sign up',0

msgGoogleTop db 0C9h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BBh,0
msgGoogleMid db 0BAh,'                        Sign in with Google                         ',0BAh,0
msgGoogleBot db 0C8h,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0CDh,0BCh,0

msgNoAcc    db '                  Don''t have an account?',0

msgFooter   db 'Created by: Joseph Xeno O. Banzon',0

.code

WriteString PROC
    push ax
    push bx
    push cx
    push dx

NextChar:
    lodsb
    cmp al, 0
    je Done
    mov ah, 02h        ; set cursor pos
    mov bh, 0
    int 10h

    mov ah, 09h        ; write char with attribute
    mov bh, 0
    mov cx, 1
    int 10h

    inc dl             ; move right
    jmp NextChar
Done:
    pop dx
    pop cx
    pop bx
    pop ax
    ret
WriteString ENDP


start:
    mov ax, @data
    mov ds, ax

    ; Set video mode 3 (80x25 text)
    mov ah, 0
    mov al, 3
    int 10h

    ; Set video memory segment
    mov ax, 0B800h
    mov es, ax

    ; === Fill screen: white BG ===
    mov al, ' '
    mov ah, 70h        ; white bg, black text
    xor di, di
    mov cx, 2000
FillScreen:
    stosw
    loop FillScreen

    ; === Top border ===
    mov al, ' '
    mov ah, 4Fh        ; red bg, white text
    xor di, di
    mov cx, 80
TopBorder:
    stosw
    loop TopBorder

    ; === Bottom border ===
    mov di, 3840       ; row 24 = 24*160
    mov cx, 80
BottomBorder:
    stosw
    loop BottomBorder

    ; === Left & Right borders ===
    mov cx, 23
    mov si, 1
DrawSides:
    mov di, si
    shl di, 1
    mov bx, di
    shl di, 2
    add di, bx
    shl di, 4          ; di = si*160
    mov bx, di

    mov al, ' '
    mov ah, 4Fh
    stosw              ; left border

    mov di, bx
    add di, 158
    stosw              ; right border

    inc si
    loop DrawSides

    ; === Form Text ===
    lea si, msgDetails
    mov dh, 2
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgWelcome
    mov dh, 4
    mov dl, 5
    mov bl, 70h
    call WriteString

    ; === Email box ===
    lea si, msgEmailTop
    mov dh, 6
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgEmailMid
    mov dh, 7
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgEmailBot
    mov dh, 8
    mov dl, 5
    mov bl, 70h
    call WriteString

    ; === Password box ===
    lea si, msgPassTop
    mov dh, 10
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgPassMid
    mov dh, 11
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgPassBot
    mov dh, 12
    mov dl, 5
    mov bl, 70h
    call WriteString

    ; === Checkbox + Remember ===
    lea si, msgCheckBox
    mov dh, 14
    mov dl, 5
    mov bl, 70h         
    call WriteString

    lea si, msgRememberText
    mov dh, 14
    mov dl, 9
    mov bl, 70h         
    call WriteString

    ; === Forgot password (blue + underline) ===
    lea si, msgForgot
    mov dh, 14
    mov dl, 60
    mov bl, 71h         ; blue text, white bg
    call WriteString

 

    ; === Sign up (blue + underline) ===
    lea si, msgNoAcc
    mov dh, 21
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgSignUpText
    mov dh, 21
    mov dl, 47
    mov bl, 71h
    call WriteString


    ; === Google sign-in box ===
    lea si, msgGoogleTop
    mov dh, 18
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgGoogleMid
    mov dh, 19
    mov dl, 5
    mov bl, 70h
    call WriteString

    lea si, msgGoogleBot
    mov dh, 20
    mov dl, 5
    mov bl, 70h
    call WriteString

    ; === Footer ===
    lea si, msgFooter
    mov dh, 23
    mov dl, 5
    mov bl, 70h
    call WriteString

    ; Wait for key press
    mov ah, 0
    int 16h

    ; Exit to DOS
    mov ax, 4C00h
    int 21h

end start
