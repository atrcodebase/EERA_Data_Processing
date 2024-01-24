if(!require(cleaninginspectoR)) devtools::install_github("ellieallien/cleaninginspectoR", dependencies = T)

to_be_ignored_vars <- c("D7_Year", "G4_Minutes")

# extracting the numeric indicators of each tool
tool0.numeric_vars <- kobo_tool.tool0$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool1.numeric_vars <- kobo_tool.tool1$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool2.numeric_vars <- kobo_tool.tool2$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool3.numeric_vars <- kobo_tool.tool3$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool4.numeric_vars <- kobo_tool.tool4$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool5.numeric_vars <- kobo_tool.tool5$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool6.numeric_vars <- kobo_tool.tool6$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)
tool7.numeric_vars <- kobo_tool.tool7$survey |> filter(type == "integer" & !name %in% to_be_ignored_vars) |> pull(name)


# creating the indices to facilitate joining of meta cols and KEY ---------
meta_cols_tool0 <- clean_data.tool0$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool3_Grades_Repeat <- clean_data.tool0$Tool3_Grades_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool3_Class_Attendance <- clean_data.tool0$Tool3_Class_Attendance %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool3_T3_N_Classes_Repeat <- clean_data.tool0$Tool3_T3_N_Classes_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool3_Headcount <- clean_data.tool0$Tool3_Headcount %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool1_Timetable_Year <- clean_data.tool0$Tool1_Timetable_Year %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool0.Tool1_Timetable1_Repeat <- clean_data.tool0$Tool1_Timetable1_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY) # Under Tool1_Timetable_Year
meta_cols_tool0.Tool1_Timetable2_Repeat <- clean_data.tool0$Tool1_Timetable2_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY) # Under Tool1_Timetable_Year
meta_cols_tool0.Tool1_Timetable3_Repeat <- clean_data.tool0$Tool1_Timetable3_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY) # Under Tool1_Timetable_Year
meta_cols_tool0.Tool1_Timetable4_Repeat <- clean_data.tool0$Tool1_Timetable4_Repeat %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY) # Under Tool1_Timetable_Year


meta_cols_tool1 <- clean_data.tool1$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool1.Shifts_Detail <- clean_data.tool1$Shifts_Detail  %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool2.data <- clean_data.tool2$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool2.student_pack <- clean_data.tool2$Students_Pack_Group %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool2.teacher_pack <- clean_data.tool2$Teachers_Pack_Group %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool2.Public_Stationary_Kit_Group<- clean_data.tool2$Public_Stationary_Kit_Group %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool3 <- clean_data.tool3$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)
meta_cols_tool3.Student_Headcount<- clean_data.tool3$Student_Headcount %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool4 <- clean_data.tool4$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool5 <- clean_data.tool5$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool6 <- clean_data.tool6$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


meta_cols_tool7 <- clean_data.tool7$data %>% mutate(index = as.numeric(row.names(.))) |> select(index, all_of(unname(meta_cols)), KEY)


