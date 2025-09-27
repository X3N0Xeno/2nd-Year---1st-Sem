; Filename: Exer26.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will create a Vehicle Sticker Application Form. Get user input. Display the summary of the user information.

.model small
.stack 100h

.data
row         db 1            ; 8-bit row counter for border loop

; ----- UI Text strings -----
title1      db 'Please enter the needed information:',0Dh,0Ah,'$'
hdr1        db 'Cebu Institute of Technology - University$'
hdr2        db 'VEHICLE STICKER APPLICATION FORM$'
hdr3        db 'Please fill out form below.$'

; field label strings (for printing in the drawn form)
lab1 db 'Personnel Type: $'
lab2 db 'Name of Applicant/Driver: $'
lab3 db 'Mobile Number: $'
lab4 db 'Vehicle Make(s)/Brand: $'
lab5 db 'Vehicle Color: $'
lab6 db 'Vehicle Sticker Type: $'
lab7 db 'ID Number: $'
lab8 db 'Address: $'
lab9 db 'Plate Number: $'
lab10 db 'Vehicle Type: $'

submitTxt db ' SUBMIT $'
footerText db 'Copyright 2025 JOSEPH XENO O. BANZON$'
thankyou db 'Thank you!$'
newline db 13,10,'$'

; Input prompts (plain text)
p1  db 0Dh,0Ah,'Personnel Type: $'
p2  db 0Dh,0Ah,'Name of Applicant/Driver: $'
p3  db 0Dh,0Ah,'Mobile Number: $'
p4  db 0Dh,0Ah,'Vehicle Make/Brand: $'
p5  db 0Dh,0Ah,'Vehicle Color: $'
p6  db 0Dh,0Ah,'Vehicle Sticker Type: $'
p7  db 0Dh,0Ah,'ID Number: $'
p8  db 0Dh,0Ah,'Address: $'
p9  db 0Dh,0Ah,'Plate Number: $'
p10 db 0Dh,0Ah,'Vehicle Type: $'

; Input buffers (AH=0Ah format: max, len, chars...)
MAXLEN EQU 40
in1  db MAXLEN,0,MAXLEN dup(?)    ; Personnel Type
in2  db MAXLEN,0,MAXLEN dup(?)    ; Name
in3  db MAXLEN,0,MAXLEN dup(?)    ; Mobile
in4  db MAXLEN,0,MAXLEN dup(?)    ; Make
in5  db MAXLEN,0,MAXLEN dup(?)    ; Color
in6  db MAXLEN,0,MAXLEN dup(?)    ; Sticker
in7  db MAXLEN,0,MAXLEN dup(?)    ; ID
in8  db MAXLEN,0,MAXLEN dup(?)    ; Address
in9  db MAXLEN,0,MAXLEN dup(?)    ; Plate
in10 db MAXLEN,0,MAXLEN dup(?)    ; Type

