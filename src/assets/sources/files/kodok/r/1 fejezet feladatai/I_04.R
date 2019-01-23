#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 04. feladat - Csokoládés, vaníliás sütemény.
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1,0.5))

#Feltételek
#Tojás
add.constraint(lpmodel, c(4,1), type = "<=", 30)
#Sütési idő
add.constraint(lpmodel, c(20,40), type = "<=", (8*60))

#A felépített modell megoldása
solve(lpmodel) 

#Célfüggvény értékének lekérése
get.objective(lpmodel) #9.857143 -> Ennyi lesz a bevétel Jones farmernek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) # 5.142857 9.428571 -> Ennyi csokis és vaníliás sütit kell csinálnia.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************