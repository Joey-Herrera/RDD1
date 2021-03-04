*Install necessary packages
ssc install cmogram
ssc install rdrobust

*Generate dui dummy variable 
gen dui = 0
replace dui = 1 if bac1 >= 0.08

*Question 5 - Replication of Panel 2 Table A
rdrobust male bac1, c(0.08) h(0.05) kernel("uniform")
rdrobust white bac1, c(0.08) h(0.05) kernel("uniform")
rdrobust aged bac1, c(0.08) h(0.05) kernel("uniform")
rdrobust acc bac1, c(0.08) h(0.05) kernel("uniform")

*Question 6 - Replication of Figure 2 Panel A-D 
*Disjointed panel for characteristics for quadratic models

cmogram male bac1, cut(0.08) scatter line(0.08) qfitci
cmogram white bac1, cut(0.08) scatter line(0.08) qfitci
cmogram aged bac1, cut(0.08) scatter line(0.08) qfitci
cmogram acc bac1, cut(0.08) scatter line(0.08) qfitci

rdplot male bac1, c(0.08) p(2)
rdplot white bac1, c(0.08) p(2)
rdplot aged bac1, c(0.08) p(2)
rdplot acc bac1, c(0.08) p(2)

*Disjointed panel for linear model
cmogram male bac1, cut(0.08) scatter line(0.08) lfitci
cmogram white bac1, cut(0.08) scatter line(0.08) lfitci
cmogram aged bac1, cut(0.08) scatter line(0.08) lfitci
cmogram acc bac1, cut(0.08) scatter line(0.08) lfitci

rdplot male bac1, c(0.08) p(1)
rdplot white bac1, c(0.08) p(1)
rdplot aged bac1, c(0.08) p(1)
rdplot acc bac1, c(0.08) p(1)

*Question 7 - Replicate Table 3 Column A and Column B
*Generate interaction variables
gen bac1sq = (bac1)^2
gen lininteract = bac1*dui
gen quadinteract = (bac1)^2*dui

*Column 1 Panel A
rdrobust recidivism bac1, c(0.08) covs(male white acc lininteract aged dui) h(0.05) kernel("uniform")

*Column 1 Panel B
rdrobust recidivism bac1, c(0.08) covs(male white acc lininteract aged dui) h(0.025) kernel("uniform")

*Column 2 Panel A
rdrobust recidivism bac1 lininteract, c(0.08) covs(male white acc lininteract aged dui) h(0.05) kernel("uniform")

*Column 2 Panel B
rdrobust recidivism bac1 lininteract, c(0.08) covs(male white acc lininteract aged dui) h(0.025) kernel("uniform")

*Column 3 Panel A
rdrobust recidivism bac1 lininteract quadinteract, c(0.08) covs(male white acc lininteract aged dui) h(0.05) kernel("uniform")

*Column 3 Panel B
rdrobust recidivism bac1 lininteract quadinteract, c(0.08) covs(male white acc lininteract aged dui) h(0.025) kernel("uniform")

*Question 8 - Replicate Figure 3 Panel A with linear and quadratic fits
cmogram recidivism bac1, cut(0.08) scatter line(0.08) qfitci
cmogram recidivism bac1, cut(0.08) scatter line(0.08) lfitci

rdplot recidivism bac1 if bac1<0.15, c(0.08) p(2)
rdplot recidivism bac1 if bac1<0.15, c(0.08) p(1)
