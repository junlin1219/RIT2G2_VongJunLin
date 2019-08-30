INCLUDE Irvine32.inc

decrease proto c,
	array:PTR Dword, arraysize:Dword

.data
	count dword 0
	count2 dword 0

.code
decrease proc c,
	array:PTR Dword, arraysize:Dword



	mov esi,0
	mov edi,1
	mov ecx,arraysize
	mov eax,array[esi]

	
L1:
	mov eax,array[esi]
	mov edx,array[edi]
	cmp eax,edx
	jg greater
	jl lesser
	loop L1
	jmp last

lesser:
	mov edx,count
	cmp edx,0
	jne changec
	inc esi
	inc edi
	loop L1

greater:
	inc count
	inc esi
	inc edi 
	loop L1
	
changec:
	mov eax,count
	mov count2,eax
	mov count,0
	jmp lesser

last:
	mov eax,count
	mov ebx,count2
	cmp eax,ebx
	jg countb
	jl countl

countb:
	mov eax,count	
	ret

countl:
	mov eax,count2
	ret   

decrease ENDP

END