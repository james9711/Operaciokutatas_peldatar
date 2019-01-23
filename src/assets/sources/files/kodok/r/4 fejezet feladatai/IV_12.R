#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 6. feladat
#
# Tételhúzás.
# 
#***********************************************************************************

library(lpSolveAPI)

#40 darab döntési változó van.
lpmodel<-make.lp(0,40)

#Állítsuk be minimalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
#Itt a raktár tárolási költségeit a raktárba való szállítás költségéhez adtam hozzá minden raktár esetén.
set.objfn(lpmodel,c(90,95,115,0,0,0,0,0,95,90,120,0,0,0,0,0,0,0,0,72,78,82,91,60,0,0,0,81,80,76,92,72,0,0,0,74,81,78,94,83))

#Megadom a feltételeket.
#Gyártott mennyiség
add.constraint(lpmodel, c(1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 240)
add.constraint(lpmodel, c(0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 240)
#Áruházak igényei
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0), type = ">=", 80)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0), type = ">=", 104)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0), type = ">=", 128)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0), type = ">=", 64)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1), type = ">=", 64)
#Ami kimegy az áruházba, az raktárból szállítsuk oda
add.constraint(lpmodel, c(1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 0)
add.constraint(lpmodel, c(0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1,0,0,0,0,0,0,0,0), type = "=", 0)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,-1,-1,-1,-1,-1), type = "=", 0)
#Raktárak maximális kapacitása
add.constraint(lpmodel, c(1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 100)
add.constraint(lpmodel, c(0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 100)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#79976 -> Ennyi lesz az összköltsége a szállításnak.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("1.gyár","2.gyár","1.raktár","2.raktár","3.raktár"),c("1.raktár","2.raktár","3.raktár","1.áruház","2.áruház","3.áruház","4.áruház","5.áruház"))

solution 
#          1.raktár 2.raktár 3.raktár 1.áruház 2.áruház 3.áruház 4.áruház 5.áruház
#1.gyár          0        0      240        0        0        0        0        0
#2.gyár        100      100        0        0        0        0        0        0
#1.raktár        0        0        0        0        0        0       36       64
#2.raktár        0        0        0        0        0       72       28        0
#3.raktár        0        0        0       80      104       56        0        0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************