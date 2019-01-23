#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 06. feladat - Tehén, kecske tartás
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c((10*100),(3*150)))

#Feltételek
#Terület
add.constraint(lpmodel, c(5,4), type = "<=", 160)
#Élelmezés
add.constraint(lpmodel, c(5,3), type = "<=", 500)

#Állítsuk be egészre a változókat.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #32000 -> 320 liter tud eladni ennyiért.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) # 32 0 -> 32 tehenet kell tartania.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************