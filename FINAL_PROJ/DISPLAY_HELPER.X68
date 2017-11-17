*-----------------------------------------------------------
* Title      : DISPLAY ALL REGISTERS
* Written by : HAOMIN SHI
* Date       : NOV 18
* Description: THIS IS A TEMP TEST FILE I MADE TO TEST THE DISPLAY ALL DA AND RA
* EXTRA FUNCTIONS: MIGHT ADD SUPPORT FOR THE MEMORY/ADDRESS LINE DISPLAY
*-----------------------------------------------------------
    ORG    $1000
    
START:                  ; first instruction of program


BD0 DC.W 'D0 '
BD1 DC.W 'D1 '
    *AND MORE

BA0 DC.W 'A0 '
    *AND MORE
    
    LEA BD0, A1
    JSR DISPLAY_HELPER_DATA_R
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
    SIMHALT             ; halt simulator
    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
