/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 12. feladat - Irodai szék
**********************************************************************************/;

proc optmodel;
    /*Változók*/

    var x11 >= 0, x12 >= 0, x13 >= 0, x14  >= 0, x15  >= 0, x16  >= 0, x17  >= 0, x18  >= 0;
    var x21 >= 0, x22 >= 0, x23 >= 0, x24  >= 0, x25  >= 0, x26  >= 0, x27  >= 0, x28  >= 0;
    var x31 >= 0, x32 >= 0, x33 >= 0, x34  >= 0, x35  >= 0, x36  >= 0, x37  >= 0, x38  >= 0;
    var x41 >= 0, x42 >= 0, x43 >= 0, x44  >= 0, x45  >= 0, x46  >= 0, x47  >= 0, x48  >= 0;
    var x51 >= 0, x52 >= 0, x53 >= 0, x54  >= 0, x55  >= 0, x56  >= 0, x57  >= 0, x58  >= 0;

    /*Feltételek definiálása*/
    /*Kapacitás*/
    con GY1: x11 + x12 + x13 <= 240;
    con GY2: x21 + x22 + x23 <= 240;
    con R1:  x11 + x21 <= 100;
    con R2:  x12 + x22 <= 100;

    /*Igény*/
    con A1: x34 + x44 + x54 >= 80;
    con A2: x35 + x45 + x55 >= 104;
    con A3: x36 + x46 + x56 >= 128;
    con A4: x37 + x47 + x57 >= 64;
    con A5: x38 + x48 + x58 >= 64;

    /*Szállítás költsége*/
    con K1: x11 + x21 - x34 - x35 - x36 - x37 - x38 = 0;
    con K2: x12 + x22 - x44 - x45 - x46 - x47 - x48 = 0;
    con K3: x13 + x23 - x54 - x55 - x56 - x57 - x58 = 0;

    /*Minimalizációs célfv. meghatározása*/
    min z=90*x11 + 95*x12 + 115*x13
        + 95*x21 + 90*x22 + 120*x23
        + 72*x34 + 78*x35 + 82*x36 + 91*x37 + 60*x38
        + 81*x44 + 80*x45 + 76*x46 + 92*x47 + 72*x48
        + 74*x54 + 81*x55 + 78*x56 + 94*x57 + 83*x58;

    /*A felépített modell megoldása*/
    solve;

    /*A változók értékének a lekérdezése*/
    print x11;
    print x12;
    print x13;
    print x14;
    print x15;
    print x16;
    print x17;
    print x18;
    print x21;
    print x22;
    print x23;
    print x24;
    print x25;
    print x26;
    print x27;
    print x28;
    print x31;
    print x32;
    print x33;
    print x34;
    print x35;
    print x36;
    print x37;
    print x38;
    print x41;
    print x42;
    print x43;
    print x44;
    print x45;
    print x46;
    print x47;
    print x48;
    print x51;
    print x52;
    print x53;
    print x54;
    print x55;
    print x56;
    print x57;
    print x58;

run;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;