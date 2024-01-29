Coalesce = function(var) ifelse(is.na(var), 0, var)

# create the necessary columns --------------------------------------------
# Tool 0
clean_data.tool0$data <- clean_data.tool0$data |>
  mutate(
    Tool2_Total_Teachers_Staff_Male.re_calc = case_when(
      Coalesce(Tool2_Teachers_Staff_Present_Male) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Male) == 6666 ~ 0,
      Coalesce(Tool2_Teachers_Staff_Present_Male) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Male) != 6666 ~ Coalesce(Tool2_Teachers_Staff_Absent_Male),
      Coalesce(Tool2_Teachers_Staff_Present_Male) != 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Male) == 6666 ~ Coalesce(Tool2_Teachers_Staff_Present_Male),
      TRUE ~ Coalesce(Tool2_Teachers_Staff_Present_Male) + Coalesce(Tool2_Teachers_Staff_Absent_Male)
    ),
    Tool2_Total_Teachers_Staff_Female.re_calc = case_when(
      Coalesce(Tool2_Teachers_Staff_Present_Female) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Female) == 6666 ~ 0,
      Coalesce(Tool2_Teachers_Staff_Present_Female) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Female) != 6666 ~ Coalesce(Tool2_Teachers_Staff_Absent_Female),
      Coalesce(Tool2_Teachers_Staff_Present_Female) != 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Female) == 6666 ~ Coalesce(Tool2_Teachers_Staff_Present_Female),
      TRUE ~ Coalesce(Tool2_Teachers_Staff_Present_Female) + Coalesce(Tool2_Teachers_Staff_Absent_Female)
    ),
    Tool2_Total_Teachers_Staff_Gender_Not_Identifiable.re_calc = case_when(
      Coalesce(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable) == 6666 ~ 0,
      Coalesce(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable) == 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable) != 6666 ~ Coalesce(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable),
      Coalesce(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable) != 6666 & Coalesce(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable) == 6666 ~ Coalesce(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable),
      TRUE ~ Coalesce(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable) + Coalesce(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable),
    ),
    
    Tool8_FDE_Overall_Total_Present_Students_Male_Female.re_calc = case_when(
      Coalesce(Tool8_FDE_Overall_Present_Students_Male) == 6666 & Coalesce(Tool8_FDE_Overall_Present_Students_Female) == 6666 ~ 0,
      Coalesce(Tool8_FDE_Overall_Present_Students_Male) == 6666 & Coalesce(Tool8_FDE_Overall_Present_Students_Female) != 6666 ~ Coalesce(Tool8_FDE_Overall_Present_Students_Female),
      Coalesce(Tool8_FDE_Overall_Present_Students_Male) != 6666 & Coalesce(Tool8_FDE_Overall_Present_Students_Female) == 6666 ~ Coalesce(Tool8_FDE_Overall_Present_Students_Male),
      TRUE ~ Coalesce(Tool8_FDE_Overall_Present_Students_Male) +  Coalesce(Tool8_FDE_Overall_Present_Students_Female)
    ), 
    Tool8_FDE_Overall_Total_Absent_Students_Male_Female.re_calc = case_when(
      Coalesce(Tool8_FDE_Overall_Absent_Students_Male) == 6666 & Coalesce(Tool8_FDE_Overall_Absent_Students_Female) == 6666 ~ 0,
      Coalesce(Tool8_FDE_Overall_Absent_Students_Male) == 6666 & Coalesce(Tool8_FDE_Overall_Absent_Students_Female) != 6666 ~ Coalesce(Tool8_FDE_Overall_Absent_Students_Female),
      Coalesce(Tool8_FDE_Overall_Absent_Students_Male) != 6666 & Coalesce(Tool8_FDE_Overall_Absent_Students_Female) == 6666 ~ Coalesce(Tool8_FDE_Overall_Absent_Students_Male),
      TRUE ~ Coalesce(Tool8_FDE_Overall_Absent_Students_Male) + Coalesce(Tool8_FDE_Overall_Absent_Students_Female)
    ) 
  )


