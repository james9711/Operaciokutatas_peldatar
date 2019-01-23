#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 5. fejezet 6. feladat
#
# IT karbantartás.
# 
#***********************************************************************************

library(lpSolveAPI)

#20 darab döntési változó lesz
lpmodel<-make.lp(0,20)

#Beállítjuk minimalizációra.
lp.control(lpmodel,sense='min')

#Beállítom a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(7,5,11,12,9,4,9,9,10,7,12,11,6,5,8,6,7,8,11,10))

#Megadom a feltételeket.
#Egy ember csak egy céghez mehet ki
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 1)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 1)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 1)
#Minden céghez csak egy ember menjen ki karbantartásra
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0), type = "=", 1)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1), type = "=", 1)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#27 -> Ennyi idő kell összesen a karbantartási feladatok elvégzéséhez.

solution <- matrix(get.variables(lpmodel),nrow = 5,byrow = TRUE)
dimnames(solution)<-list(c("Sándor","Bence","István","Lajos","László"),c("1.cég","2.cég","3.cég","4.cég"))

solution 
#       1.cég 2.cég 3.cég 4.cég
#Sándor     0     1     0     0
#Bence      0     0     1     0
#István     0     0     0     0
#Lajos      0     0     0     1
#László     1     0     0     0

#István lesz az, aki egyetlen céghez sem megy ki.

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************