*-----------------------------------------------------------
* Title      : DISPLAY ALL REGISTERS
* Written by : HAOMIN SHI
* Date       : NOV 18
* Description: THIS IS A TEMP TEST FILE I MADE TO TEST THE DISPLAY ALL DA AND RA
* EXTRA FUNCTIONS: MIGHT ADD SUPPORT FOR THE MEMORY/ADDRESS LINE DISPLAY
*-----------------------------------------------------------
    ORG    $1000
    
START:                  ; first instruction of program

    MOVEM.L D0-D7/A0-A7, -(SP)

    MOVE.L D0, $3000
    MOVE.L D1, $3010
    MOVE.L D2, $3020
    MOVE.L D3, $3030
    MOVE.L D4, $3040
    MOVE.L D5, $3050
    MOVE.L D6, $3060
    MOVE.L D7, $3070
    
    MOVE.L A0, $3080
    MOVE.L A1, $3090
    MOVE.L A2, $4000
    MOVE.L A3, $4010
    MOVE.L A4, $4020
    MOVE.L A5, $4030
    MOVE.L A6, $4040
    MOVE.L A7, $4050
    
    CLR.L D0    ;CLEAN UP REGISTERS FOR FUTURE USE
    
    MOVE.L D0, D1
    MOVE.L D0, D2
    MOVE.L D0, D3
    MOVE.L D0, D4
    MOVE.L D0, D5
    MOVE.L D0, D6
    MOVE.L D0, D7
   
    MOVE.L D0, A0
    MOVE.L D0, A1
    MOVE.L D0, A2
    MOVE.L D0, A3
    MOVE.L D0, A4
    MOVE.L D0, A5
    MOVE.L D0, A6
    MOVE.L D0, A7   ;ALL DATA/ADDR REGISTER CLEARED
    
BD0 DC.W 'D0 '
BD1 DC.W 'D1 '
BD2 DC.W 'D2 '
BD3 DC.W 'D3 '
BD4 DC.W 'D4 '
BD5 DC.W 'D5 '
BD6 DC.W 'D6 '
BD7 DC.W 'D7 '

BA0 DC.W 'A0 '
BA1 DC.W 'A1 '
BA2 DC.W 'A2 '
BA3 DC.W 'A3 '
BA4 DC.W 'A4 '
BA5 DC.W 'A5 '
BA6 DC.W 'A6 '
BA7 DC.W 'A7 '

LI DC.W ' ' 

D0_P:
    LEA     BD0,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVEA.L #0,A2
    MOVE.L  $3000,D3
D0_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D0_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D0_L
D0_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D0
*-------------------------------------
D1_P:
    LEA     BD1,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3010,D3
D1_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D1_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D1_L
D1_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D1
*-------------------------------------    
D2_P:
    LEA     BD2,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3020,D3
D2_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D2_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D2_L
D2_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D2
*-------------------------------------      
D3_P:
    LEA     BD3,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3030,D3
D3_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D3_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D3_L
D3_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #13,D0      ;line break
    TRAP    #15
    *DONE D3    
*-------------------------------------    
D4_P:
    LEA     BD4,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3040,D3
D4_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D4_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D4_L
D4_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D4 
*-------------------------------------
D5_P:
    LEA     BD5,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3050,D3
D5_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D5_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D5_L
D5_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D5 
*---------------------------------------
D6_P:
    LEA     BD6,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3060,D3
D6_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D6_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D6_L
D6_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0
    TRAP    #15
    *DONE D6
*---------------------------------------
D7_P:
    LEA     BD7,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3070,D3
D7_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     D7_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     D7_L
D7_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #13,D0      ;also line break again
    TRAP    #15
    *DONE D7
    *all data register done
*---------------------------------------  
*DISPLAYING ADDR REGISTERS
A0_P:
    LEA     BA0,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3080,D3
A0_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A0_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A0_L
A0_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0     
    TRAP    #15
    *DONE A0
*---------------------------------------     
A1_P:
    LEA     BA1,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $3090,D3
A1_L
    CMP     #14,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A1_D   
    ADD.W   #2,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A1_L
A1_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0     
    TRAP    #15
    *DONE A1
*--------------------------------------- 
A2_P:
    LEA     BA2,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4000,D3
A2_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A2_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A2_L
A2_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0     
    TRAP    #15
    *DONE A2
*------------------------------
A3_P:
    LEA     BA3,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4010,D3
A3_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A3_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A3_L
A3_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #13,D0      ;LINE BREAK     
    TRAP    #15
    *DONE A3
*-------------------------------
A4_P:
    LEA     BA4,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4020,D3
A4_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A4_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A4_L
A4_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0           
    TRAP    #15
    *DONE A4
*-------------------------------
A5_P:
    LEA     BA5,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4030,D3
A5_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A5_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A5_L
A5_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0           
    TRAP    #15
    *DONE A5
*--------------------------------
A6_P:
    LEA     BA6,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4040,D3
A6_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A6_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A6_L
A6_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #14,D0           
    TRAP    #15
    *DONE A6
*----------------------------
A7_P:
    LEA     BA7,A1
    MOVE.W  #14,D0
    TRAP    #15         
    MOVE.L  $4050,D3
A7_L
    CMP     #7,A2      ;EACH LOOP OUTPUT ONE DIGIT
    BGT     A7_D   
    ADD.W   #1,A2       ;GOSE TO THE NEXT DIGIT
    ROL.L   #4,D3
    MOVE.L  D3,D1
    AND.L   #$F,D1
    MOVE.B  #16,D2
    MOVE.B  #15,D0
    TRAP    #15
    BRA     A7_L
A7_D    
    MOVEA.L #0,A2
    LEA     LI,A1       ;SPACE
    MOVE.W  #13,D0      ;LINE BREAKS           
    TRAP    #15
    *DONE A7
    *DONE DISPLAY ALL ADDR REGESTERS
*----------------------------
    MOVEM.L (SP)+,D0-D7/A0-A7


    SIMHALT             ; halt simulator
    END    START        ; last line of source





*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
