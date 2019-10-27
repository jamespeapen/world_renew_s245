clear
set more off
/*
*******************************************************************************************
*******************************************************************************************
**     DATE:       January 2018
**     PROGRAM:    Import Excel data from Endline survey and label - Mozambique data
**     AUTHOR:     Douglas R Brown
********************************************************************************************
********************************************************************************************
*/

cd "C:\data\WorldRenewData\"
** import Mozambique data
import excel "DownloadedFiles\Mozambique - GAC Questionnaire - xml - 2018-01-11-14-35.xlsx", sheet("Mozambique - GAC Questionnaire") firstrow

** drop variables from blank columns and label remaining variables
* Demographics
drop start
drop end
drop name
drop phone_number
label variable town "Town"
label variable district "District"
label variable partner "Partner"
label variable gender "Gender"
* Program participation
drop program
label variable program_vsl "Savings Program"
label variable program_community_leadership "Community Leadership Program"
label variable program_agriculture "Agriculture Program"
* label variable program_literacy "Literacy Program"
label variable age "Age Group"
* A: Food Security
* A1: Food frequency - UO#3
drop a_note
drop a1_note
label variable a1_a "Food before a morning meal"
label variable a1_b "Morning meal"
label variable a1_c "Food between morning and midday meals"
label variable a1_d "Midday meal"
label variable a1_e "Food between midday and evening meals"
label variable a1_f "Evening meal"
label variable a1_g "Food after the evening meal"
label variable a1_meals_hh "Meals for household"
drop a1_total_hh
label variable a1_meals_others "Meals for others"
drop a1_total_others
label variable a1_meals_ind "Meals for individual"
drop a1_total_ind
label variable a1_meals_none "Meals not consumed"
drop a1_total_none
* A2: Food diversity - OU#3
label variable a2_a "Cereals"
label variable a2_b "Roots/Tubers"
label variable a2_c "Legumes"
label variable a2_d "Milk/Milk Products"
label variable a2_e "Eggs"
label variable a2_f "Meat/offal"
label variable a2_g "Fish/Seafood"
label variable a2_h "Oil/Fat"
label variable a2_i "Sugar/Honey"
label variable a2_j "Fruits"
label variable a2_k "Vegetables"
label variable a2_meals_hh "Food groups for household"
drop a2_total_hh
label variable a2_meals_others "Food groups for others"
drop a2_total_others
label variable a2_meals_ind "Food groups for individual"
drop a2_total_ind
label variable a2_meals_none "Food groups not consumed"
drop a2_total_none
* A3: Hungry months - OU#3
drop a3_note
drop a3_label
label variable a3_jan "Enough food in January"
drop a3_jan_reason
label variable a3_jan_reason_money "Not have enough money"
label variable a3_jan_reason_weather "Weather-related"
label variable a3_jan_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_jan_reason_ran_out "Ran out of food"
label variable a3_jan_reason_not_available "Was not available in our community"
label variable a3_feb "Enough food in February"
drop a3_feb_reason
label variable a3_feb_reason_money "Not have enough money"
label variable a3_feb_reason_weather "Weather-related"
label variable a3_feb_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_feb_reason_ran_out "Ran out of food"
label variable a3_feb_reason_not_available "Was not available in our community"
label variable a3_mar "Enough food in March"
drop a3_mar_reason
label variable a3_mar_reason_money "Not have enough money"
label variable a3_mar_reason_weather "Weather-related"
label variable a3_mar_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_mar_reason_ran_out "Ran out of food"
label variable a3_mar_reason_not_available "Was not available in our community"
label variable a3_apr "Enough food in April"
drop a3_apr_reason
label variable a3_apr_reason_money "Not have enough money"
label variable a3_apr_reason_weather "Weather-related"
label variable a3_apr_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_apr_reason_ran_out "Ran out of food"
label variable a3_apr_reason_not_available "Was not available in our community"
label variable a3_may "Enough food in May"
drop a3_may_reason
label variable a3_may_reason_money "Not have enough money"
label variable a3_may_reason_weather "Weather-related"
label variable a3_may_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_may_reason_ran_out "Ran out of food"
label variable a3_may_reason_not_available "Was not available in our community"
label variable a3_jun "Enough food in June"
drop a3_jun_reason
label variable a3_jun_reason_money "Not have enough money"
label variable a3_jun_reason_weather "Weather-related"
label variable a3_jun_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_jun_reason_ran_out "Ran out of food"
label variable a3_jun_reason_not_available "Was not available in our community"
label variable a3_jul "Enough food in July"
drop a3_jul_reason
label variable a3_jul_reason_money "Not have enough money"
label variable a3_jul_reason_weather "Weather-related"
label variable a3_jul_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_jul_reason_ran_out "Ran out of food"
label variable a3_jul_reason_not_available "Was not available in our community"
label variable a3_aug "Enough food in August"
drop a3_aug_reason
label variable a3_aug_reason_money "Not have enough money"
label variable a3_aug_reason_weather "Weather-related"
label variable a3_aug_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_aug_reason_ran_out "Ran out of food"
label variable a3_aug_reason_not_available "Was not available in our community"
label variable a3_sep "Enough food in September"
drop a3_sep_reason
label variable a3_sep_reason_money "Not have enough money"
label variable a3_sep_reason_weather "Weather-related"
label variable a3_sep_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_sep_reason_ran_out "Ran out of food"
label variable a3_sep_reason_not_available "Was not available in our community"
label variable a3_oct "Enough food in October"
drop a3_oct_reason
label variable a3_oct_reason_money "Not have enough money"
label variable a3_oct_reason_weather "Weather-related"
label variable a3_oct_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_oct_reason_ran_out "Ran out of food"
label variable a3_oct_reason_not_available "Was not available in our community"
label variable a3_nov "Enough food in November"
drop a3_nov_reason
label variable a3_nov_reason_money "Not have enough money"
label variable a3_nov_reason_weather "Weather-related"
label variable a3_nov_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_nov_reason_ran_out "Ran out of food"
label variable a3_nov_reason_not_available "Was not available in our community"
label variable a3_dec "Enough food in December"
drop a3_dec_reason
label variable a3_dec_reason_money "Not have enough money"
label variable a3_dec_reason_weather "Weather-related"
label variable a3_dec_reason_less_desired "No access to preferred staple food but to a less desirable one"
label variable a3_dec_reason_ran_out "Ran out of food"
label variable a3_dec_reason_not_available "Was not available in our community"
label variable a3_calc "Total number of hungry months"
drop a3_total
* A4: Coping strategy - OU#3
label variable a4_a "Rely on less preferred and less expensive foods"
label variable a4_b "Borrow food, or rely on help from a friend or relative"
label variable a4_c "Purchase food on credit"
label variable a4_d "Gather wild food, hunt, or harvest immature crops"
label variable a4_e "Consume seed stock that was to be held for next season"
label variable a4_f "Send household members to eat elsewhere"
label variable a4_g "Send household members to ask strangers for help"
label variable a4_h "Limit portion size at mealtimes"
label variable a4_i "Restrict adult consumption in order for small children to eat"
label variable a4_j "Feed working members of household at the expense of nonworking members"
label variable a4_k "Ration the money you had and buy prepared food"
label variable a4_l "Reduce number of meals eaten in a day"
label variable a4_m "Eat meals without curries"
label variable a4_n "Require children to drink more water to feel full"
label variable a4_o "Restrict child consumption to have enough food for adults"
label variable a4_other "Other"
label variable a4_other_spec "Specify other"
label variable a4_calc "Number of coping strategies used often"
drop a4_total
* Section B: Sources of income/livelihoods
* B1: IGAs before participating
drop b1
label variable b1_farming_rain "Farming (rain-fed agriculture) - before"
label variable b1_other_business "Other Business Activities - before"
label variable b1_outside_money "Remittances - before"
label variable b1_processing "Value-added processing - before"
* label variable b1_honey "Selling honey - before"
label variable b1_livestock_products "Selling animal products - before"
label variable b1_livestock_animals "Livestock sales - before"
label variable b1_fishing "Fishing or Fish Ponds - before"
label variable b1_day_labour "Day labour - on/off farm - before"
label variable b1_farming_irrigation "Farming (farm uses irrigation) - before"
label variable b1_income_other "Income from other source - before"
* B2: IGAs after participating - PMF 200
drop b2
label variable b2_farming_rain "Farming (rain-fed agriculture) - now"
label variable b2_other_business "Other Business Activities - now"
label variable b2_outside_money "Remittances - now"
label variable b2_processing "Value-added processing - now"
* label variable b2_honey "Selling honey - now"
label variable b2_livestock_products "Selling animal products - now"
label variable b2_livestock_animals "Livestock sales - now"
label variable b2_fishing "Fishing or Fish Ponds - now"
label variable b2_day_labour "Day labour - on/off farm - now"
label variable b2_farming_irrigation "Farming (farm uses irrigation) - now"
label variable b2_income_other "Income from other source - now"
* B3: Change in income from partipation - PMF 200-2
label variable b3 "Amount earned has increased"
rename b31 b3_1
label variable b3_1 "Amount earned has increased significantly"
* B4: Assets owned - OU#2
drop b4_note
* drop b4_hint
drop b4_label
drop b4_label_own
drop b4_label_own_new
drop b4_1
label variable b4_1_own "Own a House"
label variable b4_1_own_new "House is new since program started"
drop b4_2
label variable b4_2_own "Own Land"
label variable b4_2_own_new "Land is new since program started"
drop b4_3
label variable b4_3_own "Own Farm Tools / Equipment"
label variable b4_3_own_new "Farm Tools / Equipment are new since program started"
drop b4_4
label variable b4_4_own "Own a Mobile Phone"
label variable b4_4_own_new "Mobile Phone is new since program started"
drop b4_5
label variable b4_5_own "Own a Bicycle"
label variable b4_5_own_new "Bicycle is new since program started"
drop b4_6
label variable b4_6_own "Own Livestock"
label variable b4_6_own_new "Livestock are new since program started"
drop b4_7
label variable b4_7_own "Have own savings"
label variable b4_7_own_new "Savings are new since program started"
drop b4_8
label variable b4_8_own "Own a boat"
label variable b4_8_own_new "Boat is new since program started"
drop b4_other
label variable b4_other_own "Own other assets"
label variable b4_other_own_new "Other assets new since program started"
label variable b4_other_spec "Specify other:"
label variable b4_calc "Number of assets owned"
drop b4_total_own
label variable b4_calc_new "Number of assets since project started"
drop b4_total_new

