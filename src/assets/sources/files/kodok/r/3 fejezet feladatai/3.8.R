#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 3. fejezet 8. feladat
#
# Sós és édes süti rendelés 
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz. 3 feltételem lesz, mert azokat később adom hozzá.
lpmodel<-make.lp(0,2)

#Alapesetben minimalizációra van beállítva, ezért átállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(250,150))

#A modellben az első oszlop az édes süti, a második a sós.

#Megrendelés összértéke maximum 25000 Ft legyen
add.constraint(lpmodel, c(2000,1500), type = "<=", 25000)
#Legalább ennyi sós legyen
add.constraint(lpmodel, c(0,1), type = ">=", 6)
#Legalább ennyi édes legyen
add.constraint(lpmodel, c(1,0), type = ">=", 5)
#Liszt
add.constraint(lpmodel, c(0.6,1), type = "<=", 15)
#Élesztő
add.constraint(lpmodel, c(0.05,0.08), type = "<=", 1)
#Cukor
add.constraint(lpmodel, c(0.3,0.02), type = "<=", 2)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #2700 -> Ennyi a haszna a pékségnek

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #6 és 8, azaz 6 kg édes és 8 kg sós süti lesz a megrendelésben.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************