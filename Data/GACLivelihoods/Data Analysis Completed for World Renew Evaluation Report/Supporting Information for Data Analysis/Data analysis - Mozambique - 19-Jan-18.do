clear
set more off
/*
*******************************************************************************************
*******************************************************************************************
**     DATE:       January 2018
**     PROGRAM:    Analysis of Mozambique data
**     AUTHOR:     Douglas R Brown
********************************************************************************************
********************************************************************************************
*/

cd "C:\data\WorldRenewData\"

use "Outfiles\Labelled and cleaned-Mozambique.dta", clear

** Create identifier variables (for eventual use when data is combined)
* move key identifier and demographic variables to front of data
order respondent_num partner_n gender_n age_nr town district program_vsl ///
program_community_leadership program_agriculture 

* Create identifier for country and partner
gen country=4
label var country "Country"
label define country 1 "Bangladesh" 2 "Honduras" 3 "Mali" 4 "Mozambique" 5 "Tanzania"
label values country country
gen unique_id=country*100000+partner_n*1000+respondent_num
label var unique_id "Respondent ID"
order unique_id country respondent_num partner_n gender_n age_nr town district program_vsl ///
program_community_leadership program_agriculture 

* profile of respondents
sum gender_n age_nr program_vsl program_community_leadership program_agriculture 

tab partner_n
tab gender_n
tab age_nr
tab age_nr gender_n
bysort gender_n: tab age_nr

/* not needed for Bangladesh
* respondents from Kurmari only had the Community Leadership and Agriculture programs
* data therefore has missing values for Literacy and VSL when added to the ODES-AEDM data
* recode "missing" to "no" for those repondents
recode program_vsl program_literacy (. = 0)
*/

foreach var of varlist program_vsl program_community_leadership ///
   program_agriculture  {
tab `var'
tab `var' gender_n
bysort gender_n: tab `var'
}
foreach var of varlist program_vsl program_community_leadership ///
   program_agriculture  {
tab `var'
tab `var' age_nr
bysort age_nr: tab `var'
}
* Number of program activities engaged in by respondents
generate ActivityCount = program_vsl + program_community_leadership + program_agriculture 
tab ActivityCount
tab ActivityCount gender_n
tab ActivityCount age_nr

* A1: Food frequency
* baseline asked whether you (the respondent) or anyone had something to eat in 
* each of the time slots
sum a1_a_n- a1_g_n
label list who_ate_lbl
/*
who_ate_lbl:
           1 no_one
           2 yes_everyone
           3 yes_others
           4 yes_you
*/
tab1 a1_a_n- a1_g_n, missing
* for the Endline, this would correspond to an answer of either 2, 3 or 4 for 
* each eating time period
gen FoodFrequencyScore=0
gen p1=0
replace p1=1 if a1_a_n>=2 & a1_a_n<=4
gen p2=0
replace p2=1 if a1_b_n>=2 & a1_b_n<=4
gen p3=0
replace p3=1 if a1_c_n>=2 & a1_c_n<=4
gen p4=0
replace p4=1 if a1_d_n>=2 & a1_d_n<=4
gen p5=0
replace p5=1 if a1_e_n>=2 & a1_e_n<=4
gen p6=0
replace p6=1 if a1_f_n>=2 & a1_f_n<=4
gen p7=0
replace p7=1 if a1_g_n>=2 & a1_g_n<=4
* This value is comparable to the baseline calculation
replace FoodFrequencyScore=p1+p2+p3+p4+p5+p6+p7
sum FoodFrequencyScore
* generate data for table
tab FoodFrequencyScore
tab FoodFrequencyScore gender_n
bysort gender_n: tab FoodFrequencyScore
* test for significant difference in score between gender of respondents
oneway FoodFrequencyScore gender_n, tabulate

drop p1-p7

