source("R/functions/to_na_function.R")

## Turn values to Lables -------------------------------------------------------
# Tool 0
clean_data.tool0_for_client$data <- clean_data.tool0_for_client$data |>
  mutate(
    Tool2_N_Attendance_Books = as.character(Tool2_N_Attendance_Books),
    Tool2_N_Attendance_Books = case_when(
      Tool2_N_Attendance_Books == "6666" ~ "Not available",
      TRUE ~ Tool2_N_Attendance_Books
    ),
    
    Tool2_N_Pages_Attendance_Books = as.character(Tool2_N_Pages_Attendance_Books),
    Tool2_N_Pages_Attendance_Books = case_when(
      Tool2_N_Pages_Attendance_Books == "6666" ~ "Not available",
      TRUE ~ Tool2_N_Pages_Attendance_Books
    ),
    
    Tool2_N_Teachers_Staff_All_Attendance_Books = as.character(Tool2_N_Teachers_Staff_All_Attendance_Books),
    Tool2_N_Teachers_Staff_All_Attendance_Books = case_when(
      Tool2_N_Teachers_Staff_All_Attendance_Books == "6666" ~ "Not available",
      TRUE ~ Tool2_N_Teachers_Staff_All_Attendance_Books
    ),
    
    Tool2_Teachers_Staff_Present_Male = as.character(Tool2_Teachers_Staff_Present_Male),
    Tool2_Teachers_Staff_Present_Male = case_when(
      Tool2_Teachers_Staff_Present_Male == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Present_Male
    ),
    
    Tool2_Teachers_Staff_Absent_Male = as.character(Tool2_Teachers_Staff_Absent_Male),
    Tool2_Teachers_Staff_Absent_Male = case_when(
      Tool2_Teachers_Staff_Absent_Male == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Absent_Male
    ),
    
    Tool2_Teachers_Staff_Present_Female = as.character(Tool2_Teachers_Staff_Present_Female),
    Tool2_Teachers_Staff_Present_Female = case_when(
      Tool2_Teachers_Staff_Present_Female == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Present_Female
    ),
    
    Tool2_Teachers_Staff_Absent_Female = as.character(Tool2_Teachers_Staff_Absent_Female),
    Tool2_Teachers_Staff_Absent_Female = case_when(
      Tool2_Teachers_Staff_Absent_Female == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Absent_Female
    ),
    
    Tool2_Teachers_Staff_Present_Gender_Not_Identifiable = as.character(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable),
    Tool2_Teachers_Staff_Present_Gender_Not_Identifiable = case_when(
      Tool2_Teachers_Staff_Present_Gender_Not_Identifiable == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Present_Gender_Not_Identifiable
    ),
    
    Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable = as.character(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable),
    Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable = case_when(
      Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable
    ),
    
    Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable = as.character(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable),
    Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable = case_when(
      Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable == "6666" ~ "Not available",
      TRUE ~ Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable
    ),
    
    Tool3_Enrolled_Students_Not_Matching_Integer = as.character(Tool3_Enrolled_Students_Not_Matching_Integer),
    Tool3_Enrolled_Students_Not_Matching_Integer = case_when(
      Tool3_Enrolled_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_Enrolled_Students_Not_Matching_Integer
    ),
    
    Tool3_Regularly_Present_Students_Not_Matching_Integer = as.character(Tool3_Regularly_Present_Students_Not_Matching_Integer),
    Tool3_Regularly_Present_Students_Not_Matching_Integer = case_when(
      Tool3_Regularly_Present_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_Regularly_Present_Students_Not_Matching_Integer
    ), 
    
    Tool3_Permanently_Absent_Students_Not_Matching_Integer = as.character(Tool3_Permanently_Absent_Students_Not_Matching_Integer),
    Tool3_Permanently_Absent_Students_Not_Matching_Integer = case_when(
      Tool3_Permanently_Absent_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_Permanently_Absent_Students_Not_Matching_Integer
    ),
    
    Tool3_T3_Enrolled_Students_Not_Matching_Integer = as.character(Tool3_T3_Enrolled_Students_Not_Matching_Integer),
    Tool3_T3_Enrolled_Students_Not_Matching_Integer = case_when(
      Tool3_T3_Enrolled_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_Enrolled_Students_Not_Matching_Integer
    ),
    
    Tool3_T3_Regularly_Present_Students_Not_Matching_Integer = as.character(Tool3_T3_Regularly_Present_Students_Not_Matching_Integer),
    Tool3_T3_Regularly_Present_Students_Not_Matching_Integer = case_when(
      Tool3_T3_Regularly_Present_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_Regularly_Present_Students_Not_Matching_Integer
    ),
    
    Tool3_T3_Permanently_Absent_Students_Not_Matching_Integer = as.character(Tool3_T3_Permanently_Absent_Students_Not_Matching_Integer),
    Tool3_T3_Permanently_Absent_Students_Not_Matching_Integer = case_when(
      Tool3_T3_Permanently_Absent_Students_Not_Matching_Integer == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_Permanently_Absent_Students_Not_Matching_Integer
    ),
    
    Tool8_FDE_Overall_Present_Students_Male = as.character(Tool8_FDE_Overall_Present_Students_Male),
    Tool8_FDE_Overall_Present_Students_Male = case_when(
      Tool8_FDE_Overall_Present_Students_Male == "6666" ~ "Not available",
      TRUE ~ Tool8_FDE_Overall_Present_Students_Male
    ),
    
    Tool8_FDE_Overall_Present_Students_Female = as.character(Tool8_FDE_Overall_Present_Students_Female),
    Tool8_FDE_Overall_Present_Students_Female = case_when(
      Tool8_FDE_Overall_Present_Students_Female == "6666" ~ "Not available",
      TRUE ~ Tool8_FDE_Overall_Present_Students_Female
    ),
    
    Tool8_FDE_Overall_Absent_Students_Male = as.character(Tool8_FDE_Overall_Absent_Students_Male),
    Tool8_FDE_Overall_Absent_Students_Male = case_when(
      Tool8_FDE_Overall_Absent_Students_Male == "6666" ~ "Not available",
      TRUE ~ Tool8_FDE_Overall_Absent_Students_Male
    ),
    
    Tool8_FDE_Overall_Absent_Students_Female = as.character(Tool8_FDE_Overall_Absent_Students_Female),
    Tool8_FDE_Overall_Absent_Students_Female = case_when(
      Tool8_FDE_Overall_Absent_Students_Female == "6666" ~ "Not available",
      TRUE ~ Tool8_FDE_Overall_Absent_Students_Female
    ),
    
    Tool8_Total_Present_Variance = as.character(Tool8_Total_Present_Variance),
    Tool8_Total_Present_Variance = case_when(
      Tool8_Total_Present_Variance == "6666" ~ "Not available",
      TRUE ~ Tool8_Total_Present_Variance
    ),
    
    Tool8_Total_Present_Variance = as.character(Tool8_Total_Present_Variance),
    Tool8_Total_Present_Variance = case_when(
      Tool8_Total_Present_Variance == "6666" ~ "Not available",
      TRUE ~ Tool8_Total_Present_Variance
    )
  )

