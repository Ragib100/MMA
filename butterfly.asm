.MODEL SMALL
.STACK 100H
.DATA
    MSG DB 'Enter n: $',0
    STAR DB 1
    SPACE DB 1
    N DB 0
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
    
    MOV CL,N
    SUB CL,2
    CMP CL,0
    JLE IGNORESPACE
    XOR CH,CH
    
    MAKESPACE:
        INC SPACE
        INC SPACE
        LOOP MAKESPACE
    
    IGNORESPACE:    
        MOV BL,1
        
    UPPER: 
        CALL NEWLINE
        MOV STAR,BL
        CMP BL,N
        JE EQUAL
        
        CALL PRINTSTAR
        CALL PRINTSPACE
        CALL PRINTSTAR
        
        INC BL
        SUB SPACE,2
        JMP UPPER
        
    EQUAL:
        MOV CL,STAR
        XOR CH,CH
        SHL CX,1
        DEC CX
        PRINT3:
            MOV AH,02H
            MOV DX,'*'
            INT 21H
            LOOP PRINT3
        ;JMP FINISH
    
    DEC BL
    DEC STAR
    MOV SPACE,1
        
    LOWER:
        CALL NEWLINE
        MOV STAR,BL
        CMP BL,0
        JE FINISH
        
        CALL PRINTSTAR
        CALL PRINTSPACE
        CALL PRINTSTAR
        
        DEC BL
        ADD SPACE,2
        JMP LOWER
     
    JMP FINISH   
    
    PRINTSTAR:
        MOV CL,STAR
        XOR CH,CH
        PRINT1:
            MOV AH,02H
            MOV DX,'*'
            INT 21H
            LOOP PRINT1
        RET
        
    PRINTSPACE:
        MOV CL,SPACE
        XOR CH,CH
        PRINT2:
            MOV AH,02H
            MOV DX,' '
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