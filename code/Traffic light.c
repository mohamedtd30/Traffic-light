int flag; // global variable
int value;
void manual(){
     int j;
     if (flag == 2){
        portc.b3 = 0;
        portc.b2 = 1;
        for (j = 3; j >= 0; --j){
           value = 3;
           portb = j;
           delay_ms(500);
           if (j == 0){
               portc.b4 = 0;
               portc.b2 = 0;
           }
        }
     }
     else if (flag == 3){
        portc.b6 = 0;
        portc.b5 = 1;
        for (j = 3; j >= 0; --j){
           value = 2;
           portb = j;
           delay_ms(500);
           if (j == 0){
               portc.b1 = 0;
               portc.b5 = 0;
           }
        }
     }
}

int find(){
     if (portc.b7 == 1)
        return 1;
     else
         return -1; // default value
}

void turnOnFirstLeds(int count){
     portc.b4 = 1; // The red led will be always on untill the loop finishes
     if (count <= 3){
        portc.b3 = 0; // green led
        portc.b2 = 1; // yellow led
     }
     else
        portc.b3 = 1;
     // turn off all the leds
     if (count == 0){
        portc.b4 = 0;
        portc.b3 = 0;
        portc.b2 = 0;
     }
}

void turnOnOtherLeds(int count){
     portc.b1 = 1; // The red led will be always on untill the loop finishes
     if (count <= 3){
        portc.b6 = 0;
        portc.b5 = 1;
     }
     else
        portc.b6 = 1;

     if (count == 0){
        portc.b1 = 0;
        portc.b6 = 0;
        portc.b5 = 0;
     }
}

int check(){
     if (value == 2){
        value = 0;
        return 1;
     }
     else if (value == 3){
        value = 0;
        return 0;
     }
     else
        return -1; // default value
}

void main() {
     int i;
     trisb = 0;
     trisc = 0b10000001;
     trisd = 0;
     portd = 255;
     portb = 0;
     portc = 0;

     while (1)
     {
         flag = 2;
         for (i = 35 ; i >= 0; i--)
         {
             if (i == 31)
                i -= 6;
             else if (i == 15)
                i -= 6;
             if (portc.b7 != 0)
                portb = i;
             turnOnFirstLeds(i);
             delay_ms(500);
             if (portc.b7 == 0){
                if (i <= 3){portb = i; continue;}
                portb = 0;
                while (portc.b0 == 0) {if (find() == 1) {break;}}
                if (find() == 1) {i = 36; continue;};
                manual();
            }
            else
                continue;
            if (check() == 0) {break;};
         }

         flag = 3;
         for (i = 21 ; i >= 0; i--)
         {
             if (i == 15)
                i -= 6;
             if (portc.b7 != 0)
                portb = i;
             turnOnOtherLeds(i);
             delay_ms(500);
             if (portc.b7 == 0){
                if (i <= 3){portb = i; continue;}
                portb = 0;
                while (portc.b0 == 0) {if (find() == 1) {break;}}
                if (find() == 1) {i = 22; continue;}
                manual();
            }
            else
                continue;
            if (check() == 1){break;};
         }
     }
}