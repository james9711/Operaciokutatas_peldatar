/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 6. feladat - Kertészet
**********************************************************************************/;

proc optmodel;
    set <str> DOLGOZOK = /K1, K2, K3, K4/;
    set <str> FELADAT =  /Gazolas, Ültetes, Locsolas, Növenyvagas/;
    set EREDMENY={DOLGOZOK, FELADAT};
    num ktg{EREDMENY} = [72, 42, 36, 69,
                         64, 46, 40, 75,
                         66, 38, 35, 63,
                         68, 46, 41, 67];

    var x{EREDMENY} >=0 ;

    min obj=sum{i in DOLGOZOK, j in FELADAT} ktg[i,j]*x[i,j];

    con Felt1{i in DOLGOZOK}: sum{j in FELADAT}  x[i,j] <= 1;
    con Felt2{j in FELADAT}:  sum{i in DOLGOZOK} x[i,j] >= 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;