clear
set more off
/*
*******************************************************************************************
*******************************************************************************************
**     DATE:       January 2018
**     PROGRAM:    Data for inclusion with trend analysis
**                      - combine the 5 country datasets, order variables
**                      - add variable labels for those created during analysis
**                      - generate data for trend data analysis
**     AUTHOR:     Douglas R Brown
********************************************************************************************
********************************************************************************************
*/
 
cd "C:\data\WorldRenewData\"

* combine all 5 datasets and order them to match survey order
use "Outfiles\FinalData-Mozambique.dta" ,clear

append using "Outfiles\FinalData-Bangladesh.dta" "Outfiles\FinalData-Honduras.dta" ///
"Outfiles\FinalData-Mali.dta" "Outfiles\FinalData-Tanzania.dta", generate(Source_file) force

order unique_id country respondent_num partner_n gender_n age_nr town district ///
program_vsl program_community_leadership program_agriculture program_literacy ///
ActivityCount FoodFrequencyScore FoodDiversityScore NumMonthsWithEnough ///
NumHungryMonths NumCopingStrategiesUsed NumCopingStrategiesUsed2 ///
NumIncomeSourceBefore NumIncomeSourceNow ChangeInNumSources HasBusinessPlan ///
HasConfidence PracticeSustAgr_all PracticeSustAgr_agr CA_Principle_1 CA_Principle_2 ///
CA_Principle_3 CA_num_practices CA_practitioner CA_full_practitioner IncreasedYieldFromSustAgr ///
GrowDiseaseResist UseImprovedStorage_3_4 UseImprovedStorage_2_3_4 ///
Change_in_knowledge Usefulness_Sust_Agr HasConfidence_seed_fert Secure_tenure ///
PracticeAnimHusbandry PracticeAnimHusbandry1 PracticeAnimHusbandry2 ///
PracticeAnimHusbandry3 PracticeAnimHusbandry4 Used_literacy_skills  ///
a1_a_n a1_b_n a1_c_n a1_d_n a1_e_n a1_f_n a1_g_n a1_meals_hh a1_meals_ind a1_meals_none ///
a1_meals_others a2_a_n a2_b_n a2_c_n a2_d_n a2_e_n a2_f_n a2_g_n a2_h_n a2_i_n a2_j_n ///
a2_k_n a2_meals_hh a2_meals_ind a2_meals_none a2_meals_others ///
a3_jan_n a3_jan_reason_money a3_jan_reason_weather a3_jan_reason_less_desired ///
a3_jan_reason_ran_out a3_jan_reason_not_available a3_feb_n a3_feb_reason_money ///
a3_feb_reason_weather a3_feb_reason_less_desired a3_feb_reason_ran_out ///
a3_feb_reason_not_available a3_mar_n a3_mar_reason_money a3_mar_reason_weather ///
a3_mar_reason_less_desired a3_mar_reason_ran_out a3_mar_reason_not_available ///
a3_apr_n a3_apr_reason_money a3_apr_reason_weather a3_apr_reason_less_desired ///
a3_apr_reason_ran_out a3_apr_reason_not_available a3_may_n a3_may_reason_money ///
a3_may_reason_weather a3_may_reason_less_desired a3_may_reason_ran_out ///
a3_may_reason_not_available a3_jun_n a3_jun_reason_money a3_jun_reason_weather ///
a3_jun_reason_less_desired a3_jun_reason_ran_out a3_jun_reason_not_available ///
a3_jul_n a3_jul_reason_money a3_jul_reason_weather a3_jul_reason_less_desired ///
a3_jul_reason_ran_out a3_jul_reason_not_available a3_aug_n a3_aug_reason_money ///
a3_aug_reason_weather a3_aug_reason_less_desired a3_aug_reason_ran_out ///
a3_aug_reason_not_available a3_sep_n a3_sep_reason_money a3_sep_reason_weather ///
a3_sep_reason_less_desired a3_sep_reason_ran_out a3_sep_reason_not_available ///
a3_oct_n a3_oct_reason_money a3_oct_reason_weather a3_oct_reason_less_desired ///
a3_oct_reason_ran_out a3_oct_reason_not_available a3_nov_n a3_nov_reason_money ///
a3_nov_reason_weather a3_nov_reason_less_desired a3_nov_reason_ran_out ///
a3_nov_reason_not_available a3_dec_n a3_dec_reason_money a3_dec_reason_weather ///
a3_dec_reason_less_desired a3_dec_reason_ran_out a3_dec_reason_not_available ///
a3_calc a4_a_n a4_b_n a4_c_n a4_d_n a4_e_n a4_f_n a4_g_n a4_h_n a4_i_n a4_j_n ///
a4_k_n a4_l_n a4_m_n a4_n_n a4_o_n a4_p_n a4_other_spec a4_calc b1_day_labour ///
b1_farming_irrigation b1_farming_rain b1_fishing b1_honey b1_income_other ///
b1_livestock_animals b1_livestock_products b1_other_business b1_outside_money ///
b1_processing b2_day_labour b2_farming_irrigation b2_farming_rain b2_fishing ///
b2_honey b2_income_other b2_livestock_animals b2_livestock_products b2_other_business ///
b2_outside_money b2_processing b3_1_n b3_n b4_1_own b4_1_own_new b4_2_own ///
b4_2_own_new b4_3_own b4_3_own_new b4_4_own b4_4_own_new b4_5_own b4_5_own_new ///
b4_6_own b4_6_own_new b4_7_own b4_7_own_new b4_8_own b4_8_own_new b4_calc b4_calc_new ///
b4_other_own b4_other_own_new b4_other_spec b5_nr b6_community_group b6_family ///
b6_farmer_group b6_government b6_local_bank b6_neighbours b6_other b6_other_source ///
b6_other_staff b6_saving_group b6_staff b7_1_community_group b7_1_family ///
b7_1_farmer_group b7_1_government b7_1_local_bank b7_1_neighbours b7_1_other_source ///
b7_1_other_staff b7_1_saving_group b7_1_staff b7_n b8_n c1_agroforestry c1_bio_pest ///
c1_bund_diguette c1_compost c1_contour_farming c1_crop_diversification ///
c1_crop_rotation c1_ecosan c1_fallow c1_family_gardens c1_fertilizer c1_floating_garden ///
c1_garden_mgmt c1_garden_sacks c1_gmcc c1_intercrop c1_kassine c1_kitchen_garden ///
c1_manure c1_manure_tea c1_min_till c1_no_burn c1_oxen c1_plasa c1_polytunnels ///
c1_raised_bed c1_raised_beds c1_sand_dam c1_seed_space c1_soil_cover c1_sri ///
c1_stone_bunds c1_trees c1_vegetable_techniques c2_afford_fertilizer c2_afford_food ///
c2_afford_pesticides c2_afford_rice c2_better_soil c2_healthy_family c2_less_labour ///
c2_less_pests c2_less_water c2_more_food c2_more_meals c2_other c2_other_benefit ///
c2_resilient_crop c2_restore_land c2_water_rice c2_yield c3_camote c3_cowpea ///
c3_cowpea_sixty c3_dr_beans c3_dr_cassava c3_dr_maize c3_dr_sorghum c3_dr_tomatoes ///
c3_ervilha_fejiao c3_groundnuts_dr c3_millet_dr c3_mucuna c3_other_crops_improved ///
c3_papaya c3_pataste c3_rice_dr c3_rice_fr c3_sweet_potato_of c4_n c5_avocado ///
c5_banana c5_beans c5_beets c5_beets_sugar c5_broccoli c5_cabbage c5_cacao ///
c5_carrots c5_cassava c5_celery c5_chayote c5_cilantro c5_cucumbers c5_garlic ///
c5_gourds c5_groundnuts c5_irish_potato c5_jackbean c5_lablab c5_lettuce c5_limes ///
c5_maize c5_malanga c5_moringa c5_mucuna c5_okra c5_onions c5_other c5_other_crop ///
c5_parsley c5_passionfruit c5_pea c5_pineapple c5_plantain c5_potatoes c5_pumpkins ///
c5_radish c5_rice c5_sorrel c5_soybeans c5_spinach c5_spinach_greens c5_squash ///
c5_sunflower c5_sweet_pepper c5_sweet_potato c5_swiss_chard c5_tomatoes c5_watermelon ///
c5_zucchini c6_bund_new c6_bund_use c6_calc c6_calc_new c6_canals_new c6_canals_use ///
c6_dams_new c6_dams_use c6_drip_new c6_drip_use c6_lake_new c6_lake_use c6_n ///
c6_no_access_new c6_no_access_use c6_other_new c6_other_spec c6_other_use ///
c6_piping_new c6_piping_use c6_pump_new c6_pump_use c6_rain_new c6_rain_use ///
c6_river_new c6_river_use c6_water_storage_new c6_water_storage_use c6_wells_new ///
c6_wells_use c6_zai_new c6_zai_use c7_calc c7_calc_new c7_improved_silo_new ///
c7_improved_silo_use c7_other_new c7_other_spec c7_other_use c7_PICS_bags_new ///
c7_PICS_bags_use c7_trad_bags_new c7_trad_bags_use c7_trad_silo_new c7_trad_silo_use ///
c8_bees_new c8_bees_use c8_calc c8_calc_new c8_cattle_new c8_cattle_use ///
c8_chickens_ducks_new c8_chickens_ducks_use c8_chickens_new c8_chickens_use ///
c8_ducks_new c8_ducks_use c8_fish_new c8_fish_use c8_goats_new c8_goats_use ///
c8_guinea_pigs_new c8_guinea_pigs_use c8_interfish_new c8_interfish_use ///
c8_none_new c8_none_use c8_other_new c8_other_spec c8_other_use c8_pigs_new ///
c8_pigs_use c8_rabbits_new c8_rabbits_use c8_snails_new c8_snails_use ///
c9_1_enclosures_before c9_1_feed_source_before c9_1_grazing_before ///
c9_1_other_practice_before c9_1_vaccinations_before c9_calc c9_calc_new ///
c9_disease_new c9_disease_use c9_enclosures_new c9_enclosures_use c9_feed_new ///
c9_feed_source_use c9_feed_use c9_flock_new c9_flock_use c9_grazing_new ///
c9_grazing_use c9_herd_mgmt_new c9_herd_mgmt_use c9_hygiene_new c9_hygiene_use ///
c9_other_new c9_other_practice_use c9_other_spec c9_other_use c9_parasites_new ///
c9_parasites_use c9_sanitary_slaughter_new c9_sanitary_slaughter_use ///
c9_vaccinations_new c9_vaccinations_use c10_nr c11_nr c12_nr c13_nr c14_nr ///
c15_formal_title c15_long_lease c15_no_land c15_short_lease c15_traditional_title ///
c16_n d1_n d2_nr d3_n d4_n d5_nr d5_other d6_nr d7_n d8_manage_hh d8_manage_iga ///
d8_more_respect d8_more_self_esteem d8_other_use d8_personal d8_with_children d8_with_group ///
e1_n e2_n e3_n e4_buy_food e4_family_event e4_fund_ag_inputs e4_fund_iga ///
e4_household e4_medical e4_other e4_other_use e4_school e5_n e6_n e7_n ///
e8_advice e8_financial_support e8_other_group_support Source_file 

