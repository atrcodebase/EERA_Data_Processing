source("R/functions/log_na_inconsistencies_in_sm_questions.R")

sm_check_result <- plyr::rbind.fill(
  # Tool 0
  rbind(
    check_select_multiple(data = clean_data.tool0$data, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="data"),
    check_select_multiple(data = clean_data.tool0$Tool3_Headcount, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool3_Headcount"),
    check_select_multiple(data = clean_data.tool0$Tool1_Timetable_Year, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool1_Timetable_Year"),
    check_select_multiple(data = clean_data.tool0$Tool1_Timetable1_Repeat, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool1_Timetable1_Repeat"),
    check_select_multiple(data = clean_data.tool0$Tool1_Timetable2_Repeat, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool1_Timetable2_Repeat"),
    check_select_multiple(data = clean_data.tool0$Tool1_Timetable3_Repeat, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool1_Timetable3_Repeat"),
    check_select_multiple(data = clean_data.tool0$Tool1_Timetable4_Repeat, tool = kobo_tool.tool0$survey, question_separator = "_") %>% mutate(Tab_name="Tool1_Timetable4_Repeat")
  ) %>% mutate(tool = "Data_entry", Sample_Type = "Public School"),
  
  # Tool 1
  rbind(
    check_select_multiple(data = clean_data.tool1$data, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "data"),
    check_select_multiple(data = clean_data.tool1$School_Operationality, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "School_Operationality"),
    check_select_multiple(data = clean_data.tool1$School_Operationality_Other_..., tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "School_Operationality_Other_..."),
    check_select_multiple(data = clean_data.tool1$Shifts_Detail, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "Shifts_Detail"),
    check_select_multiple(data = clean_data.tool1$Other_Shifts_Detail, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "Other_Shifts_Detail"),
    check_select_multiple(data = clean_data.tool1$Headmasters, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "Headmasters")
    ) %>% mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),

  # Tool 2
  rbind(
    check_select_multiple(data = clean_data.tool2$data, tool = kobo_tool.tool2$survey, question_separator = "_") %>% mutate(Tab_name="data"),
    check_select_multiple(data = clean_data.tool2$Public_Stationary_Kit_Group, tool = kobo_tool.tool2$survey, question_separator = "_") %>% mutate(Tab_name="Public_Stationary_Kit_Group"),
    check_select_multiple(data = clean_data.tool2$Teachers_Pack_Group, tool = kobo_tool.tool2$survey, question_separator = "_") %>% mutate(Tab_name="Teachers_Pack_Group"),
    check_select_multiple(data = clean_data.tool2$Students_Pack_Group, tool = kobo_tool.tool2$survey, question_separator = "_") %>% mutate(Tab_name="Students_Pack_Group")
  ) %>%
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  check_select_multiple(data = clean_data.tool3$data, tool = kobo_tool.tool3$survey, question_separator = "_") %>% 
    mutate(Tab_name = "data", tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    check_select_multiple(data = clean_data.tool4$data, tool = kobo_tool.tool4$survey, question_separator = "_") %>% mutate(Tab_name = "data"),
    check_select_multiple(data = clean_data.tool4$Subjects_Not_Being_Taught, tool = kobo_tool.tool4$survey, question_separator = "_") %>% mutate(Tab_name = "Subjects_Not_Being_Taught")
    ) |> mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
    
  # Tool 5
  check_select_multiple(data = clean_data.tool5$data, tool = kobo_tool.tool5$survey, question_separator = "_") |> 
    mutate(Tab_name = "data", tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  check_select_multiple(data = clean_data.tool6$data, tool = kobo_tool.tool6$survey, question_separator = "_") |> 
    # left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = "KEY") |>
    mutate(Tab_name = "data", tool = "Tool 6 - Parent"),
  
  # Tool 7
  check_select_multiple(data = clean_data.tool7$data, tool = clean_data.tool7$survey, question_separator = "_") |> 
    # left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = "KEY") |>
    mutate(Tab_name = "data", tool = "Tool 7 - Shura"),
  
  # Tool 8
  rbind(
    check_select_multiple(data = clean_data.tool8$data, tool = kobo_tool.tool8$survey, question_separator = "_") %>% mutate(Tab_name="data"),
    check_select_multiple(data = clean_data.tool8$Classes, tool = kobo_tool.tool8$survey, question_separator = "_") %>% mutate(Tab_name="Classes"),
    check_select_multiple(data = clean_data.tool8$Classroom_Materials, tool = kobo_tool.tool8$survey, question_separator = "_") %>% mutate(Tab_name="Classroom_Materials"),
    check_select_multiple(data = clean_data.tool8$Teacher_Kit, tool = kobo_tool.tool8$survey, question_separator = "_") %>% mutate(Tab_name="Teacher_Kit"),
    check_select_multiple(data = clean_data.tool8$Student_Kit, tool = kobo_tool.tool8$survey, question_separator = "_") %>% mutate(Tab_name="Student_Kit")
  ) |> mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  
  # Tool 9
  check_select_multiple(data = clean_data.tool9$data, tool = clean_data.tool9$survey, question_separator = "_") |> 
    mutate(Tab_name = "data", tool = "Tool 9 - IP", Sample_Type = "CBE")
) 

# check if the PARENT multiple choice question is inconsistent with it's CHILD/BINARY questions -- Omitted - Fixed in the "R/fix_select_multiple_questions.R"
# sm_na_issues <- rbind(
#   # Tool 1
#   rbind(
#     log_nas_in_sm(clean_data.tool1$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices),
#     log_nas_in_sm(clean_data.tool1$School_Operationality, extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices),
#     log_nas_in_sm(clean_data.tool1$School_Operationality_Other_..., extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices),
#     log_nas_in_sm(clean_data.tool1$Shifts_Detail, extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices),
#     log_nas_in_sm(clean_data.tool1$Other_Shifts_Detail, extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices),
#     log_nas_in_sm(clean_data.tool1$Headmasters, extra_cols = meta_cols, tool.survey = kobo_tool.tool1$survey, tool.choices = kobo_tool.tool1$choices)
#   ) |>
#     mutate(tool = "Tool 1 - Headmaster"),
#   
#   # Tool 2
#   rbind(
#     log_nas_in_sm(clean_data.tool2$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool2$survey, tool.choices = kobo_tool.tool2$choices),
#     log_nas_in_sm(clean_data.tool2$Public_Stationary_Kit_Group, extra_cols = meta_cols, tool.survey = kobo_tool.tool2$survey, tool.choices = kobo_tool.tool2$choices),
#     log_nas_in_sm(clean_data.tool2$Teachers_Pack_Group, extra_cols = meta_cols, tool.survey = kobo_tool.tool2$survey, tool.choices = kobo_tool.tool2$choices),
#     log_nas_in_sm(clean_data.tool2$Students_Pack_Group, extra_cols = meta_cols, tool.survey = kobo_tool.tool2$survey, tool.choices = kobo_tool.tool2$choices)
#   ) |> 
#     mutate(tool = "Tool 2 - Light"),
#   
#   # Tool 3
#   log_nas_in_sm(clean_data.tool3$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool3$survey, tool.choices = kobo_tool.tool3$choices) |> 
#     mutate(tool = "Tool 3 - Headcount"),
#   
#   # Tool 4
#   rbind(
#     log_nas_in_sm(clean_data.tool4$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool4$survey, tool.choices = kobo_tool.tool4$choices),
#     log_nas_in_sm(clean_data.tool4$Subjects_Not_Being_Taught, extra_cols = meta_cols, tool.survey = kobo_tool.tool4$survey, tool.choices = kobo_tool.tool4$choices)
#   ) |> 
#     mutate(tool = "Tool 4 - Teacher"),
#   
#   # Tool 5
#   log_nas_in_sm(clean_data.tool5$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool5$survey, tool.choices = kobo_tool.tool5$choices) |> 
#     mutate(tool = "Tool 5 - WASH"),
#   
#   # Tool 6
#   log_nas_in_sm(clean_data.tool6$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool6$survey, tool.choices = kobo_tool.tool6$choices) |> 
#     mutate(tool = "Tool 6 - Parent"),
#   
#   # Tool 7
#   log_nas_in_sm(clean_data.tool7$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool7$survey, tool.choices = kobo_tool.tool7$choices) |> 
#     mutate(tool = "Tool 7 - Shura"),
#   
#   # Tool 8
#   rbind(
#     log_nas_in_sm(clean_data.tool8$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool8$survey, tool.choices = kobo_tool.tool8$choices),
#     log_nas_in_sm(clean_data.tool8$Classes, extra_cols = meta_cols, tool.survey = kobo_tool.tool8$survey, tool.choices = kobo_tool.tool8$choices),
#     log_nas_in_sm(clean_data.tool8$Classroom_Materials, extra_cols = meta_cols, tool.survey = kobo_tool.tool8$survey, tool.choices = kobo_tool.tool8$choices),
#     log_nas_in_sm(clean_data.tool8$Teacher_Kit, extra_cols = meta_cols, tool.survey = kobo_tool.tool8$survey, tool.choices = kobo_tool.tool8$choices),
#     log_nas_in_sm(clean_data.tool8$Student_Kit, extra_cols = meta_cols, tool.survey = kobo_tool.tool8$survey, tool.choices = kobo_tool.tool8$choices)
#   ) |> 
#     mutate(tool = "Tool 8 - Class"),
#   
#   # Tool 9
#   log_nas_in_sm(clean_data.tool9$data, extra_cols = meta_cols, tool.survey = kobo_tool.tool9$survey, tool.choices = kobo_tool.tool9$choices) |> 
#     mutate(tool = "Tool 9 - IP")
# )

# removing extra elements from the environment
rm(list = c(
  objects(pattern = "^multi_vars_")
))