clean_data.tool0_for_client$Tool3_T3_N_Classes_Repeat <- clean_data.tool0_for_client$Tool3_T3_N_Classes_Repeat |>
  mutate(
    Tool3_T3_N_Students_Class_Male_Regular_Attendance = as.character(Tool3_T3_N_Students_Class_Male_Regular_Attendance),
    Tool3_T3_N_Students_Class_Male_Regular_Attendance = case_when(
      Tool3_T3_N_Students_Class_Male_Regular_Attendance == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Male_Regular_Attendance
    ),
    
    Tool3_T3_N_Students_Class_Female_Regular_Attendance = as.character(Tool3_T3_N_Students_Class_Female_Regular_Attendance),
    Tool3_T3_N_Students_Class_Female_Regular_Attendance = case_when(
      Tool3_T3_N_Students_Class_Female_Regular_Attendance == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Female_Regular_Attendance
    ),
    
    Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance = as.character(Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance),
    Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance = case_when(
      Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance
    ),
    
    Tool3_T3_N_Students_Class_Male_Permanently_Absent = as.character(Tool3_T3_N_Students_Class_Male_Permanently_Absent),
    Tool3_T3_N_Students_Class_Male_Permanently_Absent = case_when(
      Tool3_T3_N_Students_Class_Male_Permanently_Absent == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Male_Permanently_Absent
    ),
    
    Tool3_T3_N_Students_Class_Female_Permanently_Absent = as.character(Tool3_T3_N_Students_Class_Female_Permanently_Absent),
    Tool3_T3_N_Students_Class_Female_Permanently_Absent = case_when(
      Tool3_T3_N_Students_Class_Female_Permanently_Absent == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Female_Permanently_Absent
    ),
    
    Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent = as.character(Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent),
    Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent = case_when(
      Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Class_Gender_Not_Identified_Permanently_Absent
    ),
    
    Tool3_T3_N_Students_Enrolled_Class_Male = as.character(Tool3_T3_N_Students_Enrolled_Class_Male),
    Tool3_T3_N_Students_Enrolled_Class_Male = case_when(
      Tool3_T3_N_Students_Enrolled_Class_Male == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Male
    ),
    
    Tool3_T3_N_Students_Enrolled_Class_Female = as.character(Tool3_T3_N_Students_Enrolled_Class_Female),
    Tool3_T3_N_Students_Enrolled_Class_Female = case_when(
      Tool3_T3_N_Students_Enrolled_Class_Female == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Female
    ),
    
    Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified = as.character(Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified),
    Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified = case_when(
      Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified == "6666" ~ "Not available",
      TRUE ~ Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified
    )
  )

