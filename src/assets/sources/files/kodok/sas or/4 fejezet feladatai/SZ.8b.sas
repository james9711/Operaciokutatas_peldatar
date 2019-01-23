/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 8.b feladat - Napló
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14  >= 0 ;
    var x21 >= 0, x22 >= 0, x23 >= 0, x24  >= 0 ;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34  >= 0 ;

    /*Feltételek definiálása*/
    /*Kapacitás*/
    con NY1: x11 + x12 + x13 + x14 <= 250;
    con NY2: x21 + x22 + x23 + x24 <= 150;
    con NY3: x31 + x32 + x33 + x34 <= 190;
    /*Igény*/
    con B1: x11 + x21 + x31 >= 150;
    con B2: x12 + x22 + x32 >= 195;
    con B3: x13 + x23 + x33 >= 120;
    con B4: x14 + x24 + x34 >= 125;
    con B5: x33 = 0;
    con B6: x24 = 0;

    /*Minimalizációs célfv. meghatározása*/
    min z=2*x11 + 4*x12 + 2*x13 + 1*x14 
        + 3*x21 + 3*x22 + 5*x23 + 2*x24 
        + 4*x31 + 4*x32 + 1*x33 + 3*x34;

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