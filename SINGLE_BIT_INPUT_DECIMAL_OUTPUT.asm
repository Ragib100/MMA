.MODEL SMALL
.STACK 100H
.DATA
    A DB 0
    B DB 0
    ANS DW 0
    DIVISOR DB 10
    REM DB 0
    CNT DW 0
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV A,AL
    
    MOV AH,01H
    INT 21H
    SUB AL,'0'
    MOV B,AL
    
    XOR AX,AX
    MOV AL,A
    MUL A  
    ADD ANS,AX
            
    XOR AX,AX
    MOV AL,B
    MUL B
    ADD ANS,AX
            
    XOR AX,AX
    MOV AL,A
    MUL B
    SHL AX,1
    ADD ANS,AX
    
    
    MOV AX,ANS
    
    CMP AX,0
    JE FINISH
    
    PRINT:
        DIV DIVISOR
        MOV BX,AX
        
        MOV AL,AH
        XOR AH,AH
        
        PUSH AX
        
        INC CNT
        MOV AL,BL
        MOV AH,0
        
        CMP AX,0
        JNE PRINT
        
    MOV CX,CNT
    
    PRINTDIGIT:
        POP DX
        ADD DX,'0'
        MOV AH,02H
        INT 21H
        LOOP PRINTDIGIT
        
    FINISH:
    
    
    
    MAIN ENDP
END MAIN