; ASCII box pieces (same style as your template)
inputTop    db '$'
inputMid    db '$'
inputBot    db '$'
.code
start:

    mov ax, @data
    mov ds, ax

    ; ----------------------------
    ; FIRST: prompt user for each input (plain text)
    ; ----------------------------
    ; Display university
    mov ah, 09h
    lea dx, hdr1
    int 21h

    ;newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display form title
    mov ah, 09h
    lea dx, hdr2
    int 21h

    ;newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Prompt form input
    mov ah, 09h
    lea dx, title1
    int 21h

    mov dx, OFFSET p1
    mov ah,09h
    int 21h
    mov dx, OFFSET in1
    mov ah,0Ah
    int 21h
    ; terminate with '$' so printing later with AH=09 stops
    lea si, in1
    call AppendDollar

    mov dx, OFFSET p2
    mov ah,09h
    int 21h
    mov dx, OFFSET in2
    mov ah,0Ah
    int 21h
    lea si, in2
    call AppendDollar

    mov dx, OFFSET p3
    mov ah,09h
    int 21h
    mov dx, OFFSET in3
    mov ah,0Ah
    int 21h
    lea si, in3
    call AppendDollar

    mov dx, OFFSET p4
    mov ah,09h
    int 21h
    mov dx, OFFSET in4
    mov ah,0Ah
    int 21h
    lea si, in4
    call AppendDollar

    mov dx, OFFSET p5
    mov ah,09h
    int 21h
    mov dx, OFFSET in5
    mov ah,0Ah
    int 21h
    lea si, in5
    call AppendDollar

    mov dx, OFFSET p6
    mov ah,09h
    int 21h
    mov dx, OFFSET in6
    mov ah,0Ah
    int 21h
    lea si, in6
    call AppendDollar

    mov dx, OFFSET p7
    mov ah,09h
    int 21h
    mov dx, OFFSET in7
    mov ah,0Ah
    int 21h
    lea si, in7
    call AppendDollar

    mov dx, OFFSET p8
    mov ah,09h
    int 21h
    mov dx, OFFSET in8
    mov ah,0Ah
    int 21h
    lea si, in8
    call AppendDollar

    mov dx, OFFSET p9
    mov ah,09h
    int 21h
    mov dx, OFFSET in9
    mov ah,0Ah
    int 21h
    lea si, in9
    call AppendDollar

    mov dx, OFFSET p10
    mov ah,09h
    int 21h
    mov dx, OFFSET in10
    mov ah,0Ah
    int 21h
    lea si, in10
    call AppendDollar

    ; ----------------------------
    ; NOW: Draw the screen & form and display the collected inputs
    ; ----------------------------

    ; Set 80x25 text mode (clears screen)
    mov ax, 0003h
    int 10h

    ; -------- Fill entire screen: white background (black text) --------
    mov ah, 06h
    xor al, al
    mov bh, 070h        ; attribute: black text on white background
    mov cx, 0000h       ; upper-left (row0,col0)
    mov dx, 144Fh       ; lower-right (row20,col79)
    int 10h

    ; -------- Draw red border around entire screen --------
    ; Top border (row 0): draw 80 spaces with red background
    mov ah, 02h
    xor bh, bh
    xor dh, dh        ; dh = 0
    xor dl, dl        ; dl = 0
    int 10h

    mov ah, 09h       ; int10 AH=09: write character with attribute
    mov al, ' '       ; write spaces
    mov bl, 00h       ; BLACK BLACK
    xor bh, bh
    mov cx, 80
    int 10h

    ; Bottom border (row 20): set cursor then write 80 spaces
    mov ah, 02h
    xor bh, bh
    mov dh, 20
    xor dl, dl
    int 10h

    mov ah, 09h
    mov al, ' '
    mov bl, 00h
    xor bh, bh
    mov cx, 80
    int 10h

    ; Left & right columns (rows 1..23): put red spaces in column 0 and 79
    mov cx, 20         ; rows 1 through 23 (23 rows)
    mov byte ptr [row], 1

