; Filename: Exer13.asm
; Create AUGUST 2025 Calendar using ASCII characters, with borders.
; Name: Joseph Xeno O. Banzon
; Date: August 28, 2025

putc MACRO char
    mov ah, 02h
    mov dl, char
    int 21h
ENDM
renderc MACRO char, page, color, write
    mov ah, 09h 
    mov al, char
    mov bh, page
    mov bl, color
    mov cx, write
    int 10h
ENDM
setcursor MACRO row, col
    mov ah, 02h
    mov bh, 00h
    mov dh, row
    mov dl, col
    int 10h
ENDM
colorz MACRO color, write
    mov ah, 09h 
    mov bl, color
    mov cx, write
    int 10h
ENDM
.model small
.data
	txt_0_R0_C0 db "                        AUGUST 2025                       ",'$'
	txt_1_R1_C0 db "__________________________________________________________",'$'
	txt_2_R2_C0 db "|SUNDAY|MONDAY|TUESDAY|WEDNESDAY|THURSDAY|FRIDAY|SATURDAY|",'$'
	txt_3_R3_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_4_R4_C0 db "|      |      |       |         |        |  1   |   ",'$'
	txt_5_R4_C52 db "2",'$'
	txt_6_R4_C53 db "    |",'$'
	txt_7_R5_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_8_R6_C0 db "|  ",'$'
	txt_9_R6_C3 db "3",'$'
	txt_10_R6_C4 db "   |  4   |   5   |    6    |   7    |  8   |   ",'$'
	txt_11_R6_C52 db "9",'$'
	txt_12_R6_C53 db "    |",'$'
	txt_13_R7_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_14_R8_C0 db "|  ",'$'
	txt_15_R8_C3 db "10",'$'
	txt_16_R8_C5 db "  |  11  |   12  |    13   |   14   |  15  |   ",'$'
	txt_17_R8_C52 db "16",'$'
	txt_18_R8_C54 db "   |",'$'
	txt_19_R9_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_20_R10_C0 db "|  ",'$'
	txt_21_R10_C3 db "17",'$'
	txt_22_R10_C5 db "  |  18  |   19  |    20   |   21   |  22  |   ",'$'
	txt_23_R10_C52 db "23",'$'
	txt_24_R10_C54 db "   |",'$'
	txt_25_R11_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_26_R12_C0 db "|  ",'$'
	txt_27_R12_C3 db "24",'$'
	txt_28_R12_C5 db "  |  25  |   26  |    27   |   28   |  29  |   ",'$'
	txt_29_R12_C52 db "30",'$'
	txt_30_R12_C54 db "   |",'$'
	txt_31_R13_C0 db "|------|------|-------|---------|--------|------|--------|",'$'
	txt_32_R14_C0 db "|  ",'$'
	txt_33_R14_C3 db "31",'$'
	txt_34_R14_C5 db "  |      |       |         |        |      |        |",'$'
	txt_35_R15_C0 db "|______|______|_______|_________|________|______|________|",'$'
.code

.stack 100h
start :
    mov ax, @data
    mov ds, ax

    ; Set to video mode 
    mov ah, 00h
    mov al, 03h ; 80x25 color text mode
    int 10h


	setcursor 0, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_0_R0_C0
	int 21h

	setcursor 1, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_1_R1_C0
	int 21h

	setcursor 2, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_2_R2_C0
	int 21h

	setcursor 3, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_3_R3_C0
	int 21h

	setcursor 4, 0
	colorz 48, 52
	mov ah, 09h
	mov dx, offset txt_4_R4_C0
	int 21h

	setcursor 4, 52
	colorz 52, 1
	mov ah, 09h
	mov dx, offset txt_5_R4_C52
	int 21h

	setcursor 4, 53
	colorz 48, 5
	mov ah, 09h
	mov dx, offset txt_6_R4_C53
	int 21h

	setcursor 5, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_7_R5_C0
	int 21h

	setcursor 6, 0
	colorz 48, 3
	mov ah, 09h
	mov dx, offset txt_8_R6_C0
	int 21h

	setcursor 6, 3
	colorz 49, 1
	mov ah, 09h
	mov dx, offset txt_9_R6_C3
	int 21h

	setcursor 6, 4
	colorz 48, 48
	mov ah, 09h
	mov dx, offset txt_10_R6_C4
	int 21h

	setcursor 6, 52
	colorz 52, 1
	mov ah, 09h
	mov dx, offset txt_11_R6_C52
	int 21h

	setcursor 6, 53
	colorz 48, 5
	mov ah, 09h
	mov dx, offset txt_12_R6_C53
	int 21h

	setcursor 7, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_13_R7_C0
	int 21h

	setcursor 8, 0
	colorz 48, 3
	mov ah, 09h
	mov dx, offset txt_14_R8_C0
	int 21h

	setcursor 8, 3
	colorz 49, 2
	mov ah, 09h
	mov dx, offset txt_15_R8_C3
	int 21h

	setcursor 8, 5
	colorz 48, 47
	mov ah, 09h
	mov dx, offset txt_16_R8_C5
	int 21h

	setcursor 8, 52
	colorz 52, 2
	mov ah, 09h
	mov dx, offset txt_17_R8_C52
	int 21h

	setcursor 8, 54
	colorz 48, 4
	mov ah, 09h
	mov dx, offset txt_18_R8_C54
	int 21h

	setcursor 9, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_19_R9_C0
	int 21h

	setcursor 10, 0
	colorz 48, 3
	mov ah, 09h
	mov dx, offset txt_20_R10_C0
	int 21h

	setcursor 10, 3
	colorz 49, 2
	mov ah, 09h
	mov dx, offset txt_21_R10_C3
	int 21h

	setcursor 10, 5
	colorz 48, 47
	mov ah, 09h
	mov dx, offset txt_22_R10_C5
	int 21h

	setcursor 10, 52
	colorz 52, 2
	mov ah, 09h
	mov dx, offset txt_23_R10_C52
	int 21h

	setcursor 10, 54
	colorz 48, 4
	mov ah, 09h
	mov dx, offset txt_24_R10_C54
	int 21h

	setcursor 11, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_25_R11_C0
	int 21h

	setcursor 12, 0
	colorz 48, 3
	mov ah, 09h
	mov dx, offset txt_26_R12_C0
	int 21h

	setcursor 12, 3
	colorz 49, 2
	mov ah, 09h
	mov dx, offset txt_27_R12_C3
	int 21h

	setcursor 12, 5
	colorz 48, 47
	mov ah, 09h
	mov dx, offset txt_28_R12_C5
	int 21h

	setcursor 12, 52
	colorz 52, 2
	mov ah, 09h
	mov dx, offset txt_29_R12_C52
	int 21h

	setcursor 12, 54
	colorz 48, 4
	mov ah, 09h
	mov dx, offset txt_30_R12_C54
	int 21h

	setcursor 13, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_31_R13_C0
	int 21h

	setcursor 14, 0
	colorz 48, 3
	mov ah, 09h
	mov dx, offset txt_32_R14_C0
	int 21h

	setcursor 14, 3
	colorz 49, 2
	mov ah, 09h
	mov dx, offset txt_33_R14_C3
	int 21h

	setcursor 14, 5
	colorz 48, 53
	mov ah, 09h
	mov dx, offset txt_34_R14_C5
	int 21h

	setcursor 15, 0
	colorz 48, 58
	mov ah, 09h
	mov dx, offset txt_35_R15_C0
	int 21h

    mov ah, 4Ch      ; DOS exit function
    mov al, 0        ; Return code 0
    int 21h          ; Call DOS interrupt
end start ; end program