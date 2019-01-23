#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 3. feladat
#
# Konzervszállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#15 darab döntési változó van.
lpmodel<-make.lp(0,15)

#Állítsuk be minimalizációra a modellt.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(1.2,1.3,1.5,1.1,1.7,1.7,2.1,1.8,1.3,1.4,1.6,1.6,1.7,1.8,1.8))

#Adjuk meg a feltételeket.
#Gyárak által gyártott mennyiség
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "<=", 500)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "<=", 540)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "<=", 360)

#Áruházak igényei
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = ">=", 300)  #Tesco
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = ">=", 400)  #Auchan
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = ">=", 350)  #Spar
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = ">=", 250)  #Coop
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = ">=", 100)  #CBA

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#2019 euróba fog kerülni nekünk a kiszállítás.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("GY1","GY2","GY3"),c("Tesco","Auchan","Spar","Coop","CBA"))

solution
#    Tesco Auchan Spar Coop CBA
#GY1   300    200    0    0   0
#GY2     0      0  190  250 100
#GY3     0    200  160    0   0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************