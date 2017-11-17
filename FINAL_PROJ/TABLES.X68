*-----------------------------------------------------------
* Title      : Command table for all the functions
* Written by : Haomin Shi
* Date       : Nov 17
* Description: A table taht has all the function names in it and location pointer
*-----------------------------------------------------------
    ORG    $2000
;START:                  ; first instruction of program

COMP_TABLE:
    DC.B 'HELP'
    *AND OTHERS

COMP_ADDR:
    DC.W 'HELP'
    *AND OTHERS



*----------------------------------------------------------
*SHORT NAMES OF THE RESGERS, SETTED UP FOR EASE OF DISPLAY
    ORG $3000
BD0 DC.W 'D0 '
BD1 DC.W 'D1 '
*AND MORE

BA0 DC.W 'A0 '
*AND MORE



*-------------------------------------------------------------
*TABLES FOR THE EXCEPTION
    ORG $2300
    ;MOVE.L #RESET          $0
    ;MOVE.L #BUS_ERR,        $8
    ;MOVE.L #ADRS_ERR,       $C
    ;MOVE.L #ILL_INST,       $10
    *AND MORE

*------------------------------------------------------------
*HANDY HELPERS, THESE ARE THE THINGS I NEED FOR NICER OUTPUTS    
    ORG $2400
SPACE_BREAK DC.W '-------------'
*------------------------------------------------------------
*HELPER FUNCTIONS
DISPLAY_HELPER_DATA_R:  ;TO USE THIS FUNCTION, NEED TO USE "LEA BD#, A1" BEFORE JSR
*SETTING UP FOR LOOP IN ORDER TO OUTPUT DR AND AR WITH 000S INCLUDED
    MOVE.L D3, A4       ;WHEN OUTPUT DR, USE A4 TO HOLD TEMP VALUES
    MOVE.L D0, A5
    MOVE.L #14,D0       ;BASIC FUNCTION, SET UP OUTPUT FOR 'D0_'
    TRAP #15
    MOVE.L A5, D3
    MOVE.L #0, D7
    
LOOP:
    CMPI.W #$0008, D7
    BGE.S DONE
    ADDI.W #1, D7
    ROL.L #4, D3
    MOVE.L D3, D1
    AND.L #$F, D1
    ADD.W #$30, D1
    MOVE.B #6, D0       ;EXPLAINE #6: Display single character in D1.B                        
    TRAP #15
    BRA LOOP           ;CURRENTLY JUST A INFINITE LOOOP
    
DONE:
    RTS
*------------------------------------------------------------
*MAIN FUNCTION OF THE PROGRAM
    ORG $1000
START:
    *TESTING OUT THE HELPER_D_R
    LEA BD0, A1
    JSR DISPLAY_HELPER_DATA_R
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LEA BD1, A1
    JSR DISPLAY_HELPER_DATA_R   ;SOMTHING STILL NEED TO WORK OUT ON THIS ONE, THERE IS SOMETHING WRONG WITH THE D3
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