* B5: Business plan/marketing strategy for IGAs -PMF 210-1
label variable b5 "Has a business plan"

* B6: Support to develop plan
drop b6
label variable b6_family "Other Family Members helped with plan"
label variable b6_government "Government helped with plan"
label variable b6_saving_group "Saving and Lending Group helped with plan"
label variable b6_farmer_group "Farmer Group helped with plan"
label variable b6_neighbours "Neighbours  helped with plan"
label variable b6_community_group "Village Development Committee / Community Group helped with plan"
label variable b6_other_staff "Staff person from a different project helped with plan"
label variable b6_other_source "Other source of help with plan"
label variable b6_staff "Project staff person helped with plan"
label variable b6_other "Specify other:"

* B7: Help to implement plan
label variable b7 "Received help with implementing plan"
rename b71 b7_1
rename b71_* b7_1_*
drop b7_1
label variable b7_1_family "Other Family Members helped implement plan"
label variable b7_1_government "Government helped implement plan"
label variable b7_1_saving_group "Saving and Lending Group helped implement plan"
label variable b7_1_farmer_group "Farmer Group helped implement plan"
label variable b7_1_neighbours "Neighbours helped implement plan"
label variable b7_1_community_group "Village Development Committee / Community Group helped implement plan"
label variable b7_1_other_staff "Staff person from a different project helped implement plan"
label variable b7_1_other_source "Other source of help with implementation"
label variable b7_1_staff "Project staff person helped implement plan"