* add variable names to data
label variable ActivityCount "Number of program activities engaged in by respondents"
label variable FoodFrequencyScore "Food frequency score (FFS)"
label variable FoodDiversityScore "Food diversity score (FDS)"
label variable NumMonthsWithEnough "Number of months with enough food (sum of a3_jan_n to a3_dec_n)"
label variable NumHungryMonths "Seasonal Food Security Score (SFSS) or Number of months without enough food (12-NumMonthsWithEnough)"
label variable NumCopingStrategiesUsed "Coping strategy index (CSI)"
label variable NumCopingStrategiesUsed2 "Coping strategy index (CSI) with 3 additional coping strategies (used for Mozambique only)"
label variable NumIncomeSourceBefore "Number of IGAs prior to participation in project"
label variable NumIncomeSourceNow "Number of IGAs now following participation in project"
label variable ChangeInNumSources "Diffence in number of IGAs before and after participation"
label variable HasBusinessPlan "Has a business plan - unwritten or written"
label variable HasConfidence "Confidence in management ability - somewhat or very"
label variable PracticeSustAgr_all "Practice one or more sustainable agricultural practices"
label variable PracticeSustAgr_agr "Practice one or more sustainable agricultural practices"
label variable CA_Principle_1 "Uses minimum tillage (CA Principle #1)"
label variable CA_Principle_2 "Keeps soil covered (CA Principle #2)"
label variable CA_Principle_3 "Practices intercropping and/or crop rotation (CA Principle #3)"
label variable CA_num_practices "Number of CA principles employed"
label variable CA_practitioner "Partial CA adoption (adopting 2 or more of the 3 principles"
label variable CA_full_practitioner "Complete CA adoption (adopting all 3 principles)"
label variable IncreasedYieldFromSustAgr "Noticed an increased yield from sustainable agricultural practices"
label variable GrowDiseaseResist "Growing at least one disease resistant or drought tolerant crop"
label variable UseImprovedStorage_3_4 "Used PICS bags or a metal/improved silo"
label variable UseImprovedStorage_2_3_4 "Used traditional silo, PICS bags or a metal/improved silo"
label variable PracticeAnimHusbandry "Raised at least one type of livestock"
label variable PracticeAnimHusbandry1 "Raised at least one type of livestock"
label variable PracticeAnimHusbandry2 "Raised at least one type of livestock"
label variable PracticeAnimHusbandry3 "Used at least one improved animal husbandry practice"
label variable PracticeAnimHusbandry4 "Used at least one improved animal husbandry practice"
label variable Change_in_knowledge "Difference between self-reported level of knowledge of sustainable agriculture now and before (c11-c10)"
label variable Usefulness_Sust_Agr "Sustainable agricultural practices are somewhat or very useful"
label variable HasConfidence_seed_fert "Confidence in ability to access seed/fert - somewhat or very"
label variable Secure_tenure "Farmer has secure tenure - formal or traditional title, short or long term lease"
label variable Used_literacy_skills "Literacy skills helped -- management of IGA, community group, self-esteem"

