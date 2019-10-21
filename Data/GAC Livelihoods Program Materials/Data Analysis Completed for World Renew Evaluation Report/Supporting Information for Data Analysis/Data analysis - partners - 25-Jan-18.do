clear
set more off
/*
*******************************************************************************************
*******************************************************************************************
**     DATE:       January 2018
**     PROGRAM:    Data for inclusion with trend analysis -- combine the 5 country datasets, order variables
**     AUTHOR:     Douglas R Brown
********************************************************************************************
********************************************************************************************
*/

cd "C:\data\WorldRenewData\"

use "Outfiles\FinalData-Combined.dta" ,clear

* Generate frequency distribution for each FS indicator for each partner
tab FoodFrequencyScore
tab FoodFrequencyScore partner_n
tab FoodDiversityScore
tab FoodDiversityScore partner_n
tab NumHungryMonths
tab NumHungryMonths partner_n
tab NumCopingStrategiesUsed
tab NumCopingStrategiesUsed partner_n

sum FoodFrequencyScore FoodDiversityScore NumHungryMonths NumCopingStrategiesUsed
forval num = 1/12 {
sum FoodFrequencyScore FoodDiversityScore NumHungryMonths NumCopingStrategiesUsed if partner_n==`num'
}

* generate frequencies and means for CA practices for each partner
tab CA_Principle_1
tab CA_Principle_1 partner_n
tab CA_Principle_2
tab CA_Principle_2 partner_n
tab CA_Principle_3
tab CA_Principle_3 partner_n
tab CA_num_practices 
tab CA_num_practices partner_n
tab CA_practitioner 
tab CA_practitioner partner_n
tab CA_full_practitioner
tab CA_full_practitioner partner_n

sum CA_Principle_1 CA_Principle_2 CA_Principle_3 CA_num_practices CA_practitioner CA_full_practitioner
forval num = 1/12 {
sum CA_Principle_1 CA_Principle_2 CA_Principle_3 CA_num_practices CA_practitioner ///
CA_full_practitioner if partner_n==`num'
}