* B8: Confidence in management ability - PMF 210-2
label variable b8 "Confidence in management ability"

* Section C: Sustainable agriculture
* C1: Sustainable agriculture practices - PMF 100-1
drop c1
label variable c1_crop_rotation "Practicing crop rotation CA Principle #3), including intercropping with legumes"
label variable c1_intercrop "Practicing intercropping with legumes/GMCCs (CA Principle #3)"
label variable c1_min_till "Minimum tillage (CA Principle #1), including potholes, ripper or zai holes"
label variable c1_soil_cover "Keeping the soil covered (CA Principle #2)"
label variable c1_seed_space "Proper spacing of seeds"
label variable c1_manure_tea "Use manure tea"
label variable c1_bio_pest "Bio-pesticides"
label variable c1_compost "Compost"
label variable c1_no_burn "Not burning crop residues"

* C2: Benefits of Sust Agr practices - PMF 110
drop c2
label variable c2_afford_pesticides "Less money spent on pesticides"
label variable c2_more_meals "Are able to eat more meals each day"
label variable c2_more_food "Have more food throughout the year"
label variable c2_healthy_family "Children / Family is healthier"
label variable c2_better_soil "Improved soil quality"
label variable c2_less_labour "Can spend more time on other businesses"
label variable c2_yield "Improved yield"
label variable c2_other_benefit "Other benefits"
label variable c2_resilient_crop "Crops better able to survive dry conditions / Soil holds moisture better"
label variable c2_less_pests "Fewer Pests Attacking Crops"
label variable c2_afford_fertilizer "Less money spent on fertilizer"
label variable c2_restore_land "Restore degraded land"
label variable c2_other "Specify other:"

* C3: Crop varieties grown in past year - PMF 120-2
drop c3
label variable c3_ervilha_fejiao "Beans (Ervilha) - Pigeon Pea(?)"
label variable c3_sweet_potato_of "Orange fleshed sweet potato"
rename c3_cassava_dr c3_dr_cassava
label variable c3_dr_cassava "Disease resistant cassava"
rename c3_maize_dr c3_dr_maize
label variable c3_dr_maize "Short duration/drought resistant maize"
label variable c3_cowpea_sixty "60-day cowpea"
label variable c3_groundnuts_dr "Disease resistant groundnuts"
label variable c3_mucuna "Mucuna/Velvet bean"

* C4: Growing improved varieties - PMF 120-2
label variable c4 "Currently growing a disease resistant or drought tolerant variety"

* C5: Varieties grown since joining program
drop c5
label variable c5_cabbage "Cabbage"
rename c5_peanuts c5_groundnuts
label variable c5_groundnuts "Peanuts/Groundnuts"
label variable c5_lettuce "Lettuce"
label variable c5_onions "Onions"
label variable c5_tomatoes "Tomatoes"

* C6: Access to water for farming - PMF 117
label variable c6 "Have access to water for farming"
drop c6_note
drop c6_label
drop c6_label_new
drop c6_label_use
drop c6_drip
label variable c6_drip_new "Drip Irrigation (hose or plastic bottles) - new"
label variable c6_drip_use "Use Drip Irrigation (hose or plastic bottles)"
drop c6_pump
label variable c6_pump_new "Treadle Pump - new"
label variable c6_pump_use "Use a Treadle Pump"
drop c6_rain
label variable c6_rain_new "Collecting rainwater on roof - new"
label variable c6_rain_use "Use rainwater collected on roof"
drop c6_river
label variable c6_river_new "Nearby river or stream - new"
label variable c6_river_use "Use a nearby river or stream"
drop c6_no_access
label variable c6_no_access_new "No access to water source other than rainfall - new"
label variable c6_no_access_use "Have no access to water source other than rainfall"
drop c6_wells
label variable c6_wells_new "Well (new)"
label variable c6_wells_use "Use a well"
drop c6_lake
label variable c6_lake_new "Nearby lake (new)"
label variable c6_lake_use "Use a nearby lake"
drop c6_other
label variable c6_other_new "Other sources - new"
label variable c6_other_use "Use another source"
label variable c6_other_spec "Specify other:"
label variable c6_calc "Total methods used"
drop c6_total_use
label variable c6_calc_new "Total NEW methods used"
drop c6_total_new

