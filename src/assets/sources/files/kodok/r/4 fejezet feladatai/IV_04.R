#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 4. feladat
#
# Földárverés.
# 
#***********************************************************************************

library(lpSolveAPI)

#15 darab döntési változó van.
lpmodel<-make.lp(0,15)

#Állítsuk be maximalizációra a modellt.
lp.control(lpmodel,sense='max')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(102,120,130,105,137,125,114,131,121,108,123,113,106,129,121))

#Adjuk meg a feltételeket.
#A földterületek feltételei
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "<=", 100)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "<=", 100)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "<=", 80)
#A licitálok földszerzési feltétele
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = "<=", 60)
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = "<=", 60)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = "<=", 60)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = "<=", 60)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = "<=", 60)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#36080 -> 36080000 lesz a bevétele az önkormányzatnak.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("I","II","III"),c("István","Béla","Pál","Attila","Imre"))

solution
#    István Béla Pál Attila Imre
#I        0   40   0      0   60
#II      40    0  60      0    0
#III     20    0   0     60    0

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
