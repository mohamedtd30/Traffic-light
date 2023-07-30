
_manual:

;Traffic light.c,3 :: 		void manual(){
;Traffic light.c,5 :: 		if (flag == 2){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual58
	MOVLW      2
	XORWF      _flag+0, 0
L__manual58:
	BTFSS      STATUS+0, 2
	GOTO       L_manual0
;Traffic light.c,6 :: 		portc.b3 = 0;
	BCF        PORTC+0, 3
;Traffic light.c,7 :: 		portc.b2 = 1;
	BSF        PORTC+0, 2
;Traffic light.c,8 :: 		for (j = 3; j >= 0; --j){
	MOVLW      3
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_manual1:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual59
	MOVLW      0
	SUBWF      R1+0, 0
L__manual59:
	BTFSS      STATUS+0, 0
	GOTO       L_manual2
;Traffic light.c,9 :: 		value = 3;
	MOVLW      3
	MOVWF      _value+0
	MOVLW      0
	MOVWF      _value+1
;Traffic light.c,10 :: 		portb = j;
	MOVF       R1+0, 0
	MOVWF      PORTB+0
;Traffic light.c,11 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_manual4:
	DECFSZ     R13+0, 1
	GOTO       L_manual4
	DECFSZ     R12+0, 1
	GOTO       L_manual4
	DECFSZ     R11+0, 1
	GOTO       L_manual4
	NOP
	NOP
;Traffic light.c,12 :: 		if (j == 0){
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual60
	MOVLW      0
	XORWF      R1+0, 0
L__manual60:
	BTFSS      STATUS+0, 2
	GOTO       L_manual5
;Traffic light.c,13 :: 		portc.b4 = 0;
	BCF        PORTC+0, 4
;Traffic light.c,14 :: 		portc.b2 = 0;
	BCF        PORTC+0, 2
;Traffic light.c,15 :: 		}
L_manual5:
;Traffic light.c,8 :: 		for (j = 3; j >= 0; --j){
	MOVLW      1
	SUBWF      R1+0, 1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
;Traffic light.c,16 :: 		}
	GOTO       L_manual1
L_manual2:
;Traffic light.c,17 :: 		}
	GOTO       L_manual6
L_manual0:
;Traffic light.c,18 :: 		else if (flag == 3){
	MOVLW      0
	XORWF      _flag+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual61
	MOVLW      3
	XORWF      _flag+0, 0
L__manual61:
	BTFSS      STATUS+0, 2
	GOTO       L_manual7
;Traffic light.c,19 :: 		portc.b6 = 0;
	BCF        PORTC+0, 6
;Traffic light.c,20 :: 		portc.b5 = 1;
	BSF        PORTC+0, 5
;Traffic light.c,21 :: 		for (j = 3; j >= 0; --j){
	MOVLW      3
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_manual8:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual62
	MOVLW      0
	SUBWF      R1+0, 0
L__manual62:
	BTFSS      STATUS+0, 0
	GOTO       L_manual9
;Traffic light.c,22 :: 		value = 2;
	MOVLW      2
	MOVWF      _value+0
	MOVLW      0
	MOVWF      _value+1
;Traffic light.c,23 :: 		portb = j;
	MOVF       R1+0, 0
	MOVWF      PORTB+0
;Traffic light.c,24 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_manual11:
	DECFSZ     R13+0, 1
	GOTO       L_manual11
	DECFSZ     R12+0, 1
	GOTO       L_manual11
	DECFSZ     R11+0, 1
	GOTO       L_manual11
	NOP
	NOP
;Traffic light.c,25 :: 		if (j == 0){
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__manual63
	MOVLW      0
	XORWF      R1+0, 0
L__manual63:
	BTFSS      STATUS+0, 2
	GOTO       L_manual12
;Traffic light.c,26 :: 		portc.b1 = 0;
	BCF        PORTC+0, 1
;Traffic light.c,27 :: 		portc.b5 = 0;
	BCF        PORTC+0, 5
;Traffic light.c,28 :: 		}
L_manual12:
;Traffic light.c,21 :: 		for (j = 3; j >= 0; --j){
	MOVLW      1
	SUBWF      R1+0, 1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
;Traffic light.c,29 :: 		}
	GOTO       L_manual8
L_manual9:
;Traffic light.c,30 :: 		}
L_manual7:
L_manual6:
;Traffic light.c,31 :: 		}
L_end_manual:
	RETURN
; end of _manual

_find:

;Traffic light.c,33 :: 		int find(){
;Traffic light.c,34 :: 		if (portc.b7 == 1)
	BTFSS      PORTC+0, 7
	GOTO       L_find13
;Traffic light.c,35 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_find
L_find13:
;Traffic light.c,37 :: 		return -1; // default value
	MOVLW      255
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R0+1
;Traffic light.c,38 :: 		}
L_end_find:
	RETURN
; end of _find

_turnOnFirstLeds:

;Traffic light.c,40 :: 		void turnOnFirstLeds(int count){
;Traffic light.c,41 :: 		portc.b4 = 1; // The red led will be always on untill the loop finishes
	BSF        PORTC+0, 4
;Traffic light.c,42 :: 		if (count <= 3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_turnOnFirstLeds_count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turnOnFirstLeds66
	MOVF       FARG_turnOnFirstLeds_count+0, 0
	SUBLW      3
L__turnOnFirstLeds66:
	BTFSS      STATUS+0, 0
	GOTO       L_turnOnFirstLeds15
;Traffic light.c,43 :: 		portc.b3 = 0; // green led
	BCF        PORTC+0, 3
;Traffic light.c,44 :: 		portc.b2 = 1; // yellow led
	BSF        PORTC+0, 2
;Traffic light.c,45 :: 		}
	GOTO       L_turnOnFirstLeds16
L_turnOnFirstLeds15:
;Traffic light.c,47 :: 		portc.b3 = 1;
	BSF        PORTC+0, 3
L_turnOnFirstLeds16:
;Traffic light.c,49 :: 		if (count == 0){
	MOVLW      0
	XORWF      FARG_turnOnFirstLeds_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turnOnFirstLeds67
	MOVLW      0
	XORWF      FARG_turnOnFirstLeds_count+0, 0
L__turnOnFirstLeds67:
	BTFSS      STATUS+0, 2
	GOTO       L_turnOnFirstLeds17
;Traffic light.c,50 :: 		portc.b4 = 0;
	BCF        PORTC+0, 4
;Traffic light.c,51 :: 		portc.b3 = 0;
	BCF        PORTC+0, 3
;Traffic light.c,52 :: 		portc.b2 = 0;
	BCF        PORTC+0, 2
;Traffic light.c,53 :: 		}
L_turnOnFirstLeds17:
;Traffic light.c,54 :: 		}
L_end_turnOnFirstLeds:
	RETURN
; end of _turnOnFirstLeds

_turnOnOtherLeds:

;Traffic light.c,56 :: 		void turnOnOtherLeds(int count){
;Traffic light.c,57 :: 		portc.b1 = 1; // The red led will be always on untill the loop finishes
	BSF        PORTC+0, 1
;Traffic light.c,58 :: 		if (count <= 3){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_turnOnOtherLeds_count+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turnOnOtherLeds69
	MOVF       FARG_turnOnOtherLeds_count+0, 0
	SUBLW      3
L__turnOnOtherLeds69:
	BTFSS      STATUS+0, 0
	GOTO       L_turnOnOtherLeds18
;Traffic light.c,59 :: 		portc.b6 = 0;
	BCF        PORTC+0, 6
;Traffic light.c,60 :: 		portc.b5 = 1;
	BSF        PORTC+0, 5
;Traffic light.c,61 :: 		}
	GOTO       L_turnOnOtherLeds19
L_turnOnOtherLeds18:
;Traffic light.c,63 :: 		portc.b6 = 1;
	BSF        PORTC+0, 6
L_turnOnOtherLeds19:
;Traffic light.c,65 :: 		if (count == 0){
	MOVLW      0
	XORWF      FARG_turnOnOtherLeds_count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__turnOnOtherLeds70
	MOVLW      0
	XORWF      FARG_turnOnOtherLeds_count+0, 0
L__turnOnOtherLeds70:
	BTFSS      STATUS+0, 2
	GOTO       L_turnOnOtherLeds20
;Traffic light.c,66 :: 		portc.b1 = 0;
	BCF        PORTC+0, 1
;Traffic light.c,67 :: 		portc.b6 = 0;
	BCF        PORTC+0, 6
;Traffic light.c,68 :: 		portc.b5 = 0;
	BCF        PORTC+0, 5
;Traffic light.c,69 :: 		}
L_turnOnOtherLeds20:
;Traffic light.c,70 :: 		}
L_end_turnOnOtherLeds:
	RETURN
; end of _turnOnOtherLeds

_check:

;Traffic light.c,72 :: 		int check(){
;Traffic light.c,73 :: 		if (value == 2){
	MOVLW      0
	XORWF      _value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check72
	MOVLW      2
	XORWF      _value+0, 0
L__check72:
	BTFSS      STATUS+0, 2
	GOTO       L_check21
;Traffic light.c,74 :: 		value = 0;
	CLRF       _value+0
	CLRF       _value+1
;Traffic light.c,75 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_check
;Traffic light.c,76 :: 		}
L_check21:
;Traffic light.c,77 :: 		else if (value == 3){
	MOVLW      0
	XORWF      _value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check73
	MOVLW      3
	XORWF      _value+0, 0
L__check73:
	BTFSS      STATUS+0, 2
	GOTO       L_check23
;Traffic light.c,78 :: 		value = 0;
	CLRF       _value+0
	CLRF       _value+1
;Traffic light.c,79 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
	GOTO       L_end_check
;Traffic light.c,80 :: 		}
L_check23:
;Traffic light.c,82 :: 		return -1; // default value
	MOVLW      255
	MOVWF      R0+0
	MOVLW      255
	MOVWF      R0+1
;Traffic light.c,83 :: 		}
L_end_check:
	RETURN
; end of _check

_main:

;Traffic light.c,85 :: 		void main() {
;Traffic light.c,87 :: 		trisb = 0;
	CLRF       TRISB+0
;Traffic light.c,88 :: 		trisc = 0b10000001;
	MOVLW      129
	MOVWF      TRISC+0
;Traffic light.c,89 :: 		trisd = 0;
	CLRF       TRISD+0
;Traffic light.c,90 :: 		portd = 255;
	MOVLW      255
	MOVWF      PORTD+0
;Traffic light.c,91 :: 		portb = 0;
	CLRF       PORTB+0
;Traffic light.c,92 :: 		portc = 0;
	CLRF       PORTC+0
;Traffic light.c,94 :: 		while (1)
L_main25:
;Traffic light.c,96 :: 		flag = 2;
	MOVLW      2
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;Traffic light.c,97 :: 		for (i = 35 ; i >= 0; i--)
	MOVLW      35
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main27:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main75:
	BTFSS      STATUS+0, 0
	GOTO       L_main28
;Traffic light.c,99 :: 		if (i == 31)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      31
	XORWF      main_i_L0+0, 0
L__main76:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;Traffic light.c,100 :: 		i -= 6;
	MOVLW      6
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
	GOTO       L_main31
L_main30:
;Traffic light.c,101 :: 		else if (i == 15)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      15
	XORWF      main_i_L0+0, 0
L__main77:
	BTFSS      STATUS+0, 2
	GOTO       L_main32
;Traffic light.c,102 :: 		i -= 6;
	MOVLW      6
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
L_main32:
L_main31:
;Traffic light.c,103 :: 		if (portc.b7 != 0)
	BTFSS      PORTC+0, 7
	GOTO       L_main33
;Traffic light.c,104 :: 		portb = i;
	MOVF       main_i_L0+0, 0
	MOVWF      PORTB+0
L_main33:
;Traffic light.c,105 :: 		turnOnFirstLeds(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_turnOnFirstLeds_count+0
	MOVF       main_i_L0+1, 0
	MOVWF      FARG_turnOnFirstLeds_count+1
	CALL       _turnOnFirstLeds+0
;Traffic light.c,106 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
	DECFSZ     R11+0, 1
	GOTO       L_main34
	NOP
	NOP
;Traffic light.c,107 :: 		if (portc.b7 == 0){
	BTFSC      PORTC+0, 7
	GOTO       L_main35
;Traffic light.c,108 :: 		if (i <= 3){portb = i; continue;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main78:
	BTFSS      STATUS+0, 0
	GOTO       L_main36
	MOVF       main_i_L0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main29
L_main36:
;Traffic light.c,109 :: 		portb = 0;
	CLRF       PORTB+0
;Traffic light.c,110 :: 		while (portc.b0 == 0) {if (find() == 1) {break;}}
L_main37:
	BTFSC      PORTC+0, 0
	GOTO       L_main38
	CALL       _find+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVLW      1
	XORWF      R0+0, 0
L__main79:
	BTFSS      STATUS+0, 2
	GOTO       L_main39
	GOTO       L_main38
L_main39:
	GOTO       L_main37
L_main38:
;Traffic light.c,111 :: 		if (find() == 1) {i = 36; continue;};
	CALL       _find+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      1
	XORWF      R0+0, 0
L__main80:
	BTFSS      STATUS+0, 2
	GOTO       L_main40
	MOVLW      36
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
	GOTO       L_main29
L_main40:
;Traffic light.c,112 :: 		manual();
	CALL       _manual+0
;Traffic light.c,113 :: 		}
	GOTO       L_main41
L_main35:
;Traffic light.c,115 :: 		continue;
	GOTO       L_main29
L_main41:
;Traffic light.c,116 :: 		if (check() == 0) {break;};
	CALL       _check+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      0
	XORWF      R0+0, 0
L__main81:
	BTFSS      STATUS+0, 2
	GOTO       L_main42
	GOTO       L_main28
L_main42:
;Traffic light.c,117 :: 		}
L_main29:
;Traffic light.c,97 :: 		for (i = 35 ; i >= 0; i--)
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;Traffic light.c,117 :: 		}
	GOTO       L_main27
L_main28:
;Traffic light.c,119 :: 		flag = 3;
	MOVLW      3
	MOVWF      _flag+0
	MOVLW      0
	MOVWF      _flag+1
;Traffic light.c,120 :: 		for (i = 21 ; i >= 0; i--)
	MOVLW      21
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
L_main43:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main82:
	BTFSS      STATUS+0, 0
	GOTO       L_main44
;Traffic light.c,122 :: 		if (i == 15)
	MOVLW      0
	XORWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      15
	XORWF      main_i_L0+0, 0
L__main83:
	BTFSS      STATUS+0, 2
	GOTO       L_main46
;Traffic light.c,123 :: 		i -= 6;
	MOVLW      6
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
L_main46:
;Traffic light.c,124 :: 		if (portc.b7 != 0)
	BTFSS      PORTC+0, 7
	GOTO       L_main47
;Traffic light.c,125 :: 		portb = i;
	MOVF       main_i_L0+0, 0
	MOVWF      PORTB+0
L_main47:
;Traffic light.c,126 :: 		turnOnOtherLeds(i);
	MOVF       main_i_L0+0, 0
	MOVWF      FARG_turnOnOtherLeds_count+0
	MOVF       main_i_L0+1, 0
	MOVWF      FARG_turnOnOtherLeds_count+1
	CALL       _turnOnOtherLeds+0
;Traffic light.c,127 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
;Traffic light.c,128 :: 		if (portc.b7 == 0){
	BTFSC      PORTC+0, 7
	GOTO       L_main49
;Traffic light.c,129 :: 		if (i <= 3){portb = i; continue;}
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVF       main_i_L0+0, 0
	SUBLW      3
L__main84:
	BTFSS      STATUS+0, 0
	GOTO       L_main50
	MOVF       main_i_L0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main45
L_main50:
;Traffic light.c,130 :: 		portb = 0;
	CLRF       PORTB+0
;Traffic light.c,131 :: 		while (portc.b0 == 0) {if (find() == 1) {break;}}
L_main51:
	BTFSC      PORTC+0, 0
	GOTO       L_main52
	CALL       _find+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      1
	XORWF      R0+0, 0
L__main85:
	BTFSS      STATUS+0, 2
	GOTO       L_main53
	GOTO       L_main52
L_main53:
	GOTO       L_main51
L_main52:
;Traffic light.c,132 :: 		if (find() == 1) {i = 22; continue;}
	CALL       _find+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVLW      1
	XORWF      R0+0, 0
L__main86:
	BTFSS      STATUS+0, 2
	GOTO       L_main54
	MOVLW      22
	MOVWF      main_i_L0+0
	MOVLW      0
	MOVWF      main_i_L0+1
	GOTO       L_main45
L_main54:
;Traffic light.c,133 :: 		manual();
	CALL       _manual+0
;Traffic light.c,134 :: 		}
	GOTO       L_main55
L_main49:
;Traffic light.c,136 :: 		continue;
	GOTO       L_main45
L_main55:
;Traffic light.c,137 :: 		if (check() == 1){break;};
	CALL       _check+0
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      1
	XORWF      R0+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L_main56
	GOTO       L_main44
L_main56:
;Traffic light.c,138 :: 		}
L_main45:
;Traffic light.c,120 :: 		for (i = 21 ; i >= 0; i--)
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;Traffic light.c,138 :: 		}
	GOTO       L_main43
L_main44:
;Traffic light.c,139 :: 		}
	GOTO       L_main25
;Traffic light.c,140 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
