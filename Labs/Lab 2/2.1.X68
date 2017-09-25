*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here
                MOVE.W  D0,-(A0)                                
                CMP.W   A1,A0                                   
                BGE     $300C                                   
                MOVE.B  #228,D7                                 
                TRAP    #14                                     
               
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
