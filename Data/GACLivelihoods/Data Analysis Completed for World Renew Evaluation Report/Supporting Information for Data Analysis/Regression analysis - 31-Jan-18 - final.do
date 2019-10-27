clear
set more off
/*
*******************************************************************************************
*******************************************************************************************
**     DATE:       January 2018
**     PROGRAM:    Regression analysis 
**     AUTHOR:     Douglas R Brown
********************************************************************************************
********************************************************************************************
*/
 
cd "C:\data\WorldRenewData\"

use "Outfiles\FinalData-Combined.dta" ,clear


* create indicator variables for country and partner
label list country
generate bangladesh=country==1
generate honduras=country==2
generate mali=country==3
generate mozambique=country==4
generate tanzania=country==5
tab country
tab1 bangladesh honduras mali moz tanz

label list partner_all
generate geita=partner_n==1
generate mud=partner_n==2
generate alfalit=partner_n==3
generate dn=partner_n==4
generate harvest=partner_n==5
generate mcm=partner_n==6
generate aedm=partner_n==7
generate odes=partner_n==8
generate kurmari=partner_n==9
generate pari=partner_n==10
generate sathi=partner_n==11
generate diocese_niassa=partner_n==12
tab partner_n
tab1 geita mud alfalit dn harvest mcm aedm odes kurmari pari sathi diocese_niassa

generate age_under_30=age_nr==1
generate age_30_49=age_nr==2
generate age_50_plus=age_nr==3
tab age_nr
tab1 age_under_30 age_30_49 age_50_plus

recode program_literacy (. = 0), gen( program_literacy_r)
sum program_vsl program_community_leadership program_agriculture program_literacy_r
corr program_vsl program_community_leadership program_agriculture program_literacy_r

*create interaction terms for program participation
gen agr_lit= program_agriculture* program_literacy_r
tab agr_lit
gen agr_vsl= program_agriculture* program_vsl
tab agr_vsl
gen agr_lead= program_agriculture* program_community_leadership
tab agr_lead
gen vsl_lead= program_vsl * program_community_leadership
tab vsl_lead
gen vsl_lit= program_vsl * program_literacy_r
tab vsl_lit
gen lead_lit= program_community_leadership * program_literacy_r
tab lead_lit
gen all_prog= program_vsl* program_community_leadership* program_agriculture* program_literacy_r
tab all_prog
gen agr_lit_vsl= program_vsl* program_agriculture* program_literacy_r
tab agr_lit_vsl
gen agr_lit_lead=  program_community_leadership* program_agriculture* program_literacy_r
tab agr_lit_lead
gen vsl_lit_lead= program_vsl* program_community_leadership* program_literacy_r
tab vsl_lit_lead

* replace "." with "0" for variables in section B that would have been asked to all respondents
drop b6_other b4_other_spec
recode b1_* b2_* b3_* b4_* b5_* b6_* b7_* (. = 0)
sum b1_* b2_* b3_* b4_* b5_* b6_* b7_* 

* determine changes in livelihoods 
* create variables for those who added a livelihood activity or ceased one
* between the beginning and end of the project
gen Added_day_labour=b2_day_labour-b1_day_labour
gen Added_farming_irrigation=b2_farming_irrigation-b1_farming_irrigation
gen Added_farming_rain=b2_farming_rain-b1_farming_rain
gen Added_fishing=b2_fishing-b1_fishing
gen Added_honey=b2_honey-b1_honey
gen Added_income_other=b2_income_other-b1_income_other
gen Added_livestock_animals=b2_livestock_animals-b1_livestock_animals
gen Added_livestock_products=b2_livestock_products-b1_livestock_products
gen Added_other_business=b2_other_business-b1_other_business
gen Added_outside_money=b2_outside_money-b1_outside_money
gen Added_processing=b2_processing-b1_processing
gen Stopped_day_labour=-Added_day_labour
gen Stopped_farming_irrigation=-Added_farming_irrigation
gen Stopped_farming_rain=-Added_farming_rain
gen Stopped_fishing=-Added_fishing
gen Stopped_honey=-Added_honey
gen Stopped_income_other=-Added_income_other
gen Stopped_livestock_animals=-Added_livestock_animals
gen Stopped_livestock_products=-Added_livestock_products
gen Stopped_other_business=-Added_other_business
gen Stopped_outside_money=-Added_outside_money
gen Stopped_processing=-Added_processing
recode Added_day_labour Stopped_day_labour (-1 = 0)
recode Added_farming_irrigation Stopped_farming_irrigation (-1 = 0)
recode Added_farming_rain Stopped_farming_rain (-1 = 0)
recode Added_fishing Stopped_fishing (-1 = 0)
recode Added_honey Stopped_honey (-1 = 0)
recode Added_income_other Stopped_income_other (-1 = 0)
recode Added_livestock_animals Stopped_livestock_animals (-1 = 0)
recode Added_livestock_products Stopped_livestock_products (-1 = 0)
recode Added_other_business Stopped_other_business (-1 = 0)
recode Added_outside_money Stopped_outside_money (-1 = 0)
recode Added_processing Stopped_processing (-1 = 0)
label values Added_day_labour Stopped_day_labour yesno
label values Added_farming_irrigation Stopped_farming_irrigation yesno
label values Added_farming_rain Stopped_farming_rain yesno
label values Added_fishing Stopped_fishing yesno
label values Added_honey Stopped_honey yesno
label values Added_income_other Stopped_income_other yesno
label values Added_livestock_animals Stopped_livestock_animals yesno
label values Added_livestock_products Stopped_livestock_products yesno
label values Added_other_business Stopped_other_business yesno
label values Added_outside_money Stopped_outside_money yesno
label values Added_processing Stopped_processing yesno

