/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 9. feladat - Betonszállítás
**********************************************************************************/;

proc optmodel;
    set <str> BAZIS = /B1, B2, B3/;
    set <str> SZALLIT =/ÉH1, ÉH2, ÉH3, ÉH4, ÉH5/;
    set UTAK={BAZIS, SZALLIT};
    num kap{BAZIS} = [52, 43, 44];
    num igeny{SZALLIT} = [36, 17, 23, 25, 33];
    num ktg{UTAK} =[3500,4800,2000,7200,4800,
                    3500,7200,4800,3500,4800,
                    7200,2000,7200,4800,4800];

    var x{UTAK} >=0 ;

    min obj=sum{i in BAZIS, j in SZALLIT} ktg[i,j]*x[i,j];

    con kapFelt{i in BAZIS}:  sum{j in SZALLIT} x[i,j] <= kap[i];
    con igenyFelt{j in SZALLIT}:sum{i in BAZIS} x[i,j] >= igeny[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;

