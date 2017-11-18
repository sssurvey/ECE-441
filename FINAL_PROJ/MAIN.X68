*-----------------------------------------------------------
* Title      : MAIN
* Written by : HAOMIN SHI
* Date       : NOV 17
* Description: THIS WILL BE THE PROGRAM
*-----------------------------------------------------------
    ORG     $500    

COM_TABLE
   DC.W 'HELP' 
   DC.W 'MDSP'
   DC.B 'MTST'
COMP_ADDR
   DC.W HELP
   ;DC.W MDSP
   ;DC.W MTST



    ORG    $1000
PROMPT DC.W 'FINAL> ',0
ERROR  DC.W 'WHAT?!',0
HELP   DC.W 'THIS IS HELP!',0
MM     DC.W 'THIS IS MM!',0
NOTHING DC.W 'PLEASE INPUT VALUE!',0
EXIT   DC.W  'EXITED',0
;most of these above are just temp place holder to test the prompt

MAIN:
    MOVEM.L D0-D7/A0-A7,-(SP)    
    CMP.W #0, D1
    BEQ ZERO
    CMP.W #4, D1
    BEQ FOUR
    CMP.W #2, D1
    BEQ TWO
    
FOUR:   ;IF USER INPUT 4 LETTER COM, BRANCH IT TO HERE AND COMPARE CONTENT
    CMP.L #'HELP',(A1)  ;A1 IS POINTING TO WHERE MY INPUT IS
    BEQ HELP_1
    CMP.L #'EXIT',(A1)
    BEQ EXIT_1
    BRA SYNTAX_ERROR
    
TWO:    ;IF USER INPUT 2 LETTER COM, BRANCH IT TO HERE AND COMPARE CONTENT
    CMP.W #'MM',(A1)
    BEQ MM_1    
    BRA SYNTAX_ERROR

ZERO:    ;IF USER DONT PUT ANYTHING, ASK FOR USER INPUT
    LEA NOTHING, A1
    MOVE.L #13,D0
    TRAP #15
    MOVEM.L (SP)+,D0-D7/A0-A7
    BRA START
    
HELP_1: ;USED IF USER INPUT HELP
    LEA HELP, A1
    MOVE.L #13,D0
    TRAP #15
    MOVEM.L (SP)+,D0-D7/A0-A7
    BRA START

MM_1:   ;SAME FOR MM
    LEA MM, A1
    MOVE.L #13,D0
    TRAP #15
    MOVEM.L (SP)+,D0-D7/A0-A7
    BRA START
    
EXIT_1:
    LEA EXIT, A1
    MOVE.L #13,D0
    TRAP #15
    BRA EXITED
    
SYNTAX_ERROR:
    LEA ERROR, A1
    MOVE.W #13,D0   ;OUTPUT ERROR NEW LINE
    TRAP #15
    MOVEM.L (SP)+,D0-D7/A0-A7  
    BRA START


*-----------------------------------------------------

    ORG $2000

START:                  ; first instruction of program
    LEA PROMPT,A1
    MOVE.W #14,D0       ;PRINT OUT THE PROMPT
    TRAP #15
    LEA $3200, A1       ;SAVE THE USER INPUT AT THE $3200 MM LOCATION
    MOVE.L #2,D0        
    TRAP #15
    BRA MAIN
    ;DONE
    
    
    
    ;CMP.B #'.',(A1)
    ;BNE B_COMMAND
    ;BRA MAIN


EXITED
* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
