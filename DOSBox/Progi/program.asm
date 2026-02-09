.model tiny        ; модель памяти для .COM
.code
org 100h           ; точка входа .COM

Start:
        mov ah, 09h              ; функция DOS 09h — вывести строку
        mov dx, offset HelloStr ; адрес строки
        int 21h

        mov ax, 4C00h            ; выход в DOS
        int 21h

HelloStr db 'MICROSOFT IS THE BIGGEST PIECES OF DOG SHIT', 0Dh, 0Ah, '$'

end Start
