   LIST P=16F887           
   INCLUDE "P16F887.INC"   

    __config _CONFIG1, b'1110000011100001'
    __config _CONFIG2, b'1111100011111111'

    CBLOCK  0x20            
    COUNTER                 
    ENDC

    ORG     0x00            
    GOTO    MAIN            

    ORG     0x04            
    GOTO    TMR0_INT        

MAIN
    BANKSEL ANSEL

    CLRF    ANSEL
    CLRF    ANSELH

    BANKSEL OPTION_REG
    MOVLW   B'11010111'     
    MOVWF   OPTION_REG

    BANKSEL TRISB
    CLRF    TRISB           

    BANKSEL PORTB
    CLRF    PORTB           

    MOVLW   D'15'           
    MOVWF   COUNTER         

    BANKSEL INTCON
    MOVLW   B'10100000'     
                            
    MOVWF   INTCON

LOOP
    GOTO    LOOP            

TMR0_INT

    BCF     INTCON, TMR0IF  
    DECFSZ  COUNTER, F      
    GOTO    CIKIS           
    
    MOVLW   D'15'           
    MOVWF   COUNTER         
    
    MOVLW   H'01'           
    XORWF   PORTB, F        

CIKIS
    RETFIE                  

    END                     