* determine whether income is more diverse or not
tab ChangeInNumSources
generate MoreDiverseIncome=ChangeInNumSources
recode MoreDiverseIncome (-4 -3 -2 -1 = 0) (1 2 3 4 5 = 1)
label values MoreDiverseIncome yesno
tab MoreDiverseIncome

* determine changes in household asset ownership
* this is done by determining who currently owns something and states that it is new
* we only want those for home both are true
gen Added_house= b4_1_own * b4_1_own_new
gen Added_land=b4_2_own * b4_2_own_new 
gen Added_tools=b4_3_own * b4_3_own_new
gen Added_mobile_phone=b4_4_own * b4_4_own_new
gen Added_bicycle=b4_5_own * b4_5_own_new
gen Added_livestock=b4_6_own * b4_6_own_new
gen Added_savings=b4_7_own * b4_7_own_new
gen Added_boat=b4_8_own * b4_8_own_new
label values Added_house Added_land Added_tools Added_mobile_phone Added_bicycle ///
Added_livestock Added_savings Added_boat yesno
sum Added_house Added_land Added_tools Added_mobile_phone Added_bicycle ///
Added_livestock Added_savings Added_boat

* magnitude of self-reported increase in income due to project participation
gen Income_increase=b3_n+b3_1_n
label define Income_increase 0 "no increase" 1 "some increase" 2 "significant increase"
label values Income_increase Income_increase
label variable Income_increase "Increase in income due to program participation"
gen Income_increase_some=b3_n
gen Income_increase_significant=b3_1_n
label values Income_increase_some Income_increase_significant yesno

* indicator variables for type of business plan
tabulate b5_nr, generate(BusinessPlan)
label values BusinessPlan1 BusinessPlan2 BusinessPlan3 yesno
label variable BusinessPlan1 "No business plan"
label variable BusinessPlan2 "Unwritten business plan"
label variable BusinessPlan3 "Business plan on paper"
sum BusinessPlan1 BusinessPlan2 BusinessPlan3

tab b8_n, generate(IGA_Mgt_Confidence)
label values IGA_Mgt_Confidence1 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 yesno
label variable IGA_Mgt_Confidence1 "No confidence in ability to manage IGAs" 
label variable IGA_Mgt_Confidence2 "Somewhat confident in ability to manage IGAs" 
label variable IGA_Mgt_Confidence3 "Very confident in ability to manage IGAs" 
sum IGA_Mgt_Confidence1 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3

gen Help_to_plan= b6_community_group+ b6_family+ b6_farmer_group+ b6_government+ ///
b6_local_bank+ b6_neighbours+ b6_other_source+ b6_other_staff+ b6_saving_group+ b6_staff
recode  Help_to_plan (1/9 = 1)
label values Help_to_plan yesno
gen Help_to_implement=b7_n
label values Help_to_implement yesno

sum Income_increase FoodFrequencyScore FoodDiversityScore NumMonthsWithEnough NumHungryMonths NumCopingStrategiesUsed NumIncomeSourceBefore NumIncomeSourceNow ChangeInNumSources
corr Income_increase FoodFrequencyScore FoodDiversityScore NumMonthsWithEnough NumHungryMonths NumCopingStrategiesUsed NumIncomeSourceBefore NumIncomeSourceNow ChangeInNumSources



global llhdchge "Added_day_labour Added_farming_irrigation Added_farming_rain Added_fishing Added_honey Added_income_other Added_livestock_animals Added_livestock_products Added_other_business Added_outside_money Added_processing Stopped_day_labour Stopped_farming_irrigation Stopped_farming_rain Stopped_fishing Stopped_honey Stopped_income_other Stopped_livestock_animals Stopped_livestock_products Stopped_other_business Stopped_outside_money Stopped_processing"
global llhd "b2_day_labour b2_farming_irrigation b2_farming_rain b2_fishing b2_honey b2_income_other b2_livestock_animals b2_livestock_products b2_other_business b2_outside_money b2_processing"
global assetchge "Added_house Added_land Added_tools Added_mobile_phone Added_bicycle Added_livestock Added_savings Added_boat"

global pgm "program_literacy_r program_vsl program_community_leadership program_agriculture"
global pgminteract "agr_lit agr_vsl agr_lead vsl_lead vsl_lit lead_lit all_prog agr_lit_vsl agr_lit_lead vsl_lit_lead"
global ages "age_under_30 age_30_49 age_50_plus"
global countrylist "bangladesh honduras mali mozambique tanzania"
global partnerlist "geita mud alfalit dn harvest mcm aedm odes kurmari pari sathi diocese_niassa"