* C7: Crops storage practices - PMF 116-1
drop c7_note
drop c7_label
drop c7_label_new
drop c7_label_use
drop c7_trad_bags
label variable c7_trad_bags_new "Traditional/regular bags - new"
label variable c7_trad_bags_use "Use traditional/regular bags"
drop c7_trad_silo
label variable c7_trad_silo_new "Traditional (non-improved) silo - new"
label variable c7_trad_silo_use "Use traditional (non-improved) silo"
drop c7_PICS_bags
label variable c7_PICS_bags_new "PICS bags (hermetically sealed) - new"
label variable c7_PICS_bags_use "Use PICS bags (hermetically sealed)"
drop c7_improved_silo
label variable c7_improved_silo_new "Metal silo or other improved silo - new"
label variable c7_improved_silo_use "Use metal silo or other improved silo"
label variable c7_calc "Total methods used"
drop c7_total_use
label variable c7_calc_new "Total NEW methods used"
drop c7_total_new

/* not in Mozambique data
* C8: Types of livestock raised - PMF130-1
* C9: Animal husbandry practices used now - PMF130-1
*/

* C10: Familiarity with Sust Agr before - PMF 110-1
label variable c10 "Familiarity with sustainable agriculture methods BEFORE"

* C11: Familiarity with Sust Agr now - PMF 110-1
label variable c11 "Familiarity with sustainable agriculture methods NOW"

* C12: Usefulness of practices - PMF 110-2
label variable c12 "Usefulness of the farming methods you learned"

* C13: Women's access to land - PMF 140-2
label variable c13 "Confidence that women can access the land for farming as easily as men"

* C14: Women's access to inputs - PMF 120-1
label variable c14 "Confidence that women can access seed and fertilizer as easily as men"

* C15: Land tenure - PMF140-2
drop c15
label variable c15_no_land "No title or agreement of any kind"
label variable c15_formal_title "Formal land title (from government)"
label variable c15_short_lease "Short-term lease/borrowing"
label variable c15_traditional_title "Traditional land title (from village council, chief, tribe, etc.)"
label variable c15_long_lease "Long-term lease"

/* not in Mozambique data
* C16: Support received from one of the project partners (Geita or MUD) - PMF 140-2
* Section D: Literacy
* D1: Participation in a literacy/numeracy program - PMF 222
* D2: Finished the course
* D3: Passing the test - PMF 220-1
* D4: Involved in a community group - PMF 220-3
* D5: Type of group
* D6: Frequency of use of lit/num skills - PMF 220-2
* D7: Help provided by the lit/num skills- PMF 220-3
* D8: How the skills have been used
*/

* Section E: Access to finance (savings and credit)
* E1: Savings - PMF 210
label variable e1 "Practice of regular saving"

* E2: Save with a VSLA - PMF 210
label variable e2 "Save money as part of a savings and lending group"

* E3: Loan from WVSL - PMF 210
label variable e3 "Received a loan from your VSLA Group"

* E4: Use of money from loan - PMF 210
drop e4
label variable e4_family_event "Used money for wedding/funeral"
label variable e4_fund_ag_inputs "Used money for  purchase of agricultural inputs"
label variable e4_household "Used money for  home improvement or repair"
label variable e4_school "Used money for school fees/school uniforms"
label variable e4_fund_iga "Used money for for income generating activity"
label variable e4_buy_food "Used money for to purchase food"
label variable e4_other_use "Used money for other things"
label variable e4_medical "Used money for medical needs"
drop e4_spec

* E5: Loan repaid - PMF 210
label variable e5 "Repaid the loan(s) already"

* E6: Expect to repay in future - PMF 210
label variable e6 "Able to repay it at some point in the future"

drop __version__
drop _id
drop _uuid
drop _submission_time
rename _index respondent_num
label variable respondent_num "Respondent number from survey"

describe, fullname
sum

** destring, encode and recode variables needed for analysis

* Demographics/participant profile
tab partner, missing
encode partner , generate( partner_n )
label list partner_n
/*
label list partner_n
partner_n:
           1 diocese_niassa
*/
recode partner_n (1 = 12) 
label define partner_all 1 "geita" 2 "mud" 3 "alfalit" 4 "dn" 5 "harvest" 6 "mcm" 7 "aedm" ///
8 "odes" 9 "kurmari" 10 "pari" 11 "sathi" 12 "diocese_niassa"
label list partner_all
label values partner_n partner_all
tab partner_n, missing
tab gender, missing
label define gender 0 "female" 1 "male"
encode gender , generate( gender_n ) label(gender)
tab gender_n, missing
tab age, missing
encode age, generate(age_n)
tab age_n, missing
recode age_n (3 = 1 under_30) (1 = 2 30_49) (2 = 3 50_plus), generate (age_nr)
tab age_nr, missing
drop partner gender age age_n

