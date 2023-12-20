# Exporting unsterilized version of clean datasets -----------------------------
write.xlsx(clean_data.tool0, paste0(output_data_path, "cleaned_dfs/unsterilized/EERA_Public_SchoolCBE_Data_Entry_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool1_EERA_Public_School_Headmaster_Interview_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool2_EERA_Public_School_Light_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool3_EERA_Public_School_Student_Document_Headcount_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool4_EERA_Public_School_Teacher_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool5_EERA_Public_School_WASH_Observation_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool6_EERA_Public_School_Parent_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool7_EERA_Public_School_Shura_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool8_EERA_CBE_Class_Level_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9, paste0(output_data_path, "cleaned_dfs/unsterilized/Tool9_EERA_CBE_IP_Level_Tool_", Sys.Date(),".xlsx"))

# Exporting unsterilized version of clean datasets -----------------------------
write.xlsx(clean_data.tool0_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/EERA_Public_SchoolCBE_Data_Entry_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool1_EERA_Public_School_Headmaster_Interview_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool2_EERA_Public_School_Light_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool3_EERA_Public_School_Student_Document_Headcount_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool4_EERA_Public_School_Teacher_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool5_EERA_Public_School_WASH_Observation_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool6_EERA_Public_School_Parent_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool7_EERA_Public_School_Shura_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool8_EERA_CBE_Class_Level_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_ulabeled, paste0(output_data_path, "cleaned_dfs/cleaned_data/Tool9_EERA_CBE_IP_Level_Tool_", Sys.Date(),".xlsx"))

# Exporting for client version of clean datasets -------------------------------
# write.xlsx(clean_data.tool0_for_client, paste0(output_data_path, "cleaned_dfs/for_client/EERA_Public_SchoolCBE_Data_Entry_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool1_EERA_Public_School_Headmaster_Interview_cleaned_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool2_EERA_Public_School_Light_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool3_EERA_Public_School_Student_Document_Headcount_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool4_EERA_Public_School_Teacher_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool5_EERA_Public_School_WASH_Observation_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool6_EERA_Public_School_Parent_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool7_EERA_Public_School_Shura_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool8_EERA_CBE_Class_Level_Tool_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_for_client, paste0(output_data_path, "cleaned_dfs/for_client/Tool9_EERA_CBE_IP_Level_Tool_", Sys.Date(),".xlsx"))


# file.edit("./R/sample_dfs.R")

# Export other outputs ---------------------------------------------------------
# export issues in data sets
if (nrow(correction_log_discrep) > 0){
  
  write.xlsx(correction_log_discrep, paste0(output_data_path, "issues/correction_log_issues/correction_log_issues_", Sys.Date(),".xlsx"))
}

if (nrow(repeat_sheet_issues) > 0){
  write.xlsx(repeat_sheet_issues, paste0(output_data_path, "issues/repeat_sheet_issues/repeat_sheet_issues_", Sys.Date(),".xlsx"))
}

if (nrow(missing_translations) > 0){
  write.xlsx(missing_translations, paste0(output_data_path, "issues/translation_missing/missing_translations_", Sys.Date(),".xlsx"))
}

if (nrow(missing_qa) > 0){
  write.xlsx(missing_qa, paste0(output_data_path, "issues/qa_missing/missing_qa_", Sys.Date(),".xlsx"))
}

if (nrow(un_logged_values) > 0){
  write.xlsx(un_logged_values, paste0(output_data_path, "issues/other_responses/unlogged_other_responses_", Sys.Date(),".xlsx"))
}

if (nrow(Logic_check_result) > 0){
  write.xlsx(Logic_check_result, paste0(output_data_path, "issues/logic_checks/logic_checks_", Sys.Date(),".xlsx"))
}

# Logic Check Data Entry
if(nrow(logic_check_data_entry_final) > 0){
  write.xlsx(logic_check_data_entry_final, paste0(output_data_path, "issues/logic_checks/logic_checks_Data_Entry_Tool_", Sys.Date(),".xlsx"))
}

# if (nrow(calculate_issues) > 0){
#   write.xlsx(calculate_issues, paste0(output_data_path, "issues/calculate_issues/calculate_issues_", Sys.Date(),".xlsx"))
# }

sm_question_issues_dfs = list(
  # "NA issues in select_multiple" = sm_na_issues,
  "parent_series_inconsistencies" = sm_check_result
)

if (nrow(sm_check_result) > 0){
  write.xlsx(sm_question_issues_dfs, paste0(output_data_path, "issues/sm_issues/sm_check_result_", Sys.Date(),".xlsx"))
}

if (nrow(outlier_check_result) > 0){
  write.xlsx(outlier_check_result, paste0(output_data_path, "issues/outliers/outlier_check_result_", Sys.Date(),".xlsx"))
}

if (nrow(over_sampled_extra_ints) > 0){
  write.xlsx(over_sampled_extra_ints, paste0(output_data_path, "issues/over_sampled/over_sampled_extra_ints_", Sys.Date(),".xlsx"))
}

if (nrow(missing_not_interviewed_site) > 0){
  write.xlsx(missing_not_interviewed_site, paste0(output_data_path, "issues/interview_missing/missing_not_interviewed_Sites_", Sys.Date(),".xlsx"))
}

if (nrow(wrong_choices_result) > 0){
  write.xlsx(wrong_choices_result, paste0(output_data_path, "issues/wrong_choices/wrong_choices_result_", Sys.Date(),".xlsx"))
}

if (nrow(relevancy_issues) > 0){
  write.xlsx(relevancy_issues, paste0(output_data_path, "issues/relevancy_checks/relevancy_issues_", Sys.Date(),".xlsx"))
}

qa_issues_dfs = list(
  "not QAed interviews" = not_qaed_ints,
  "inconsistency in QA_status" = inconsistent_qa_status,
  "inconsistency in QA interviews" = int_in_qa_sheet_not_in_df
) 

if (nrow(not_qaed_ints) > 0 | nrow(inconsistent_qa_status) > 0 | nrow(int_in_qa_sheet_not_in_df) > 0){
  write.xlsx(qa_issues_dfs, paste0(output_data_path, "issues/qaed_inconsistencies/QAed_ints_inconsistencies_", Sys.Date(),".xlsx")) # DONE
}

# if (nrow(GIS_flag) > 0){
#   write.xlsx(GIS_flag, paste0(output_data_path, "issues/GIS_flags/GIS_flag_", Sys.Date(),".xlsx"))
# }


