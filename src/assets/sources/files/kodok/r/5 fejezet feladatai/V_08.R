#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 8. feladat
#
# Árpatermesztés.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó lesz
lpmodel<-make.lp(0,16)

#Beállítjuk maximalizációra.
lp.control(lpmodel,sense='max')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(7,11,9,6,6,13,10,5,5,12,8,4,7,10,8,3))

#Megadom a feltételeket.
#Egy ember csak egy céghez mehet ki
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "=", 1)
#Minden céghez csak egy ember menjen ki karbantartásra
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#35 -> Ennyi tonna rozsot fog tudni learatni a gazda.

solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("1.föld","2.föld","3.föld","4.föld"),c("1.hét","2.hét","3.hét","4.hét"))

solution 
#       1.hét 2.hét 3.hét 4.hét
#1.föld     0     0     0     1
#2.föld     0     0     1     0
#3.föld     0     1     0     0
#4.föld     1     0     0     0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************