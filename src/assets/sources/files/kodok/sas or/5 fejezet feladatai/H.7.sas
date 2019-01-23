/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 7. feladat - IT karbantartás
**********************************************************************************/;

proc optmodel;
    set <str> MUNKATARS = /Sandor, Bence, Istvan, Lajos, Laszlo/;
    set <str> MEGRENDELO =  /C1, C2, C3, C4/;
    set IDO={MUNKATARS, MEGRENDELO};
    num ktg{IDO} = [7, 5, 11, 12,
                    9, 4,  9,  9,
                   10, 7, 12, 11,
                    6, 5,  8,  6,
                    7, 8, 11, 10];

    var x{IDO} >=0 ;

    min obj=sum{i in MUNKATARS, j in MEGRENDELO} ktg[i,j]*x[i,j];

    con Felt1{i in MUNKATARS}:  sum{j in MEGRENDELO} x[i,j] <= 1;
    con Felt2{j in MEGRENDELO}: sum{i in MUNKATARS}  x[i,j]  = 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;