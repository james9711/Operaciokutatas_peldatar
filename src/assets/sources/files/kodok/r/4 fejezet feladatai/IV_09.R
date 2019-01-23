#***********************************************************************************
# Operációkutatás szoftveres példatár
#
# 4. fejezet 9. feladat
#
# Betonszállítás.
# 
#***********************************************************************************

library(lpSolveAPI)

#15 darab döntési változó van.
lpmodel<-make.lp(0,15)

#Állítsuk be minimalizációra a modellünket.
lp.control(lpmodel,sense='min')

#Konfiguráljuk a célfüggvény változók együtthatóit.(Ide nem a hossz értékei kerülnek, hanem a költségek)
set.objfn(lpmodel,c(3500,4800,2000,7200,4800,3500,7200,4800,3500,4800,7200,2000,7200,4800,4800))

#Adjuk meg a feltételeket (a jobb oldali érték mindig a szükséges betonkeverők számát mutatja)
#Bázisban lévő betonok feltétele 
#(1040 tonna, amit egy 20 tonnás betonkeverő 52 fordulásból tud elvinni)
add.constraint(lpmodel, c(1,1,1,1,1,0,0,0,0,0,0,0,0,0,0), type = "<=", 52)
add.constraint(lpmodel, c(0,0,0,0,0,1,1,1,1,1,0,0,0,0,0), type = "<=", 43)
add.constraint(lpmodel, c(0,0,0,0,0,0,0,0,0,0,1,1,1,1,1), type = "<=", 44)

#Építkezési helyek igényei (hány betonkeverő tudja kielégíteni az igényeket)
add.constraint(lpmodel, c(1,0,0,0,0,1,0,0,0,0,1,0,0,0,0), type = ">=", 36)
add.constraint(lpmodel, c(0,1,0,0,0,0,1,0,0,0,0,1,0,0,0), type = ">=", 17)
add.constraint(lpmodel, c(0,0,1,0,0,0,0,1,0,0,0,0,1,0,0), type = ">=", 23)
add.constraint(lpmodel, c(0,0,0,1,0,0,0,0,1,0,0,0,0,1,0), type = ">=", 25)
add.constraint(lpmodel, c(0,0,0,0,1,0,0,0,0,1,0,0,0,0,1), type = ">=", 33)

#A felépített modell megoldása.
solve(lpmodel)

#Célfüggvény értékének lekérése
get.objective(lpmodel) # 451900 forintba fog kerülni a szállítás.

#Az optimális megoldást adó változók értékének megjelenítése
solution <- matrix(get.variables(lpmodel),nrow = 3,byrow = TRUE)
dimnames(solution)<-list(c("Bázis1","Bázis2","Bázis3"),c("HÉ1","HÉ2","HÉ3","HÉ4","HÉ5"))

solution 
#       HÉ1 HÉ2 HÉ3 HÉ4 HÉ5
#Bázis1  18   0  23   0  11
#Bázis2  18   0   0  25   0
#Bázis3   0  17   0   0  22

#*******************************************************************************
# Debreceni Egyetem, Informatikai Kar 					                        2016
#*******************************************************************************
