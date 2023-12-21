# removing deleted and pilot interviews -----------------------------------
# Tool 1 - Headmaster
clean_data.tool1$data <- clean_data.tool1$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
clean_data.tool1$Support_Respondents <- clean_data.tool1$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$School_Operationality <- clean_data.tool1$School_Operationality %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$School_Operationality_Other_... <- clean_data.tool1$School_Operationality_Other_... %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Shifts_Detail <- clean_data.tool1$Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Other_Shifts_Detail <- clean_data.tool1$Other_Shifts_Detail %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Headmasters <- clean_data.tool1$Headmasters %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Curriculum_Changes <- clean_data.tool1$Curriculum_Changes %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule %>% filter(PARENT_KEY %in% clean_data.tool1$Curriculum_Changes$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Grades_Curriculum <- clean_data.tool1$Grades_Curriculum %>% filter(PARENT_KEY %in% clean_data.tool1$Curriculum_Changes$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Subjects_Detail <- clean_data.tool1$Subjects_Detail %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Education_Quality <- clean_data.tool1$Education_Quality %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool1$Relevant_photos <- clean_data.tool1$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool1$data$KEY & !KEY %in% deleted_keys_ps)

# Tool 2 - Light
clean_data.tool2$data <- clean_data.tool2$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
clean_data.tool2$Support_Respondents <- clean_data.tool2$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool2$Relevant_photos <- clean_data.tool2$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool2$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 3 - Headcount
clean_data.tool3$data <- clean_data.tool3$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
clean_data.tool3$Support_Respondents <- clean_data.tool3$Support_Respondents %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Enrollement_Attendance_Summary <- clean_data.tool3$Enrollement_Attendance_Summary %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Grade_Details <- clean_data.tool3$Grade_Details %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$LastWeek_Attendance_Detail <- clean_data.tool3$LastWeek_Attendance_Detail %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Student_Headcount <- clean_data.tool3$Student_Headcount %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool3$Relevant_photos <- clean_data.tool3$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool3$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 4 - Teacher
clean_data.tool4$data <- clean_data.tool4$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
clean_data.tool4$Additional_Subjects <- clean_data.tool4$Additional_Subjects %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool4$Relevant_photos <- clean_data.tool4$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool4$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 5 - WASH
clean_data.tool5$data <- clean_data.tool5$data %>% filter(KEY %in% approved_keys_ps & !KEY %in% deleted_keys_ps)
clean_data.tool5$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Useable_Toilets <- clean_data.tool5$Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)
clean_data.tool5$Relevant_photos <- clean_data.tool5$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool5$data$KEY & !KEY %in% deleted_keys_ps)


# Tool 6 - Parent
clean_data.tool6$data <- clean_data.tool6$data %>% filter((KEY %in% approved_keys_ps | KEY %in% approved_keys_cbe) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool6$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool6$Relevant_photos <- clean_data.tool6$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool6$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))


# Tool 7 - SHURA
clean_data.tool7$data <- clean_data.tool7$data %>% filter((KEY %in% approved_keys_ps | KEY %in% approved_keys_cbe) & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool7$C6_list_members <- clean_data.tool7$C6_list_members %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))
clean_data.tool7$Relevant_photos <- clean_data.tool7$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool7$data$KEY & !KEY %in% c(deleted_keys_ps,deleted_keys_cbe))


# Tool 8 - Class
clean_data.tool8$data <- clean_data.tool8$data %>% filter(KEY %in% approved_keys_cbe & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Classes <- clean_data.tool8$Classes %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Adults_At_The_CBE <- clean_data.tool8$Adults_At_The_CBE %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Section_2_2_3_Attendance_Rec... <- clean_data.tool8$Section_2_2_3_Attendance_Rec... %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Students_Enrolment_Book <- clean_data.tool8$Students_Enrolment_Book %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Section_2_4_Student_Ages <- clean_data.tool8$Section_2_4_Student_Ages %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Classroom_Materials <- clean_data.tool8$Classroom_Materials %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Teacher_Kit <- clean_data.tool8$Teacher_Kit %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Student_Kit <- clean_data.tool8$Student_Kit %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$V_list_of_all_members <- clean_data.tool8$V_list_of_all_members %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Subjects_Added <- clean_data.tool8$Subjects_Added %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)
clean_data.tool8$Relevant_photos <- clean_data.tool8$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool8$data$KEY & !KEY %in% deleted_keys_cbe)


# Tool 9 - IP
clean_data.tool9$data <- clean_data.tool9$data %>% filter(KEY %in% approved_keys_cbe & !KEY %in% deleted_keys_cbe)
clean_data.tool9$Relevant_photos <- clean_data.tool9$Relevant_photos %>% filter(PARENT_KEY %in% clean_data.tool9$data$KEY & !KEY %in% deleted_keys_cbe)