* Program participation
tab1 program_vsl program_community_leadership program_agriculture , missing
destring program_vsl program_community_leadership program_agriculture , replace
label define yesno 0 "no" 1 "yes"
label values program_vsl program_community_leadership program_agriculture yesno
tab1 program_vsl program_community_leadership program_agriculture , missing

** Section A - Food Security
* A1: Food frequency - UO#3
tab1 a1_a- a1_g, missing
label define who_ate_lbl 1 "no_one" 2 "yes_everyone" 3 "yes_others" 4 "yes_you"
label list who_ate_lbl
encode a1_a, generate(a1_a_n) label(who_ate_lbl)
encode a1_b, generate(a1_b_n) label(who_ate_lbl)
encode a1_c, generate(a1_c_n) label(who_ate_lbl)
encode a1_d, generate(a1_d_n) label(who_ate_lbl)
encode a1_e, generate(a1_e_n) label(who_ate_lbl)
encode a1_f, generate(a1_f_n) label(who_ate_lbl)
encode a1_g, generate(a1_g_n) label(who_ate_lbl)
sum a1_a_n- a1_g_n
tab1 a1_a_n- a1_g_n, missing
drop a1_a- a1_g

tab1 a1_meals_hh a1_meals_others a1_meals_ind a1_meals_none, missing
destring  a1_meals_hh a1_meals_others a1_meals_ind a1_meals_none, replace
tab1 a1_meals_hh a1_meals_others a1_meals_ind a1_meals_none, missing

* A2: Food diversity - OU#3
tab1 a2_a- a2_k, missing
encode a2_a, generate(a2_a_n) label(who_ate_lbl)
encode a2_b, generate(a2_b_n) label(who_ate_lbl)
encode a2_c, generate(a2_c_n) label(who_ate_lbl)
encode a2_d, generate(a2_d_n) label(who_ate_lbl)
encode a2_e, generate(a2_e_n) label(who_ate_lbl)
encode a2_f, generate(a2_f_n) label(who_ate_lbl)
encode a2_g, generate(a2_g_n) label(who_ate_lbl)
encode a2_h, generate(a2_h_n) label(who_ate_lbl)
encode a2_i, generate(a2_i_n) label(who_ate_lbl)
encode a2_j, generate(a2_j_n) label(who_ate_lbl)
encode a2_k, generate(a2_k_n) label(who_ate_lbl)
sum a2_a_n- a2_k_n
tab1 a2_a_n- a2_k_n, missing
drop a2_a- a2_k

tab1 a2_meals_hh a2_meals_others a2_meals_ind a2_meals_none, missing
destring a2_meals_hh a2_meals_others a2_meals_ind a2_meals_none, replace
tab1 a2_meals_hh a2_meals_others a2_meals_ind a2_meals_none, missing

* A3: Hungry months - OU#3
* Months of adequate food for hhld needs

* code for Tanzania and Mozambique(with 5 reasons)

foreach month in "jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep" "oct" "nov" "dec" {
tab a3_`month', missing
encode a3_`month', generate(a3_`month'_n) label(yesno)	
tab a3_`month'_n, missing
drop a3_`month'

tab1 a3_`month'_reason_money a3_`month'_reason_weather a3_`month'_reason_less_desired ///
   a3_`month'_reason_ran_out a3_`month'_reason_not_available, missing
destring a3_`month'_reason_money a3_`month'_reason_weather a3_`month'_reason_less_desired ///
   a3_`month'_reason_ran_out a3_`month'_reason_not_available, replace
tab1 a3_`month'_reason_money a3_`month'_reason_weather a3_`month'_reason_less_desired ///
   a3_`month'_reason_ran_out a3_`month'_reason_not_available, missing
label values a3_`month'_reason_money a3_`month'_reason_weather a3_`month'_reason_less_desired ///
   a3_`month'_reason_ran_out a3_`month'_reason_not_available yesno
tab1 a3_`month'_reason_money a3_`month'_reason_weather a3_`month'_reason_less_desired ///
   a3_`month'_reason_ran_out a3_`month'_reason_not_available, missing
}
 
tab a3_calc, missing
destring a3_calc, replace
sum a3_calc
tab a3_calc, missing

* A4: Coping strategy - OU#3
tab1 a4_a- a4_other, missing
label define neveroften 0 "never" 1 "often"
label list neveroften
encode a4_a, generate(a4_a_n) label(neveroften)
encode a4_b, generate(a4_b_n) label(neveroften)
encode a4_c, generate(a4_c_n) label(neveroften)
encode a4_d, generate(a4_d_n) label(neveroften)
encode a4_e, generate(a4_e_n) label(neveroften)
encode a4_f, generate(a4_f_n) label(neveroften)
encode a4_g, generate(a4_g_n) label(neveroften)
encode a4_h, generate(a4_h_n) label(neveroften)
encode a4_i, generate(a4_i_n) label(neveroften)
encode a4_j, generate(a4_j_n) label(neveroften)
encode a4_k, generate(a4_k_n) label(neveroften)
encode a4_l, generate(a4_l_n) label(neveroften)
* NB the Mozambique data has 3 additional options that are not in the standard
* coping strategy questions -- identified here as "m", "n", and "o"
* the "other" category is the same as before
encode a4_m, generate(a4_m_n) label(neveroften)
encode a4_n, generate(a4_n_n) label(neveroften)
encode a4_o, generate(a4_o_n) label(neveroften)
encode a4_other, generate(a4_other_n) label(neveroften)
drop a4_a- a4_other

