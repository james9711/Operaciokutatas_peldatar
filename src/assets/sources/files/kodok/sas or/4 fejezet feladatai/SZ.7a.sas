
/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 7.a feladat - Bicikliszállítás
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14  >= 0, x15  >= 0, x16  >= 0 ; 
    var x21 >= 0, x22 >= 0, x23 >= 0, x24  >= 0, x25  >= 0, x26  >= 0 ;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34  >= 0, x35  >= 0, x36  >= 0 ;
    var x41 >= 0, x42 >= 0, x43 >= 0, x44  >= 0, x45  >= 0, x46  >= 0 ;

    /*Feltételek definiálása*/
    /*Kapacitás*/
    con GY1: x11 + x12 + x13 + x14 + x15 + x16 <= 32;
    con GY2: x21 + x22 + x23 + x24 + x25 + x26 <= 46;
    con GY3: x31 + x32 + x33 + x34 + x35 + x36 <= 18;
    con GY4: x41 + x42 + x43 + x44 + x45 + x46 <= 24;
    /*Igény*/
    con B1: x11 + x21 + x31 + x41 >= 13;
    con B2: x12 + x22 + x32 + x42 >= 19;
    con B3: x13 + x23 + x33 + x43 >= 25;
    con B4: x14 + x24 + x34 + x44 >= 21;
    con B5: x15 + x25 + x35 + x45 >= 16;
    con B6: x16 + x26 + x36 + x46 >= 26;

    /*Minimalizációs célfv. meghatározása*/
    min z= 7*x11 +  9*x12 + 12*x13 + 10*x14 + 10*x15 + 9*x16
        +  8*x21 + 11*x22 + 10*x23 + 13*x24 + 11*x25 + 9*x26
        + 12*x31 + 11*x32 + 11*x33 +  9*x34 + 10*x35 + 7*x36
        + 10*x41 +  8*x42 +  9*x43 + 11*x44 + 11*x45 + 10*x46;

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
    print x11;
    print x12;
    print x13;
    print x14;
    print x15;
    print x16;
    print x21;
    print x22;
    print x23;
    print x24;
    print x25;
    print x26;
    print x31;
    print x32;
    print x33;
    print x34;
    print x35;
    print x36;
    print x41;
    print x42;
    print x43;
    print x44;
    print x45;
    print x46;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;