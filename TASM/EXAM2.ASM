; Filename: Hands-on Exam 2.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 25, 2025
; Description: Fishbook Account Registration form with summary box + colored buttons and a decision for box color

.MODEL small
.STACK 100h
.DATA
    formTitle db 'FISHBOOK ACCOUNT REGISTRATION$'
    inputFullName db 13,10,'Enter Full Name: $'
    inputBirthday db 13,10,'Enter Birthday: $'
    inputGender db 13,10,'Enter Gender: $'
    inputEmail db 13,10,'Enter Email Address: $'
    inputPassword db 13,10,'Enter Password: $'
    inputDecision db 'Enter your choice: $'

    ; DOS 0Ah input buffers (first byte = max, second = actual length)
    fullName   db 50, 0, 49 dup(?)
    birthday   db 50, 0, 49 dup(?)
    gender     db 50, 0, 49 dup(?)
    email      db 50, 0, 49 dup(?)
    password   db 50, 0, 49 dup(?)
    decision   db 2, 0, 1 dup(?)

    sumDecision db 13,10,'How do you like to display the summary table?',13,10,'$'
    decision1 db '1 - blue background',13,10,'$'
    decision2 db '2 - red background',13,10,'$'
    errorMsg db 13,10,'Error. Invalid input',13,10,'$'
    sumMessage db 13,10,'Please review account registration details below:',13,10,'$'

    fullNameLabel       db 'Full Name:      $'
    birthdayLabel       db 'Birthday:       $'
    genderLabel         db 'Gender:         $'
    emailLabel          db 'Email Address:  $'
    passwordLabel       db 'Password:       $'

    submitButton db ' SUBMIT $'
    cancelButton db ' CANCEL $'
    editButton db ' EDIT $'

    verticalBorder db '|$'                  ; single char border (no CR/LF)
    firstHorizontalBorder db '___________________________________________$'  ; 45 underscores
    horizontalBorder db '+-----------------------------------------+$'          ; + + with 43 dashes -> total 45
    newline db 13,10,'$'                     ; explicit CR/LF used by us

    ; Box width (characters) — must match lengths above
    BOX_WIDTH    equ 43

.CODE
ProgramStart:
    mov ax, @data
    mov ds, ax

    ; Display form title
    mov ah, 09h
    lea dx, formTitle
    int 21h

    ; Prompt for Full Name
    mov ah, 09h
    lea dx, inputFullName
    int 21h
    mov ah, 0Ah
    lea dx, fullName
    int 21h

    ; Prompt for Birthday
    mov ah, 09h
    lea dx, inputBirthday
    int 21h
    mov ah, 0Ah
    lea dx, birthday
    int 21h

    ; Prompt for Gender
    mov ah, 09h
    lea dx, inputGender
    int 21h
    mov ah, 0Ah
    lea dx, gender
    int 21h

    ; Prompt for Email
    mov ah, 09h
    lea dx, inputEmail
    int 21h
    mov ah, 0Ah
    lea dx, email
    int 21h

    ; Prompt for Password
    mov ah, 09h
    lea dx, inputPassword
    int 21h
    mov ah, 0Ah
    lea dx, password
    int 21h

    ; Prompt for decision on summary box color
    mov ah, 09h
    lea dx, sumDecision
    int 21h
    mov ah, 09h
    lea dx, decision1
    int 21h
    mov ah, 09h
    lea dx, decision2
    int 21h
    mov ah, 09h
    lea dx, inputDecision
    int 21h
    
    ; Input decision
    mov ah, 0Ah
    lea dx, decision
    int 21h

    ; Check decision
    lea bx, decision
    mov al, [bx+2]         ; Get the character entered
    
    cmp al, '1'
    je ValidChoice
    
    cmp al, '2'
    je ValidChoice
    
    ; Invalid input - call error procedure
    call ErrorProcess
    
ValidChoice:

    ; Form Summary Message
    mov ah, 09h
    lea dx, sumMessage
    int 21h

    ; Display colored summary box
    call DisplaySummaryBox

    ; Display colored buttons
    call DisplayButtons

    ; Terminate program
    mov ah, 4Ch
    int 21h

; Error procedure - prints error message and exits program
ErrorProcess proc
    mov ah, 09h
    lea dx, errorMsg
    int 21h
    mov ah, 4Ch            ; Exit program
    int 21h
ErrorProcess endp

ColorLastLine proc
    push ax
    push bx
    push cx
    push dx
    push si
    push es

    ; Get cursor position (DH = row, DL = col)
    mov ah, 03h
    mov bh, 0
    int 10h

    ; Adjust: move up one row (so we color the line that was just printed)
    dec dh

    ; Video segment
    mov ax, 0B800h
    mov es, ax

    ; Compute offset = row * 160
    xor ax, ax
    mov al, dh
    mov bx, 160
    mul bx
    mov si, ax

    ; Check decision directly
    push bx
    lea bx, decision
    mov al, [bx+2]
    pop bx
    
    ; Default blue
    mov bl, 1Fh
    
    ; If '2', use red
    cmp al, '2'
    jne UseColor
    mov bl, 4Fh