tab1 a4_a_n- a4_other_n, missing
sum a4_a_n- a4_other_n
tab a4_other_spec

* rename a4_other_n a4_m_n
rename a4_other_n a4_p_n
tab a4_calc, missing
destring a4_calc, replace
* sum a4_a_n- a4_m_n a4_calc
sum a4_a_n- a4_p_n a4_calc

* Section B: Sources of income/livelihoods
* B1: IGAs before participating
tab1 b1_farming_rain- b1_income_other, missing
destring  b1_farming_rain- b1_income_other, replace
label values b1_farming_rain- b1_income_other yesno
tab1 b1_farming_rain- b1_income_other, missing
sum b1_farming_rain- b1_income_other

* B2: IGAs after participating - PMF 200
tab1 b2_farming_rain- b2_income_other, missing
destring  b2_farming_rain- b2_income_other, replace
label values b2_farming_rain- b2_income_other yesno
tab1 b2_farming_rain- b2_income_other, missing
sum b2_farming_rain- b2_income_other

* B3: Change in income from partipation - PMF 200-2
tab1 b3 b3_1, missing
encode b3, generate(b3_n)  label(yesno)
encode b3_1, generate(b3_1_n)  label(yesno)
tab1 b3_n b3_1_n, missing
sum b3_n b3_1_n
drop b3 b3_1

* B4: Assets owned - OU#2
destring b4_1_own- b4_other_own_new, replace
label values b4_1_own- b4_other_own_new yesno
tab1 b4_1_own- b4_other_own_new, missing
tab1 b4_calc b4_calc_new, missing
destring b4_calc b4_calc_new, replace
tab1 b4_calc b4_calc_new, missing
sum b4_1_own- b4_other_own_new b4_calc b4_calc_new
tab b4_other_spec

* B5: Business plan/marketing strategy for IGAs -PMF 210-1
tab b5,missing
label define plan_lbl 0 "no_plan" 1 "yes_unwritten" 2 "yes_paper_plan"
encode b5, generate(b5_nr) label(plan_lbl)
tab b5_nr, missing
sum b5_nr
drop b5

* B6: Support to develop plan
tab1 b6_family- b6_staff, missing
destring b6_family- b6_staff, replace
label values b6_family- b6_staff yesno
tab1 b6_family- b6_staff, missing
sum b6_family- b6_staff
tab b6_other

* B7: Help to implement plan
tab b7, missing
encode b7, generate(b7_n) label(yesno)
tab b7_n, missing
sum b7_n
drop b7

tab1 b7_1_family- b7_1_staff, missing
destring b7_1_family- b7_1_staff, replace
label values b7_1_family- b7_1_staff yesno
tab1 b7_1_family- b7_1_staff, missing
sum b7_1_family- b7_1_staff

* B8: Confidence in management ability - PMF 210-2
tab b8, missing
label define confidence_lbl 1 "not_at_all" 2 "somewhat" 3 "very"
encode b8, generate(b8_n) label(confidence_lbl)
tab b8_n, missing
sum b8_n
drop b8

* Section C: Sustainable agriculture
* C1: Sustainable agriculture practices - PMF 100-1

tab1 c1_crop_rotation- c1_no_burn, missing
destring c1_crop_rotation- c1_no_burn, replace
label values c1_crop_rotation- c1_no_burn yesno
tab1 c1_crop_rotation- c1_no_burn, missing
sum c1_crop_rotation- c1_no_burn


* C2: Benefits of Sust Agr practices - PMF 110
tab1 c2_restore_land- c2_afford_fertilizer, missing
destring c2_restore_land- c2_afford_fertilizer, replace
label values c2_restore_land- c2_afford_fertilizer yesno
tab1 c2_restore_land- c2_afford_fertilizer, missing
sum c2_restore_land- c2_afford_fertilizer
tab c2_other

* C3: Crop varieties grown in past year - PMF 120-2
tab1 c3_ervilha_fejiao- c3_sweet_potato_of, missing
destring c3_ervilha_fejiao- c3_sweet_potato_of, replace
label values c3_ervilha_fejiao- c3_sweet_potato_of yesno
tab1 c3_ervilha_fejiao- c3_sweet_potato_of, missing
sum c3_ervilha_fejiao- c3_sweet_potato_of

* C4: Growing improved varieties - PMF 120-2
tab c4, missing
encode c4, generate(c4_n) label(yesno)
tab c4_n, missing
sum c4_n
drop c4

* C5: Varieties grown since joining program
tab1 c5_lettuce- c5_groundnuts, missing
destring c5_lettuce- c5_groundnuts, replace
label values c5_lettuce- c5_groundnuts yesno
tab1 c5_lettuce- c5_groundnuts, missing
sum c5_lettuce- c5_groundnuts

* C6: Access to water for farming - PMF 117
tab c6, missing
encode c6, generate(c6_n) label(yesno)	
tab c6_n, missing
sum c6_n
drop c6