* A2: Food diversity
* same situation for the baseline
sum a2_a_n- a2_k_n
tab1 a2_a_n- a2_k_n, missing
gen FoodDiversityScore=0
gen p1=0
replace p1=1 if a2_a_n>=2 & a2_a_n<=4
gen p2=0
replace p2=1 if a2_b_n>=2 & a2_b_n<=4
gen p3=0
replace p3=1 if a2_c_n>=2 & a2_c_n<=4
gen p4=0
replace p4=1 if a2_d_n>=2 & a2_d_n<=4
gen p5=0
replace p5=1 if a2_e_n>=2 & a2_e_n<=4
gen p6=0
replace p6=1 if a2_f_n>=2 & a2_f_n<=4
gen p7=0
replace p7=1 if a2_g_n>=2 & a2_g_n<=4
gen p8=0
replace p8=1 if a2_h_n>=2 & a2_h_n<=4
gen p9=0
replace p9=1 if a2_i_n>=2 & a2_i_n<=4
gen p10=0
replace p10=1 if a2_j_n>=2 & a2_j_n<=4
gen p11=0
replace p11=1 if a2_k_n>=2 & a2_k_n<=4
replace FoodDiversityScore=p1+p2+p3+p4+p5+p6+p7+p8+p9+p10+p11
sum FoodDiversityScore
* generate data for table
tab FoodDiversityScore
tab FoodDiversityScore gender_n
bysort gender_n: tab FoodDiversityScore
* test for significant difference in score between gender of respondents
oneway FoodDiversityScore gender_n, tabulate

drop p1-p11

* A3: Number of hungry months
* Values for each of the 12 months:
sum a3_???_n
gen NumMonthsWithEnough= a3_jan_n+ a3_feb_n+ a3_mar_n+ a3_apr_n+ a3_may_n+ a3_jun_n+ ///
   a3_jul_n+ a3_aug_n+ a3_sep_n+ a3_oct_n+ a3_nov_n+ a3_dec_n
gen NumHungryMonths=12-NumMonthsWithEnough
* generate data for table
sum NumHungryMonths
tab NumHungryMonths
tab NumHungryMonths gender_n
bysort gender_n: tab NumHungryMonths
* test for significant difference in score between gender of respondents
oneway NumHungryMonths gender_n, tabulate

* added the following since there seemed to be an anomaly where one partner was very different
tab NumHungryMonths partner_n

* A4: Number of coping strategies used
* NB the Mozambique data has 3 additional options that are not in the standard
* coping strategy questions -- identified here as "m", "n", and "o"
* the "other" category is the same as before (in this case "p")

*** first do the standard analysis for comparison purposes with other data
* values for each of them
sum a4_a_n- a4_p_n
* assume that missing values mean that it was not used (a4_p_n)
recode a4_p_n (. = 0)
gen NumCopingStrategiesUsed = a4_a_n+ a4_b_n + a4_c_n+ a4_d_n+ a4_e_n+ a4_f_n+ ///
a4_g_n+ a4_h_n+ a4_i_n+ a4_j_n+ a4_k_n+ a4_l_n+ a4_p_n
* generate data for table
sum NumCopingStrategiesUsed
tab NumCopingStrategiesUsed
tab NumCopingStrategiesUsed gender_n
* test for significant difference in score between gender of respondents
oneway NumCopingStrategiesUsed gender_n, tabulate

*** second - do the analysis with the 3 additional coping strageies
gen NumCopingStrategiesUsed2 = a4_a_n+ a4_b_n + a4_c_n+ a4_d_n+ a4_e_n+ a4_f_n+ ///
a4_g_n+ a4_h_n+ a4_i_n+ a4_j_n+ a4_k_n+ a4_l_n+ a4_m_n +a4_n_n +a4_o_n +a4_p_n
* generate data for table
sum NumCopingStrategiesUsed2
tab NumCopingStrategiesUsed2
tab NumCopingStrategiesUsed2 gender_n
* test for significant difference in score between gender of respondents
oneway NumCopingStrategiesUsed2 gender_n, tabulate

