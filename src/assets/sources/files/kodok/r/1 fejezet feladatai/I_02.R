#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 02. feladat - Szendvicskészítés
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Alapesetben minimalizációra van beállítva, ezért átállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,1))

#Feltételek
#Vaj
add.constraint(lpmodel, c(2,1), type = "<=", 45)
#Sonka
add.constraint(lpmodel, c(2,0), type = "<=", 60)
#Szalámi
add.constraint(lpmodel, c(0,1.5), type = "<=", 35)
#Sajt
add.constraint(lpmodel, c(2,3), type = "<=", 75)
#Uborka
add.constraint(lpmodel, c(1,1), type = "<=", 35)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #28 -> 28 darab szendvicset tudunk csinálni

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #Ebből 12 sonkás és 16 szalámis.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************