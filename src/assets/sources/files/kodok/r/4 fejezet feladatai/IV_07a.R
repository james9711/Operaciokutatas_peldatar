#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 7.a feladat 
#
# Bicikliszállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#16 darab döntési változó van.
lpmodel<-make.lp(0,24)

#Állítsuk be maximalizációra a modellünket.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(7,9,12,10,10,9,8,11,10,13,11,9,12,11,11,9,10,7,10,8,9,11,11,10))

#Adjuk meg a feltételeket.
#Mennyiségi feltételek
add.constraint(lpmodel, c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 32)
add.constraint(lpmodel, c(0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 46)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0), type = "<=", 18)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1), type = "<=", 24)

#Boltok igényei
add.constraint(lpmodel, c(1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0), type = ">=", 13)
add.constraint(lpmodel, c(0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0), type = ">=", 19)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0), type = ">=", 25)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0), type = ">=", 21)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0), type = ">=", 16)
add.constraint(lpmodel, c(0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1), type = ">=", 26)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#Célfüggvény értéke: 1074

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 4,byrow = TRUE)
dimnames(solution)<-list(c("Gy1","Gy2","Gy3","Gy4"),c("B1","B2","B3","B4","B5","B6"))

solution 
#    B1 B2 B3 B4 B5 B6
#Gy1  0  0  0 21 11  0
#Gy2 13  0 20  0  5  8
#Gy3  0  0  0  0  0 18
#Gy4  0 19  5  0  0  0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