* B1: Income sources (livelihood activities) prior to program participation
sum b1*
gen NumIncomeSourceBefore = b1_farming_rain + b1_other_business + b1_outside_money ///
+ b1_processing+  b1_livestock_products+ b1_livestock_animals + b1_fishing ///
+  b1_day_labour+ b1_farming_irrigation+ b1_income_other
sum NumIncomeSourceBefore 
tab NumIncomeSourceBefore 
tab NumIncomeSourceBefore gender_n
oneway NumIncomeSourceBefore gender_n, tabulate

* B2: Income sources (livelihood activities) now -- as a result of program participation
sum b2*
gen NumIncomeSourceNow = b2_farming_rain + b2_other_business + b2_outside_money ///
+ b2_processing+  b2_livestock_products+ b2_livestock_animals + b2_fishing ///
+  b2_day_labour+ b2_farming_irrigation+ b2_income_other
sum NumIncomeSourceNow 
tab NumIncomeSourceNow 
tab NumIncomeSourceNow gender_n
oneway NumIncomeSourceNow gender_n, tabulate

* Change in number of income sources (diversification)
generate ChangeInNumSources = NumIncomeSourceNow - NumIncomeSourceBefore
sum ChangeInNumSources 
tab ChangeInNumSources 
tab ChangeInNumSources gender_n
oneway ChangeInNumSources gender_n, tabulate
ttest NumIncomeSourceNow == NumIncomeSourceBefore
ttest NumIncomeSourceNow == NumIncomeSourceBefore if gender_n==0
ttest NumIncomeSourceNow == NumIncomeSourceBefore if gender_n==1

* B3: Change in income from partipation - PMF 200-2
* has income increased
sum b3_n b3_1_n
tab1 b3_n b3_1_n, missing
tab b3_n gender_n
bysort gender_n: tab b3_n
oneway b3_n gender_n, tabulate
* for those whose income has increased, has it been significant?
tab b3_1_n gender_n
bysort gender_n: tab b3_1_n
oneway b3_1_n gender_n, tabulate

* B4: Asset ownership
sum b4_1_own b4_3_own b4_4_own b4_5_own
tab1 b4_1_own b4_3_own b4_4_own b4_5_own, missing
tab1 b4_1_own b4_3_own b4_4_own b4_5_own
* UO2.1 own a house
tab b4_1_own
tab b4_1_own gender_n
oneway b4_1_own gender_n, tabulate
* UO2.1 own farm tools/equip
tab b4_3_own 
tab b4_3_own gender_n
oneway b4_3_own gender_n, tabulate
* UO2.3 own a mobile phone
tab b4_4_own
tab b4_4_own gender_n
oneway b4_4_own gender_n, tabulate
* UO2.4 own a bicycle
tab b4_5_own
tab b4_5_own gender_n
oneway b4_5_own gender_n, tabulate

* B5: Business plan/marketing strategy for IGAs -PMF 210-1
tab b5_nr
tab b5_nr, missing
label list plan_lbl
/*
plan_lbl:
           0 no_plan
           1 yes_unwritten
           2 yes_paper_plan
*/
recode b5_nr (0 = 0 no_plan) (1 2 = 100 has_plan), generate (HasBusinessPlan)
* recode to 100 results in means as % rather than a fraction of 1
sum HasBusinessPlan
tab HasBusinessPlan
tab HasBusinessPlan gender_n
bysort gender_n: tab HasBusinessPlan
oneway HasBusinessPlan gender_n, tabulate

* B8: Confidence in management ability - PMF 210-2
tab b8_n
sum b8_n
label list confidence_lbl
/*
confidence_lbl:
           1 not_at_all
           2 somewhat
           3 very
*/
recode b8_n (1 = 0 not_confident) (2 3 = 100 confident), generate(HasConfidence)
* recode to 100 results in means as % rather than a fraction of 1
sum HasConfidence
tab HasConfidence
tab HasConfidence gender_n
bysort gender_n: tab HasConfidence
oneway HasConfidence gender_n, tabulate

