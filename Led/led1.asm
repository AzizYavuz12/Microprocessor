
    list    p=16F887
    include <P16F887.inc>

    __CONFIG _CONFIG1, _FOSC_HS & _WDTE_OFF & _PWRTE_ON & _LVP_OFF & _CP_OFF
    __CONFIG _CONFIG2, _WRT_OFF


    org 0x00
    goto MAIN

MAIN:
    bsf STATUS, RP0       
    movlw b'00000101'       
    movwf TRISD
    bcf STATUS, RP0         
    clrf PORTD             

LOOP:
    btfsc PORTD, 0          
    bsf   PORTD, 1           
    btfss PORTD, 0
    bcf   PORTD, 1           

    btfsc PORTD, 2           
    bsf   PORTD, 3           
    btfss PORTD, 2
    bcf   PORTD, 3           

    goto LOOP                

    end


