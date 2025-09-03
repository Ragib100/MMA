.MODEL SMALL
.STACK 100H
.DATA
    N DB 0
    TEMP DB 10D
    DIVISOR DB 10D
    CNT DW 0
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
              
              
    INPUT:
        MOV AH,01H
        INT 21H
        
        CMP AL,0DH
        JE OUTPUT
        
        SUB AL,'0'
        MOV BL,AL
        MOV AL,N
        MUL TEMP
        MOV N,AL
        ADD N,BL
        
        JMP INPUT
    
    
     OUTPUT:
    
    MOV AH,02H
    MOV Dx,0aH
    INT 21H
    MOV Dx,0dH
    INT 21H
    
   
            
        XOR AH,AH
        MOV AL,N
        
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