* Section C: Sustainable agriculture
* C1: Sustainable agriculture practices - PMF 100-1
describe  c1_min_till- c1_no_burn, fullname
sum  c1_min_till- c1_no_burn
sum  c1_min_till- c1_no_burn if gender_n==0
sum  c1_min_till- c1_no_burn if gender_n==1
tab1 c1_min_till- c1_no_burn

* This variable has zeros for all respondents except those who responded to this section
* N = XXX out of the total sample
gen PracticeSustAgr_all=(c1_min_till==1 | c1_soil_cover==1 | c1_crop_rotation==1 | ///
c1_intercrop==1 | c1_compost==1 | c1_bio_pest==1 | c1_manure_tea==1 | ///
c1_seed_space==1 | c1_no_burn==1)
sum PracticeSustAgr_all
tab PracticeSustAgr_all
tab PracticeSustAgr_all gender_n
oneway PracticeSustAgr_all gender_n, tabulate
* Agriculture program participants who practice sustainable agriculture
gen PracticeSustAgr_agr=.
replace PracticeSustAgr_agr=0 if program_agriculture==1
replace PracticeSustAgr_agr=1 if  (c1_min_till==1 | c1_soil_cover==1 | c1_crop_rotation==1 | ///
c1_intercrop==1 | c1_compost==1 | c1_bio_pest==1 | c1_manure_tea==1 | ///
c1_seed_space==1 | c1_no_burn==1)
sum PracticeSustAgr_agr
tab PracticeSustAgr_agr
tab PracticeSustAgr_agr gender_n
oneway PracticeSustAgr_agr gender_n, tabulate

* CA: Conservation Agriculture
sum c1_min_till c1_soil_cover c1_intercrop c1_crop_rotation
tab1 c1_min_till c1_soil_cover c1_intercrop c1_crop_rotation
* Combine measures so that there is one for each of the 3 principles
generate CA_Principle_1 = c1_min_till
generate CA_Principle_2 = c1_soil_cover
generate CA_Principle_3 = c1_intercrop
replace CA_Principle_3 = 1 if c1_crop_rotation==1
sum CA_Principle_1 CA_Principle_2 CA_Principle_3
tab CA_Principle_1 gender_n
oneway CA_Principle_1 gender_n, tabulate
tab CA_Principle_2 gender_n
oneway CA_Principle_2 gender_n, tabulate
tab CA_Principle_3 gender_n
oneway CA_Principle_3 gender_n, tabulate
* Measure of how many principles a respondent has adopted
generate CA_num_practices = CA_Principle_1 + CA_Principle_2 + CA_Principle_3
sum CA_num_practices
tab CA_num_practices
tab CA_num_practices gender_n
oneway CA_num_practices gender_n, tabulate
* Partial CA adoption (adopting 2 or more of the 3 principles)
generate CA_practitioner = .
replace CA_practitioner = 0 if CA_num_practices==0 | CA_num_practices==1
replace CA_practitioner = 1 if CA_num_practices==2 | CA_num_practices==3
sum CA_practitioner
tab CA_practitioner
tab CA_practitioner gender_n
oneway CA_practitioner gender_n, tabulate
* Complete CA adoption (adopting all 3 principles)
generate CA_full_practitioner = .
replace CA_full_practitioner = 0 if CA_num_practices==0 | CA_num_practices==1 | CA_num_practices==2
replace CA_full_practitioner = 1 if CA_num_practices==3
sum CA_full_practitioner
tab CA_full_practitioner
tab CA_full_practitioner gender_n
oneway CA_full_practitioner gender_n, tabulate

* C2: Benefits of Sust Agr practices - PMF 110
describe c2_yield- c2_afford_pesticides, fullname
sum c2_yield- c2_afford_pesticides 
sum c2_yield- c2_afford_pesticides if gender_n==0
sum c2_yield- c2_afford_pesticides if gender_n==1
tab c2_other
tab c2_yield, missing
tab c2_yield
generate IncreasedYieldFromSustAgr = c2_yield
sum IncreasedYieldFromSustAgr
tab IncreasedYieldFromSustAgr
tab IncreasedYieldFromSustAgr gender_n
oneway IncreasedYieldFromSustAgr gender_n, tabulate

