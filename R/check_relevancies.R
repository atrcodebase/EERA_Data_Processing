source("R/functions/check_relevancy_rule.R")

join_dfs <- function(df1, df2){
  return(df1 %>% 
           mutate(KEY_join=str_split_fixed(PARENT_KEY, "/", 2)[,1]) %>% # In case PARENT_KEY belongs to another child sheet
           left_join(df2, by = c("KEY_join" = "KEY")) %>% select(-KEY_join))
} 

# Cloning df
clean_data.tool0_joined <- clean_data.tool0
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
# Tool 0
# for(sheet in names(clean_data.tool0_joined)[-1]){
#   # Join
#   clean_data.tool0_joined[[sheet]] <- join_dfs(clean_data.tool0_joined[], clean_data.tool1$data |> select(!any_of(meta_cols)))
# }

# Tool 1
clean_data.tool1_joined$Support_Respondents <- join_dfs(clean_data.tool1$Support_Respondents, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$School_Operationality <- join_dfs(clean_data.tool1$School_Operationality, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$School_Operationality_Other_... <- join_dfs(clean_data.tool1$School_Operationality_Other_..., clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Shifts_Detail <- join_dfs(clean_data.tool1$Shifts_Detail, clean_data.tool1$data)
clean_data.tool1_joined$Other_Shifts_Detail <- join_dfs(clean_data.tool1$Other_Shifts_Detail, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Headmasters <- join_dfs(clean_data.tool1$Headmasters, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Curriculum_Changes <- join_dfs(clean_data.tool1$Curriculum_Changes, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Weekly_Class_Schedule <- join_dfs(clean_data.tool1$Weekly_Class_Schedule, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Weekly_Class_Schedule <- left_join(clean_data.tool1_joined$Weekly_Class_Schedule, clean_data.tool1$Curriculum_Changes |> select(F1, KEY), by=c("PARENT_KEY"="KEY")) # Joining extra column from child sheet
clean_data.tool1_joined$Grades_Curriculum <- join_dfs(clean_data.tool1$Grades_Curriculum, clean_data.tool1$data |> select(!any_of(meta_cols)))
clean_data.tool1_joined$Grades_Curriculum <- left_join(clean_data.tool1_joined$Grades_Curriculum, clean_data.tool1$Curriculum_Changes |> select(F1, KEY), by=c("PARENT_KEY"="KEY")) # Joining extra column from child sheet
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
relevancy_issues <- bind_rows(
  # Tool 1
  rbind(
    check_relevancy_rules(data = clean_data.tool1_joined$data, tool_relevancy =  relevancy_file.tool1, sheet_name="data"),
    check_relevancy_rules(clean_data.tool1_joined$Support_Respondents, relevancy_file.tool1, sheet_name="Support_Respondents"),
    check_relevancy_rules(clean_data.tool1_joined$School_Operationality, relevancy_file.tool1, sheet_name="School_Operationality"),
    check_relevancy_rules(clean_data.tool1_joined$School_Operationality_Other_..., relevancy_file.tool1, sheet_name="School_Operationality_Other_Grades"),
    check_relevancy_rules(clean_data.tool1_joined$Shifts_Detail, relevancy_file.tool1, sheet_name="Shifts_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Other_Shifts_Detail, relevancy_file.tool1, sheet_name="Other_Shifts_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Headmasters, relevancy_file.tool1, sheet_name="Headmasters"),
    check_relevancy_rules(clean_data.tool1_joined$Curriculum_Changes, relevancy_file.tool1, sheet_name="Curriculum_Changes"),
    check_relevancy_rules(clean_data.tool1_joined$Weekly_Class_Schedule, relevancy_file.tool1, sheet_name="Weekly_Class_Schedule"),
    check_relevancy_rules(clean_data.tool1_joined$Grades_Curriculum, relevancy_file.tool1, sheet_name="Grades_Curriculum"),
    check_relevancy_rules(clean_data.tool1_joined$Subjects_Detail, relevancy_file.tool1, sheet_name="Subjects_Detail"),
    check_relevancy_rules(clean_data.tool1_joined$Education_Quality, relevancy_file.tool1, sheet_name="Education_Quality")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_type = "Public School"),
  # Tool 2
  rbind(
    check_relevancy_rules(clean_data.tool2_joined$data, relevancy_file.tool2, sheet_name="data"),
    check_relevancy_rules(clean_data.tool2_joined$Support_Respondents, relevancy_file.tool2, sheet_name="Support_Respondents"),
    check_relevancy_rules(clean_data.tool2_joined$Attendance_Sheet_Photos, relevancy_file.tool2, sheet_name="Attendance_Sheet_Photos"),
    check_relevancy_rules(clean_data.tool2_joined$Public_Stationary_Kit_Group, relevancy_file.tool2, sheet_name="Public_Stationary_Kit_Group"),
    check_relevancy_rules(clean_data.tool2_joined$Teachers_Pack_Group, relevancy_file.tool2, sheet_name="Teachers_Pack_Group"),
    check_relevancy_rules(clean_data.tool2_joined$Students_Pack_Group, relevancy_file.tool2, sheet_name="Students_Pack_Group")
  ) |>
    mutate(tool = "Tool 2 - Light", Sample_type = "Public School"),
  
  # Tool 3
  rbind(
    check_relevancy_rules(clean_data.tool3_joined$data, relevancy_file.tool3, sheet_name="data"),
    check_relevancy_rules(clean_data.tool3_joined$Support_Respondents, relevancy_file.tool3, sheet_name="Support_Respondents"),
    check_relevancy_rules(clean_data.tool3_joined$Enrollement_Attendance_Summary, relevancy_file.tool3, sheet_name="Enrollement_Attendance_Summary"),
    check_relevancy_rules(clean_data.tool3_joined$Todays_Attendance_Detail, relevancy_file.tool3, sheet_name="Todays_Attendance_Detail"),
    check_relevancy_rules(clean_data.tool3_joined$LastWeek_Attendance_Detail, relevancy_file.tool3, sheet_name="LastWeek_Attendance_Detail"),
    check_relevancy_rules(clean_data.tool3_joined$Student_Headcount, relevancy_file.tool3, sheet_name="Student_Headcount")
  ) |>
    mutate(tool = "Tool 3 - Headcount", Sample_type = "Public School"),
  
  # Tool 4
  rbind(
    check_relevancy_rules(clean_data.tool4_joined$data, relevancy_file.tool4, sheet_name="data"),
    check_relevancy_rules(clean_data.tool4_joined$Additional_Subjects, relevancy_file.tool4, sheet_name="Additional_Subjects"),
    check_relevancy_rules(clean_data.tool4_joined$Subjects_taught_by_this_teacher, relevancy_file.tool4, sheet_name="Subjects_taught_by_this_teacher"),
    check_relevancy_rules(clean_data.tool4_joined$Subjects_Not_Being_Taught, relevancy_file.tool4, sheet_name="Subjects_Not_Being_Taught")
  ) |>
    mutate(tool = "Tool 4 - Teacher", Sample_type = "Public School"),
  
  # Tool 5
  rbind(
    check_relevancy_rules(clean_data.tool5_joined$data, relevancy_file.tool5, sheet_name="data"),
    check_relevancy_rules(clean_data.tool5_joined$Under_Construction_Toilets, relevancy_file.tool5, sheet_name="Under_Construction_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Useable_Toilets, relevancy_file.tool5, sheet_name="Useable_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Non_Useable_Toilets, relevancy_file.tool5, sheet_name="Non_Useable_Toilets"),
    check_relevancy_rules(clean_data.tool5_joined$Relevant_photos, relevancy_file.tool5, sheet_name="Relevant_photos")
  ) |> 
    mutate(tool = "Tool 5 - WASH", Sample_type = "Public School"),
  
  # Tool 6
  rbind(
    check_relevancy_rules(clean_data.tool6_joined$data, relevancy_file.tool6, sheet_name="data"),
    check_relevancy_rules(clean_data.tool6_joined$Subjects_Added, relevancy_file.tool6, sheet_name="Subjects_Added"),
    check_relevancy_rules(clean_data.tool6_joined$Relevant_photos, relevancy_file.tool6, sheet_name="Relevant_photos")
  ) |>
    mutate(tool = "Tool 6 - Parent", Key=str_split_fixed(KEY, "/", 2)[,1]) |> 
    left_join(select(clean_data.tool6_joined$data, KEY, Sample_type = Sample_Type), by = c("Key"="KEY")) %>% 
    select(everything(), tool, Sample_type),
  
  # Tool 7
  rbind(
    check_relevancy_rules(clean_data.tool7_joined$data, relevancy_file.tool7, sheet_name="data"),
    check_relevancy_rules(clean_data.tool7_joined$C6_list_members, relevancy_file.tool7, sheet_name="C6_list_members"),
    check_relevancy_rules(clean_data.tool7_joined$Subjects_Added, relevancy_file.tool7, sheet_name="Subjects_Added"),
    check_relevancy_rules(clean_data.tool7_joined$Relevant_photos, relevancy_file.tool7, sheet_name="Relevant_photos")
  ) |> 
    mutate(tool = "Tool 7 - Shura", Key=str_split_fixed(KEY, "/", 2)[,1]) |> 
    left_join(select(clean_data.tool7_joined$data, KEY, Sample_type = Sample_Type), by = c("Key"="KEY")) %>% 
    select(everything(), tool, Sample_type),
  
  # Tool 8 
  rbind(
    check_relevancy_rules(clean_data.tool8_joined$data, relevancy_file.tool8, sheet_name="data"),
    check_relevancy_rules(clean_data.tool8_joined$Classes, relevancy_file.tool8, sheet_name="Classes"),
    check_relevancy_rules(clean_data.tool8_joined$Adults_At_The_CBE, relevancy_file.tool8, sheet_name="Adults_At_The_CBE"),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_2_3_Attendance_Rec..., relevancy_file.tool8, sheet_name="Section_2_2_3_Attendance_Record_Check_CBS"),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_2_4_Headcount, relevancy_file.tool8, sheet_name="Section_2_2_4_Headcount"),
    check_relevancy_rules(clean_data.tool8_joined$Students_Enrolment_Book, relevancy_file.tool8, sheet_name="Students_Enrolment_Book"),
    check_relevancy_rules(clean_data.tool8_joined$Section_2_4_Student_Ages, relevancy_file.tool8, sheet_name="Section_2_4_Student_Ages"),
    check_relevancy_rules(clean_data.tool8_joined$Classroom_Materials, relevancy_file.tool8, sheet_name="Classroom_Materials"),
    check_relevancy_rules(clean_data.tool8_joined$Teacher_Kit, relevancy_file.tool8, sheet_name="Teacher_Kit"),
    check_relevancy_rules(clean_data.tool8_joined$Student_Kit, relevancy_file.tool8, sheet_name="Student_Kit"),
    check_relevancy_rules(clean_data.tool8_joined$V_list_of_all_members, relevancy_file.tool8, sheet_name="V_list_of_all_members"),
    check_relevancy_rules(clean_data.tool8_joined$Subjects_Added, relevancy_file.tool8, sheet_name="Subjects_Added")
  ) |> 
    mutate(tool = "Tool 8 - Class", Sample_type = "CBE"),
  
  # Tool 9
  rbind(
    check_relevancy_rules(clean_data.tool9_joined$data, relevancy_file.tool9, sheet_name="data"),
    check_relevancy_rules(clean_data.tool9_joined$Relevant_photos, relevancy_file.tool9, sheet_name="Relevant_photos")) %>% 
    mutate(tool = "Tool 9 - IP", Sample_type = "CBE")
)
relevancy_issues <- relevancy_issues %>% 
  mutate(Key=str_split_fixed(KEY, "/", 2)[,1]) %>% 
  relocate(Key, .after = KEY)
  
# removing extra elements from the environment
rm(list = c("check_relevancy_rules",
            "join_dfs",
            ls(pattern = "_joined$"),
            ls(pattern = "notrequired_questions$")
))
