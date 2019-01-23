/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 10. feladat - Délutáni olvasás
**********************************************************************************/;

proc optmodel;
    set <str> DIAK = /Sari, Jancsi, Sanyika, Marti, Pistike/;
    set <str> KONYV = /K1, K2, K3, K4, K5/;
    set IDO={DIAK, KONYV};
    num ktg{IDO} = [84, 73, 46, 73, 90,
                    76, 78, 80, 84, 77,
                    68, 73, 83, 92, 88,
                    82, 79, 91, 94, 72,
                    62, 68, 64, 75, 73];

    var x{IDO} >=0 ;

    max obj=sum{i in DIAK, j in KONYV} ktg[i,j]*x[i,j];

    con Felt1{i in DIAK}: sum{j in KONYV} x[i,j] = 1;
    con Felt2{j in KONYV}: sum{i in DIAK} x[i,j] = 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai KIDO 					2016
**********************************************************************************/;