* C4: Growing improved varieties - PMF 120-2
* growing disease resistant crops
tab c4_n, missing
tab c4_n
sum c4_n
generate GrowDiseaseResist = c4_n
sum GrowDiseaseResist
tab GrowDiseaseResist
tab GrowDiseaseResist gender_n
oneway GrowDiseaseResist gender_n, tabulate

* C7: Crop storage practices - PMF 116-2
* using improved storage (either PICS or metal silo)
tab1 c7_trad_bags_use c7_trad_silo_use c7_PICS_bags_use c7_improved_silo_use , missing
tab1 c7_trad_bags_use c7_trad_silo_use c7_PICS_bags_use c7_improved_silo_use 
sum c7_trad_bags_use c7_trad_silo_use c7_PICS_bags_use c7_improved_silo_use 
* this was a multiple response question -- people could have more than one type of storage.
* Of the people who responded to the question those who used  some form of improved storage
* were counted as 1 and the rest as 0. However, there were two combinations that were relevant.

* for Bangaldesh, since PICS was not used, we drop this for the following 2 definitions

* the following counts "improved" as either (3) PICS bags or a (4) metal/improved silo
gen UseImprovedStorage_3_4=.
* set to an initial value to zero for all respondents who answered at least one of the storage questions
replace UseImprovedStorage_3_4=0 if c7_trad_bags_use~=. | c7_trad_silo_use~=. |  ///
   c7_PICS_bags_use~=. | c7_improved_silo_use~=. 
replace UseImprovedStorage_3_4=1 if c7_PICS_bags_use==1 | c7_improved_silo_use==1
sum UseImprovedStorage_3_4
tab UseImprovedStorage_3_4
tab UseImprovedStorage_3_4 gender_n
oneway UseImprovedStorage_3_4 gender_n, tabulate

* the following counts "improved" as either (2) traditional silo, (3) PICS bags or a (4) metal/improved silo
gen UseImprovedStorage_2_3_4=.
* set to an initial value to zero for all respondents who answered at least one of the storage questions
replace UseImprovedStorage_2_3_4=0 if c7_trad_bags_use~=. | c7_trad_silo_use~=. |  ///
   c7_PICS_bags_use~=. | c7_improved_silo_use~=. 
replace UseImprovedStorage_2_3_4=1 if c7_trad_silo_new==1 | c7_PICS_bags_use==1 | c7_improved_silo_new==1
sum UseImprovedStorage_2_3_4
tab UseImprovedStorage_2_3_4
tab UseImprovedStorage_2_3_4 gender_n
oneway UseImprovedStorage_2_3_4 gender_n, tabulate

