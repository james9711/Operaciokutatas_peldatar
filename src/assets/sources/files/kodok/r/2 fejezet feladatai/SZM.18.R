#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 2. fejezet 18. feladat
#
# Wcpapír és írólapgyár.
# 
#***********************************************************************************

library(lpSolveAPI)

#2 darab döntési változó van.
lpmodel<-make.lp(0,2)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(400,300))

#Adjuk meg a feltételeket.
#Fanyersanyag
add.constraint(lpmodel, c(1.2,0.1), type = "<=", 50)
#Fahulladék
add.constraint(lpmodel, c(-0.2,0.5), type = "<=", 15)
#Munkaidő
add.constraint(lpmodel, c(45,30), type = "<=", 20*60)
#3-szor annyi wcpapír
add.constraint(lpmodel, c(3,-1), type = "=", 0)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:2,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#10400 -> 10400 forint lesz a haszna a gyárnak.

#A megoldást adó változók értékének lekérése
get.variables(lpmodel)
#8 24 -> 8kg írólapot és 24 csomag wcpapírt állít elő a gyár.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************