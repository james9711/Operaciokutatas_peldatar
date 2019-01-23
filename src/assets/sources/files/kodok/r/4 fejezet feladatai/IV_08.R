#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 8. feladat
#
# Napló
# 
#***********************************************************************************

library(lpSolveAPI)

#12 darab döntési változó van.
lpmodel<-make.lp(0,12)

#Állítsuk be maximalizációra a modellünket.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.
set.objfn(lpmodel,c(2,4,2,1,3,3,5,2,4,4,1,3))

#Adjuk meg a feltételeket.
#Nyomdák
add.constraint(lpmodel, c(1,1,1,1,0,0,0,0,0,0,0,0), type = "<=", 250)
add.constraint(lpmodel, c(0,0,0,0,1,1,1,1,0,0,0,0), type = "<=", 150)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,1,1,1,1), type = "<=", 190)

#Újságosok igényei
add.constraint(lpmodel, c(1,0,0,0,1,0,0,0,1,0,0,0), type = ">=", 150)
add.constraint(lpmodel, c(0,1,0,0,0,1,0,0,0,1,0,0), type = ">=", 195)
add.constraint(lpmodel, c(0,0,1,0,0,0,1,0,0,0,1,0), type = ">=", 120)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,1,0,0,0,1), type = ">=", 125)

#b. rész megoldásához plusz 2 feltétel
#add.constraint(lpmodel, c(0,0,0,0,0,0,0,1,0,0,0,0), type = "=", 0)
#add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,0), type = "=", 0)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel)
#1.615 lesz a várható hozama az összes befektetésünknek.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("NY1","NY2","NY3"),c("Újságos1","Újságos2","Újságos3","Újságos4"))

solution
#a. esetén a megoldás
#    Újságos1 Újságos2 Újságos3 Újságos4
#NY1      150        0        0      100
#NY2        0      150        0        0
#NY3        0       45      120       25

#b. esetén a megoldás
#    Újságos1 Újságos2 Újságos3 Újságos4
#NY1      130        0      120        0
#NY2        0      150        0        0
#NY3       20       45        0      125

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
