# removing deleted and pilot interviews -----------------------------------
# Tool 1 - Headmaster
raw_data.tool1$data <- raw_data.tool1$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
raw_data.tool1$Support_Respondents <- raw_data.tool1$Support_Respondents %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$School_Operationality <- raw_data.tool1$School_Operationality %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$School_Operationality_Other_... <- raw_data.tool1$School_Operationality_Other_... %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Shifts_Detail <- raw_data.tool1$Shifts_Detail %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Other_Shifts_Detail <- raw_data.tool1$Other_Shifts_Detail %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Headmasters <- raw_data.tool1$Headmasters %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Curriculum_Changes <- raw_data.tool1$Curriculum_Changes %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Weekly_Class_Schedule <- raw_data.tool1$Weekly_Class_Schedule %>% filter(PARENT_KEY %in% raw_data.tool1$Curriculum_Changes$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Grades_Curriculum <- raw_data.tool1$Grades_Curriculum %>% filter(PARENT_KEY %in% raw_data.tool1$Curriculum_Changes$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Subjects_Detail <- raw_data.tool1$Subjects_Detail %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Education_Quality <- raw_data.tool1$Education_Quality %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool1$Relevant_photos <- raw_data.tool1$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)

# Tool 2 - Light
raw_data.tool2$data <- raw_data.tool2$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
raw_data.tool2$Support_Respondents <- raw_data.tool2$Support_Respondents %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool2$Attendance_Sheet_Photos <- raw_data.tool2$Attendance_Sheet_Photos %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool2$Public_Stationary_Kit_Group <- raw_data.tool2$Public_Stationary_Kit_Group %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool2$Teachers_Pack_Group <- raw_data.tool2$Teachers_Pack_Group %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool2$Students_Pack_Group <- raw_data.tool2$Students_Pack_Group %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool2$Relevant_photos <- raw_data.tool2$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 3 - Headcount
raw_data.tool3$data <- raw_data.tool3$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
raw_data.tool3$Support_Respondents <- raw_data.tool3$Support_Respondents %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$Enrollement_Attendance_Summary <- raw_data.tool3$Enrollement_Attendance_Summary %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$Grade_Details <- raw_data.tool3$Grade_Details %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$Todays_Attendance_Detail <- raw_data.tool3$Todays_Attendance_Detail %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$LastWeek_Attendance_Detail <- raw_data.tool3$LastWeek_Attendance_Detail %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$Student_Headcount <- raw_data.tool3$Student_Headcount %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool3$Relevant_photos <- raw_data.tool3$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 4 - Teacher
raw_data.tool4$data <- raw_data.tool4$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
raw_data.tool4$Additional_Subjects <- raw_data.tool4$Additional_Subjects %>% filter(PARENT_KEY %in% raw_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool4$Subjects_taught_by_this_teacher <- raw_data.tool4$Subjects_taught_by_this_teacher %>% filter(PARENT_KEY %in% raw_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool4$Subjects_Not_Being_Taught <- raw_data.tool4$Subjects_Not_Being_Taught %>% filter(PARENT_KEY %in% raw_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool4$Relevant_photos <- raw_data.tool4$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 5 - WASH
raw_data.tool5$data <- raw_data.tool5$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
raw_data.tool5$Under_Construction_Toilets <- raw_data.tool5$Under_Construction_Toilets %>% filter(PARENT_KEY %in% raw_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool5$Useable_Toilets <- raw_data.tool5$Useable_Toilets %>% filter(PARENT_KEY %in% raw_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool5$Non_Useable_Toilets <- raw_data.tool5$Non_Useable_Toilets %>% filter(PARENT_KEY %in% raw_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
raw_data.tool5$Relevant_photos <- raw_data.tool5$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 6 - Parent
raw_data.tool6$data <- raw_data.tool6$data %>% filter((KEY %in% approved_keys_ps | KEY %in% approved_keys_cbe) & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))
raw_data.tool6$Subjects_Added <- raw_data.tool6$Subjects_Added %>% filter(PARENT_KEY %in% raw_data.tool6$data$KEY & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))
raw_data.tool6$Relevant_photos <- raw_data.tool6$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool6$data$KEY & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))


# Tool 7 - SHURA
raw_data.tool7$data <- raw_data.tool7$data %>% filter((KEY %in% approved_keys_ps | KEY %in% approved_keys_cbe) & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))
raw_data.tool7$C6_list_members <- raw_data.tool7$C6_list_members %>% filter(PARENT_KEY %in% raw_data.tool7$data$KEY & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))
raw_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added %>% filter(PARENT_KEY %in% raw_data.tool7$data$KEY & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))
raw_data.tool7$Relevant_photos <- raw_data.tool7$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool7$data$KEY & (!KEY %in% deleted_keys_ps | !KEY %in% deleted_keys_cbe))


# Tool 8 - Class
raw_data.tool8$data <- raw_data.tool8$data %>% filter(KEY %in% approved_keys_cbe & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Classes <- raw_data.tool8$Classes %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Adults_At_The_CBE <- raw_data.tool8$Adults_At_The_CBE %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Section_2_2_3_Attendance_Rec... <- raw_data.tool8$Section_2_2_3_Attendance_Rec... %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Section_2_2_4_Headcount <- raw_data.tool8$Section_2_2_4_Headcount %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Students_Enrolment_Book <- raw_data.tool8$Students_Enrolment_Book %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Section_2_4_Student_Ages <- raw_data.tool8$Section_2_4_Student_Ages %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Classroom_Materials <- raw_data.tool8$Classroom_Materials %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Teacher_Kit <- raw_data.tool8$Teacher_Kit %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Student_Kit <- raw_data.tool8$Student_Kit %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$V_list_of_all_members <- raw_data.tool8$V_list_of_all_members %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Subjects_Added <- raw_data.tool8$Subjects_Added %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
raw_data.tool8$Relevant_photos <- raw_data.tool8$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)


# Tool 9 - IP
raw_data.tool9$data <- raw_data.tool9$data %>% filter(KEY %in% approved_keys_cbe & !KEY %in% deleted_keys_cbe)
raw_data.tool9$Relevant_photos <- raw_data.tool9$Relevant_photos %>% filter(PARENT_KEY %in% raw_data.tool9$data$KEY & !KEY %in% deleted_keys_cbe)

