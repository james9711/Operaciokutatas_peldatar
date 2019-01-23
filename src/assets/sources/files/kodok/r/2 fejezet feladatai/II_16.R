#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# II. Szimplex feladatok
#
# 16. feladat - Vonattal szállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó van.
lpmodel<-make.lp(0,12)

#Állítsuk be a modellt maximalizációra.
lp.control(lpmodel,sense='max')

#Állítsuk be a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(2000,2500,3200,2800,2000,2500,3200,2800,2000,2500,3200,2800))

#Adjuk meg a feltételeket.

#Vagonok súlyfeltételei
#1. vagonba mennyi árú kerülhet
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 17)
#2. vagonba mennyi árú kerülhet
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 11)
#3. vagonba mennyi árú kerülhet
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 12)

#Vagonok mennyiség feltételei
add.constraint(lpmodel, c(400,600,700,550,0,0,0,0,0,0,0,0), type = "<=", 4000)
add.constraint(lpmodel, c(0,0,0,0,400,600,700,550,0,0,0,0), type = "<=", 7000)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,400,600,700,550), type = "<=", 8000)

#Az egyes szállítmányokból mennyi áll rendelkezésre
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0), type = "<=", 13)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0), type = "<=", 20)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0), type = "<=", 8)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1), type = "<=", 19)

#Álltsuk be a változókat egész típusúra
set.type(lpmodel,1:12,"integer")

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#87600 -> 87600$ profitja lesz a cégnek a szállításból.

#A megoldást adó változók értékének lekérése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("1.vagon","2.vagon","3.vagon"),c("1.szállítmány","2.szállítmány","3.szállítmány","4.szállítmány"))

solution
#        1.szállítmány 2.szállítmány 3.szállítmány 4.szállítmány
#1.vagon            10             0             0             0
#2.vagon             0             0             6             5
#3.vagon             0             0             2            10

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************