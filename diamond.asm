.MODEL SMALL
.STACK 100H
.DATA        
    MSG DB 'Enter n:$',0
    N DB 0
    SPACE DB 0
    HASH DB 1
    UPDONE DB 0
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,09H       
    INT 21H
    MOV AH,01H
    INT 21H
    
    CMP AL,'0'
    JE FINISH
    
    SUB AL,'0'
    MOV N,AL
    MOV SPACE,AL
    DEC SPACE
    
    OUTER:
        MOV AL,HASH
        CMP AL,0
        JLE FINISH
        
        CALL NEWLINE
        CALL PRINTSPACE
        CALL PRINTHASH
        
        MOV AL,UPDONE
        CMP AL,1
        JE LOWER
        ADD HASH,2
        DEC SPACE
        JMP OUTER
        LOWER:
            SUB HASH,2
            INC SPACE
            JMP OUTER
            
        
    PRINTSPACE:
        CMP SPACE,0
        JE RETURN
        MOV CL,SPACE
        XOR CH,CH
        PRINT1:
            MOV AH,02H
            MOV DX,' '
            INT 21H   
            LOOP PRINT1
            RET
        
        RETURN:
            MOV UPDONE,1
            RET
        
    PRINTHASH:
        MOV CL,HASH
        XOR CH,CH
        PRINT2:
            MOV AH,02H
            MOV DX,'#'
            INT 21H
            LOOP PRINT2
        RET
               
    NEWLINE:
        MOV AH,02H
        MOV DX,0AH
        INT 21H
        MOV DX,0DH
        INT 21H
        RET
    
    FINISH:
    
    MAIN ENDP
END MAIN