# to compare the counts between supposed counts (based on main sheet) and rows in child sheet
source("R/compare_row_counts.R")
source("R/repeat_sheet_indx_check.R")

# to count select multiple's selected choices
count_sm_selected_choices <- function(df, question) {
  sm.binaries <- names(df)[grepl(paste0("^", question, "_\\d"), names(df), ignore.case = T)]
  data.frame(
    supposed_row_count = apply(df[sm.binaries], 1, sum, na.rm = T),
    KEY = df$KEY
  )
}


# Changed the supposed_row_count value from COUNT column in data sets to column define in the tool repeat-count - 131223
repeat_sheet_issues <- plyr::rbind.fill(
  plyr::rbind.fill(
    # Tool 0 
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data |> mutate(Tool3_Grades_value_count = case_when(
        is.na(Tool3_Grades) | str_trim(Tool3_Grades) == "" ~ 0,
        TRUE ~ (str_count(Tool3_Grades," ")+1))
      ), supposed_row_count = Tool3_Grades_value_count, KEY),
      child_df = clean_data.tool0$Tool3_Grades_Repeat,
      child_sheet_name = "Tool3_Grades_Repeat"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool3_Grades"),
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data, supposed_row_count = Total_Classes, KEY),
      child_df = clean_data.tool0$Tool3_Class_Attendance,
      child_sheet_name = "Tool3_Class_Attendance"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Total_Classes"),
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data |> filter(Tool3_T3_Confirm_Visit_Date_Attendance == 1), supposed_row_count = Total_Classes, KEY),
      child_df = clean_data.tool0$Tool3_T3_N_Classes_Repeat,
      child_sheet_name = "Tool3_T3_N_Classes_Repeat"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Total_Classes"),
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data, supposed_row_count = Tool3_N_Classes_Headcount, KEY),
      child_df = clean_data.tool0$Tool3_Headcount,
      child_sheet_name = "Tool3_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool3_N_Classes_Headcount"),
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$data |> mutate(Tool1_Timetable_value_count = case_when(
        is.na(Tool1_Timetable) | str_trim(Tool1_Timetable) == "" ~ 0,
        TRUE ~ (str_count(Tool1_Timetable," ")+1))
      ), supposed_row_count = Tool1_Timetable_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable_Year,
      child_sheet_name = "Tool1_Timetable_Year"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Tool1_Timetable"),
    
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable1_value_count = case_when(
        is.na(Tool1_How_Many_Timetable1) | str_trim(Tool1_How_Many_Timetable1) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable1," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable1_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable1_Repeat,
      child_sheet_name = "Tool1_Timetable1_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable1"),
    
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable2_value_count = case_when(
        is.na(Tool1_How_Many_Timetable2) | str_trim(Tool1_How_Many_Timetable2) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable2," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable2_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable2_Repeat,
      child_sheet_name = "Tool1_Timetable2_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable2"),
    
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable3_value_count = case_when(
        is.na(Tool1_How_Many_Timetable3) | str_trim(Tool1_How_Many_Timetable3) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable3," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable3_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable3_Repeat,
      child_sheet_name = "Tool1_Timetable3_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable3"),
    
    
    compare_row_counts(
      supposed_count_df = select(clean_data.tool0$Tool1_Timetable_Year |> mutate(Tool1_How_Many_Timetable4_value_count = case_when(
        is.na(Tool1_How_Many_Timetable4) | str_trim(Tool1_How_Many_Timetable4) == "" ~ 0,
        TRUE ~ (str_count(Tool1_How_Many_Timetable4," ")+1))
      ), supposed_row_count = Tool1_How_Many_Timetable4_value_count, KEY),
      child_df = clean_data.tool0$Tool1_Timetable4_Repeat,
      child_sheet_name = "Tool1_Timetable4_Repeat"
    ) |> mutate(Row_count_from_tab = "Tool1_Timetable_Year", Row_count_column_name = "Tool1_How_Many_Timetable4")
  ) |> 
    mutate(tool = "Tool Data Entry", Sample_Type = ""),
  # Tool 1
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = C11, KEY),
      child_df = clean_data.tool1$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C11"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = School_rep, KEY),
      child_df = clean_data.tool1$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_rep"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data |> mutate(C14A1_value_count = case_when(
        is.na(C14A1) | str_trim(C14A1) == "" ~ 0,
        TRUE ~ (str_count(C14A1, " ") + 1)
      )), 
      supposed_row_count = C14A1_value_count, KEY),
      child_df = clean_data.tool1$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C14A1"),

    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = C15, KEY),
      child_df = clean_data.tool1$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C15"),
    # 10
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data |> mutate(subject_detail_counter = 31), supposed_row_count = subject_detail_counter, KEY),
      child_df = clean_data.tool1$Subjects_Detail,
      child_sheet_name = "Subjects_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "subject_detail_counter"),
    # 11
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data |> filter(A34 %in% c(1,2,3,4,"1","2","3","4")) |> mutate(education_quality_counter = 9), supposed_row_count = education_quality_counter, KEY),
      child_df = clean_data.tool1$Education_Quality,
      child_sheet_name = "Education_Quality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "education_quality_counter")
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = D8, KEY),
      child_df = clean_data.tool2$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D8"),
    # 2 - The repeat does not have repeat count in the tool - but it has a note to like (Please go to previous page and take a photo or multiple photos of the daily attendance sheet.)
    clean_data.tool2$data |>
      filter(G2 == 1) |>
      mutate(supposed_row_count = 1) |>
      left_join(
        clean_data.tool2$Attendance_Sheet_Photos |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 1 missing row for the logged KEY in Attendance_Sheet_Photos sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Attendance_Sheet_Photos sheet")
        ),
        sheet_name = "Attendance_Sheet_Photos",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> mutate(H5_value_count = case_when(
        is.na(H5) | str_trim(H5) == "" ~ 0,
        str_detect(H5, "8888") ~ (str_count(H5, " ")),
        TRUE ~ (str_count(H5, " ")+1)
      )), supposed_row_count = H5_value_count, KEY),
      child_df = clean_data.tool2$Public_Stationary_Kit_Group,
      child_sheet_name = "Public_Stationary_Kit_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "H5"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> filter(i1 == 1) |> mutate(i5_value_count = case_when(
        is.na(i5) | str_trim(i5) == "" ~ 0,
        TRUE ~ (str_count(i5, " ")+1)
      )), supposed_row_count = i5_value_count, KEY),
      child_df = clean_data.tool2$Teachers_Pack_Group,
      child_sheet_name = "Teachers_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "i5"),
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data |> mutate(J5_value_count = case_when(
        is.na(J5) | str_trim(J5) == "" ~ 0,
        str_detect(J5, "8888") ~ (str_count(J5, " ")),
        TRUE ~ (str_count(J5, " ")+1)
      )), supposed_row_count = J5_value_count, KEY),
      child_df = clean_data.tool2$Students_Pack_Group,
      child_sheet_name = "Students_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "J5")
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = B9, KEY),
      child_df = clean_data.tool3$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "B9"),
    # 2 - Does not have repeat count in the tool - Note (<b>Please go to previous page and take a photo of the enrollement and attendance summary.)
    clean_data.tool3$data |>
      mutate(supposed_row_count = 1) |>
      filter(C1 == 1) |>
      left_join(
        clean_data.tool3$Enrollement_Attendance_Summary |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 1 missing row for the logged KEY in Enrollement_Attendance_Summary sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Enrollement_Attendance_Summary sheet")
        ),
        sheet_name = "Enrollement_Attendance_Summary",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = C9, KEY),
      child_df = clean_data.tool3$Grade_Details,
      child_sheet_name = "Grade_Details"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = N_Classes_Grade, KEY),
      child_df = clean_data.tool3$Todays_Attendance_Detail,
      child_sheet_name = "Todays_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "N_Classes_Grade"),
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = C9, KEY),
      child_df = clean_data.tool3$LastWeek_Attendance_Detail,
      child_sheet_name = "LastWeek_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C9"),
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data |> mutate(E1_value_count = case_when(
        is.na(E1) | str_trim(E1) == "" ~ 0,
        TRUE ~ (str_count(E1, " ")+1)
      )), supposed_row_count = E1_value_count, KEY),
      child_df = clean_data.tool3$Student_Headcount,
      child_sheet_name = "Student_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E1")
  ) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data, KEY, supposed_row_count = F2_N),
      child_df = clean_data.tool4$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F2_N"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> mutate(D9_value_count = case_when(
        is.na(D9) | str_trim(D9) == "" ~ 0,
        TRUE ~ (str_count(D9, " ")+1)
      )), KEY, supposed_row_count = D9_value_count),
      child_df = clean_data.tool4$Subjects_taught_by_this_teacher,
      child_sheet_name = "Subjects_taught_by_this_teacher"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D9"),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data |> filter(F11 == 1) |> mutate(F12_Subjects_Not_Being_Taught_value_count = case_when(
        is.na(F12_Subjects_Not_Being_Taught) | str_trim(F12_Subjects_Not_Being_Taught) == "" ~ 0,
        str_detect(F12_Subjects_Not_Being_Taught, "8888") ~ (str_count(F12_Subjects_Not_Being_Taught, " ")),
        TRUE ~ (str_count(F12_Subjects_Not_Being_Taught, " ")+1)
      )), KEY, supposed_row_count = F12_Subjects_Not_Being_Taught_value_count),
      child_df = clean_data.tool4$Subjects_Not_Being_Taught,
      child_sheet_name = "Subjects_Not_Being_Taught"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "F12_Subjects_Not_Being_Taught")
  ) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  # 1 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of toilets under construction.)
  plyr::rbind.fill(
    clean_data.tool5$data |>
      mutate(supposed_row_count = 2) |>
      filter(C5 == 4) |>
      left_join(
        clean_data.tool5$Under_Construction_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) |> mutate(KEY = as.character(KEY)) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Under_Construction_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Under_Construction_Toilets sheet")
        ),
        sheet_name = "Under_Construction_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 2 - Does not have repeat count in the tool - note (<b>Please go to previous page and take at least two photos of useable toilets.)
    clean_data.tool5$data |>
      mutate(supposed_row_count = 2) |>
      filter(C9_4 > 0 | C9_5 > 0 | C9_6 > 0) |>
      left_join(
        clean_data.tool5$Useable_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 2 missing row for the logged KEY in Useable_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Useable_Toilets sheet")
        ),
        sheet_name = "Useable_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      ),
    # 3 - Does not have repeat count in the tool - note (<b>Please go to previous page and take a photo of Non_Useable toilets.)
    clean_data.tool5$data |>
      mutate(supposed_row_count = 1) |>
      filter(C9_7 > 0 | C9_8 > 0 | C9_9 > 0) |>
      left_join(
        clean_data.tool5$Non_Useable_Toilets |>
          group_by(KEY = PARENT_KEY) |>
          summarise(current_row_count = n()) , by = "KEY") |>
      filter(current_row_count < supposed_row_count | is.na(current_row_count)) |>
      mutate(
        issue = case_when(
          is.na(current_row_count) ~ "There is at least 1 missing row for the logged KEY in Non_Useable_Toilets sheet",
          TRUE ~ paste0("There is at least ",supposed_row_count - current_row_count ," missing row for the logged KEY in Non_Useable_Toilets sheet")
        ),
        sheet_name = "Non_Useable_Toilets",
        Row_count_column_name = "",
        Row_count_from_tab = "data"
      ) |>
      select(
        PARENT_KEY = KEY,
        issue,
        supposed_row_count,
        current_row_count,
        sheet_name,
        Row_count_column_name,
        Row_count_from_tab
      )
    ) |>
      mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School") |> as.data.frame(),
  # Tool 6
  plyr::rbind.fill(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool6$data, KEY, supposed_row_count = D4_N),
      child_df = clean_data.tool6$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "D4_N")
  ) |> 
    mutate(tool = "Tool 6 - Parent", Sample_Type = "Public School"),
  
  # Tool 7
  plyr::rbind.fill(
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = E4_N),
      child_df = clean_data.tool7$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "E4_N")
  ) |>
    mutate(tool = "Tool 7 - Shura", Sample_Type = "Public School")
)


# Remove Unnecessary Objects from Environment --------------------------------------------------------------
rm(list = c("count_sm_selected_choices", "compare_row_counts"))
