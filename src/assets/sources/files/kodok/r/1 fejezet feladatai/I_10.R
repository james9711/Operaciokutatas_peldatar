#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 10. feladat - Sapka, kardigán
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c(2000,4000))

#Feltételek
#Csak sapka egy héten 
add.constraint(lpmodel, c(1,0), type = "<=", 40)
#Csak kardigán
add.constraint(lpmodel, c(0,1), type = "<=", 20)
#Fonal
add.constraint(lpmodel, c(5,20), type = "<=", 250)
#Segítő szervezet igény
#Sapka
add.constraint(lpmodel, c(1,0), type = ">=", 45)
#Kardigán
add.constraint(lpmodel, c(0,1), type = ">=", 10)

#Hogy egész értékű megoldást kapjunk.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

solve(lpmodel) 

#Optimális megoldás
get.objective(lpmodel) #Nincs megoldása a feladatnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************