clean_data.tool0_for_client$Tool3_Grades_Repeat <- clean_data.tool0_for_client$Tool3_Grades_Repeat |>
  mutate(
    Tool3_N_Classes = as.character(Tool3_N_Classes),
    Tool3_N_Classes = case_when(
      Tool3_N_Classes == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Classes
    ),
    
    Tool3_N_Students_Enrolled_Grade_Male = as.character(Tool3_N_Students_Enrolled_Grade_Male),
    Tool3_N_Students_Enrolled_Grade_Male = case_when(
      Tool3_N_Students_Enrolled_Grade_Male == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Enrolled_Grade_Male
    ),
    
    Tool3_N_Students_Enrolled_Grade_Female = as.character(Tool3_N_Students_Enrolled_Grade_Female),
    Tool3_N_Students_Enrolled_Grade_Female = case_when(
      Tool3_N_Students_Enrolled_Grade_Female == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Enrolled_Grade_Female
    ),
    
    Tool3_N_Students_Enrolled_Grade_Mixed = as.character(Tool3_N_Students_Enrolled_Grade_Mixed),
    Tool3_N_Students_Enrolled_Grade_Mixed = case_when(
      Tool3_N_Students_Enrolled_Grade_Mixed == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Enrolled_Grade_Mixed
    ),
    
    Tool3_N_Students_Class_Male_Regular_Attendance = as.character(Tool3_N_Students_Class_Male_Regular_Attendance),
    Tool3_N_Students_Class_Male_Regular_Attendance = case_when(
      Tool3_N_Students_Class_Male_Regular_Attendance == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Male_Regular_Attendance
    ),
    
    Tool3_N_Students_Class_Female_Regular_Attendance = as.character(Tool3_N_Students_Class_Female_Regular_Attendance),
    Tool3_N_Students_Class_Female_Regular_Attendance = case_when(
      Tool3_N_Students_Class_Female_Regular_Attendance == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Female_Regular_Attendance
    ),
    
    Tool3_N_Students_Class_Mixed_Regular_Attendance = as.character(Tool3_N_Students_Class_Mixed_Regular_Attendance),
    Tool3_N_Students_Class_Mixed_Regular_Attendance = case_when(
      Tool3_N_Students_Class_Mixed_Regular_Attendance == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Mixed_Regular_Attendance
    ),
    
    Tool3_N_Students_Class_Male_Permanently_Absent = as.character(Tool3_N_Students_Class_Male_Permanently_Absent),
    Tool3_N_Students_Class_Male_Permanently_Absent = case_when(
      Tool3_N_Students_Class_Male_Permanently_Absent == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Male_Permanently_Absent
    ),
    
    Tool3_N_Students_Class_Female_Permanently_Absent = as.character(Tool3_N_Students_Class_Female_Permanently_Absent),
    Tool3_N_Students_Class_Female_Permanently_Absent = case_when(
      Tool3_N_Students_Class_Female_Permanently_Absent == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Female_Permanently_Absent
    ),
    
    Tool3_N_Students_Class_Mixed_Permanently_Absent = as.character(Tool3_N_Students_Class_Mixed_Permanently_Absent),
    Tool3_N_Students_Class_Mixed_Permanently_Absent = case_when(
      Tool3_N_Students_Class_Mixed_Permanently_Absent == "6666" ~ "Number not determined",
      TRUE ~ Tool3_N_Students_Class_Mixed_Permanently_Absent
    )
  )

clean_data.tool0_for_client$Tool1_Timetable1_Repeat <- clean_data.tool0_for_client$Tool1_Timetable1_Repeat |>
  mutate(
    Tool1_Timetable1_Number_Of_Classes_Timetable1 = as.character(Tool1_Timetable1_Number_Of_Classes_Timetable1),
    Tool1_Timetable1_Number_Of_Classes_Timetable1 = case_when(
      Tool1_Timetable1_Number_Of_Classes_Timetable1 == "6666" ~ "Not available",
      TRUE ~ Tool1_Timetable1_Number_Of_Classes_Timetable1
    )
  )

