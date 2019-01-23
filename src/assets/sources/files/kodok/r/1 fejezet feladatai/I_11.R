#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 10. feladat - Lovastábor, úszótábor
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Konfiguráljuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c(1,1))

#Feltételek
#Lovastábor minimum
add.constraint(lpmodel, c(1,0), type = ">=", 5)
#Úszótábor minimum
add.constraint(lpmodel, c(0,1), type = ">=", 7)
#Összköltség
add.constraint(lpmodel, c(10000,12000), type = "<=", 120000)
#Út
add.constraint(lpmodel, c(20,5), type = "<=", 100)

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