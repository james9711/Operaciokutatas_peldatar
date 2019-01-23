
/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 3. feladat - Vegyes váltó
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14 >= 0; 
    var x21 >= 0, x22 >= 0, x23 >= 0, x24 >= 0;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34 >= 0;
    var x41 >= 0, x42 >= 0, x43 >= 0, x44 >= 0;
    var x51 >= 0, x52 >= 0, x53 >= 0, x54 >= 0;

    /*Feltételek definiálása*/
    con HAT:      x11 + x21 + x31 + x41 + x51 = 1;
    con MELL:     x12 + x22 + x32 + x42 + x52 = 1;
    con GYORS:    x13 + x23 + x33 + x43 + x53 = 1;
    con PILLANGO: x14 + x24 + x34 + x44 + x54 = 1;


    /*Minimalizációs célfv. meghatározása*/
    min z= 69.4*x11 + 78.4*x12 + 63.2*x13 + 66.4*x14 
         + 71.2*x21 + 76.3*x22 + 65.9*x23 + 67.3*x24
         + 68.6*x31 + 81.3*x32 + 66.4*x33 + 69.8*x34
         + 68.8*x41 + 76.5*x42 + 61.5*x43 + 67.1*x44
         + 68.9*x51 + 77.9*x52 + 65.1*x53 + 67.2*x54;

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
    print x41;
    print x42;
    print x43;
    print x44;
    print x51;
    print x52;
    print x53;
    print x54;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;