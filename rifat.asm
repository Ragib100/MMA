.MODEL SMALL
.STACK 100H
.DATA
    BORO DB 'GREATER THAN 5$',0
    CHOTO DB 'LESS THAN 5$',0
    SOMAN DB 'EQUAL TO 5$',0
.CODE

MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        MOV AH,01H
        INT 21H
        MOV BL,AL
        SUB BL,'0'
        CMP BL,5
        JG GREAT
        JL LESS
        LEA DX,SOMAN
        MOV AH,09H
        INT 21H
        JMP FINISH
        
    GREAT:
        LEA DX,BORO
        MOV AH,09H
        INT 21H
        JMP FINISH
        
    LESS:
        LEA DX,CHOTO
        MOV AH,09H
        INT 21H
        
    FINISH:
    
        
    MAIN ENDP
END MAIN