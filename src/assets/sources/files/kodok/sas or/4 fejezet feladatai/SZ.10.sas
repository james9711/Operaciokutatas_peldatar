/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 10. feladat - Tejszállítás
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14  >= 0 ;
    var x21 >= 0, x22 >= 0, x23 >= 0, x24  >= 0 ;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34  >= 0 ;

    /*Feltételek definiálása*/
    /*Kapacitás*/
    con T1: x11 + x12 + x13 + x14 <= 35;
    con T2: x21 + x22 + x23 + x24 <= 80;
    con T3: x31 + x32 + x33 + x34 <= 20;
    /*Igény*/
    con B1: x11 + x21 + x31 >= 32;
    con B2: x12 + x22 + x32 >= 24;
    con B3: x13 + x23 + x33 >= 43;
    con B4: x14 + x24 + x34 >= 36;
    /*Elsõ bolt nem kér tejet a második termelõtõl*/
    con N1: x21 = 0;

    /*Minimalizációs célfv. meghatározása*/
    min z=7*x11 + 3*x12 + 4*x13 + 4*x14 
        + 2*x21 + 4*x22 + 6*x23 + 5*x24 
        + 4*x31 + 5*x32 + 3*x33 + 3*x34;

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
    print x11;
    print x12;
    print x13;
    print x14;
    print x21;
    print x22;
    print x23;
    print x24;
    print x31;
    print x32;
    print x33;
    print x34;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;