* two observations have missing data throughout -- remove them from final dataset
drop if unique_id==307004
drop if unique_id==307005

describe, fullnames
sum 

* generate data for trend analysis

bysort partner_n: tab b4_1_own gender_n
bysort partner_n: tab b4_3_own gender_n
bysort partner_n: tab b4_4_own gender_n
bysort partner_n: tab b4_5_own gender_n

mean FoodFrequencyScore FoodDiversityScore NumHungryMonths NumCopingStrategiesUsed
forval num = 1/12 {
mean FoodFrequencyScore FoodDiversityScore NumHungryMonths NumCopingStrategiesUsed if partner_n==`num'
}

* 100-2
tab IncreasedYieldFromSustAgr gender_n
bysort partner_n: tab IncreasedYieldFromSustAgr gender_n

* 200-2
tab b3_1_n gender_n
bysort partner_n: tab b3_1_n gender_n

* 110-2
tab Usefulness_Sust_Agr gender_n
bysort partner_n: tab Usefulness_Sust_Agr gender_n

* 120-1
tab HasConfidence_seed_fert gender_n
bysort partner_n: tab HasConfidence_seed_fert gender_n

* 120-2
tab GrowDiseaseResist gender_n
bysort partner_n: tab GrowDiseaseResist gender_n

* 210-2
tab HasConfidence gender_n
bysort partner_n: tab HasConfidence gender_n

* 220-2
tab Used_literacy_skills gender_n
bysort partner_n: tab Used_literacy_skills gender_n

* 220-3
tab d7_n gender_n
bysort partner_n: tab d7_n  gender_n

* 140-2
tab Secure_tenure gender_n
bysort partner_n: tab Secure_tenure gender_n

* 210-1
tab HasBusinessPlan gender_n
bysort partner_n: tab HasBusinessPlan gender_n

* 220-1
tab d3_n gender_n
bysort partner_n: tab d3_n gender_n

* 110-1
tab c10_nr
tab c11_nr
tab Change_in_knowledge
generate Increased_knowledge=Change_in_knowledge
recode Increased_knowledge (-3 = 0) (-2 = 0) (-1 = 0) (1 = 1) (2 = 1) (3 = 1)
tab Increased_knowledge
tab Increased_knowledge gender_n
bysort partner_n: tab Increased_knowledge gender_n
label variable Increased_knowledge "Perceived level of knowledge now is greater than before"

* 130-1
tab PracticeAnimHusbandry1 gender_n
bysort partner_n: tab PracticeAnimHusbandry1 gender_n

order unique_id country respondent_num partner_n gender_n age_nr town district ///
program_vsl program_community_leadership program_agriculture program_literacy ///
ActivityCount FoodFrequencyScore FoodDiversityScore NumMonthsWithEnough ///
NumHungryMonths NumCopingStrategiesUsed NumCopingStrategiesUsed2 ///
NumIncomeSourceBefore NumIncomeSourceNow ChangeInNumSources HasBusinessPlan ///
HasConfidence PracticeSustAgr_all PracticeSustAgr_agr CA_Principle_1 CA_Principle_2 ///
CA_Principle_3 CA_num_practices CA_practitioner CA_full_practitioner IncreasedYieldFromSustAgr ///
GrowDiseaseResist UseImprovedStorage_3_4 UseImprovedStorage_2_3_4 ///
Change_in_knowledge Usefulness_Sust_Agr HasConfidence_seed_fert Secure_tenure ///
PracticeAnimHusbandry PracticeAnimHusbandry1 PracticeAnimHusbandry2 ///
PracticeAnimHusbandry3 PracticeAnimHusbandry4 Used_literacy_skills Increased_knowledge 

* save combined file for regression and other analysis
save "C:\data\WorldRenewData\Outfiles\FinalData-Combined.dta", replace


