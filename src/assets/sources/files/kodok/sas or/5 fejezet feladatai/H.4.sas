
/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 4. feladat - Szobafestés
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14 >= 0, x15 >= 0; 
    var x21 >= 0, x22 >= 0, x23 >= 0, x24 >= 0, x25 >= 0;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34 >= 0, x35 >= 0;
    var x41 >= 0, x42 >= 0, x43 >= 0, x44 >= 0, x45 >= 0;
    var x51 >= 0, x52 >= 0, x53 >= 0, x54 >= 0, x55 >= 0;

    /*Feltételek definiálása*/
    /*Egy fázist egy ember*/
    con Kipakolas:      x11 + x21 + x31 + x41 + x51 = 1;
    con Falhiba:        x12 + x22 + x32 + x42 + x52 = 1;
    con Alapozas:       x13 + x23 + x33 + x43 + x53 = 1;
    con Festes:         x14 + x24 + x34 + x44 + x54 = 1;
    con Visszapakolas:  x15 + x25 + x35 + x45 + x55 = 1;

    /*Egy ember egy fázis*/
    con Andras:  x11 + x12 + x13 + x14 + x15 = 1;
    con Bela:    x21 + x22 + x23 + x24 + x25 = 1;
    con Zoltan:  x31 + x32 + x33 + x34 + x35 = 1;
    con Sandor:  x41 + x42 + x43 + x44 + x45 = 1;
    con Oliver:  x51 + x52 + x53 + x54 + x55 = 1;

    /*Egyéb feltétel*/
    con Andras1: x14 = 0;
    con Zoltan1: x31 + x35 = 0;

    /*Minimalizációs célfv. meghatározása*/
    min z= 46*x11 + 23*x12 + 43*x13 + 79*x14 + 41*x15
         + 41*x21 + 21*x22 + 39*x23 + 81*x24 + 43*x25
         + 36*x31 + 29*x32 + 41*x33 + 84*x34 + 37*x35
         + 39*x41 + 27*x42 + 40*x43 + 81*x44 + 39*x45
         + 44*x51 + 31*x52 + 46*x53 + 92*x54 + 48*x55;

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
    print x11;
    print x12;
    print x13;
    print x14;
    print x15;
    print x21;
    print x22;
    print x23;
    print x24;
    print x25;
    print x31;
    print x32;
    print x33;
    print x34;
    print x35;
    print x41;
    print x42;
    print x43;
    print x44;
    print x45;
    print x51;
    print x52;
    print x53;
    print x54;
    print x55;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;