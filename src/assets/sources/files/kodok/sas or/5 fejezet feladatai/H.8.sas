/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 8. feladat - Árpatermesztés
**********************************************************************************/;

proc optmodel;
    set <str> FOLD = /F1, F2, F3, F4/;
    set <str> HET =  /H1, H2, H3, H4/;
    set ARATAS={FOLD, HET};
    num ktg{ARATAS} = [7, 11,  9, 6,
                       6, 13, 10, 5,
                       5, 12,  8, 4,
                       7, 10,  8, 3];

    var x{ARATAS} >=0 ;

    max obj=sum{i in FOLD, j in HET} ktg[i,j]*x[i,j];

    con Felt1{i in FOLD}: sum{j in HET}  x[i,j] <= 1;
    con Felt2{j in HET}:  sum{i in FOLD} x[i,j] <= 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;