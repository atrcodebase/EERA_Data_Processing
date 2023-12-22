clean_data.tool0_sample <- clean_data.tool0_for_client
clean_data.tool1_sample <- clean_data.tool1_for_client
clean_data.tool2_sample <- clean_data.tool2_for_client
clean_data.tool3_sample <- clean_data.tool3_for_client
clean_data.tool4_sample <- clean_data.tool4_for_client
clean_data.tool5_sample <- clean_data.tool5_for_client
clean_data.tool6_sample <- clean_data.tool6_for_client
clean_data.tool7_sample <- clean_data.tool7_for_client
clean_data.tool8_sample <- clean_data.tool8_for_client
clean_data.tool9_sample <- clean_data.tool9_for_client

n_sample = 200

# Tool 0 - Data Entry
clean_data.tool0_sample$data <- sample_n(clean_data.tool0_for_client$data, n_sample)
clean_data.tool0_sample$Tool3_Grades_Repeat <- clean_data.tool0_for_client$Tool3_Grades_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)
clean_data.tool0_sample$Tool3_Class_Attendance  <- clean_data.tool0_for_client$Tool3_Class_Attendance %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)  
clean_data.tool0_sample$Tool3_T3_N_Classes_Repeat  <- clean_data.tool0_for_client$Tool3_T3_N_Classes_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)
clean_data.tool0_sample$Tool3_Headcount  <- clean_data.tool0_for_client$Tool3_Headcount %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)
clean_data.tool0_sample$Tool1_Timetable_Year  <- clean_data.tool0_for_client$Tool1_Timetable_Year %>% filter(PARENT_KEY %in% clean_data.tool0_sample$data$KEY)
clean_data.tool0_sample$Tool1_Timetable1_Repeat  <- clean_data.tool0_for_client$Tool1_Timetable1_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$Tool1_Timetable_Year$KEY)
clean_data.tool0_sample$Tool1_Timetable2_Repeat  <- clean_data.tool0_for_client$Tool1_Timetable2_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$Tool1_Timetable_Year$KEY)
clean_data.tool0_sample$Tool1_Timetable3_Repeat  <- clean_data.tool0_for_client$Tool1_Timetable3_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$Tool1_Timetable_Year$KEY)
clean_data.tool0_sample$Tool1_Timetable4_Repeat  <- clean_data.tool0_for_client$Tool1_Timetable4_Repeat %>% filter(PARENT_KEY %in% clean_data.tool0_sample$Tool1_Timetable_Year$KEY)

# Tool 1
clean_data.tool1_sample$data <- sample_n(clean_data.tool1_for_client$data, n_sample)
clean_data.tool1_sample$Support_Respondents <- clean_data.tool1_for_client$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$School_Operationality <- clean_data.tool1_for_client$School_Operationality %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$School_Operationality_Other_... <- clean_data.tool1_for_client$School_Operationality_Other_... %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Shifts_Detail <- clean_data.tool1_for_client$Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Other_Shifts_Detail <- clean_data.tool1_for_client$Other_Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Headmasters <- clean_data.tool1_for_client$Headmasters %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Curriculum_Changes <- clean_data.tool1_for_client$Curriculum_Changes %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Weekly_Class_Schedule <- clean_data.tool1_for_client$Weekly_Class_Schedule %>% filter(PARENT_KEY %in% clean_data.tool1_sample$Curriculum_Changes$KEY)
clean_data.tool1_sample$Grades_Curriculum <- clean_data.tool1_for_client$Grades_Curriculum %>% filter(PARENT_KEY %in% clean_data.tool1_sample$Curriculum_Changes$KEY)
clean_data.tool1_sample$Subjects_Detail <- clean_data.tool1_for_client$Subjects_Detail %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Education_Quality <- clean_data.tool1_for_client$Education_Quality %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)
clean_data.tool1_sample$Relevant_photos <- clean_data.tool1_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool1_sample$data$KEY)

# Tool 2 
clean_data.tool2_sample$data <- sample_n(clean_data.tool2_for_client$data, n_sample)
clean_data.tool2_sample$Support_Respondents <- clean_data.tool2_for_client$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
clean_data.tool2_sample$Attendance_Sheet_Photos <- clean_data.tool2_for_client$Attendance_Sheet_Photos %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
clean_data.tool2_sample$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
clean_data.tool2_sample$Teachers_Pack_Group <- clean_data.tool2_for_client$Teachers_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
clean_data.tool2_sample$Students_Pack_Group <- clean_data.tool2_for_client$Students_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)
clean_data.tool2_sample$Relevant_photos <- clean_data.tool2_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool2_sample$data$KEY)


# Tool 3
clean_data.tool3_sample$data <- sample_n(clean_data.tool3_for_client$data, n_sample)
clean_data.tool3_sample$Support_Respondents <- clean_data.tool3_for_client$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$Enrollement_Attendance_Summary <- clean_data.tool3_for_client$Enrollement_Attendance_Summary %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$Grade_Details <- clean_data.tool3_for_client$Grade_Details %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$Todays_Attendance_Detail <- clean_data.tool3_for_client$Todays_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$LastWeek_Attendance_Detail <- clean_data.tool3_for_client$LastWeek_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$Student_Headcount <- clean_data.tool3_for_client$Student_Headcount %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)
clean_data.tool3_sample$Relevant_photos <- clean_data.tool3_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool3_sample$data$KEY)


