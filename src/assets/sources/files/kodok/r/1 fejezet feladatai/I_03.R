#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 03. feladat - Kosztüm, öltöny gyártás
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(4,3))

#Feltételek
#Szabás
add.constraint(lpmodel, c(1,1), type = "<=", 40)
#Varrás
add.constraint(lpmodel, c(2,1), type = "<=", 60)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #140 -> 140$ lesz a haszna a vállalatnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) # 20 20 -> 20 kosztümöt és 20 öltönyt kell gyártani a maximális profithoz.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************