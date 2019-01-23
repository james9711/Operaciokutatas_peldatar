#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 3.fejezet 13. feladat
#
# (4.14. feladat is ugyanez)
#
# Útszéli hamburgerező 
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz. 3 feltételem lesz, mert azokat később adom hozzá.
lpmodel<-make.lp(0,2)

#Alapesetben minimalizációra van beállítva, ezért átállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(800,1100))

#Feltételekben egységesen dkg-ot használok mértékegységként (kivéve a bucikat).
#Buci
add.constraint(lpmodel, c(1,1), type = "<=", 80)
#Csirkehús
add.constraint(lpmodel, c(10,0), type = "<=", 500)
#Marhahús
add.constraint(lpmodel, c(0,13), type = "<=", 400)
#Sajt
add.constraint(lpmodel, c(4,8), type = "<=", 200)
#Zöldség
add.constraint(lpmodel, c(10,8), type = "<=", 350)

#Alapesetben valósként kezeli a változókat. Ezt állítjuk át egészre.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #33500 -> Ennyi lesz a napi bevétele.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #24 13  -> 24 csirkehamburger és 13 marhahamburger adna el ekkor.

# Válaszok:
#     a) A c feladatrészt megoldva láthatjuk, hogy lehet 30000 Ft feletti a bevétel.
#     b) Az alapanyag korlátok mellett maximálisan 33500 Ft lehet a bevétel, így
#        a 40000 Ft-os határ nem érhető el.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************