clean_data.tool0$data <- clean_data.tool0$data |>
  left_join(
    clean_data.tool0$Tool3_Class_Attendance |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Tool3_Total_Regularly_Present_Students_Attendance_Male_sum = sum(Tool3_Total_Regularly_Present_Students_Attendance_Male, na.rm = T),
        Tool3_Total_Regularly_Present_Students_Attendance_Female_sum = sum(Tool3_Total_Regularly_Present_Students_Attendance_Female, na.rm = T),
        Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified_sum = sum(Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified, na.rm = T),
        Tool3_Total_Permanently_Absent_Students_Attendance_Male_sum = sum(Tool3_Total_Permanently_Absent_Students_Attendance_Male, na.rm = T),
        Tool3_Total_Permanently_Absent_Students_Attendance_Female_sum = sum(Tool3_Total_Permanently_Absent_Students_Attendance_Female, na.rm = T),
        Tool3_Total_Permanently_Absent_Students_Attendance_Gender_Not_Identified_sum = sum(Tool3_Total_Permanently_Absent_Students_Attendance_Gender_Not_Identified, na.rm = T),
        Tool3_Total_Enrolled_Students_Attendance_Male_sum = sum(Tool3_Total_Enrolled_Students_Attendance_Male, na.rm = T),
        Tool3_Total_Enrolled_Students_Attendance_Female_sum = sum(Tool3_Total_Enrolled_Students_Attendance_Female, na.rm = T),
        Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified_sum = sum(Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified, na.rm = T)
      ) |>
      mutate(
        Tool3_Total_Regularly_Present_for_Matching.re_calc = rowSums(across(c(Tool3_Total_Regularly_Present_Students_Attendance_Male_sum, 
                                                                              Tool3_Total_Regularly_Present_Students_Attendance_Female_sum, 
                                                                              Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified_sum)), na.rm = T),
        Tool3_Total_Permanently_Absent_Students_for_Matching.re_calc = rowSums(across(c(Tool3_Total_Permanently_Absent_Students_Attendance_Male_sum, 
                                                                                        Tool3_Total_Permanently_Absent_Students_Attendance_Female_sum, 
                                                                                        Tool3_Total_Permanently_Absent_Students_Attendance_Gender_Not_Identified_sum)), na.rm = T),
        Tool3_Total_Enrolled_Students_for_Matching.re_calc = rowSums(across(c(Tool3_Total_Enrolled_Students_Attendance_Male_sum, 
                                                                              Tool3_Total_Enrolled_Students_Attendance_Female_sum, 
                                                                              Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified_sum)), na.rm = T)
      ), by = "KEY")


clean_data.tool0$data <- clean_data.tool0$data |>
  left_join(
    clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
      mutate(
        Tool3_T3_N_Students_Class_Male_Regular_Attendance = case_when(
          Tool3_T3_N_Students_Class_Male_Regular_Attendance == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Male_Regular_Attendance
        ),
        Tool3_T3_N_Students_Class_Female_Regular_Attendance = case_when(
          Tool3_T3_N_Students_Class_Female_Regular_Attendance == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Female_Regular_Attendance
        ),
        Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance = case_when(
          Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance
        ),
        Tool3_T3_N_Students_Class_Male_Permanently_Absent = case_when(
          Tool3_T3_N_Students_Class_Male_Permanently_Absent == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Male_Permanently_Absent
        ),
        Tool3_T3_N_Students_Class_Female_Permanently_Absent = case_when(
          Tool3_T3_N_Students_Class_Female_Permanently_Absent == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Female_Permanently_Absent
        ),
        Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent = case_when(
          Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent
        ),
        Tool3_T3_N_Students_Enrolled_Class_Male = case_when(
          Tool3_T3_N_Students_Enrolled_Class_Male == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Male
        ),
        Tool3_T3_N_Students_Enrolled_Class_Female = case_when(
          Tool3_T3_N_Students_Enrolled_Class_Female == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Female
        ),
        Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified = case_when(
          Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified == 6666 ~ NA_real_,
          TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified
        )
      ) |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Tool3_T3_Total_N_of_Students_Regular_Attendance_Male.re_calc = sum(Tool3_T3_N_Students_Class_Male_Regular_Attendance, na.rm = T),
        Tool3_T3_Total_N_of_Students_Regular_Attendance_Female.re_calc = sum(Tool3_T3_N_Students_Class_Female_Regular_Attendance, na.rm = T), 
        Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified.re_calc = sum(Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance, na.rm = T),
        Tool3_T3_Total_N_of_Students_Permanently_Absent_Male.re_calc = sum(Tool3_T3_N_Students_Class_Male_Permanently_Absent, na.rm = T),
        Tool3_T3_Total_N_of_Students_Permanently_Absent_Female.re_calc = sum(Tool3_T3_N_Students_Class_Female_Permanently_Absent, na.rm = T),
        Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified.re_calc = sum(Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent, na.rm = T),
        Tool3_T3_Total_N_of_Students_Enrolled_Male.re_calc = sum(Tool3_T3_N_Students_Enrolled_Class_Male, na.rm = T),
        Tool3_T3_Total_N_of_Students_Enrolled_Female.re_calc = sum(Tool3_T3_N_Students_Enrolled_Class_Female, na.rm = T),
        Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified.re_calc = sum(Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified, na.rm = T)
      ), by = "KEY")

