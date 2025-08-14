.MODEL SMALL
.STACK 100H
.DATA
    WELCOME DB 'Enter the value of X:$',0
    NUMBERMSG DB 'Given input is a number$',0             
    VOWELMSG DB 'Given the input is a Vowel$',0
    CONSONENTMSG DB 'Given the input is a Consonent$',0
    INVALIDMSG DB 'Invalid input$',0
    QUESTION DB 'Do you want to give another input?(Y/N)$',0
.CODE

MAIN PROC    
    START:
        MOV AX,@DATA
        MOV DS,AX
        LEA DX,WELCOME
        MOV AH,09H
        INT 21H
        MOV AH,01H
        INT 21H
        MOV BL,AL
        CALL NEWLINE
        CMP BL,'A'
        JGE CHAR
        CMP BL,'0'
        JGE NUMBER
        JMP INVALID
            
        CHAR:
            CMP BL,'A'
            JE VOWEL
            CMP BL,'E'
            JE VOWEL
            CMP BL,'I'
            JE VOWEL
            CMP BL,'O'
            JE VOWEL
            CMP BL,'U'
            JE VOWEL
            CMP BL,'Z'
            JLE CONSONENT
            JMP INVALID
            
        VOWEL:
            LEA DX,VOWELMSG
            MOV AH,09H
            INT 21H
            CALL NEWLINE
            JMP REPEAT
            
        CONSONENT:
            LEA DX,CONSONENTMSG
            MOV AH,09H
            INT 21H
            CALL NEWLINE
            JMP REPEAT
            
        NUMBER:
            CMP BL,'9'
            JG INVALID
            LEA DX,NUMBERMSG
            MOV AH,09H
            INT 21H
            CALL NEWLINE
            JMP REPEAT
            
        INVALID:
            LEA DX,INVALIDMSG
            MOV AH,09H
            INT 21H
            CALL NEWLINE
            JMP REPEAT
        
        REPEAT:
            LEA DX,QUESTION
            MOV AH,09H
            INT 21H
            MOV AH,01H
            INT 21H
            MOV BL,AL
            CALL NEWLINE
            CMP BL,'Y'
            JE DOREPEAT
            CMP BL,'N'
            JE FINISH
            JMP INVALID
            
        DOREPEAT:
            JMP START
        
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