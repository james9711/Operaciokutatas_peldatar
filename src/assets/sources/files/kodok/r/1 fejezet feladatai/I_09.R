#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# I. Grafikusan megoldható feladatok
#
# 09. feladat - Palancsinta, gofri 
#
#***********************************************************************************

library(lpSolveAPI)

#A célfüggvényemben 2 változó lesz.
lpmodel<-make.lp(0,2)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Beállítjuk a célfüggvény változók együtthatóit. 
set.objfn(lpmodel,c(50,40))

#Feltételek
#Tej
add.constraint(lpmodel, c(13,6.5), type = "<=", 845)
#Liszt
add.constraint(lpmodel, c(10,8), type = "<=", 800)

#Hogy egész értékű megoldást kapjunk.
set.type(lpmodel,1,c("integer"))
set.type(lpmodel,2,c("integer"))

solve(lpmodel) 

#Optimális megoldás
get.objective(lpmodel) #4000 -> Ennyi lesz a haszna Juli néninek.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel) #0 100  -> 0 gofrit és 100 palacsintát kell csinálnia.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************