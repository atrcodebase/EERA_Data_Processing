source("R/functions/check_relevancy_rule.R")

join_dfs <- function(df1, df2) return(left_join(df1, df2, by = c("PARENT_KEY" = "KEY")))

# Cloning df
clean_data.tool1_joined <- clean_data.tool1
clean_data.tool2_joined <- clean_data.tool2
clean_data.tool3_joined <- clean_data.tool3
clean_data.tool4_joined <- clean_data.tool4
clean_data.tool5_joined <- clean_data.tool5
clean_data.tool6_joined <- clean_data.tool6
clean_data.tool7_joined <- clean_data.tool7
clean_data.tool8_joined <- clean_data.tool8
clean_data.tool9_joined <- clean_data.tool9

# joining DFs to be able to check the relevancy failure in child s -------------
# Tool 1
clean_data.tool1_joined$Support_Respondents <- join_dfs(clean_data.tool1$Support_Respondents, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$School_Operationality <- join_dfs(clean_data.tool1$School_Operationality, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$School_Operationality_Other_... <- join_dfs(clean_data.tool1$School_Operationality_Other_..., clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Shifts_Detail <- join_dfs(clean_data.tool1$Shifts_Detail, clean_data.tool1$data)
clean_data.tool1_joined$Other_Shifts_Detail <- join_dfs(clean_data.tool1$Other_Shifts_Detail, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Headmasters <- join_dfs(clean_data.tool1$Headmasters, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Curriculum_Changes <- join_dfs(clean_data.tool1$Curriculum_Changes, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Weekly_Class_Schedule <- join_dfs(clean_data.tool1$Weekly_Class_Schedule, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Grades_Curriculum <- join_dfs(clean_data.tool1$Grades_Curriculum, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Subjects_Detail <- join_dfs(clean_data.tool1$Subjects_Detail, clean_data.tool1$data) |> select(!any_of(meta_cols))
clean_data.tool1_joined$Education_Quality <- join_dfs(clean_data.tool1$Education_Quality, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Relevant_photos <- join_dfs(clean_data.tool1$Relevant_photos, clean_data.tool1$data |> select(!any_of(meta_cols)))


# Tool 2
clean_data.tool2_joined$Support_Respondents<- join_dfs(clean_data.tool2$Support_Respondents, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Attendance_Sheet_Photos<- join_dfs(clean_data.tool2$Attendance_Sheet_Photos, clean_data.tool2$data) |> select(!any_of(meta_cols))
clean_data.tool2_joined$Public_Stationary_Kit_Group<- join_dfs(clean_data.tool2$Public_Stationary_Kit_Group, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Teachers_Pack_Group<- join_dfs(clean_data.tool2$Teachers_Pack_Group, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Students_Pack_Group<- join_dfs(clean_data.tool2$Students_Pack_Group, clean_data.tool2$data |> select(!any_of(meta_cols)))
clean_data.tool2_joined$Relevant_photos<- join_dfs(clean_data.tool2$Relevant_photos, clean_data.tool2$data |> select(!any_of(meta_cols)))


# Tool 3
clean_data.tool3_joined$Support_Respondents <- join_dfs(clean_data.tool3$Support_Respondents, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Enrollement_Attendance_Summary <- join_dfs(clean_data.tool3$Enrollement_Attendance_Summary, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Grade_Details <- join_dfs(clean_data.tool3$Grade_Details, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Todays_Attendance_Detail <- join_dfs(clean_data.tool3$Todays_Attendance_Detail, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$LastWeek_Attendance_Detail <- join_dfs(clean_data.tool3$LastWeek_Attendance_Detail, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Student_Headcount <- join_dfs(clean_data.tool3$Student_Headcount, clean_data.tool3$data |> select(!any_of(meta_cols)))
clean_data.tool3_joined$Relevant_photos <- join_dfs(clean_data.tool3$Relevant_photos, clean_data.tool3$data |> select(!any_of(meta_cols)))


# Tool 4
clean_data.tool4_joined$Additional_Subjects <- join_dfs(clean_data.tool4$Additional_Subjects, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Subjects_taught_by_this_teacher <- join_dfs(clean_data.tool4$Subjects_taught_by_this_teacher, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Subjects_Not_Being_Taught <- join_dfs(clean_data.tool4$Subjects_Not_Being_Taught, clean_data.tool4$data |> select(!any_of(meta_cols)))
clean_data.tool4_joined$Relevant_photos <- join_dfs(clean_data.tool4$Relevant_photos, clean_data.tool4$data |> select(!any_of(meta_cols)))


# Tool 5
clean_data.tool5_joined$Under_Construction_Toilets <- join_dfs(clean_data.tool5$Under_Construction_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Useable_Toilets <- join_dfs(clean_data.tool5$Useable_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Non_Useable_Toilets <- join_dfs(clean_data.tool5$Non_Useable_Toilets, clean_data.tool5$data |> select(!any_of(meta_cols)))
clean_data.tool5_joined$Relevant_photos <- join_dfs(clean_data.tool5$Relevant_photos, clean_data.tool5$data |> select(!any_of(meta_cols)))


# Tool 6
clean_data.tool6_joined$Subjects_Added <- join_dfs(clean_data.tool6$Subjects_Added, clean_data.tool6$data |> select(!any_of(meta_cols)))
clean_data.tool6_joined$Relevant_photos <- join_dfs(clean_data.tool6$Relevant_photos, clean_data.tool6$data |> select(!any_of(meta_cols)))


# Tool 7
clean_data.tool7_joined$C6_list_members <- join_dfs(clean_data.tool7$C6_list_members, clean_data.tool7$data |> select(!any_of(meta_cols)))
clean_data.tool7_joined$Subjects_Added <- join_dfs(clean_data.tool7$Subjects_Added, clean_data.tool7$data |> select(!any_of(meta_cols)))
clean_data.tool7_joined$Relevant_photos <- join_dfs(clean_data.tool7$Relevant_photos, clean_data.tool7$data |> select(!any_of(meta_cols)))


# Tool 8
clean_data.tool8_joined$Classes <- join_dfs(clean_data.tool8$Classes, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Adults_At_The_CBE <- join_dfs(clean_data.tool8$Adults_At_The_CBE, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Section_2_2_3_Attendance_Rec... <- join_dfs(clean_data.tool8$Section_2_2_3_Attendance_Rec..., clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Section_2_2_4_Headcount <- join_dfs(clean_data.tool8$Section_2_2_4_Headcount, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Students_Enrolment_Book <- join_dfs(clean_data.tool8$Students_Enrolment_Book, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Section_2_4_Student_Ages <- join_dfs(clean_data.tool8$Section_2_4_Student_Ages, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Classroom_Materials <- join_dfs(clean_data.tool8$Classroom_Materials, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Teacher_Kit <- join_dfs(clean_data.tool8$Teacher_Kit, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Student_Kit <- join_dfs(clean_data.tool8$Student_Kit, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$V_list_of_all_members <- join_dfs(clean_data.tool8$V_list_of_all_members, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Subjects_Added <- join_dfs(clean_data.tool8$Subjects_Added, clean_data.tool8$data |> select(!any_of(meta_cols)))
clean_data.tool8_joined$Relevant_photos <- join_dfs(clean_data.tool8$Relevant_photos, clean_data.tool8$data |> select(!any_of(meta_cols)))


# Tool 9
clean_data.tool9_joined$Relevant_photos <- join_dfs(clean_data.tool9$Relevant_photos, clean_data.tool9$data |> select(!any_of(meta_cols)))


# listing the required questions -----------------------------------------------
tool1.notrequired_questions <- kobo_tool.tool1$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool2.notrequired_questions <- kobo_tool.tool2$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool3.notrequired_questions <- kobo_tool.tool3$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool4.notrequired_questions <- kobo_tool.tool4$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool5.notrequired_questions <- kobo_tool.tool5$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool6.notrequired_questions <- kobo_tool.tool6$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool7.notrequired_questions <- kobo_tool.tool7$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool8.notrequired_questions <- kobo_tool.tool8$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)
tool9.notrequired_questions <- kobo_tool.tool9$survey %>% filter((required %in% c("False", "FALSE", "") | is.na(required)) & !is.na(name)) %>% pull(name)


# checking the relevancy issues ------------------------------------------------
relevancy_issues <- rbind(
  # Tool 1
  rbind(
    check_relevancy_rules(data = clean_data.tool1_joined$data,tool_relevancy =  relevancy_file.tool1 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool1_joined$Support_Respondents, relevancy_file.tool1 %>% filter(sheet == "Support_Respondents")) |> 
      mutate(sheet = "Support_Respondents"),
    check_relevancy_rules(clean_data.tool1_joined$School_Operationality, relevancy_file.tool1 %>% filter(sheet == "School_Operationality")) |> 
      mutate(sheet = "School_Operationality"),
    check_relevancy_rules(clean_data.tool1_joined$School_Operationality_Other_..., relevancy_file.tool1 %>% filter(sheet == "School_Operationality_Other_Grades")) |> 
      mutate(sheet = "School_Operationality_Other_..."),
    check_relevancy_rules(clean_data.tool1_joined$Shifts_Detail, relevancy_file.tool1 %>% filter(sheet == "Shifts_Detail")) |> 
      mutate(sheet = "Shifts_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Other_Shifts_Detail, relevancy_file.tool1 %>% filter(sheet == "Other_Shifts_Detail")) |> 
      mutate(sheet = "Other_Shifts_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Headmasters, relevancy_file.tool1 %>% filter(sheet == "Headmasters")) |> 
      mutate(sheet = "Headmasters"),
    check_relevancy_rules(clean_data.tool1_joined$Curriculum_Changes, relevancy_file.tool1 %>% filter(sheet == "Curriculum_Changes")) |> 
      mutate(sheet = "Curriculum_Changes"),
    check_relevancy_rules(clean_data.tool1_joined$Weekly_Class_Schedule, relevancy_file.tool1 %>% filter(sheet == "Weekly_Class_Schedule")) |> 
      mutate(sheet = "Weekly_Class_Schedule"),
    check_relevancy_rules(clean_data.tool1_joined$Grades_Curriculum, relevancy_file.tool1 %>% filter(sheet == "Grades_Curriculum")) |> 
      mutate(sheet = "Grades_Curriculum"),
    check_relevancy_rules(clean_data.tool1_joined$Subjects_Detail, relevancy_file.tool1 %>% filter(sheet == "Subjects_Detail")) |> 
      mutate(sheet = "Subjects_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Education_Quality, relevancy_file.tool1 %>% filter(sheet == "Education_Quality")) |> 
      mutate(sheet = "Education_Quality")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_type = "Public School") |> 
    filter(!(question %in% tool1.notrequired_questions & (is.na(value) | value == ""))),
  
  # Tool 2
  rbind(
    check_relevancy_rules(clean_data.tool2_joined$data, relevancy_file.tool2 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool2_joined$Support_Respondents, relevancy_file.tool2 %>% filter(sheet == "Support_Respondents")) |> 
      mutate(sheet = "Support_Respondents"),
    check_relevancy_rules(clean_data.tool2_joined$Attendance_Sheet_Photos, relevancy_file.tool2 %>% filter(sheet == "Attendance_Sheet_Photos")) |> 
      mutate(sheet = "Attendance_Sheet_Photos"),
    check_relevancy_rules(clean_data.tool2_joined$Public_Stationary_Kit_Group, relevancy_file.tool2 %>% filter(sheet == "Public_Stationary_Kit_Group")) |> 
      mutate(sheet = "Public_Stationary_Kit_Group"),
    check_relevancy_rules(clean_data.tool2_joined$Teachers_Pack_Group, relevancy_file.tool2 %>% filter(sheet == "Teachers_Pack_Group")) |> 
      mutate(sheet = "Teachers_Pack_Group"),
    check_relevancy_rules(clean_data.tool2_joined$Students_Pack_Group, relevancy_file.tool2 %>% filter(sheet == "Students_Pack_Group")) |> 
      mutate(sheet = "Students_Pack_Group")
  ) |>
    mutate(tool = "Tool 2 - Light", Sample_type = "Public School") |> 
    filter(!(question %in% tool2.notrequired_questions & (is.na(value) | value == ""))),
  
  # Tool 3
  rbind(
    check_relevancy_rules(clean_data.tool3_joined$data, relevancy_file.tool3 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool3_joined$Support_Respondents, relevancy_file.tool3 %>% filter(sheet == "Support_Respondents")) |> 
      mutate(sheet = "Support_Respondents"),
    check_relevancy_rules(clean_data.tool3_joined$Enrollement_Attendance_Summary, relevancy_file.tool3 %>% filter(sheet == "Enrollement_Attendance_Summary")) |> 
      mutate(sheet = "Enrollement_Attendance_Summary"),
    check_relevancy_rules(clean_data.tool3_joined$Todays_Attendance_Detail, relevancy_file.tool3 %>% filter(sheet == "Todays_Attendance_Detail")) |> 
      mutate(sheet = "Todays_Attendance_Detail"),
    check_relevancy_rules(clean_data.tool3_joined$LastWeek_Attendance_Detail, relevancy_file.tool3 %>% filter(sheet == "LastWeek_Attendance_Detail")) |> 
      mutate(sheet = "LastWeek_Attendance_Detail"),
    check_relevancy_rules(clean_data.tool3_joined$Student_Headcount, relevancy_file.tool3 %>% filter(sheet == "Student_Headcount")) |> 
      mutate(sheet = "Student_Headcount")
  ) |>
    mutate(tool = "Tool 3 - Headcount", Sample_type = "Public School") |> 
    filter(!(question %in% tool3.notrequired_questions & (is.na(value) | value == ""))),
  
  
  # Tool 4
  rbind(
    check_relevancy_rules(clean_data.tool4_joined$data, relevancy_file.tool4 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool4_joined$Additional_Subjects, relevancy_file.tool4 %>% filter(sheet == "Additional_Subjects")) |> 
      mutate(sheet = "Additional_Subjects"),
    check_relevancy_rules(clean_data.tool4_joined$Subjects_taught_by_this_teacher, relevancy_file.tool4 %>% filter(sheet == "Subjects_taught_by_this_teacher")) |> 
      mutate(sheet = "Subjects_taught_by_this_teacher"),
    check_relevancy_rules(clean_data.tool4_joined$Subjects_Not_Being_Taught, relevancy_file.tool4 %>% filter(sheet == "Subjects_Not_Being_Taught")) |> 
      mutate(sheet = "Subjects_Not_Being_Taught")
  ) |>
    mutate(tool = "Tool 4 - Teacher", Sample_type = "Public School") |> 
    filter(!(question %in% tool4.notrequired_questions & (is.na(value) | value == ""))),
  
  
  # Tool 5
  rbind(
    check_relevancy_rules(clean_data.tool5_joined$data, relevancy_file.tool5 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool5_joined$Under_Construction_Toilets, relevancy_file.tool5 %>% filter(sheet == "Under_Construction_Toilets")) |> 
      mutate(sheet = "Under_Construction_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Useable_Toilets, relevancy_file.tool5 %>% filter(sheet == "Useable_Toilets")) |> 
      mutate(sheet = "Useable_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Non_Useable_Toilets, relevancy_file.tool5 %>% filter(sheet == "Non_Useable_Toilets")) |> 
      mutate(sheet = "Non_Useable_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Relevant_photos, relevancy_file.tool5 %>% filter(sheet == "Relevant_photos")) |> 
      mutate(sheet = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 5 - WASH", Sample_type = "Public School") |> 
    filter(!(question %in% tool5.notrequired_questions & (is.na(value) | value == ""))),
  
  
  # Tool 6
  rbind(
    check_relevancy_rules(clean_data.tool6_joined$data, relevancy_file.tool6 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data") |>
      left_join(select(clean_data.tool6_joined$data, KEY, Sample_type = Sample_Type), by = "KEY")
    
    # uncomment for every run
    # check_relevancy_rules(clean_data.tool6_joined$Subjects_Added, relevancy_file.tool6 %>% filter(sheet == "Subjects_Added")) |> 
    #   mutate(sheet = "Subjects_Added") |>
    #   left_join(select(clean_data.tool6_joined$Subjects_Added, KEY, Sample_type = Sample_Type), by = "KEY"),
    
    # check_relevancy_rules(clean_data.tool6_joined$Relevant_photos, relevancy_file.tool6 %>% filter(sheet == "Relevant_photos")) |> 
    #   mutate(sheet = "Relevant_photos") |>
    #   left_join(select(clean_data.tool6_joined$Relevant_photos, KEY, Sample_type = Sample_Type), by = "KEY")
  ) |>
    mutate(tool = "Tool 6 - Parent") |> 
    filter(!(question %in% tool6.notrequired_questions & (is.na(value) | value == ""))) |>
    select(everything(), tool, Sample_type),
  
  
  # Tool 7
  rbind(
    check_relevancy_rules(clean_data.tool7_joined$data, relevancy_file.tool7 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data") |>
      left_join(select(clean_data.tool7_joined$data, KEY, Sample_type = Sample_Type), by = "KEY"),
    
    if(nrow(check_relevancy_rules(clean_data.tool7_joined$C6_list_members, relevancy_file.tool7 %>% filter(sheet == "C6_list_members"))) > 0){
    check_relevancy_rules(clean_data.tool7_joined$C6_list_members, relevancy_file.tool7 %>% filter(sheet == "C6_list_members")) |> 
      mutate(sheet = "C6_list_members") |>
      left_join(select(clean_data.tool7_joined$C6_list_members, KEY, Sample_type = Sample_Type), by = "KEY")
    }
    # uncomment for every run
    # check_relevancy_rules(clean_data.tool7_joined$Subjects_Added, relevancy_file.tool7 %>% filter(sheet == "Subjects_Added")) |>
    #   mutate(sheet = "Subjects_Added") |>
    #   left_join(select(clean_data.tool7_joined$Subjects_Added, KEY, Sample_type = Sample_Type), by = "KEY"),
    
    # check_relevancy_rules(clean_data.tool7_joined$Relevant_photos, relevancy_file.tool7 %>% filter(sheet == "Relevant_photos")) |> 
    #   mutate(sheet = "Relevant_photos") |>
    #   left_join(select(clean_data.tool7_joined$Relevant_photos, KEY, Sample_type = Sample_Type), by = "KEY")
  ) |> 
    mutate(tool = "Tool 7 - Shura") |> 
    filter(!(question %in% tool7.notrequired_questions & (is.na(value) | value == ""))) |>
    select(everything(), tool, Sample_type),
  
  
  # Tool 8 
  rbind(
    check_relevancy_rules(clean_data.tool8_joined$data, relevancy_file.tool8 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    check_relevancy_rules(clean_data.tool8_joined$Classes, relevancy_file.tool8 %>% filter(sheet == "Classes")) |> 
      mutate(sheet = "Classes"),
    check_relevancy_rules(clean_data.tool8_joined$Adults_At_The_CBE, relevancy_file.tool8 %>% filter(sheet == "Adults_At_The_CBE")) |> 
      mutate(sheet = "Adults_At_The_CBE"),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_2_3_Attendance_Rec..., relevancy_file.tool8 %>% filter(sheet == "Section_2_2_3_Attendance_Record_Check_CBS")) |> 
      mutate(sheet = "Section_2_2_3_Attendance_Rec..."),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_2_4_Headcount, relevancy_file.tool8 %>% filter(sheet == "Section_2_2_4_Headcount")) |> 
      mutate(sheet = "Section_2_2_4_Headcount"),
    check_relevancy_rules(clean_data.tool8_joined$Students_Enrolment_Book, relevancy_file.tool8 %>% filter(sheet == "Students_Enrolment_Book")) |> 
      mutate(sheet = "Students_Enrolment_Book"),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_4_Student_Ages, relevancy_file.tool8 %>% filter(sheet == "Section_2_4_Student_Ages")) |> 
      mutate(sheet = "Section_2_4_Student_Ages"),
    check_relevancy_rules(clean_data.tool8_joined$Classroom_Materials, relevancy_file.tool8 %>% filter(sheet == "Classroom_Materials")) |> 
      mutate(sheet = "Classroom_Materials"),
    check_relevancy_rules(clean_data.tool8_joined$Teacher_Kit, relevancy_file.tool8 %>% filter(sheet == "Teacher_Kit")) |> 
      mutate(sheet = "Teacher_Kit"),
    check_relevancy_rules(clean_data.tool8_joined$Student_Kit, relevancy_file.tool8 %>% filter(sheet == "Student_Kit")) |> 
      mutate(sheet = "Student_Kit"),
    check_relevancy_rules(clean_data.tool8_joined$V_list_of_all_members, relevancy_file.tool8 %>% filter(sheet == "V_list_of_all_members")) |> 
      mutate(sheet = "V_list_of_all_members"),
    check_relevancy_rules(clean_data.tool8_joined$Subjects_Added, relevancy_file.tool8 %>% filter(sheet == "Subjects_Added")) |> 
      mutate(sheet = "Subjects_Added")
  ) |> 
    mutate(tool = "Tool 8 - Class", Sample_type = "CBE") |> 
    filter(!(question %in% tool8.notrequired_questions & (is.na(value) | value == ""))),
  
  
  # Tool 9
  rbind(
    check_relevancy_rules(clean_data.tool9_joined$data, relevancy_file.tool9 %>% filter(sheet == "data")) |> 
      mutate(sheet = "data"),
    
    check_relevancy_rules(clean_data.tool9_joined$Relevant_photos, relevancy_file.tool9 %>% filter(sheet == "Relevant_photos")) |> 
      mutate(sheet = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 9 - IP", Sample_type = "CBE") |> 
    filter(!(question %in% tool9.notrequired_questions & (is.na(value) | value == "")))
) |> 
  mutate(
    issue = case_when(
      is.na(value) | value == "" ~ "Due to the changes in the dataset a new Value is required for this question",
      TRUE ~ "Cell must be NAed due to changes in the dataset"
    )
  )

# removing extra elements from the environment
rm(list = c("check_relevancy_rules",
            "join_dfs",
            ls(pattern = "_joined$"),
            ls(pattern = "notrequired_questions$")
))
