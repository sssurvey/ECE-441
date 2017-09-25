*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $3000
START:                  ; first instruction of program
        CLR.L $700
        MOVE.W #$700,A6
        MOVE.W #$700,A5
        MOVE.B #241,D7
        TRAP #14
        
        MOVE.B #225,D7
        TRAP #14        

        CMP.W (A0),D0  
        BCC $3024
        MOVE.W (A0),-(A0) 
        ADDQ #4,A0 
        CMPA.L A0,A1 
        BCC $3018 
        MOVE.W D0,-(A0) 
        MOVE.B #228,D7 
        TRAP #14 

      

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