# Tool 1
# clean_data.tool1$data <- clean_data.tool1$data |> 
#   mutate(
#     School_indx.re_calc = case_when(
#       School_Type_SV == "Primary (1-6); Secondary (7-9); Higher Secondary (10-12)" ~ "1 2 3 4 5 6 7 8 9 10 11 12",
#       School_Type_SV == "Primary (1-6); Secondary (7-9)" ~ "1 2 3 4 5 6 7 8 9",
#       School_Type_SV == "Primary (1-6); Higher Secondary (10-12)" ~ "1 2 3 4 5 6 10 11 12",
#       School_Type_SV == "Secondary (7-9); Higher Secondary (10-12)" ~ "7 8 9 10 11 12",
#       School_Type_SV == "Primary (1-6)" ~ "1 2 3 4 5 6",
#       School_Type_SV == "Secondary (7-9)" ~ "7 8 9",
#       School_Type_SV == "Higher Secondary (10-12)" ~ "10 11 12",
#       TRUE ~ NA_character_
#     ),
#     School_rep.re_calc = ifelse(!is.na(School_indx.re_calc),as.integer(str_count(School_indx.re_calc," ")+1),School_rep)
#   )

clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(
    clean_data.tool1$Support_Respondents |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Support_Respondents.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)), by = "KEY")


clean_data.tool1$data <- clean_data.tool1$data |> 
  mutate(
    # Type_Of_School_Sample_Value
    Type_Of_School_Sample_Value.re_calc = case_when(
      Type_Of_School_CBE_Based_On_The_Sample == "Primary" ~ 1,
      Type_Of_School_CBE_Based_On_The_Sample == "Secondary" ~ 2,
      Type_Of_School_CBE_Based_On_The_Sample == "Higher Secondary" ~ 3,
      TRUE ~ NA_real_
    ),
    # School_Type_Final
    School_Type_Final.re_calc = case_when(
      A30 == 1 ~ Type_Of_School_Sample_Value,
      A30 == 0 | A30 == 2 ~ School_Type_SV,
      TRUE ~ 3
    ),
    # School_indx
    School_indx.re_calc = case_when(
      School_Type_Final == 3 ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_Final == 2 ~ "1 2 3 4 5 6 7 8 9",
      School_Type_Final == 1 ~ "1 2 3 4 5 6",
      TRUE ~ NA_character_
    ),
    School_rep.re_calc = ifelse(!is.na(School_indx),as.integer(str_count(School_indx," ")+1),School_rep),
    
    Count_Shifts.re_calc = ifelse(!is.na(C14A1),as.integer(str_count(C14A1," ")+1),0)
  )

clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(
    clean_data.tool1$School_Operationality |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_School_Operationality.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)), by = "KEY")

clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(
    clean_data.tool1$Shifts_Detail |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Shifts_Detail.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)), by = "KEY")

clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(
    clean_data.tool1$Headmasters |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Headmasters.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)), by = "KEY")


clean_data.tool1$data <- clean_data.tool1$data |>
  left_join(
    clean_data.tool1$Weekly_Class_Schedule |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Weekly_Class_Schedule_Photo.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)), by = "KEY")

# Tool 2 
clean_data.tool2$data <- clean_data.tool2$data |>
  left_join(
    clean_data.tool2$Support_Respondents |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Support_Respondents.re_calc = n()
      ) |> mutate(KEY = as.character(KEY)) , by = "KEY")


clean_data.tool2$data <- clean_data.tool2$data |>
  left_join(
    clean_data.tool2$Attendance_Sheet_Photos |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Attendance_Sheet_Photos.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

# Tool 3
clean_data.tool3$data <- clean_data.tool3$data |>
  mutate(
    # Type_Of_School_Sample_Value
    Type_Of_School_Sample_Value.re_calc = case_when(
      Type_Of_School_CBE_Based_On_The_Sample == "Primary" ~ 1,
      Type_Of_School_CBE_Based_On_The_Sample == "Secondary" ~ 2,
      Type_Of_School_CBE_Based_On_The_Sample == "Higher Secondary" ~ 3,
      TRUE ~ NA_real_
    ),
    # School_Type_Final
    School_Type_Final.re_calc = case_when(
      B6 == 1 ~ Type_Of_School_Sample_Value,
      B6 == 0 | B6 == 2 ~ School_Type_SV,
      TRUE ~ 3
    )
  )

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Support_Respondents |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Support_Respondents.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY") 

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Enrollement_Attendance_Summary |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Enrollement_Attendance_Summary.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Grade_Details |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Grade_Details.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Todays_Attendance_Detail |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Todays_Attendance_Detail.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$LastWeek_Attendance_Detail |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_LastWeek_Attendance_Detail.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  mutate(
    N_Classes_Grade.re_calc = case_when(
      C9 > 3 ~ 3,
      TRUE ~ C9
    )
  )

# Tool 5
clean_data.tool5$data <- clean_data.tool5$data |> 
  left_join(
    clean_data.tool5$Useable_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Useable_Toilet_Photo.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY") |>
  left_join( 
    clean_data.tool5$Non_Useable_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Non_Useable_Toilet_Photo.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY") |>
  left_join(
    clean_data.tool5$Under_Construction_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Under_Construction_Toilet_Photo.re_calc = n()
      ) |> mutate(KEY = as.character(KEY))
    , by = "KEY")

# compare the calculated values before and after logs replaced ----------------
calculate_issues <- plyr::rbind.fill(
  # Tool 0 
  clean_data.tool0$data |>
    filter(Tool2_Total_Teachers_Staff_Male != Tool2_Total_Teachers_Staff_Male.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool2_Total_Teachers_Staff_Male",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool2_Total_Teachers_Staff_Male,
           new_value = Tool2_Total_Teachers_Staff_Male.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool2_Total_Teachers_Staff_Female != Tool2_Total_Teachers_Staff_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool2_Total_Teachers_Staff_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool2_Total_Teachers_Staff_Female,
           new_value = Tool2_Total_Teachers_Staff_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool2_Total_Teachers_Staff_Gender_Not_Identifiable != Tool2_Total_Teachers_Staff_Gender_Not_Identifiable.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool2_Total_Teachers_Staff_Gender_Not_Identifiable",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool2_Total_Teachers_Staff_Gender_Not_Identifiable,
           new_value = Tool2_Total_Teachers_Staff_Gender_Not_Identifiable.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool8_FDE_Overall_Total_Present_Students_Male_Female != Tool8_FDE_Overall_Total_Present_Students_Male_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool8_FDE_Overall_Total_Present_Students_Male_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool8_FDE_Overall_Total_Present_Students_Male_Female,
           new_value = Tool8_FDE_Overall_Total_Present_Students_Male_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool8_FDE_Overall_Total_Absent_Students_Male_Female != Tool8_FDE_Overall_Total_Absent_Students_Male_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool8_FDE_Overall_Total_Absent_Students_Male_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool8_FDE_Overall_Total_Absent_Students_Male_Female,
           new_value = Tool8_FDE_Overall_Total_Absent_Students_Male_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_Total_Regularly_Present_for_Matching != Tool3_Total_Regularly_Present_for_Matching.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_Total_Regularly_Present_for_Matching",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_Total_Regularly_Present_for_Matching,
           new_value = Tool3_Total_Regularly_Present_for_Matching.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_Total_Permanently_Absent_Students_for_Matching != Tool3_Total_Permanently_Absent_Students_for_Matching.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_Total_Permanently_Absent_Students_for_Matching",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_Total_Permanently_Absent_Students_for_Matching,
           new_value = Tool3_Total_Permanently_Absent_Students_for_Matching.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_Total_Enrolled_Students_for_Matching != Tool3_Total_Enrolled_Students_for_Matching.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_Total_Enrolled_Students_for_Matching",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_Total_Enrolled_Students_for_Matching,
           new_value = Tool3_Total_Enrolled_Students_for_Matching.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Regular_Attendance_Male != Tool3_T3_Total_N_of_Students_Regular_Attendance_Male.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Regular_Attendance_Male",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(#any_of(meta_cols),
      question, old_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Male,
      new_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Male.re_calc, #issue, 
      tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Regular_Attendance_Female != Tool3_T3_Total_N_of_Students_Regular_Attendance_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Regular_Attendance_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Female,
           new_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified != Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified,
           new_value = Tool3_T3_Total_N_of_Students_Regular_Attendance_Gender_Not_Identified.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Permanently_Absent_Male != Tool3_T3_Total_N_of_Students_Permanently_Absent_Male.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Permanently_Absent_Male",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Male,
           new_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Male.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Permanently_Absent_Female != Tool3_T3_Total_N_of_Students_Permanently_Absent_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Permanently_Absent_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Female,
           new_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified != Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified,
           new_value = Tool3_T3_Total_N_of_Students_Permanently_Absent_Gender_Not_Identified.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Enrolled_Male != Tool3_T3_Total_N_of_Students_Enrolled_Male.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Enrolled_Male",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Enrolled_Male,
           new_value = Tool3_T3_Total_N_of_Students_Enrolled_Male.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Enrolled_Female != Tool3_T3_Total_N_of_Students_Enrolled_Female.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Enrolled_Female",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Enrolled_Female,
           new_value = Tool3_T3_Total_N_of_Students_Enrolled_Female.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool0$data |>
    filter(Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified != Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified.re_calc) |>
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified",
      tool = "Tool Data Entry",
      sheet = "data"
    ) |>
    select(any_of(meta_cols), question, old_value = Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified,
           new_value = Tool3_T3_Total_N_of_Students_Enrolled_Gender_Not_Identified.re_calc, issue, tool, sheet, KEY),
  
  # Tool 1 
  clean_data.tool1$data |> 
    filter(Count_Support_Respondents != Count_Support_Respondents.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Support_Respondents",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_Support_Respondents,
           new_value = Count_Support_Respondents.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Type_Of_School_Sample_Value != Type_Of_School_Sample_Value.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Type_Of_School_Sample_Value",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Type_Of_School_Sample_Value,
           new_value = Type_Of_School_Sample_Value.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_Type_Final != School_Type_Final.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_Type_Final",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_Type_Final,
           new_value = School_Type_Final.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_indx != School_indx.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="school_indx",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_rep != School_rep.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_rep",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_rep,
           new_value = School_rep.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Count_School_Operationality != Count_School_Operationality.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_School_Operationality",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_School_Operationality,
           new_value = Count_School_Operationality.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Count_Shifts != Count_Shifts.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Shifts",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_Shifts,
           new_value = Count_Shifts.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Count_Shifts_Detail != Count_Shifts_Detail.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Shifts_Detail",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_Shifts_Detail,
           new_value = Count_Shifts_Detail.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Count_Headmasters != Count_Headmasters.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Headmasters",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_Headmasters,
           new_value = Count_Headmasters.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(Count_Weekly_Class_Schedule_Photo != Count_Weekly_Class_Schedule_Photo.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Weekly_Class_Schedule_Photo",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = Count_Weekly_Class_Schedule_Photo,
           new_value = Count_Weekly_Class_Schedule_Photo.re_calc, issue, tool, sheet, KEY),
  
  # Tool 2
  clean_data.tool2$data |> 
    filter(Count_Support_Respondents.re_calc != Count_Support_Respondents) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Support_Respondents",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Support_Respondents,
           new_value = Count_Support_Respondents.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool2$data |> 
    filter(Count_Attendance_Sheet_Photos.re_calc != Count_Attendance_Sheet_Photos) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Attendance_Sheet_Photos",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Attendance_Sheet_Photos,
           new_value = Count_Attendance_Sheet_Photos.re_calc, issue, tool, sheet, KEY),
  
  # Tool 3
  clean_data.tool3$data |> 
    filter(Type_Of_School_Sample_Value != Type_Of_School_Sample_Value.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Type_Of_School_Sample_Value",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Type_Of_School_Sample_Value,
           new_value = Type_Of_School_Sample_Value.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(School_Type_Final != School_Type_Final.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_Type_Final",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = School_Type_Final,
           new_value = School_Type_Final.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Support_Respondents.re_calc != Count_Support_Respondents) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Support_Respondents",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Support_Respondents,
           new_value = Count_Support_Respondents.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Enrollement_Attendance_Summary.re_calc != Count_Enrollement_Attendance_Summary) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Enrollement_Attendance_Summary",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Enrollement_Attendance_Summary,
           new_value = Count_Enrollement_Attendance_Summary.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Grade_Details.re_calc != Count_Grade_Details) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Grade_Details",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Grade_Details,
           new_value = Count_Grade_Details.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(N_Classes_Grade.re_calc != N_Classes_Grade) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="N_Classes_Grade",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = N_Classes_Grade,
           new_value = N_Classes_Grade.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Todays_Attendance_Detail.re_calc != Count_Todays_Attendance_Detail) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Todays_Attendance_Detail",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Todays_Attendance_Detail,
           new_value = Count_Todays_Attendance_Detail.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_LastWeek_Attendance_Detail.re_calc != Count_LastWeek_Attendance_Detail) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_LastWeek_Attendance_Detail",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_LastWeek_Attendance_Detail,
           new_value = Count_LastWeek_Attendance_Detail.re_calc, issue, tool, sheet, KEY),
  
  # Tool 5
  clean_data.tool5$data |> 
    filter(Count_Under_Construction_Toilet_Photo.re_calc != Count_Under_Construction_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Under_Construction_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Under_Construction_Toilet_Photo,
           new_value = Count_Under_Construction_Toilet_Photo.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool5$data |> 
    filter(Count_Useable_Toilet_Photo.re_calc != Count_Useable_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Useable_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Useable_Toilet_Photo,
           new_value = Count_Useable_Toilet_Photo.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool5$data |> 
    filter(Count_Non_Useable_Toilet_Photo.re_calc != Count_Non_Useable_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Non_Useable_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Non_Useable_Toilet_Photo,
           new_value = Count_Non_Useable_Toilet_Photo.re_calc, issue, tool, sheet, KEY)
  
)


# remove extra indicators that were created in above -------------------------------
clean_data.tool1$data <- clean_data.tool1$data |> select(-ends_with(".re_calc"))
clean_data.tool2$data <- clean_data.tool2$data |> select(-ends_with(".re_calc"))
clean_data.tool3$data <- clean_data.tool3$data |> select(-ends_with(".re_calc"))
clean_data.tool5$data <- clean_data.tool5$data |> select(-ends_with(".re_calc"))
