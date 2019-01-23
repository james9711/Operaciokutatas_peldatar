#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 3. feladat - Plüss mackó.
# 
#***********************************************************************************

library(lpSolveAPI)

#3 darab döntési változó van.
lpmodel<-make.lp(0,3)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(300,450,500))

#Adjuk meg a feltételeket.
#Munkaóra
add.constraint(lpmodel, c(30,15,25), type = "<=", 35*60)
#Textília
add.constraint(lpmodel, c(0.5,0.9,0.6), type = "<=", 70)
#Pamut
add.constraint(lpmodel, c(100,200,350), type = "<=", 20000)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#40700 forint lesz a haszna a játékgyárnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
# 27 48 22 -> Ennyit gyártunk a macikból külön-külön.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************