/* not in Mozambique data

* C8: Types of livestock raised - PMF130-1
* Any that have animals are considered program participants

* this was a multiple response question -- people could have more than one type of livestock.
* Of the people who responded to the question those who had livestock were counted as 1
* and only those who had none as 0.
gen PracticeAnimHusbandry=.
replace PracticeAnimHusbandry=0 if  c8_none_use==1 
replace PracticeAnimHusbandry=1 if c8_fish_use==1 | c8_interfish_use==1 | ///
c8_chickens_use==1 | c8_ducks_use==1 | c8_other_use==1
sum PracticeAnimHusbandry
tab PracticeAnimHusbandry
tab PracticeAnimHusbandry gender_n
oneway PracticeAnimHusbandry gender_n, tabulate

* practice animal husbandry among Agriculture program participants
gen PracticeAnimHusbandry1=.
replace PracticeAnimHusbandry1=0 if program_agriculture==1
replace PracticeAnimHusbandry1=1 if c8_fish_use==1 | c8_interfish_use==1 | ///
c8_chickens_use==1 | c8_ducks_use==1 | c8_other_use==1 
sum PracticeAnimHusbandry1
tab PracticeAnimHusbandry1
tab PracticeAnimHusbandry1 gender_n
oneway PracticeAnimHusbandry1 gender_n, tabulate

* if we want to know how many who practice animal husbandry among all respondents
gen PracticeAnimHusbandry2=0
replace PracticeAnimHusbandry2=1 if c8_fish_use==1 | c8_interfish_use==1 | ///
c8_chickens_use==1 | c8_ducks_use==1 | c8_other_use==1 
sum PracticeAnimHusbandry2
tab PracticeAnimHusbandry2
tab PracticeAnimHusbandry2 gender_n
oneway PracticeAnimHusbandry2 gender_n, tabulate

* C9: Animal husbandry practices used now - PMF130-1
* calculated based on practices being used
sum c9_vaccinations_use c9_enclosures_use c9_feed_use 
tab1 c9_vaccinations_use c9_enclosures_use c9_feed_use 

* among agriculture program participants
gen PracticeAnimHusbandry3=.
replace PracticeAnimHusbandry3=0 if program_agriculture==1
replace PracticeAnimHusbandry3=1 if c9_vaccinations_use==1 | c9_enclosures_use==1 | ///
c9_feed_use==1 
sum PracticeAnimHusbandry3
tab PracticeAnimHusbandry3
tab PracticeAnimHusbandry3 gender_n
oneway PracticeAnimHusbandry3 gender_n, tabulate

* among all respondents
gen PracticeAnimHusbandry4=0
replace PracticeAnimHusbandry4=1 if c9_vaccinations_use==1 | c9_enclosures_use==1 | ///
c9_feed_use==1 
sum PracticeAnimHusbandry4
tab PracticeAnimHusbandry4
tab PracticeAnimHusbandry4 gender_n
oneway PracticeAnimHusbandry4 gender_n, tabulate

*/

* C10 and C11: Change in knowledge of sustainable agriculture
sum c10_nr c11_nr
tab c10_nr gender_n
tab c11_nr gender_n
generate Change_in_knowledge = c11_nr - c10_nr
tab Change_in_knowledge
tab Change_in_knowledge gender_n
ttest c11_nr == c10_nr
ttest c11_nr == c10_nr if gender_n==0
ttest c11_nr == c10_nr if gender_n==1

* C12: Usefulness of sustainable agric practices learned in program
tab c12_nr
label list useful_lbl
/*
useful_lbl:
           0 not_useful
           1 somewhat_useful
           2 very_useful
*/
recode c12_nr (0 = 0 "Not useful") (1 2 = 1 "Useful"), generate (Usefulness_Sust_Agr)
sum Usefulness_Sust_Agr
tab Usefulness_Sust_Agr
tab Usefulness_Sust_Agr gender_n

* C14: Confidence in ability to access seed or fertilizer
tab c14_nr
label list confidence_access_lbl
/* 
confidence_access_lbl:
           0 not_at_all
           1 somewhat
           2 very
*/
recode c14_nr (0 = 0 not_confident) (1 2 = 1 confident), generate(HasConfidence_seed_fert)
sum HasConfidence_seed_fert
tab HasConfidence_seed_fert
tab HasConfidence_seed_fert gender_n
oneway HasConfidence_seed_fert gender_n, tabulate

* C15: Security of tenure
describe c15_no_land c15_formal_title c15_short_lease c15_traditional_title c15_long_lease, fullname
sum c15_no_land c15_formal_title c15_short_lease c15_traditional_title c15_long_lease
sum c15_no_land c15_formal_title c15_short_lease c15_traditional_title c15_long_lease if gender_n==0
sum c15_no_land c15_formal_title c15_short_lease c15_traditional_title c15_long_lease if gender_n==1
oneway c15_no_land gender_n, tabulate
oneway c15_formal_title gender_n, tabulate
oneway c15_short_lease gender_n, tabulate
oneway c15_traditional_title gender_n, tabulate
oneway c15_long_lease gender_n, tabulate

