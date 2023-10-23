;Maleon, Kurt Jansen V.
;BSCS 2A - CSAR

.model small

.data
nl db 0ah, 0dh, '$'
prompt db 'Enter the binary number: $'
output db 'The decimal conversion is: $'
n1 db 0
n2 db 0
n3 db 0
n4 db 0
convNum db '0$'
.code
main:
    mov ax, @data
    mov ds, ax
      
    mov ah, 09h
    mov dx, offset prompt
    int 21h
    
    mov ah, 01h
    int 21h
    
    mov n1, al
    
    mov ah, 01h
    int 21h
    
    mov n2, al
    
    mov ah, 01h
    int 21h
    
    mov n3, al
    
    mov ah, 01h
    int 21h
    
    mov n4, al
    
    mov ah, 09h
    mov dx, offset nl
    int 21h
    
    ;mov cl, convNum
    
    jmp addOne
    
addOne:
    mov al, n4
    cmp al, '1'
    jl addTwo
    mov cl, convNum
    ADD cl, 1
    mov convNum, cl
    jmp addTwo
addTwo:
    mov al, n3
    cmp al, '1'
    jl addFour
    mov cl, convNum
    ADD cl, 2
    mov convNum, cl
    jmp addFour
addFour:
    mov al, n2
    cmp al, '1'
    jl addEight
    mov cl, convNum
    ADD cl, 4
    mov convNum, cl
    jmp addEight
addEight:
    mov al, n1
    cmp al, '1'
    jl print
    mov cl, convNum
    ADD cl, 8
    mov convNum, cl
    jmp print
    
print:
    mov cl, convNum
    
    
    cmp cl, '9'
    jle single
    
    mov ah, 02h
    mov dl, '1'
    int 21h
    
    SUB cl, 10

    mov ah, 02h
    mov dl, cl
    int 21h
    
    jmp endCode
    
single:    
    
    mov ah, 02h
    mov dl, cl
    int 21h
    
endCode:
    mov ah, 4ch
    int 21h
    
    ret
 end main