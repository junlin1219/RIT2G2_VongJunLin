INCLUDE Irvine32.inc

.DATA
MSG BYTE "In english : You like english and espresso, excellent!",0
EGG BYTE "egg",0


.CODE

MAIN PROC

	MOV EDX, OFFSET MSG
	CALL WRITESTRING
	CALL CRLF
	MOV EDI, OFFSET MSG
	MOV ECX, LENGTHOF MSG


CHECK:
	MOV AL, BYTE PTR[EDI]
	CMP AL, 20H
	JE ISSPACE
	JNE NOTSPACE
	LOOP CHECK
	JMP TERMINATE


ISSPACE:
	MOV AL, BYTE PTR[EDI + 1]
	CMP AL, 65H
	JE ISE
	JNE NOTE

NOTSPACE:
	MOV AL, BYTE PTR[EDI]
	CALL WRITECHAR
	INC EDI
	CMP AL, 21H
	JE TERMINATE
	JNE CHECK	

ISE:
	MOV AL, BYTE PTR[EDI]
	CALL WRITECHAR
	MOV EDX, OFFSET EGG
	CALL WRITESTRING
	ADD EDI,2
	JMP CHECK

NOTE:
	MOV AL, BYTE PTR[EDI]
	CALL WRITECHAR
	MOV AL, BYTE PTR[EDI + 1]
	CALL WRITECHAR
	ADD EDI,2
	JMP CHECK

TERMINATE:
	MAIN ENDP
	END MAIN