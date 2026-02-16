.model tiny
.code
org 100h
VIDEOSEG equ 0B800h

Start:    mov ax, VIDEOSEG
		  mov es, ax
		  mov al, ds:[82h]
		  mov ah, 0CEh
		  mov bx, 0h
		  mov es :[bx], ax
		  
		  mov ax, 4c00h
		  int 21h 
		  
end Start

