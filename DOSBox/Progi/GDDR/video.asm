.model tiny
.code
org 100h
VIDEOSEG equ 0B800h

Start:    
    xor cx, cx            ; Количество символов для вывода
    mov cx, ds:[82h]
	mov si, 82h          ; Начало аргументов в PSP
    mov di, 1600          ; Смещение на экране (например, вторая строка)
    
    call PrintChars      ; Вызываем подпрограмму
    
    mov ax, 4c00h        
    int 21h 

PrintChars proc
    mov ax, VIDEOSEG
    mov es, ax
    mov ah, 0CEh         ; Атрибут (желтый на красном)

NextChar:
    lodsb                ; Загружает байт из ds:[si] в AL и инкрементирует SI
    mov es:[di], ax      ; Пишем символ и атрибут в видеопамять
    add di, 2            ; Переходим к следующему знакоместу (2 байта)
    loop NextChar        ; CX--, если не 0, прыгаем на NextChar
    
    ret                  ; Возврат в Start
PrintChars endp

end Start