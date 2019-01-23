/*********************************************************************************
Operációkutatás szoftveres példatár

4. fejezet 2. feladat - Befektetés
**********************************************************************************/;

proc optmodel;
    set <str> BEFEKTETES = /Részvény, Kötvény, Lekötött_betét/;
    set <str> TARSASAG =/A, B, C, D, E, F/;
    set HOZAM={BEFEKTETES, TARSASAG};
    num sor{BEFEKTETES} = [7, 5, 3];
    num oszlop{TARSASAG}= [4,3,2,2,2,2];
    num szazalek{HOZAM} =[0.12,0.10,0.15,0.13,0.16,0.14,
                          0.081,0.076,0.073,0.078,0.074,0.08,
                          0.057,0.061,0.049,0.054,0.045,0.053];

    var x{HOZAM} >=0 ;

    max obj=sum{i in BEFEKTETES, j in TARSASAG} szazalek[i,j]*x[i,j];

    con sorFelt{i in BEFEKTETES}:  sum{j in TARSASAG}   x[i,j]  = sor[i];
    con oszlopFelt{j in TARSASAG}: sum{i in BEFEKTETES} x[i,j] <= oszlop[j];

    solve;

    print x;

quit;

/*********************************************************************************
Debreceni Egyetem, Informatikai Kar 					2016
**********************************************************************************/;