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
    check_select_multiple(data = clean_data.tool1$Shifts_Detail, tool = kobo_tool.tool1$survey, question_separator = "_") %>% mutate(Tab_name = "Shifts_Detail"),
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
    mutate(Tab_name = "data", tool = "Tool 6 - Parent", Sample_Type = "Public School"),
  
  # Tool 7
  check_select_multiple(data = clean_data.tool7$data, tool = clean_data.tool7$survey, question_separator = "_") |> 
    mutate(Tab_name = "data", tool = "Tool 7 - Shura", Sample_Type = "Public School")
) 

# removing extra elements from the environment
rm(list = c(
  objects(pattern = "^multi_vars_")
))