UseColor:
    ; Paint BOX_WIDTH characters (attribute bytes) starting from column 0
    mov cx, BOX_WIDTH
ColorLoop:
    inc si                      ; move to attribute byte
    mov byte ptr es:[si], bl    ; use color
    inc si                      ; move to next character byte
    loop ColorLoop

    pop es
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
ColorLastLine endp

; -----------------------------------------------------
; DisplaySummaryBox: prints each line, colors immediately, then prints explicit newline
; (ensures color applies to the right row - no leaking)
; -----------------------------------------------------
DisplaySummaryBox proc
    ; Top horizontal border (print, color, newline)
    mov ah, 09h
    lea dx, firstHorizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Full Name row: label, left border, value+padding, right border
    call DisplaySummaryRow
    mov ah, 09h
    lea dx, fullNameLabel
    int 21h
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    lea si, fullName
    call PrintInputWithPadding
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Horizontal border
    mov ah, 09h
    lea dx, horizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Birthday row
    call DisplaySummaryRow
    mov ah, 09h
    lea dx, birthdayLabel
    int 21h
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    lea si, birthday
    call PrintInputWithPadding
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Horizontal border
    mov ah, 09h
    lea dx, horizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Gender row
    call DisplaySummaryRow
    mov ah, 09h
    lea dx, genderLabel
    int 21h
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    lea si, gender
    call PrintInputWithPadding
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Horizontal border
    mov ah, 09h
    lea dx, horizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Email row
    call DisplaySummaryRow
    mov ah, 09h
    lea dx, emailLabel
    int 21h
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    lea si, email
    call PrintInputWithPadding
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Horizontal border
    mov ah, 09h
    lea dx, horizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Password row
    call DisplaySummaryRow
    mov ah, 09h
    lea dx, passwordLabel
    int 21h
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    lea si, password
    call PrintInputWithPadding
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine

    ; Final horizontal border
    mov ah, 09h
    lea dx, horizontalBorder
    int 21h
    mov ah, 09h
    lea dx, newline
    int 21h
    call ColorLastLine
    mov ah, 09h
    lea dx, newline
    int 21h

    ret
DisplaySummaryBox endp

; -----------------------------------------------------
; DisplayButtons: print buttons then color their attrs (unchanged approach)
; -----------------------------------------------------
DisplayButtons proc
    push ax
    push bx
    push cx
    push dx
    push si
    push es

    ; Get current cursor position (start of button line)
    mov ah, 03h
    mov bh, 0
    int 10h
    push dx                 ; Save cursor position

    ; Print buttons normally
    mov ah, 09h
    lea dx, submitButton
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov ah, 09h
    lea dx, cancelButton
    int 21h
    mov dl, ' '
    mov ah, 02h
    int 21h
    mov ah, 09h
    lea dx, editButton
    int 21h

    ; Now color buttons using video memory (attributes)
    pop dx                  ; Restore cursor position (DH=row)
    mov bl, dh              ; Save button row

    mov ax, 0B800h
    mov es, ax

    ; Calculate starting position in video memory for that row
    mov al, bl
    mov ah, 0
    mov cx, 160
    mul cx
    mov si, ax

    ; Color " SUBMIT " (8 chars) - RED background (4Fh)
    mov cx, 8
ColorizeSubmit:
    inc si
    mov byte ptr es:[si], 4Fh
    inc si
    loop ColorizeSubmit

    ; " " (1 char) - normal (07h)
    inc si
    mov byte ptr es:[si], 07h
    inc si

    ; " CANCEL " (8 chars) - RED
    mov cx, 8
ColorizeCancel:
    inc si
    mov byte ptr es:[si], 4Fh
    inc si
    loop ColorizeCancel

    ; " " (1 char) - normal
    inc si
    mov byte ptr es:[si], 07h
    inc si

    ; " EDIT " (6 chars) - RED
    mov cx, 6
ColorizeEdit:
    inc si
    mov byte ptr es:[si], 4Fh
    inc si
    loop ColorizeEdit

    pop es
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
DisplayButtons endp

; -----------------------------------------------------
; Small helpers
; -----------------------------------------------------
DisplaySummaryRow proc
    mov ah, 09h
    lea dx, verticalBorder
    int 21h
    ret
DisplaySummaryRow endp

; PrintInputWithPadding: prints string from DOS 0Ah buffer and pads to 24 chars
; (does not print newline)
PrintInputWithPadding proc
    push si
    mov bx, si
    mov cl, [bx+1]         ; input length
    xor ch, ch

    cmp cl, 0
    jbe PrintPaddingOnly
    add bx, 2
    push cx
PrintInputLoop:
    mov dl, [bx]
    mov ah, 02h
    int 21h
    inc bx
    loop PrintInputLoop
    pop cx

PrintPaddingOnly:
    mov al, 24             ; desired field width
    sub al, cl
    mov cl, al
    xor ch, ch
PaddingLoop:
    cmp cl, 0
    jbe DonePadding
    mov dl, ' '
    mov ah, 02h
    int 21h
    dec cl
    jmp PaddingLoop
DonePadding:
    pop si
    ret
PrintInputWithPadding endp

END ProgramStart