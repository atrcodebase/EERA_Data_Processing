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

# Tool 8
clean_data.tool8_for_client$data <- clean_data.tool8_for_client$data |>
  mutate(
    N4 = as.character(N4),
    P4 = as.character(P4),
    R4 = as.character(R4),
    
    N4 = case_when(
      N4 == "9999" ~ "Don't wish to respond",
      N4 == "8888" ~ "I don't know",
      TRUE ~ N4
    ),
    
    P4 = case_when(
      P4 == "9999" ~ "Don't wish to respond",
      P4 == "8888" ~ "I don't know",
      TRUE ~ P4
    ),
    
    R4 = case_when(
      R4 == "9999" ~ "Don't wish to respond",
      R4 == "8888" ~ "I don't know",
      TRUE ~ R4
    )
  )


clean_data.tool8_for_client$Section_2_4_Student_Ages <- clean_data.tool8_for_client$Section_2_4_Student_Ages |>
  mutate(
    K1 = as.character(K1),
    K2 = as.character(K2),
    
    K1 = case_when(
      K1 == "9999" ~ "Don't wish to respond",
      K1 == "8888" ~ "I don't know",
      TRUE ~ K1
    ),
    
    K2 = case_when(
      K2 == "9999" ~ "Don't wish to respond",
      K2 == "8888" ~ "I don't know",
      TRUE ~ K2
    )
  )

clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8_for_client$Classroom_Materials |>
  mutate(
    O4 = as.character(O4),
    O4 = case_when(
      O4 == "9999" ~ "Don't wish to respond",
      O4 == "8888" ~ "I don't know",
      TRUE ~ O4
    )
  )

clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8_for_client$Teacher_Kit |>
  mutate(
    Q4 = as.character(Q4),
    Q4 = case_when(
      Q4 == "9999" ~ "Don't wish to respond",
      Q4 == "8888" ~ "I don't know",
      TRUE ~ Q4
    )
  )

clean_data.tool8_for_client$Student_Kit <- clean_data.tool8_for_client$Student_Kit |>
  mutate(
    S4 = as.character(S4),
    S4 = case_when(
      S4 == "9999" ~ "Don't wish to respond",
      S4 == "8888" ~ "I don't know",
      TRUE ~ S4
    )
  )

clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8_for_client$V_list_of_all_members |>
  mutate(
    V_Male_Member = as.character(V_Male_Member),
    V_Female_Member = as.character(V_Female_Member),
    
    V_Male_Member = case_when(
      V_Male_Member == "9999" ~ "Don't wish to respond",
      V_Male_Member == "8888" ~ "I don't know",
      TRUE ~ V_Male_Member
    ),
    
    V_Female_Member = case_when(
      V_Female_Member == "9999" ~ "Don't wish to respond",
      V_Female_Member == "8888" ~ "I don't know",
      TRUE ~ V_Female_Member
    )
  )



# Tool 9

clean_data.tool9_for_client$data <- clean_data.tool9_for_client$data |>
  mutate(
    A12_Female_Numbers = as.character(A12_Female_Numbers),
    A12_Male_Numbers = as.character(A12_Male_Numbers),
    A14_Female_Numbers = as.character(A14_Female_Numbers),
    A14_Male_Numbers = as.character(A14_Male_Numbers),
    
    A12_Female_Numbers = case_when(
      A12_Female_Numbers == "9999" ~ "Don't wish to respond",
      A12_Female_Numbers == "8888" ~ "I don't know",
      TRUE ~ A12_Female_Numbers
    ),
    
    A12_Male_Numbers = case_when(
      A12_Male_Numbers == "9999" ~ "Don't wish to respond",
      A12_Male_Numbers == "8888" ~ "I don't know",
      TRUE ~ A12_Male_Numbers
    ),
    
    A14_Female_Numbers = case_when(
      A14_Female_Numbers == "9999" ~ "Don't wish to respond",
      A14_Female_Numbers == "8888" ~ "I don't know",
      TRUE ~ A14_Female_Numbers
    ),
    
    A14_Male_Numbers = case_when(
      A14_Male_Numbers == "9999" ~ "Don't wish to respond",
      A14_Male_Numbers == "8888" ~ "I don't know",
      TRUE ~ A14_Male_Numbers
    )
  )


