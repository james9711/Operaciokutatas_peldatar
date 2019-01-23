#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 05. feladat - Asztalt gyártó cég
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c(2,-3))

#Feltételek
#Haszon
add.constraint(lpmodel, c(1,2), type = ">=", 6)
#Fűrészpor
add.constraint(lpmodel, c(1,-1), type = "<=", 3)
#Ragasztó
add.constraint(lpmodel, c(1,1), type = "<=", 10)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #5 -> A maximális színvonal 5 pont lesz.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) # 4 1 -> 4 tömörfa asztal és 1 préselt asztalt kell készíteni.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************