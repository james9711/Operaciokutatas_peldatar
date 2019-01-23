#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 2. feladat
#
# Befektetés.
# 
#***********************************************************************************

library(lpSolveAPI)

#18 darab döntési változó van.
lpmodel<-make.lp(0,18)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(0.12,0.10,0.15,0.13,0.16,0.14,0.081,0.076,0.073,0.078,0.074,0.08,0.057,0.061,0.049,0.054,0.045,0.053))

#Adjuk meg a feltételeket.
#Részvény
add.constraint(lpmodel, c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0), type = "<=", 7)
#Kötvény
add.constraint(lpmodel, c(0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0), type = "<=", 5)
#Betét
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1), type = "<=", 3)

#Társaságok
add.constraint(lpmodel, c(1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0), type = ">=", 4)
add.constraint(lpmodel, c(0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0), type = ">=", 3)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0), type = ">=", 2)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0), type = ">=", 2)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0), type = ">=", 2)
add.constraint(lpmodel, c(0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1), type = ">=", 2)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#1.615 lesz a várható hozama az összes befektetésünknek.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("Részvény","Kötvény","Betét"),c("Társaság 1","Társaság 2","Társaság 3","Társaság 4","Társaság 5","Társaság 6"))

solution # A táblázat milliós értékek vannak.
#          Társaság 1 Társaság 2 Társaság 3 Társaság 4 Társaság 5 Társaság 6
#Részvény          0          0          2          1          2          2
#Kötvény           4          0          0          1          0          0
#Betét             0          3          0          0          0          0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