# logging the outliers ----------------------------------------------------
outlier_check_result <- rbind(
  # Tool 0 -- Confirm values for 6666
  rbind(
    find_outliers(clean_data.tool0$data) |> left_join(meta_cols_tool0, by = "index") |> mutate(Tab_name = "data"),
    find_outliers(clean_data.tool0$Tool3_Grades_Repeat) |> left_join(meta_cols_tool0.Tool3_Grades_Repeat, by = "index") |> mutate(Tab_name = "Tool3_Grades_Repeat"),
    find_outliers(clean_data.tool0$Tool3_Class_Attendance) |> left_join(meta_cols_tool0.Tool3_Class_Attendance, by = "index") |> mutate(Tab_name = "Tool3_Class_Attendance"),
    find_outliers(clean_data.tool0$Tool3_T3_N_Classes_Repeat) |> left_join(meta_cols_tool0.Tool3_T3_N_Classes_Repeat, by = "index") |> mutate(Tab_name = "Tool3_T3_N_Classes_Repeat"),
    find_outliers(clean_data.tool0$Tool3_Headcount) |> left_join(meta_cols_tool0.Tool3_Headcount, by = "index") |> mutate(Tab_name = "Tool3_Headcount"),
    find_outliers(clean_data.tool0$Tool1_Timetable_Year) |> left_join(meta_cols_tool0.Tool1_Timetable_Year, by = "index") |> mutate(Tab_name = "Tool1_Timetable_Year"),
    find_outliers(clean_data.tool0$Tool1_Timetable1_Repeat) |> left_join(meta_cols_tool0.Tool1_Timetable1_Repeat, by = "index") |> mutate(Tab_name = "Tool1_Timetable1_Repeat"),
    find_outliers(clean_data.tool0$Tool1_Timetable2_Repeat) |> left_join(meta_cols_tool0.Tool1_Timetable2_Repeat, by = "index") |> mutate(Tab_name = "Tool1_Timetable2_Repeat"),
    find_outliers(clean_data.tool0$Tool1_Timetable3_Repeat) |> left_join(meta_cols_tool0.Tool1_Timetable3_Repeat, by = "index") |> mutate(Tab_name = "Tool1_Timetable3_Repeat"),
    find_outliers(clean_data.tool0$Tool1_Timetable4_Repeat) |> left_join(meta_cols_tool0.Tool1_Timetable4_Repeat, by = "index") |> mutate(Tab_name = "Tool1_Timetable4_Repeat")
  ) |> 
    filter(variable %in% tool0.numeric_vars) |> 
    mutate(tool = "Tool Data Entry") |> 
    select(KEY,all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name) |> filter(old_value != 6666),
  
  # Tool 1
  rbind(
    find_outliers(clean_data.tool1$data) |> left_join(meta_cols_tool1, by = "index") |> mutate(Tab_name = "data"),
    find_outliers(clean_data.tool1$Shifts_Detail) |> left_join(meta_cols_tool1.Shifts_Detail, by = "index") |> mutate(Tab_name = "Shifts_Detail")
  ) |> 
    filter(variable %in% tool1.numeric_vars) |> 
    mutate(tool = "Tool 1 - Headmaster") |> 
    select(KEY,all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 2
  rbind(
    find_outliers(clean_data.tool2$data) |> left_join(meta_cols_tool2.data, by = "index") |> mutate(Tab_name = "data"),
    find_outliers(clean_data.tool2$Public_Stationary_Kit_Group) |> left_join(meta_cols_tool2.Public_Stationary_Kit_Group, by = "index") |> mutate(Tab_name = "Public_Stationary_Kit_Group"),
    find_outliers(clean_data.tool2$Teachers_Pack_Group) |> left_join(meta_cols_tool2.teacher_pack, by = "index") |> mutate(Tab_name = "Teachers_Pack_Group"),
    find_outliers(clean_data.tool2$Students_Pack_Group) |> left_join(meta_cols_tool2.student_pack, by = "index") |> mutate(Tab_name = "Students_Pack_Group")
  ) |> 
    filter(variable %in% tool2.numeric_vars) |> 
    mutate(tool = "Tool 2 - Light") |>
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 3
  rbind(
    find_outliers(clean_data.tool3$data) |> left_join(meta_cols_tool3, by = "index") |> mutate(Tab_name = "data"),
    find_outliers(clean_data.tool3$Student_Headcount) |> left_join(meta_cols_tool3.Student_Headcount, by = "index") |> mutate(Tab_name = "Student_Headcount")
  ) |> 
    filter(variable %in% tool3.numeric_vars) |> 
    mutate(tool = "Tool 3 - Headcount") |>
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 4
  rbind(
    find_outliers(clean_data.tool4$data) |> left_join(meta_cols_tool4, by = "index") |> mutate(Tab_name = "data")
  ) |> 
    filter(variable %in% tool4.numeric_vars) |> 
    mutate(tool = "Tool 4 - Teacher") |>
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 5
  rbind(
    find_outliers(clean_data.tool5$data) |> left_join(meta_cols_tool5, by = "index") |> mutate(Tab_name = "data")
  ) |>  
    filter(variable %in% tool5.numeric_vars) |> 
    mutate(tool = "Tool 5 - WASH") |>
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 6
  find_outliers(clean_data.tool6$data) |> 
    filter(variable %in% tool6.numeric_vars) |> 
    mutate(tool = "Tool 6 - Parent", Tab_name = "data") |>
    left_join(meta_cols_tool6, by = "index") |> 
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name),
  
  # Tool 7
  rbind(
    find_outliers(clean_data.tool7$data) |> left_join(meta_cols_tool7, by = "index") |> mutate(Tab_name = "data")
  ) |> 
    filter(variable %in% tool7.numeric_vars) |> 
    mutate(tool = "Tool 7 - Shura") |>
    select(KEY, all_of(meta_cols), index, question_name = variable, old_value = value, tool, Tab_name)

)


# removing extra elements from the environment
rm(list = c(
  objects(pattern = "\\.numeric_vars$"),
  objects(pattern = "^meta_cols_tool.*")
))
