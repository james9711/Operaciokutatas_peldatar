#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 17. feladat - Húsvéti tojásfestés.
# 
#***********************************************************************************

library(lpSolveAPI)

#3 darab döntési változó van.
lpmodel<-make.lp(0,3)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,1,1))

#Adjuk meg a feltételeket.
#Tojásfesték
#Fehér
add.constraint(lpmodel, c(20,15,25), type = "<=", 500)
#Piros
add.constraint(lpmodel, c(50,5,25), type = "<=", 700)
#Kék
add.constraint(lpmodel, c(0,40,25), type = "<=", 350)

#Idő
add.constraint(lpmodel, c(18,20,15), type = "<=", 330)

#Minimum 3 legyen mindegyikből
set.bounds(lpmodel,lower = c(3,3,3))

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:3,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#19 -> ENnyi mintázott tojást tud elkészíteni.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
#10 3 6 -> Az egyes mintafajtájú tojásokból hányat készít.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************