# Tool 4
clean_data.tool4_sample$data <- sample_n(clean_data.tool4_for_client$data, n_sample)
clean_data.tool4_sample$Additional_Subjects <- clean_data.tool4_for_client$Additional_Subjects %>% filter(PARENT_KEY %in% clean_data.tool4_sample$data$KEY)
clean_data.tool4_sample$Subjects_taught_by_this_teacher <- clean_data.tool4_for_client$Subjects_taught_by_this_teacher %>% filter(PARENT_KEY %in% clean_data.tool4_sample$data$KEY)
clean_data.tool4_sample$Subjects_Not_Being_Taught <- clean_data.tool4_for_client$Subjects_Not_Being_Taught %>% filter(PARENT_KEY %in% clean_data.tool4_sample$data$KEY)
clean_data.tool4_sample$Relevant_photos <- clean_data.tool4_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool4_sample$data$KEY)


# Tool 5
clean_data.tool5_sample$data <- sample_n(clean_data.tool5_for_client$data, n_sample)
clean_data.tool5_sample$Under_Construction_Toilets <- clean_data.tool5_for_client$Under_Construction_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5_sample$data$KEY)
clean_data.tool5_sample$Useable_Toilets <- clean_data.tool5_for_client$Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5_sample$data$KEY)
clean_data.tool5_sample$Non_Useable_Toilets <- clean_data.tool5_for_client$Non_Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5_sample$data$KEY)
clean_data.tool5_sample$Relevant_photos <- clean_data.tool5_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool5_sample$data$KEY)


# Tool 6
clean_data.tool6_sample$data <- sample_n(clean_data.tool6_for_client$data, n_sample)
clean_data.tool6_sample$Subjects_Added <- clean_data.tool6_for_client$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool6_sample$data$KEY)
clean_data.tool6_sample$Relevant_photos <- clean_data.tool6_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool6_sample$data$KEY)


# Tool 7
clean_data.tool7_sample$data <- sample_n(clean_data.tool7_for_client$data, n_sample)
clean_data.tool7_sample$C6_list_members <- clean_data.tool7_for_client$C6_list_members %>% filter(PARENT_KEY %in% clean_data.tool7_sample$data$KEY)
clean_data.tool7_sample$Subjects_Added <- clean_data.tool7_for_client$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool7_sample$data$KEY)
clean_data.tool7_sample$Relevant_photos <- clean_data.tool7_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool7_sample$data$KEY)


# Tool 8
clean_data.tool8_sample$data <- sample_n(clean_data.tool8_for_client$data, n_sample)
clean_data.tool8_sample$Classes <- clean_data.tool8_for_client$Classes %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Adults_At_The_CBE <- clean_data.tool8_for_client$Adults_At_The_CBE %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Section_2_2_3_Attendance_Rec... <- clean_data.tool8_for_client$Section_2_2_3_Attendance_Rec... %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Section_2_2_4_Headcount <- clean_data.tool8_for_client$Section_2_2_4_Headcount %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Students_Enrolment_Book <- clean_data.tool8_for_client$Students_Enrolment_Book %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Section_2_4_Student_Ages <- clean_data.tool8_for_client$Section_2_4_Student_Ages %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Classroom_Materials <- clean_data.tool8_for_client$Classroom_Materials %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Teacher_Kit <- clean_data.tool8_for_client$Teacher_Kit %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Student_Kit <- clean_data.tool8_for_client$Student_Kit %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$V_list_of_all_members <- clean_data.tool8_for_client$V_list_of_all_members %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Subjects_Added <- clean_data.tool8_for_client$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)
clean_data.tool8_sample$Relevant_photos <- clean_data.tool8_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool8_sample$data$KEY)


# Tool 9
clean_data.tool9_sample$data <- sample_n(clean_data.tool9_for_client$data, n_sample)
clean_data.tool9_sample$Relevant_photos <- clean_data.tool9_for_client$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool9_sample$data$KEY)


# Exporting for client version of clean datasets -------------------------------
write.xlsx(clean_data.tool0_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool_Data Entry_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool1_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool1_Public_School_Headmaster_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool2_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool2_Public_School_Light_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool3_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool3_Public_School_Headcount_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool4_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool4_Public_School_Teacher_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool5_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool5_Public_School_WASH_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool6_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool6_Public_School_&_CBE_Parent_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool7_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool7_Public_School_&_CBE_Shura_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool8_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool8_CBE_Class_sample_", Sys.Date(),".xlsx"))
write.xlsx(clean_data.tool9_sample, paste0(output_data_path, "cleaned_dfs/for_client/Sample/Tool9_CBE_IP_sample_", Sys.Date(),".xlsx"))

rm(list = c(ls(pattern = "_sample_")))




