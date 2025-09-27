; Filename: Exer12.asm
; Display text using string variables (4 string variables)
; Name: Joseph Xeno O. Banzon
; Date: August 28, 2025

.model small
.data
    who db 'Joseph Xeno Ortega Banzon$'
    programAndYear db 'Bachelor of Science in Computer Science 2nd Year$'
    college db 'College of Computer Studies$'
    university db 'Cebu Institute of Technology - University$'
.code
.startup
main1:
    mov ah,9
    mov dx,offset who
    int 21h

    mov ah,02h
    mov dl,0Ah 
    int 21h

    mov ah,9
    mov dx,offset programAndYear
    int 21h

    mov ah,02h
    mov dl,0Ah 
    int 21h

    mov ah,9
    mov dx,offset college
    int 21h

    mov ah,02h
    mov dl,0Ah 
    int 21h

    mov ah,9
    mov dx,offset university
    int 21h

    mov ah,02h
    mov dl,0Ah 
    int 21h

    .exit
end


