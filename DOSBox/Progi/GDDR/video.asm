.model tiny
.code
org 100h
VIDEOSEG equ 0B800h

Start:    
    call F               ; Вызываем подпрограмму
    mov ax, VIDEOSEG
    mov es, ax
    mov al, ds:[83h]     ; Берем второй символ аргумента
    mov ah, 0CEh         ; Атрибут (красный фон, желтый текст)
    mov bx, 52h           ; Смещение 2 (второе знакоместо)
    mov es:[bx], ax
    
    mov ax, 4c00h        ; Корректное завершение программы
    int 21h 

F proc                   ; Оформим как процедуру
    mov ax, VIDEOSEG
    mov es, ax
    mov al, ds:[82h]     ; Берем первый символ аргумента
    mov ah, 0CEh
    mov bx, 50h           ; Смещение 0 (первое знакоместо)
    mov es:[bx], ax
    ret                  ; ОБЯЗАТЕЛЬНО: возврат в Start
F endp

end Start