generate Secure_tenure=.
replace Secure_tenure=0 if c15_no_land==1
replace Secure_tenure=1 if c15_formal_title==1 | c15_short_lease==1 | ///
c15_traditional_title==1 | c15_long_lease==1
label values Secure_tenure yesno
sum Secure_tenure
tab Secure_tenure
tab Secure_tenure gender_n
oneway Secure_tenure gender_n, tabulate

/* not in Mozambique data

* Section D: Literacy
* D3: Literacy exam -- pass or fail?
* this data does not appear in the Tanzania dataset
sum d3_n
tab d3_n
tab d3_n gender_n
oneway d3_n gender_n, tabulate

* D7: Literacy skills have helped with managing enterprise or group
sum d7_n
tab d7_n
tab d7_n gender_n
oneway d7_n gender_n, tabulate

* D8: Use of literacy skills in managing enterprise or in community group
describe d8_manage_hh d8_manage_iga d8_personal d8_with_children d8_more_self_esteem ///
d8_more_respect d8_with_group , fullname
sum d8_manage_hh d8_manage_iga d8_personal d8_with_children d8_more_self_esteem ///
d8_more_respect d8_with_group 
sum d8_manage_hh d8_manage_iga d8_personal d8_with_children d8_more_self_esteem ///
d8_more_respect d8_with_group  if gender_n==0
sum d8_manage_hh d8_manage_iga d8_personal d8_with_children d8_more_self_esteem ///
d8_more_respect d8_with_group  if gender_n==1
tab1 d8_manage_hh d8_manage_iga d8_personal d8_with_children d8_more_self_esteem ///
d8_more_respect d8_with_group 
* Condition for this: 
* At least one of "d8_with_group", "d8_more_respect" or "d8_manage_iga" is "yes"
generate Used_literacy_skills = .
replace Used_literacy_skills = d8_with_group + d8_more_respect + d8_manage_iga
recode Used_literacy_skills (0 = 0) (1 2 3 = 1)
label values Used_literacy_skills yesno
sum Used_literacy_skills
tab Used_literacy_skills
tab Used_literacy_skills gender_n
oneway Used_literacy_skills gender_n, tabulate

*/

* Section E: Access to financial services

* E3: Receipt of a loan from VSLA group
sum e3_n
tab e3_n
tab e3_n gender_n
oneway e3_n gender_n, tabulate

* E4: Use of VSL loan -- as an indicator of a participant with a small scale enterprise/IGA
describe e4_fund_ag_inputs e4_fund_iga e4_medical e4_school e4_family_event ///
e4_household e4_buy_food e4_other_use , fullname
sum e4_fund_ag_inputs e4_fund_iga e4_medical e4_school e4_family_event ///
e4_household e4_buy_food e4_other_use
sum e4_fund_ag_inputs e4_fund_iga e4_medical e4_school e4_family_event ///
e4_household e4_buy_food e4_other_use if gender_n==0
sum e4_fund_ag_inputs e4_fund_iga e4_medical e4_school e4_family_event ///
e4_household e4_buy_food e4_other_use if gender_n==1
* tab e4_other
tab e4_fund_ag_inputs gender_n
oneway e4_fund_ag_inputs gender_n, tabulate
tab e4_fund_iga gender_n
oneway e4_fund_iga gender_n, tabulate
tab e4_medical gender_n
oneway e4_medical gender_n, tabulate
tab e4_school gender_n
oneway e4_school gender_n, tabulate
tab e4_family_event gender_n
oneway e4_family_event gender_n, tabulate
tab e4_household gender_n
oneway e4_household gender_n, tabulate
tab e4_buy_food gender_n
oneway e4_buy_food gender_n, tabulate
tab e4_other_use gender_n
oneway e4_other_use gender_n, tabulate

* E5: Repayment of loan
sum e5_n
tab e5_n
tab e5_n gender_n
oneway e5_n gender_n, tabulate

sum
describe, fullnames
 
save "Outfiles\FinalData-Mozambique.dta", replace