tab1 c6_wells_new- c6_other_use, missing
destring c6_wells_new- c6_other_use, replace
label values c6_wells_new- c6_other_use yesno
tab1 c6_wells_new- c6_other_use, missing
sum c6_wells_new- c6_other_use
tab c6_other_spec

tab1 c6_calc c6_calc_new, missing
destring c6_calc c6_calc_new, replace
tab1 c6_calc c6_calc_new, missing
sum c6_calc c6_calc_new

* C7: Crops storage practices - PMF 116-1
tab1 c7_trad_bags_new- c7_improved_silo_use, missing
destring c7_trad_bags_new- c7_improved_silo_use, replace
label values c7_trad_bags_new- c7_improved_silo_use yesno
tab1 c7_trad_bags_new- c7_improved_silo_use, missing
sum c7_trad_bags_new- c7_improved_silo_use

tab1 c7_calc c7_calc_new, missing
destring c7_calc c7_calc_new, replace
tab1 c7_calc c7_calc_new, missing
sum c7_calc c7_calc_new

/* not in Mozambique data
* C8: Types of livestock raised - PMF130-1
*/

* Familiarity with CA before (c10) and now (c11)
* C10: Familiarity with Sust Agr before - PMF 110-1
tab c10, missing
label define knowledge_lbl 1 "no_knowledge" 2 "little_knowledge" 3 "some_knowledge" 4 "know_teach"
encode c10, generate(c10_nr) label(knowledge_lbl)
tab c10_nr,missing
drop c10

* C11: Familiarity with Sust Agr now - PMF 110-1
tab c11, missing
label define knowledge_now_lbl 1 "no_knowledge_now" 2 "little_knowledge_now" 3 "some_knowledge_now" 4 "know_teach_now"
encode c11, generate(c11_nr) label(knowledge_now_lbl)
tab c11_nr, missing
drop c11

* C12: Usefulness of practices - PMF 110-2
tab c12, missing
label define useful_lbl 0 "not_useful" 1 "somewhat_useful" 2 "very_useful"
encode c12, generate(c12_nr) label(useful_lbl)
tab c12_nr, missing
sum c12_nr
drop c12

* C13: Women's access to land - PMF 140-2
* C14: Women's access to inputs - PMF 120-1
tab1 c13 c14, missing
label define confidence_access_lbl 0 "not_at_all" 1 "somewhat" 2 "very"
encode c13, generate(c13_nr) label(confidence_access_lbl)
encode c14, generate(c14_nr) label(confidence_access_lbl)
tab1 c13_nr c14_nr, missing
sum c13_nr c14_nr
drop c13 c14 

* C15: Land tenure - PMF140-2
tab1 c15_no_land- c15_long_lease, missing
destring c15_no_land- c15_long_lease, replace
label values c15_no_land- c15_long_lease yesno
tab1 c15_no_land- c15_long_lease, missing
sum c15_no_land- c15_long_lease

/* not in Mozambique data
* C16: Support received from one of the project partners (Geita or MUD) - PMF 140-2
* Section D: Literacy
* D1: Participation in a literacy/numeracy program - PMF 222
* D2: Finished the course
* D3: Passing the test - PMF 220-1
* D4: Involved in a community group - PMF 220-3
* D5: Type of group
* D6: Frequency of use of lit/num skills - PMF 220-2
* D7: Help provided by the lit/num skills- PMF 220-3
* D8: How the skills have been used
*/

* Section E: Access to finance (savings and credit)
* E1: Savings - PMF 210
tab1 e1 e2 e3, missing
encode e1, generate(e1_n) label(yesno)		

* E2: Save with a VSLA - PMF 210
encode e2, generate(e2_n) label(yesno)		

* E3: Loan from WVSL - PMF 210
encode e3, generate(e3_n) label(yesno)		
tab1 e1_n e2_n e3_n, missing
sum  e1_n e2_n e3_n
drop e1 e2 e3

* E4: Use of money from loan - PMF 210
tab1 e4_family_event- e4_medical , missing
destring e4_family_event- e4_medical , replace
label values e4_family_event- e4_medical yesno
tab1 e4_family_event- e4_medical , missing
sum e4_family_event- e4_medical

* E5: Loan repaid - PMF 210
tab e5, missing
encode e5, generate(e5_n) label(yesno)		
tab e5_n, missing
sum e5_n
drop e5

* E6: Expect to repay in future - PMF 210
tab e6, missing
encode e6, generate(e6_n) label(yesno)		
tab e6_n, missing
sum e6_n
drop e6

/* not in Bangladesh
* E7: Graduated from ODES funding - PMF 210
* E8: Type of support received since group graduated
*/