BorderLoop:
    ; Left column: set cursor to (row,0)
    mov dh, byte ptr [row]
    xor dl, dl
    mov ah, 02h
    xor bh, bh
    int 10h

    ; draw one space with red background at left
    push cx
    mov ah, 09h
    mov al, ' '
    mov bl, 00h
    xor bh, bh
    mov cx, 1
    int 10h
    pop cx

    ; Right column: set cursor to (row,79)
    mov dh, byte ptr [row]
    mov dl, 79
    mov ah, 02h
    xor bh, bh
    int 10h

    ; draw one space with red background at right
    push cx
    mov ah, 09h
    mov al, ' '
    mov bl, 00h
    xor bh, bh
    mov cx, 1
    int 10h
    pop cx

    ; increment row and loop
    inc byte ptr [row]
    loop BorderLoop

    ; ----------------------------
    ; Draw SUBMIT button in the middle-bottom of the box
    ; We'll draw small red bar and then print SUBMIT in yellow
    mov ah,02h
    mov dh,1
    mov dl,1
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,78
    int 10h

    mov ah,02h
    mov dh,2
    mov dl,1
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,78
    int 10h

    mov ah,02h
    mov dh,3
    mov dl,1
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Eh   ; red bg yellow fg
    xor bh,bh
    mov cx,78
    int 10h

    ; -------- Place header text on red background (rows 1..3) centered -------
    ; Row 1 (recentered for balanced layout)
    mov ah, 02h
    xor bh, bh
    mov dh, 1
    mov dl, 20
    int 10h
    mov ah, 09h
    mov dx, OFFSET hdr1
    int 21h

    ; Row 2 (recentered)
    mov ah, 02h
    xor bh, bh
    mov dh, 2
    mov dl, 24
    int 10h
    mov ah, 09h
    mov dx, OFFSET hdr2
    int 21h

    ; Row 3 (subtitle recentered)
    mov ah, 02h
    xor bh, bh
    mov dh, 3
    mov dl, 27
    int 10h
    mov ah, 09h
    mov dx, OFFSET hdr3
    int 21h

    ; ----------------------------
    ; Now print labels on left column and user inputs on right column inside the box
    ; Left column labels start at row 6 col 6 (unchanged)
    ; Right column input fields start shifted +5 to the right
    ; ----------------------------

    ; Left col, row 6 .. 10
    
    ;Personnel Type
    mov si, OFFSET lab1
    mov ah,02h
    mov dh,6
    mov dl,4
    int 10h
    mov ah,09h
    mov dx, OFFSET lab1
    int 21h

    ; Input field
    mov ah,02h
    mov dh,6
    mov dl,29
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ;Red Drop down button
    ;Background
    mov ah,02h
    mov dh,6
    mov dl,38
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,3
    int 10h

    ;The V button 
    mov ah,02h
    mov dh,6
    mov dl,39
    int 10h
    mov ah,09h
    mov al,'V'
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,1
    int 10h

    ; Print user value for in1
    mov ah,02h
    mov dh,6
    mov dl,29
    int 10h
    mov dx, OFFSET in1+2
    mov ah,09h
    int 21h

    ; name of applicant/driver:
    mov ah,02h
    mov dh,8
    mov dl,4
    int 10h
    mov ah,09h
    mov dx, OFFSET lab2
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,8
    mov dl,29
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; row7 value 
    mov ah,02h
    mov dh,8
    mov dl,29
    int 10h
    mov dx, OFFSET in2+2
    mov ah,09h
    int 21h

    ; MOBILE NUMBER: 
    mov ah,02h
    mov dh,10
    mov dl,4
    int 10h
    mov ah,09h
    mov dx, OFFSET lab3
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,10
    mov dl,29
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; row8 value 
    mov ah,02h
    mov dh,10
    mov dl,29
    int 10h
    mov dx, OFFSET in3+2
    mov ah,09h
    int 21h

    ; VEHICLE MAKES / BRAND 
    mov ah,02h
    mov dh,12
    mov dl,4
    int 10h
    mov ah,09h
    mov dx, OFFSET lab4
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,12
    mov dl,29
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; row9 value 
    mov ah,02h
    mov dh,12
    mov dl,29
    int 10h
    mov dx, OFFSET in4+2
    mov ah,09h
    int 21h

    ; VEHICLE COLOR 
    mov ah,02h
    mov dh,14
    mov dl,4
    int 10h
    mov ah,09h
    mov dx, OFFSET lab5
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,14
    mov dl,29
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ;Red Drop down button 
    ;Background
    mov ah,02h
    mov dh,14
    mov dl,38
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,3
    int 10h

    ;The V button 
    mov ah,02h
    mov dh,14
    mov dl,39
    int 10h
    mov ah,09h
    mov al,'V'
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,1
    int 10h

    ; row10 value 
    mov ah,02h
    mov dh,14
    mov dl,29
    int 10h
    mov dx, OFFSET in5+2
    mov ah,09h
    int 21h

    ; Right column 

    ; VEHICLE STICKER
    mov ah,02h
    mov dh,6
    mov dl,43
    int 10h
    mov ah,09h
    mov dx, OFFSET lab6
    int 21h

    ; Input field
    mov ah,02h
    mov dh,6
    mov dl,65
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ;Red Drop down button 
    ;Background
    mov ah,02h
    mov dh,6
    mov dl,74
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,3
    int 10h

    ;The V button 
    mov ah,02h
    mov dh,6
    mov dl,75
    int 10h
    mov ah,09h
    mov al,'V'
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,1
    int 10h

    ; Value 
    mov ah,02h
    mov dh,6
    mov dl,65
    int 10h
    mov dx, OFFSET in6+2
    mov ah,09h
    int 21h

    ; ID NUMBER 
    mov ah,02h
    mov dh,8
    mov dl,43
    int 10h
    mov ah,09h
    mov dx, OFFSET lab7
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,8
    mov dl,65
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; Value 
    mov ah,02h
    mov dh,8
    mov dl,65
    int 10h
    mov dx, OFFSET in7+2
    mov ah,09h
    int 21h

    ; ADDRESS 
    mov ah,02h
    mov dh,10
    mov dl,43
    int 10h
    mov ah,09h
    mov dx, OFFSET lab8
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,10
    mov dl,65
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; Value 
    mov ah,02h
    mov dh,10
    mov dl,65
    int 10h
    mov dx, OFFSET in8+2
    mov ah,09h
    int 21h

    ; PLATE NUMBER 
    mov ah,02h
    mov dh,12
    mov dl,43
    int 10h
    mov ah,09h
    mov dx, OFFSET lab9
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,12
    mov dl,65
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ; Value 
    mov ah,02h
    mov dh,12
    mov dl,65
    int 10h
    mov dx, OFFSET in9+2
    mov ah,09h
    int 21h

    ; VEHICLE TYPE 
    mov ah,02h
    mov dh,14
    mov dl,43
    int 10h
    mov ah,09h
    mov dx, OFFSET lab10
    int 21h

    ; Input field 
    mov ah,02h
    mov dh,14
    mov dl,65
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Fh   ; black bg with white fg
    xor bh,bh
    mov cx,12
    int 10h

    ;Red Drop down button 
    ;Background
    mov ah,02h
    mov dh,14
    mov dl,74
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,3
    int 10h

    ;The V button 
    mov ah,02h
    mov dh,14
    mov dl,75
    int 10h
    mov ah,09h
    mov al,'V'
    mov bl,4Fh   ; red bg white fg
    xor bh,bh
    mov cx,1
    int 10h

    ; Value 
    mov ah,02h
    mov dh,14
    mov dl,65
    int 10h
    mov dx, OFFSET in10+2
    mov ah,09h
    int 21h

    ; ----------------------------
    ; Draw SUBMIT button in the middle-bottom of the box
    ; We'll draw small red bar and then print SUBMIT in yellow
    mov ah,02h
    mov dh,16
    mov dl,35
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,4Eh   ; yellow on red to paint background
    xor bh,bh
    mov cx,12
    int 10h

    ; print SUBMIT text centered
    mov ah,02h
    mov dh,16
    mov dl,37
    int 10h
    mov ah,09h
    mov dx, OFFSET submitTxt
    int 21h

    ; Put copyright / thank you below box
    mov ah,02h
    mov dh, 18
    mov dl,23
    int 10h
    mov ah,09h
    mov dx, OFFSET footerText
    int 21h

    ; ----------------------------
    ; Draw THANK YOU in the middle-bottom of the box
    mov ah,02h
    mov dh,20
    mov dl,36
    int 10h
    mov ah,09h
    mov al,' '
    mov bl,0Eh   ; yellow on red to paint background
    xor bh,bh
    mov cx,12
    int 10h

    mov ah,02h
    mov dh, 20
    mov dl,36
    int 10h
    mov ah,09h
    mov dx, OFFSET thankyou
    int 21h

    ; Wait for keypress, then exit
    mov ah, 00h
    int 16h

    mov ax, 4C00h
    int 21h

; ----------------------------------------------------
; AppendDollar - places a '$' terminator at buffer end for AH=0Ah buffers
; Expects DS:SI -> start of buffer (i.e., buffer label)
; (buffer format: [max][len][chars...])
AppendDollar PROC
    push ax bx cx dx si
    mov bx, si
    mov cl, [bx+1]   ; length typed
    xor ch, ch
    add bx, 2
    add bx, cx       ; BX points to after last char
    mov byte ptr [bx], '$'
    pop si dx cx bx ax
    ret
AppendDollar ENDP

end start