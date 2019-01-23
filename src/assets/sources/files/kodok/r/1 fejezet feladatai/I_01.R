#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 01. feladat - Szekrény, asztal gyártás
# 
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz. 3 feltételem lesz, de azokat később adom hozzá a modellhez.
lpmodel<-make.lp(0,2)

#Alapesetben minimalizációra van beállítva, ezért átállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(75000,55000))

#Megadom a feltételeket.
#Éves munkaóra
add.constraint(lpmodel, c(10,15), type = "<=", 1300)
#Rendelkezésre álló bútorlap
add.constraint(lpmodel, c(5,3), type = "<=", 400)
#Asztalok száma
add.constraint(lpmodel, c(0,1), type = "<=", 70)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A lpmodel dimenzió neveinek elnevezéseinek beállítása
dimnames(lpmodel)<-list(c("Munkaóra","Alapanyag","Asztalkorlát"),c("Szekrény","Asztal"))

#Az lpmodel megjelenése (ellenörízhetjük, hogy jól adtuk meg a dolgokat).
lpmodel

#   Model name: 
#                 Szekrény    Asztal          
# Maximize         75000     55000              <- Célfüggvény
# Munkaóra            10        15  <=  1300    
# Alapanyag            5         3  <=   400    <- Feltételek
# Asztalkorlát         0         1  <=    70
# Kind               Std       Std          
# Type               Int       Int              <- Egészek lesznek a döntési változóink
# Upper              Inf       Inf              
# Lower                0         0              <- A változóink milyen érteket lehet fel (alapesetben "x1>0")

#A felépített modell megoldása
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel) #6550000

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #47 55 -> 47 szekrényt és 55 asztalt kell gyártani.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
