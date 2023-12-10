source("R/functions/log_na_inconsistencies_in_sm_questions.R")

# extract the select_multiple question names -- No multiple select for tool 1
multi_vars_tool_1 = kobo_tool.tool1$survey %>%
  filter(grepl("^select_multiple", type)) %>%
  pull(name)

multi_vars_tool_2 = kobo_tool.tool2$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_3 = kobo_tool.tool3$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_4 = kobo_tool.tool4$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_5 = kobo_tool.tool5$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_6 = kobo_tool.tool6$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_7 = kobo_tool.tool7$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_8 = kobo_tool.tool8$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)

multi_vars_tool_9 = kobo_tool.tool9$survey %>% 
  filter(grepl("^select_multiple", type)) %>% 
  pull(name)


sm_check_result <- rbind(
  # Tool 1
  rbind(
    check_select_multiple(clean_data.tool1$data, multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "data"),
    check_select_multiple(clean_data.tool1$School_Operationality, multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "School_Operationality"),
    check_select_multiple(clean_data.tool1$School_Operationality_Other_..., multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "School_Operationality_Other_..."),
    check_select_multiple(clean_data.tool1$Shifts_Detail, multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Shifts_Detail"),
    check_select_multiple(clean_data.tool1$Other_Shifts_Detail, multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Other_Shifts_Detail"),
    check_select_multiple(clean_data.tool1$Headmasters, multi_vars_tool_1, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Headmasters")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),

  # Tool 2
  rbind(
    check_select_multiple(clean_data.tool2$data, multi_vars_tool_2, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "data"),
    check_select_multiple(clean_data.tool2$Public_Stationary_Kit_Group, multi_vars_tool_2, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Public_Stationary_Kit_Group"),
    check_select_multiple(clean_data.tool2$Teachers_Pack_Group, multi_vars_tool_2, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Teachers_Pack_Group"),
    check_select_multiple(clean_data.tool2$Students_Pack_Group, multi_vars_tool_2, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Students_Pack_Group")
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  check_select_multiple(clean_data.tool3$data, multi_vars_tool_3, question_separator="_", choice_seprator = " ") |> 
    mutate(Tab_name = "data", tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    check_select_multiple(clean_data.tool4$data, multi_vars_tool_4, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "data"),
    check_select_multiple(clean_data.tool4$Subjects_Not_Being_Taught, multi_vars_tool_4, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Subjects_Not_Being_Taught")
  ) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
    
  # Tool 5
  check_select_multiple(clean_data.tool5$data, multi_vars_tool_5, question_separator="_", choice_seprator = " ") |> 
    mutate(Tab_name = "data", tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  check_select_multiple(clean_data.tool6$data, multi_vars_tool_6, question_separator="_", choice_seprator = " ") |> 
    left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = "KEY") |>
    mutate(Tab_name = "data", tool = "Tool 6 - Parent", .before = "Sample_Type"),
  
  # Tool 7
  check_select_multiple(clean_data.tool7$data, multi_vars_tool_7, question_separator="_", choice_seprator = " ") |> 
    left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = "KEY") |>
    mutate(Tab_name = "data", tool = "Tool 7 - Shura", .before = "Sample_Type"),
  
  # Tool 8
  rbind(
    check_select_multiple(clean_data.tool8$data, multi_vars_tool_8, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "data"),
    check_select_multiple(clean_data.tool8$Classes, multi_vars_tool_8, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Classes"),
    check_select_multiple(clean_data.tool8$Classroom_Materials, multi_vars_tool_8, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Classroom_Materials"),
    check_select_multiple(clean_data.tool8$Teacher_Kit, multi_vars_tool_8, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Teacher_Kit"),
    check_select_multiple(clean_data.tool8$Student_Kit, multi_vars_tool_8, question_separator="_", choice_seprator = " ") |> mutate(Tab_name = "Student_Kit")
  ) |> 
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  
  # Tool 9
  check_select_multiple(clean_data.tool9$data, multi_vars_tool_9, question_separator="_", choice_seprator = " ") |> 
    mutate(Tab_name = "data", tool = "Tool 9 - IP", Sample_Type = "CBE")
) %>% 
  filter(KEY != "No mismatches found!")

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



