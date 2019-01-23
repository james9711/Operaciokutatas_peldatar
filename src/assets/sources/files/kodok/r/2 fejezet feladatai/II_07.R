#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 7. feladat - Terítő készítés.
# 
#***********************************************************************************

library(lpSolveAPI)

#3 darab döntési változó van.
lpmodel<-make.lp(0,3)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(700,900,550))

#Adjuk meg a feltételeket.
#Varrás
add.constraint(lpmodel, c(72,56,40), type = "<=", 22*40*60)
#Mintázás
add.constraint(lpmodel, c(33,62,27), type = "<=", 13*40*60)
#Vasalás
add.constraint(lpmodel, c(30,32,21), type = "<=", 5*40*60)
#Anyag
add.constraint(lpmodel, c(350,150,100), type = "<=", 21000)
#Cérna
add.constraint(lpmodel, c(3,6,4), type = "<=", 350)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#63400 -> Ennyi lesz a haszna az üzemnek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 44 35 2 -> 1.terítőből 44 darabot, 2-ból 35 darabot, 3-ból 2 darabot kell készíteni.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************