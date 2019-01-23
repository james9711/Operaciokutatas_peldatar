#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 6. feladat
#
# Faszállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó van.
lpmodel<-make.lp(0,16)

#Állítsuk be minimalizációra a modellünket.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(24,27,56,62,28,30,73,69,0,0,29,36,0,0,26,44))

#Adjuk meg a feltételeket.
#Gyártott mennyiségek
#Miskolc
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 1400)
#Salgótarján
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 600)

#Igények
#Szeged
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = ">=", 1100)
#Békéscsaba
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = ">=", 900)

#Tárolási kapacitás
#Kecskemét
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 400)
#Szolnok
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0), type = "<=", 600)

#Amennyit visznek Kecskemétre és Szolnokra, azt el is viszik onnan.
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,0,0,-1,-1,0,0,0,0), type = "=", 0)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,0,0,0,0,0,-1,-1), type = "=", 0)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#116200 lesz szállítási költségünk összesen.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("Miskolc","Salgótarján","Kecskemét","Szolnok"),c("Kecskemét","Szolnok","Szeged","Békéscsaba"))

solution 
#            Kecskemét Szolnok Szeged Békéscsaba
#Miskolc           400       0    100        900
#Salgótarján         0     600      0          0
#Kecskemét           0       0    400          0
#Szolnok             0       0    600          0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
