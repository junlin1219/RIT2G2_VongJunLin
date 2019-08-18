INCLUDE Irvine32.inc

.data
TC DWORD 3200
TF DWORD ?

.code

main PROC

	XOR eax,eax		;eax = 0H
	MOV eax,90		;eax = 5AH
	MUL TC			;eax = 4 6500H
	MOV ebx,4		;ebx = 4H
	DIV ebx			;eax = 1 1940H
	ADD eax, 3200	;eax = 1 25C0H
	MOV TF,eax		;
	
	call WriteInt	;Display value stored in eax reg
	call Crlf

	exit
main ENDP
END main