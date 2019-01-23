/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 5. feladat - Tételhúzás
**********************************************************************************/;

proc optmodel;
    set <str> DIAKOK = /Attila, Ágnes, Erika, Pál, Tibor/;
    set <str> TETEL =  /T1, T2, T3, T4, T5/;
    set FELKESZULTSEG={DIAKOK, TETEL};
    num ktg{FELKESZULTSEG} = [81,88,65,42,90,
                              99,94,92,93,91,
                              81,23,46,53,74,
                              56,86,72,46,35,
                              24,63,34,58,78];

    var x{FELKESZULTSEG} >=0 ;

    max obj=sum{i in DIAKOK, j in TETEL} ktg[i,j]*x[i,j];

    con Felt1{i in DIAKOK}: sum{j in TETEL}  x[i,j] <= 1;
    con Felt2{j in TETEL}:  sum{i in DIAKOK} x[i,j] >= 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;