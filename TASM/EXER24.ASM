; Filename: Exer24.asm
; Programmer Name: Joseph Xeno O. Banzon
; Date: September 11, 2025
; Description: This assembly language program will create a College Enrollment Form. Get user input. Display a summary of the inputs. Include the necessary documentation as comments.

.MODEL small
.STACK 100h
.DATA
    university db 'Cebu Institute of Technology - University',13,10,'$'
    formTitle db 'STUDENT ENROLLMENT FORM',13,10,'$'
    promptStart db 13,10,'Please enter the following information: $'
    inputStudentID db 13,10,'Student ID Number: $'
    inputFirstName db 13,10,'First Name: $'
    inputMiddleName db 13,10,'Middle Name: $'
    inputFamilyName db 13,10,'Family Name: $'
    inputAddress db 13,10,'Address: $'
    inputCourse db 13,10,'Course: $'
    inputYear db 13,10,'Year: $'
    inputBdayMonth db 13,10,'Birthday Month: $'
    inputBdayDay db 13,10,'Birthday Day: $'
    inputBdayYear db 13,10,'Birthday Year: $'
    inputEmail db 13,10,'Email Address: $'
    firstName db 50, 0, 49 dup(?)
    middleName db 50, 0, 49 dup(?)
    familyName db 50, 0, 49 dup(?)
    studentID db 50, 0, 49 dup(?)
    address db 50, 0, 49 dup(?)
    course db 50, 0, 49 dup(?)
    year db 50, 0, 49 dup(?)
    bdayMonth db 50, 0, 49 dup(?)
    bdayDay db 50, 0, 49 dup(?)
    bdayYear db 50, 0, 49 dup(?)
    email db 50, 0, 49 dup(?)
    sectionTitle db 'SUMMARY',13,10,'$'
    sumMessage db 'Please check if all pieces of information are correct.',13,10,'$'
    idLabel         db 'ID Number: $'
    fullNameLabel   db 'Full Name: $'
    addressLabel    db 'Address: $'
    courseYearLabel db 'Course & Year: $'
    birthdayLabel   db 'Birthday: $'
    emailLabel      db 'Email Address: $'
    commaSpace      db ', $'
    dashSpace       db ' - $'
    space           db ' $'
    newline db 13,10,'$'
    thankYou db 'Thank you for enrolling at CIT-U.',13,10,'$'
    copyright db 'Copyright 2025',13,10,'$'
    programmerName db 'Programmer: Joseph Xeno O. Banzon',13,10,'$'


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

    ; Prompt for Student ID
    mov ah, 09h
    lea dx, inputStudentID
    int 21h
    mov ah, 0Ah
    lea dx, studentID
    int 21h

    ; Prompt for First Name
    mov ah, 09h
    lea dx, inputFirstName
    int 21h
    mov ah, 0Ah
    lea dx, firstName
    int 21h

    ; Prompt for Middle Name
    mov ah, 09h
    lea dx, inputMiddleName
    int 21h
    mov ah, 0Ah
    lea dx, middleName
    int 21h

    ; Prompt for Family Name
    mov ah, 09h
    lea dx, inputFamilyName
    int 21h
    mov ah, 0Ah
    lea dx, familyName
    int 21h

    ; Prompt for Address
    mov ah, 09h
    lea dx, inputAddress
    int 21h
    mov ah, 0Ah
    lea dx, address
    int 21h

    ; Prompt for Course
    mov ah, 09h
    lea dx, inputCourse
    int 21h
    mov ah, 0Ah
    lea dx, course
    int 21h

    ; Prompt for Year Level
    mov ah, 09h
    lea dx, inputYear
    int 21h
    mov ah, 0Ah
    lea dx, year
    int 21h

    ; Prompt for Birthday Month
    mov ah, 09h
    lea dx, inputBdayMonth
    int 21h
    mov ah, 0Ah
    lea dx, bdayMonth
    int 21h

    ; Prompt for Birthday Day
    mov ah, 09h
    lea dx, inputBdayDay
    int 21h
    mov ah, 0Ah
    lea dx, bdayDay
    int 21h

    ; Prompt for Birthday Year
    mov ah, 09h
    lea dx, inputYear
    int 21h
    mov ah, 0Ah
    lea dx, bdayYear
    int 21h

    ; Prompt for Email
    mov ah, 09h
    lea dx, inputEmail
    int 21h
    mov ah, 0Ah
    lea dx, email
    int 21h

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display form title
    mov ah, 09h
    lea dx, sectionTitle
    int 21h

    ; Prompt form input
    mov ah, 09h
    lea dx, sumMessage
    int 21h

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "ID Number: "
    mov ah, 09h
    lea dx, idLabel
    int 21h
    lea si, studentID
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "Full Name: "
    mov ah, 09h
    lea dx, fullNameLabel
    int 21h

    ; Family Name
    lea si, familyName
    call PrintInput

    ; Print ", "
    mov ah, 09h
    lea dx, commaSpace
    int 21h

    ; First Name
    lea si, firstName
    call PrintInput

    ; Print " "
    mov ah, 09h
    lea dx, space
    int 21h

    ; Middle Name
    lea si, middleName
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "Address: "
    mov ah, 09h
    lea dx, addressLabel
    int 21h
    lea si, address
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "Course & Year: "
    mov ah, 09h
    lea dx, courseYearLabel
    int 21h
    lea si, course
    call PrintInput

    ; Print " - "
    mov ah, 09h
    lea dx, dashSpace
    int 21h

    lea si, year
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "Birthday: "
    mov ah, 09h
    lea dx, birthdayLabel
    int 21h
    lea si, bdayMonth
    call PrintInput

    ; Print " "
    mov ah, 09h
    lea dx, space
    int 21h

    lea si, bdayDay
    call PrintInput

    ; Print ", "
    mov ah, 09h
    lea dx, commaSpace
    int 21h

    lea si, bdayYear
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display "Email Address: "
    mov ah, 09h
    lea dx, emailLabel
    int 21h
    lea si, email
    call PrintInput

    ; newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; newline
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