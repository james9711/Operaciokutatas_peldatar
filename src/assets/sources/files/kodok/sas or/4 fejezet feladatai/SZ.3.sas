/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 3. feladat - Konzervgyár
**********************************************************************************/;

proc optmodel;
    set <str> KONZERVGYAR = /K1, K2, K3/;
    set <str> ARUHAZ =/Tesco, Auchan, Spar, Coop, CBA/;
    set UTAK={KONZERVGYAR, ARUHAZ};
    num kap{KONZERVGYAR} = [500, 540, 360];
    num igeny{ARUHAZ} =[300,400,350,250,100];
    num ktg{UTAK} =[1.2,1.3,1.5,1.1,1.7,
                    1.7,2.1,1.8,1.3,1.4,
                    1.6,1.6,1.7,1.8,1.8];

    var x{UTAK} >=0 ;

    min obj=sum{i in KONZERVGYAR, j in ARUHAZ} ktg[i,j]*x[i,j];

    con kapFelt{i in KONZERVGYAR}:        sum{j in ARUHAZ} x[i,j] <= kap[i];
    con igenyFelt{j in ARUHAZ}: sum{i in KONZERVGYAR}      x[i,j] >= igeny[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;