clean_data.tool0_for_client$Tool1_Timetable2_Repeat <- clean_data.tool0_for_client$Tool1_Timetable2_Repeat |>
  mutate(
    Tool1_Timetable2_Number_Of_Classes_Timetable2 = as.character(Tool1_Timetable2_Number_Of_Classes_Timetable2),
    Tool1_Timetable2_Number_Of_Classes_Timetable2 = case_when(
      Tool1_Timetable2_Number_Of_Classes_Timetable2 == "6666" ~ "Not available",
      TRUE ~ Tool1_Timetable2_Number_Of_Classes_Timetable2
    )
  )

clean_data.tool0_for_client$Tool1_Timetable3_Repeat <- clean_data.tool0_for_client$Tool1_Timetable3_Repeat |>
  mutate(
    Tool1_Timetable3_Number_Of_Classes_Timetable3 = as.character(Tool1_Timetable3_Number_Of_Classes_Timetable3),
    Tool1_Timetable3_Number_Of_Classes_Timetable3 = case_when(
      Tool1_Timetable3_Number_Of_Classes_Timetable3 == "6666" ~ "Not available",
      TRUE ~ Tool1_Timetable3_Number_Of_Classes_Timetable3
    )
  )

clean_data.tool0_for_client$Tool1_Timetable4_Repeat <- clean_data.tool0_for_client$Tool1_Timetable4_Repeat |>
  mutate(
    Tool1_Timetable4_Number_Of_Classes_Timetable4 = as.character(Tool1_Timetable4_Number_Of_Classes_Timetable4),
    Tool1_Timetable4_Number_Of_Classes_Timetable4 = case_when(
      Tool1_Timetable4_Number_Of_Classes_Timetable4 == "6666" ~ "Not available",
      TRUE ~ Tool1_Timetable4_Number_Of_Classes_Timetable4
    )
  )


clean_data.tool0_for_client$Tool3_Headcount <- clean_data.tool0_for_client$Tool3_Headcount |>
  mutate(
    Tool3_Headcount_Male = as.character(Tool3_Headcount_Male),
    Tool3_Headcount_Female = as.character(Tool3_Headcount_Female),
    
    Tool3_Headcount_Male = case_when(
      Tool3_Headcount_Male == "9999" ~ "Not applicable",
      TRUE ~ Tool3_Headcount_Male
    ),
    
    Tool3_Headcount_Female = case_when(
      Tool3_Headcount_Female == "9999" ~ "Not applicable",
      TRUE ~ Tool3_Headcount_Female
    ),
    
    Tool3_Total_Present_Variance = as.character(Tool3_Total_Present_Variance),
    Tool3_Total_Present_Variance = case_when(
      Tool3_Total_Present_Variance == "6666" ~ "Not available",
      TRUE ~ Tool3_Total_Present_Variance
    ),
    
    Tool3_Total_Absent_Variance = as.character(Tool3_Total_Absent_Variance),
    Tool3_Total_Absent_Variance = case_when(
      Tool3_Total_Absent_Variance == "6666" ~ "Not available",
      TRUE ~ Tool3_Total_Absent_Variance
    )
    
  )


# Tool 1


# Tool 2
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group |>
  mutate(
    H9_Yes = as.character(H9_Yes),
    H9_Yes = case_when(
      H9_Yes == "9999" ~ "Don't wish to respond",
      H9_Yes == "8888" ~ "I don't know",
      TRUE ~ H9_Yes
    )
  )

# Tool 3


# Tool 4


# Tool 5
clean_data.tool5_for_client$data <- clean_data.tool5_for_client$data |>
  mutate(
    C6_Male = as.character(C6_Male),
    C6_Female = as.character(C6_Female),
    C6_Unisex = as.character(C6_Unisex),
    
    C6_Male = case_when(
      C6_Male == "777" ~ "Not Applicable",
      TRUE ~ C6_Male
    ),
    
    C6_Female = case_when(
      C6_Female == "777" ~ "Not Applicable",
      TRUE ~ C6_Female
    ),
    
    C6_Unisex = case_when(
      C6_Unisex == "777" ~ "Not Applicable",
      TRUE ~ C6_Unisex
    )
  )

# Tool 6
clean_data.tool6_for_client$data <- clean_data.tool6_for_client$data |> # TS: Confirm with Shahim: What should be done in df value version?
  mutate(
    B6 = as.character(B6),
    B6 = case_when(
      B6 == "9999" ~ "Don't wish to respond",
      B6 == "8888" ~ "I don't know",
      TRUE ~ B6
    )
  )

# Tool 7