regress FoodFrequencyScore gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant 
regress NumHungryMonths gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant 
regress NumCopingStrategiesUsed gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant 
regress Income_increase gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome
oprobit Income_increase gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome

regress FoodFrequencyScore gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
regress FoodDiversityScore gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
oprobit Income_increase gender_n $ages $countrylist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome NumHungryMonths NumCopingStrategiesUsed

regress FoodFrequencyScore gender_n $ages $countrylist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
regress FoodDiversityScore gender_n $ages $countrylist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
oprobit Income_increase gender_n $ages $countrylist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome NumHungryMonths NumCopingStrategiesUsed


regress FoodFrequencyScore gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant
regress FoodDiversityScore gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant
regress NumHungryMonths gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant
regress NumCopingStrategiesUsed gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant
regress Income_increase gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome
oprobit Income_increase gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome 

regress FoodFrequencyScore gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
regress FoodDiversityScore gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
oprobit Income_increase gender_n $ages $partnerlist $pgm $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome NumHungryMonths NumCopingStrategiesUsed

regress FoodFrequencyScore gender_n $ages $partnerlist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
regress FoodDiversityScore gender_n $ages $partnerlist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome Income_increase_some Income_increase_significant NumHungryMonths NumCopingStrategiesUsed
oprobit Income_increase gender_n $ages $partnerlist $pgm $pgminteract $llhdchge $assetchge BusinessPlan2 BusinessPlan3 IGA_Mgt_Confidence2 IGA_Mgt_Confidence3 MoreDiverseIncome NumHungryMonths NumCopingStrategiesUsed

*create interaction terms for CA principles
gen ca_1_2= CA_Principle_1* CA_Principle_2
gen ca_1_3= CA_Principle_1* CA_Principle_3
gen ca_2_3= CA_Principle_2* CA_Principle_3
gen ca_1_2_3= CA_Principle_1* CA_Principle_2 * CA_Principle_3
tab1 ca_1_2 ca_1_3 ca_2_3 ca_1_2_3
global ca "CA_Principle_1 CA_Principle_2 CA_Principle_3"
global cainteract "ca_1_2 ca_1_3 ca_2_3 ca_1_2_3"

* remove missing values from variables in agriculture program
recode  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 (. = 0) if program_agriculture==1

* Food Security, Dietary Diversity and Change in Income in relation to CA adoption and other aspects of agriculture
regress FoodFrequencyScore gender_n $ages $countrylist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodFrequencyScore gender_n $ages $countrylist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodFrequencyScore gender_n $ages $countrylist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodFrequencyScore gender_n $ages $countrylist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

regress FoodFrequencyScore gender_n $ages $partnerlist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodFrequencyScore gender_n $ages $partnerlist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant
regress FoodFrequencyScore gender_n $ages $partnerlist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodFrequencyScore gender_n $ages $partnerlist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

regress FoodDiversityScore gender_n $ages $countrylist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

regress FoodDiversityScore gender_n $ages $partnerlist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $partnerlist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $partnerlist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $partnerlist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

oprobit Income_increase gender_n $ages $countrylist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $countrylist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $countrylist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $countrylist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome

oprobit Income_increase gender_n $ages $partnerlist $pgm $ca $cainteract GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $partnerlist $pgm $ca GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $partnerlist $pgm CA_full_practitioner GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome
oprobit Income_increase gender_n $ages $partnerlist $pgm CA_practitioner  GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome

* remove missing values from variables of interest
drop c8_other_spec
drop c8_calc*
recode c8_* (.= 0) if program_agriculture==1
sum c8_*_use

drop c9_other_spec
drop c9_calc*
recode c9_* (.= 0) if program_agriculture==1
sum c9_*_use

* consider relationship between dietary diversification and types of animals raised
* and also animal husbandry practices
regress FoodDiversityScore gender_n $ages $countrylist $pgm c8_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $countrylist $pgm c8_*_use c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

regress FoodDiversityScore gender_n $ages $partnerlist $pgm c8_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $partnerlist $pgm c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 
regress FoodDiversityScore gender_n $ages $partnerlist $pgm c8_*_use c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome Income_increase_some Income_increase_significant 

oprobit Income_increase gender_n $ages $countrylist $pgm c8_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  
oprobit Income_increase gender_n $ages $countrylist $pgm c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  
oprobit Income_increase gender_n $ages $countrylist $pgm c8_*_use c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  

oprobit Income_increase gender_n $ages $partnerlist $pgm c8_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  
oprobit Income_increase gender_n $ages $partnerlist $pgm c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  
oprobit Income_increase gender_n $ages $partnerlist $pgm c8_*_use c9_*_use GrowDiseaseResist UseImprovedStorage_3_4  Increased_knowledge  HasConfidence_seed_fert Secure_tenure PracticeAnimHusbandry2 NumHungryMonths NumCopingStrategiesUsed MoreDiverseIncome  



