#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 11. feladat
#
# Rendelésfelvételi hiba.
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó van.
lpmodel<-make.lp(0,12)

#Állítsuk be minimalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(7,8,5,6,9,7,7,8,100,130,105,120))

#Adjuk meg a feltételeket.
#Raktárkapacitás
#Raktár 1
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 35)
#Raktár 2
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 50)
#Fiktív raktár
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 20)

#Igények
#1. megrendelő igénye
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0), type = ">=", 30)
#2. megrendelő
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0), type = ">=", 26)
#3. megrendelő
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0), type = ">=", 25)
#4. megrendelő
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1), type = ">=", 24)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#2569 euróba fog kerülni nekünk a kiszállítás és a kártérítés kifizetése.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("1. Raktár","2. Raktár","Fiktív raktár"),c("1. rendelő","2. rendelő","3. rendelő","4. rendelő"))

solution
#              1. rendelő 2. rendelő 3. rendelő 4. rendelő
#1. Raktár             10          0          1         24
#2. Raktár              0         26         24          0
#Fiktív raktár         20          0          0          0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************