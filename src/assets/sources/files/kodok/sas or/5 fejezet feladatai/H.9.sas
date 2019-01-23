/*********************************************************************************
Operációkutatás szoftveres példatár

5. fejezet 9. feladat - Újságírók
**********************************************************************************/;

proc optmodel;
    set <str> UJSAGIRO = /U1, U2, U3, U4/;
    set <str> HELYSZIN = /H1, H2, H3, H4/;
    set AR={UJSAGIRO, HELYSZIN};
    num ktg{AR} = [4000, 6000, 3600, 5000,
                   5200, 4600, 3500, 4400,
                   4800, 5700, 5600, 5000,
                   5300, 5600, 4900, 6200];

    var x{AR} >=0 ;

    min obj=sum{i in UJSAGIRO, j in HELYSZIN} ktg[i,j]*x[i,j];

    con Felt1{i in UJSAGIRO}: sum{j in HELYSZIN} x[i,j] = 1;
    con Felt2{j in HELYSZIN}: sum{i in UJSAGIRO} x[i,j] = 1;

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;