* Put variables back in original order
order respondent_num partner_n gender_n age_nr town district program_vsl ///
program_community_leadership program_agriculture ///
a1_a_n a1_b_n a1_c_n a1_d_n a1_e_n a1_f_n a1_g_n ///
a1_meals_hh a1_meals_ind a1_meals_none a1_meals_others ///
a2_a_n a2_b_n a2_c_n a2_d_n a2_e_n a2_f_n a2_g_n a2_h_n a2_i_n a2_j_n a2_k_n ///
a2_meals_hh a2_meals_ind a2_meals_none a2_meals_others ///
a3_jan_n a3_jan_reason_money a3_jan_reason_weather a3_jan_reason_less_desired ///
a3_jan_reason_ran_out a3_jan_reason_not_available ///
a3_feb_n a3_feb_reason_money a3_feb_reason_weather a3_feb_reason_less_desired ///
a3_feb_reason_ran_out a3_feb_reason_not_available ///
a3_mar_n a3_mar_reason_money a3_mar_reason_weather a3_mar_reason_less_desired ///
a3_mar_reason_ran_out a3_mar_reason_not_available ///
a3_apr_n a3_apr_reason_money a3_apr_reason_weather a3_apr_reason_less_desired ///
a3_apr_reason_ran_out a3_apr_reason_not_available ///
a3_may_n a3_may_reason_money a3_may_reason_weather a3_may_reason_less_desired ///
a3_may_reason_ran_out a3_may_reason_not_available ///
a3_jun_n a3_jun_reason_money a3_jun_reason_weather a3_jun_reason_less_desired ///
a3_jun_reason_ran_out a3_jun_reason_not_available ///
a3_jul_n a3_jul_reason_money a3_jul_reason_weather a3_jul_reason_less_desired ///
a3_jul_reason_ran_out a3_jul_reason_not_available ///
a3_aug_n a3_aug_reason_money a3_aug_reason_weather a3_aug_reason_less_desired ///
a3_aug_reason_ran_out a3_aug_reason_not_available ///
a3_sep_n a3_sep_reason_money a3_sep_reason_weather a3_sep_reason_less_desired ///
a3_sep_reason_ran_out a3_sep_reason_not_available ///
a3_oct_n a3_oct_reason_money a3_oct_reason_weather a3_oct_reason_less_desired ///
a3_oct_reason_ran_out a3_oct_reason_not_available ///
a3_nov_n a3_nov_reason_money a3_nov_reason_weather a3_nov_reason_less_desired ///
a3_nov_reason_ran_out a3_nov_reason_not_available ///
a3_dec_n a3_dec_reason_money a3_dec_reason_weather a3_dec_reason_less_desired ///
a3_dec_reason_ran_out a3_dec_reason_not_available a3_calc ///
a4_a_n a4_b_n a4_c_n a4_d_n a4_e_n a4_f_n a4_g_n a4_h_n a4_i_n a4_j_n a4_k_n ///
a4_l_n a4_m_n a4_n_n a4_o_n a4_p_n a4_other_spec a4_calc ///
b1_farming_rain b1_farming_irrigation b1_livestock_animals b1_fishing ///
b1_livestock_products b1_processing b1_day_labour b1_other_business ///
b1_outside_money b1_income_other ///
b2_farming_rain b2_farming_irrigation b2_livestock_animals b2_fishing ///
b2_livestock_products b2_processing b2_day_labour b2_other_business ///
b2_outside_money b2_income_other ///
b3_1_n b3_n b4_1_own b4_1_own_new b4_2_own b4_2_own_new b4_3_own b4_3_own_new ///
b4_4_own b4_4_own_new b4_5_own b4_5_own_new b4_6_own b4_6_own_new b4_7_own b4_7_own_new ///
b4_8_own b4_8_own_new b4_other_own b4_other_own_new b4_other_spec b4_calc b4_calc_new ///
b5_nr b6_staff b6_farmer_group b6_saving_group b6_community_group b6_government ///
b6_family b6_neighbours b6_other_staff b6_other_source b6_other ///
b7_n b7_1_staff b7_1_farmer_group b7_1_saving_group b7_1_community_group ///
b7_1_government b7_1_family b7_1_neighbours b7_1_other_staff b7_1_other_source ///
b8_n c1_min_till c1_soil_cover c1_crop_rotation c1_intercrop c1_compost c1_bio_pest ///
c1_manure_tea c1_seed_space c1_no_burn c2_yield c2_afford_fertilizer c2_better_soil ///
c2_restore_land c2_more_food c2_more_meals c2_healthy_family c2_less_labour ///
c2_resilient_crop c2_less_pests c2_other_benefit c2_afford_pesticides c2_other ///
c3_sweet_potato_of c3_cowpea_sixty c3_dr_maize c3_dr_cassava c3_groundnuts_dr ///
c3_ervilha_fejiao c3_mucuna c4_n c5_tomatoes c5_lettuce c5_onions c5_cabbage ///
c5_groundnuts c6_n c6_wells_new c6_wells_use c6_pump_new c6_pump_use c6_drip_new ///
c6_drip_use c6_rain_new c6_rain_use c6_river_new c6_river_use c6_lake_new ///
c6_lake_use c6_no_access_new c6_no_access_use c6_other_new c6_other_use ///
c6_other_spec c6_calc c6_calc_new c7_trad_bags_new c7_trad_bags_use ///
c7_trad_silo_new c7_trad_silo_use c7_PICS_bags_new c7_PICS_bags_use ///
c7_improved_silo_new c7_improved_silo_use c7_calc c7_calc_new ///
c10_nr c11_nr c12_nr c13_nr c14_nr ///
c15_formal_title c15_long_lease c15_no_land c15_short_lease c15_traditional_title ///
e1_n e2_n e3_n e4_buy_food e4_family_event e4_fund_ag_inputs e4_fund_iga ///
e4_household e4_medical e4_other_use e4_school e5_n e6_n   
 
sum
describe, fullnames
 
save "Outfiles\Labelled and cleaned-Mozambique.dta", replace


