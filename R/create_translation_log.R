source("R/functions/missing_translation_function.R")

# Find missing translations to add in the translation log -----------------
missing_translations <- bind_rows(
  ## Tool 0
  bind_rows(
    missing_translation_func(clean_data.tool0$data) |> mutate(Tab_name = "data"),
    missing_translation_func(clean_data.tool0$Tool3_Grades_Repeat) |> mutate(Tab_name = "Tool3_Grades_Repeat"),
    missing_translation_func(clean_data.tool0$Tool3_Class_Attendance) |> mutate(Tab_name = "Tool3_Class_Attendance"),
    missing_translation_func(clean_data.tool0$Tool3_T3_N_Classes_Repeat) |> mutate(Tab_name = "Tool3_T3_N_Classes_Repeat"),
    missing_translation_func(clean_data.tool0$Tool3_Headcount) |> mutate(Tab_name = "Tool3_Headcount"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable_Year) |> mutate(Tab_name = "Tool1_Timetable_Year"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable1_Repeat) |> mutate(Tab_name = "Tool1_Timetable1_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable2_Repeat) |> mutate(Tab_name = "Tool1_Timetable2_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable3_Repeat) |> mutate(Tab_name = "Tool1_Timetable3_Repeat"),
    missing_translation_func(clean_data.tool0$Tool1_Timetable4_Repeat) |> mutate(Tab_name = "Tool1_Timetable4_Repeat")
  ) |>
    mutate(tool = "Tool 0 - Data Entry", Sample_Type = "", .before = question_name),
  ## Tool 1
  bind_rows(
    missing_translation_func(clean_data.tool1$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool1$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool1$School_Operationality) |> mutate(Tab_Name = "School_Operationality"),
    missing_translation_func(clean_data.tool1$School_Operationality_Other_...) |> mutate(Tab_Name = "School_Operationality_Other_..."),
    missing_translation_func(clean_data.tool1$Shifts_Detail) |> mutate(Tab_Name = "Shifts_Detail"),
    missing_translation_func(clean_data.tool1$Other_Shifts_Detail) |> mutate(Tab_Name = "Other_Shifts_Detail"),
    missing_translation_func(clean_data.tool1$Headmasters) |> mutate(Tab_Name = "Headmasters"),
    missing_translation_func(clean_data.tool1$Curriculum_Changes) |> mutate(Tab_Name = "Curriculum_Changes"),
    missing_translation_func(clean_data.tool1$Weekly_Class_Schedule) |> mutate(Tab_Name = "Weekly_Class_Schedule"),
    missing_translation_func(clean_data.tool1$Grades_Curriculum) |> mutate(Tab_Name = "Grades_Curriculum"),
    missing_translation_func(clean_data.tool1$Subjects_Detail) |> mutate(Tab_Name = "Subjects_Detail"),
    missing_translation_func(clean_data.tool1$Education_Quality) |> mutate(Tab_Name = "Education_Quality"),
    missing_translation_func(clean_data.tool1$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 2
  bind_rows(
    missing_translation_func(clean_data.tool2$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool2$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool2$Attendance_Sheet_Photos) |> mutate(Tab_Name = "Attendance_Sheet_Photos"),
    missing_translation_func(clean_data.tool2$Public_Stationary_Kit_Group) |> mutate(Tab_Name = "Public_Stationary_Kit_Group"),
    missing_translation_func(clean_data.tool2$Teachers_Pack_Group) |> mutate(Tab_Name = "Teachers_Pack_Group"),
    missing_translation_func(clean_data.tool2$Students_Pack_Group) |> mutate(Tab_Name = "Students_Pack_Group"),
    missing_translation_func(clean_data.tool2$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 3
  bind_rows(
    missing_translation_func(clean_data.tool3$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool3$Support_Respondents) |> mutate(Tab_Name = "Support_Respondents"),
    missing_translation_func(clean_data.tool3$Enrollement_Attendance_Summary) |> mutate(Tab_Name = "Enrollement_Attendance_Summary"),
    missing_translation_func(clean_data.tool3$Grade_Details) |> mutate(Tab_Name = "Grade_Details"),
    missing_translation_func(clean_data.tool3$Todays_Attendance_Detail) |> mutate(Tab_Name = "Todays_Attendance_Detail"),
    missing_translation_func(clean_data.tool3$LastWeek_Attendance_Detail) |> mutate(Tab_Name = "LastWeek_Attendance_Detail"),
    missing_translation_func(clean_data.tool3$Student_Headcount) |> mutate(Tab_Name = "Student_Headcount"),
    missing_translation_func(clean_data.tool3$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School", .before = question_name),
  
  ## Tool 4
  bind_rows(
    missing_translation_func(clean_data.tool4$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool4$Additional_Subjects) |> mutate(Tab_Name = "Additional_Subjects"),
    missing_translation_func(clean_data.tool4$Subjects_taught_by_this_teacher) |> mutate(Tab_Name = "Subjects_taught_by_this_teacher"),
    missing_translation_func(clean_data.tool4$Subjects_Not_Being_Taught) |> mutate(Tab_Name = "Subjects_Not_Being_Taught"),
    missing_translation_func(clean_data.tool4$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School", .before = question_name),

  ## Tool 5
  bind_rows(
    missing_translation_func(clean_data.tool5$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool5$Under_Construction_Toilets) |> mutate(Tab_Name = "Under_Construction_Toilets"),
    missing_translation_func(clean_data.tool5$Useable_Toilets) |> mutate(Tab_Name = "Useable_Toilets"),
    missing_translation_func(clean_data.tool5$Non_Useable_Toilets) |> mutate(Tab_Name = "Non_Useable_Toilets"),
    missing_translation_func(clean_data.tool5$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School", .before = question_name),

  ## Tool 6
  bind_rows(
    missing_translation_func(clean_data.tool6$data) |> mutate(Tab_Name = "data") |> 
      left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = "KEY"),
    
    missing_translation_func(clean_data.tool6$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY)
  ) |>
    mutate(tool = "Tool 6 - Parent") |>
    select(tool, Sample_Type, everything()),

  ## Tool 7
  bind_rows(
    missing_translation_func(clean_data.tool7$data) |> mutate(Tab_Name = "data") |> 
      left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = "KEY"),
    
    missing_translation_func(clean_data.tool7$C6_list_members) |> mutate(Tab_Name = "C6_list_members") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY),
    
    missing_translation_func(clean_data.tool7$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added") |>
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) |> left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("PARENT_KEY" = "KEY")) |>
      select(-PARENT_KEY)
  ) |>
    mutate(tool = "Tool 7 - Shura") |>
    select(tool, Sample_Type, everything()),

  ## Tool 8
  bind_rows(
    missing_translation_func(clean_data.tool8$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool8$Classes) |> mutate(Tab_Name = "Classes"),
    missing_translation_func(clean_data.tool8$Adults_At_The_CBE) |> mutate(Tab_Name = "Adults_At_The_CBE"),
    missing_translation_func(clean_data.tool8$Section_2_2_3_Attendance_Rec...) |> mutate(Tab_Name = "Section_2_2_3_Attendance_Rec..."),
    missing_translation_func(clean_data.tool8$Section_2_2_4_Headcount) |> mutate(Tab_Name = "Section_2_2_4_Headcount"),
    missing_translation_func(clean_data.tool8$Students_Enrolment_Book) |> mutate(Tab_Name = "Students_Enrolment_Book"),
    missing_translation_func(clean_data.tool8$Section_2_4_Student_Ages) |> mutate(Tab_Name = "Section_2_4_Student_Ages"),
    missing_translation_func(clean_data.tool8$Classroom_Materials) |> mutate(Tab_Name = "Classroom_Materials"),
    missing_translation_func(clean_data.tool8$Teacher_Kit) |> mutate(Tab_Name = "Teacher_Kit"),
    missing_translation_func(clean_data.tool8$Student_Kit) |> mutate(Tab_Name = "Student_Kit"),
    missing_translation_func(clean_data.tool8$V_list_of_all_members) |> mutate(Tab_Name = "V_list_of_all_members"),
    missing_translation_func(clean_data.tool8$Subjects_Added) |> mutate(Tab_Name = "Subjects_Added"),
    missing_translation_func(clean_data.tool8$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE", .before = question_name),
  
  ## Tool 9
  bind_rows(
    missing_translation_func(clean_data.tool9$data) |> mutate(Tab_Name = "data"),
    missing_translation_func(clean_data.tool9$Relevant_photos) |> mutate(Tab_Name = "Relevant_photos")
  ) |>
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE", .before = question_name)
)
## Tool 0
for(sheet in names(clean_data.tool0)){
  missing_translations <- bind_rows(
    missing_translations,
    missing_translation_func(clean_data.tool0[[sheet]]) %>% 
      mutate(Tab_Name = sheet, tool = "Data Entry Tool", Sample_Type = "Public School", .before = question_name)
  )
}

need_translation <- c(
  # Tool 0: # @Taqi Please add the columns that need to be shared with Translation team
  # Tool 1:
  "A31_Other", "Interviewee_Respondent_Type_Other", "B6_Other", "B7_Other", "B9_Other", "B10_Other", "C2_Other", "C4_Other", "C4_1_Other", "C9_Other", "C12A3_Other", "C13A3_Other",
  "C13A8_Other", "D3_Other", "D4_Other", "D7_Other", "D8_Other", "E3_Other", "E4_Other", "E7_Other", "E8_Other", "E11_Other", "E12_Other", "E15_Other", "E16_Other", "E19_Other", "E20_Other",
  "E23_Other", "E24_Other", "E26_Other", "E27_Other", "F10_Other", "F15_Other", "F16_Other", "F17_Other", "H2_Other", "H3_Other", "I7_Other", "I8_Other", "J2_Other", "J3_Other", "J4_Other",
  "J5_Other", "J7_Other", "J9_Other", "J10_Other", "J13_Other", "J15_Other", "J17_Other", "J19_Other", "J21_Other", "J22_Other", "K3_Other", "K4_Other", "Survey_Language_Other",
  "B7_1", "B7_2", "F14", "A28",
  
  # Tool 2:
  "B4_Other", "Interviewee_Respondent_Type_Other", "C7_Other", "C8_Other", "C11_Other", "C12_Other", "D2_Other", "D4_Other", "D4_1_Other", "D59_Other", "D10_2_Other", "H5_Other", "H8_Other", "H11_Other",
  "H14_Other", "i5_Other", "i8_Other", "i11_Other", "i14_Other", "J5_Other", "J8_Other", "J11_Other", "J14_Other", "Survey_Language_Other",
  "C8_1", "C8_2","B2", "J16_Yes",
  
  # Tool 3:
  "Interviewee_Respondent_Type_Other", "B2_Other", "B7_Other", "B10A3_Other", "C2_Other", "C5_Other", "C6_Other", "C7_Other", "Survey_Language_Other", 
  "C10",
  "Grade_Class_1",	"Grade_Class_2",	"Grade_Class_3",	"Grade_Class_4",	"Grade_Class_5",	"Grade_Class_6",	"Grade_Class_7",	"Grade_Class_8",	"Grade_Class_9",	"Grade_Class_10", "Classes", # Confirm with QA
  

  # Tool 4:
  "D1_Other", "D3_Other", "D5_Other", "D6_Other", "D9_Other", "E4_Primary_Other", "E4_Secondary_Other", "E7_Primary_Other", "E7_Secondary_Other", "E8_Primary_Other", "E8_Secondary_Other", "E11_Primary_Other",
  "E11_Secondary_Other", "E12_Primary_Other", "E12_Secondary_Other", "E15_Primary_Other", "E15_Secondary_Other", "E16_Primary_Other", "E16_Secondary_Other", "E19_Primary_Other", "E19_Secondary_Other",
  "E20_Primary_Other", "E20_Secondary_Other", "E23_Primary_Other", "E23_Secondary_Other", "E24_Primary_Other", "E24_Secondary_Other", "E26_Other", "E27_Other", "F5_Other", "F10_Other", "F13_Other",
  "F14_Other", "F16_Other", "F17_Other", "G2_Other", "G3_Other", "G6_Other", "H5_Other", "H7_Other", "Survey_Language_Other", "B2", # School name other
  "D6_IP_Name", "F2_Subject_Name", "F9",
  
  # Tool 5:
  "Interviewee_Respondent_Type_Other", "C7_Other", "Survey_Language_Other",
  "B2",

  # Tool 6:
  "B5_Other", "C7_Other", "C8_Other", "C10_Other", "C11_Other", "D3_Other", "D4_Other", "D10_Other", "D11_Other", "D13_Other", "D14_Other", "E3_Other", "E5_Other", "F2_Other", "F4_Other", "F5_Other",
  "F7_Other", "F8_Other", "F13_2_Other", "F13_3_Other", "Survey_Language_Other",
  "D5_Subject_Name",
  "A2", # school name other
  
  # Tool 7:
  "B6_Other", "C0_Other", "C2_1_Other", "C2_2_Other", "C3_Other", "C4_Other", "C5_Other", "C8_Other", "C9_Other", "C11_Other", "C12_Other", "C14_Other", "C19_Other", "C21_Other", "C23_Other", "C25_Other",
  "C27_Other", "D6_Other", "D7_Other", "D9_Other", "D10_Other", "E2_Other", "E3_Other", "E9_Other", "E10_Other", "E12_Other", "E13_Other", "F2_Other", "F4_Other", "G2_Other", "G4_Other", "G6_Other", "G8_Other",
  "Survey_Language_Other", "C14_A", "E4_Subject_Name",

  # Tool 8:
  "B6_Other", "B7_Other", "C4_Other", "C6_Other", "C9_Other", "C10_Other", "Interviewee_Respondent_Type_Other", "D11_Other", "E18_1_Other", "N5_Other", "O3_Other", "O6_Other", "O9_Other", "P5_Other", "Q3_Other",
  "Q6_Other", "Q9_Other", "R5_Other", "S3_Other", "S6_Other", "S9_Other", "T2_Other", "T3_Other", "U2_Other", "U3_Other", "U5_Other", "V1_Other", "V2_Other", "V3_Other", "V4_Other", "V6_Other", "V7_Other", "V9_Other",
  "V10_Other", "V13_Other", "V15_Other", "V17_Other", "V19_Other", "V21_Other", "V23_Other", "V25_Other", "W2_Other", "W4_Other", "W5_Other", "X4_Response", "Y3_Other", "Y4_Other", "Y10_Other", "Y11_Other", "Y13_Other",
  "Y14_Other", "Survey_Language_Other",
  "Class_Name", "W3", "Y5_Subject_Name", "B2", "Class_Name_CBE", "Class_Name_CBE_Headcount", "Class_Name_CBE_Student_Ages",
  
  
  # Tool 9:
  "A2_Other", "A3_Other", "A4_Other", "A8_Other", "Survey_Language_Other", 
  "Respondent_Designation",
  
  # Tool 0 Data Entry
  "Tool2_Months_Attendance_Signed_Other",
  "Tool3_Class_Name",
  "Tool1_Enter_School_Name",
  "Tool1_Timetable_Other",
  "Tool1_Timetable1_Class_Name1",
  "Tool1_Timetable1_Class_Name2",
  
  "Tool1_Timetable1_Class1_Saturday_Other1", "Tool1_Timetable1_Class1_Saturday_Other2", "Tool1_Timetable1_Class1_Saturday_Other3", "Tool1_Timetable1_Class1_Saturday_Other4", "Tool1_Timetable1_Class1_Saturday_Other5",
  "Tool1_Timetable1_Class1_Sunday_Other1", "Tool1_Timetable1_Class1_Sunday_Other2", "Tool1_Timetable1_Class1_Sunday_Other3", "Tool1_Timetable1_Class1_Sunday_Other4", "Tool1_Timetable1_Class1_Sunday_Other5",
  "Tool1_Timetable1_Class1_Monday_Other1", "Tool1_Timetable1_Class1_Monday_Other2", "Tool1_Timetable1_Class1_Monday_Other3", "Tool1_Timetable1_Class1_Monday_Other4", "Tool1_Timetable1_Class1_Monday_Other5",
  "Tool1_Timetable1_Class1_Tuesday_Other1", "Tool1_Timetable1_Class1_Tuesday_Other2", "Tool1_Timetable1_Class1_Tuesday_Other3", "Tool1_Timetable1_Class1_Tuesday_Other4", "Tool1_Timetable1_Class1_Tuesday_Other5",
  "Tool1_Timetable1_Class1_Wednesday_Other1", "Tool1_Timetable1_Class1_Wednesday_Other2", "Tool1_Timetable1_Class1_Wednesday_Other3", "Tool1_Timetable1_Class1_Wednesday_Other4", "Tool1_Timetable1_Class1_Wednesday_Other5",
  "Tool1_Timetable1_Class1_Thursday_Other1", "Tool1_Timetable1_Class1_Thursday_Other2", "Tool1_Timetable1_Class1_Thursday_Other3", "Tool1_Timetable1_Class1_Thursday_Other4", "Tool1_Timetable1_Class1_Thursday_Other5",
  "Tool1_Timetable1_Class2_Saturday_Other1", "Tool1_Timetable1_Class2_Saturday_Other2", "Tool1_Timetable1_Class2_Saturday_Other3", "Tool1_Timetable1_Class2_Saturday_Other4", "Tool1_Timetable1_Class2_Saturday_Other5",
  "Tool1_Timetable1_Class2_Sunday_Other1", "Tool1_Timetable1_Class2_Sunday_Other2", "Tool1_Timetable1_Class2_Sunday_Other3", "Tool1_Timetable1_Class2_Sunday_Other4", "Tool1_Timetable1_Class2_Sunday_Other5",
  "Tool1_Timetable1_Class2_Monday_Other1", "Tool1_Timetable1_Class2_Monday_Other2", "Tool1_Timetable1_Class2_Monday_Other3", "Tool1_Timetable1_Class2_Monday_Other4", "Tool1_Timetable1_Class2_Monday_Other5",
  "Tool1_Timetable1_Class2_Tuesday_Other1", "Tool1_Timetable1_Class2_Tuesday_Other2", "Tool1_Timetable1_Class2_Tuesday_Other3", "Tool1_Timetable1_Class2_Tuesday_Other4", "Tool1_Timetable1_Class2_Tuesday_Other5",
  "Tool1_Timetable1_Class2_Wednesday_Other1", "Tool1_Timetable1_Class2_Wednesday_Other2", "Tool1_Timetable1_Class2_Wednesday_Other3", "Tool1_Timetable1_Class2_Wednesday_Other4", "Tool1_Timetable1_Class2_Wednesday_Other5",
  "Tool1_Timetable1_Class2_Thursday_Other1", "Tool1_Timetable1_Class2_Thursday_Other2", "Tool1_Timetable1_Class2_Thursday_Other3", "Tool1_Timetable1_Class2_Thursday_Other4", "Tool1_Timetable1_Class2_Thursday_Other5",
  
  "Tool1_Timetable2_Class_Name1", "Tool1_Timetable2_Class_Name2",
  
  "Tool1_Timetable2_Class1_Saturday_Other1", "Tool1_Timetable2_Class1_Saturday_Other2", "Tool1_Timetable2_Class1_Saturday_Other3", "Tool1_Timetable2_Class1_Saturday_Other4", "Tool1_Timetable2_Class1_Saturday_Other5",
  "Tool1_Timetable2_Class1_Sunday_Other1", "Tool1_Timetable2_Class1_Sunday_Other2", "Tool1_Timetable2_Class1_Sunday_Other3", "Tool1_Timetable2_Class1_Sunday_Other4", "Tool1_Timetable2_Class1_Sunday_Other5",
  "Tool1_Timetable2_Class1_Monday_Other1", "Tool1_Timetable2_Class1_Monday_Other2", "Tool1_Timetable2_Class1_Monday_Other3", "Tool1_Timetable2_Class1_Monday_Other4", "Tool1_Timetable2_Class1_Monday_Other5",
  "Tool1_Timetable2_Class1_Tuesday_Other1", "Tool1_Timetable2_Class1_Tuesday_Other2", "Tool1_Timetable2_Class1_Tuesday_Other3", "Tool1_Timetable2_Class1_Tuesday_Other4", "Tool1_Timetable2_Class1_Tuesday_Other5",
  "Tool1_Timetable2_Class1_Wednesday_Other1", "Tool1_Timetable2_Class1_Wednesday_Other2", "Tool1_Timetable2_Class1_Wednesday_Other3", "Tool1_Timetable2_Class1_Wednesday_Other4", "Tool1_Timetable2_Class1_Wednesday_Other5",
  "Tool1_Timetable2_Class1_Thursday_Other1", "Tool1_Timetable2_Class1_Thursday_Other2", "Tool1_Timetable2_Class1_Thursday_Other3", "Tool1_Timetable2_Class1_Thursday_Other4",  "Tool1_Timetable2_Class1_Thursday_Other5",
  "Tool1_Timetable2_Class2_Saturday_Other1", "Tool1_Timetable2_Class2_Saturday_Other2", "Tool1_Timetable2_Class2_Saturday_Other3", "Tool1_Timetable2_Class2_Saturday_Other4", "Tool1_Timetable2_Class2_Saturday_Other5",
  "Tool1_Timetable2_Class2_Sunday_Other1", "Tool1_Timetable2_Class2_Sunday_Other2", "Tool1_Timetable2_Class2_Sunday_Other3", "Tool1_Timetable2_Class2_Sunday_Other4", "Tool1_Timetable2_Class2_Sunday_Other5",
  "Tool1_Timetable2_Class2_Monday_Other1", "Tool1_Timetable2_Class2_Monday_Other2", "Tool1_Timetable2_Class2_Monday_Other3", "Tool1_Timetable2_Class2_Monday_Other4", "Tool1_Timetable2_Class2_Monday_Other5",
  "Tool1_Timetable2_Class2_Tuesday_Other1", "Tool1_Timetable2_Class2_Tuesday_Other2", "Tool1_Timetable2_Class2_Tuesday_Other3", "Tool1_Timetable2_Class2_Tuesday_Other4", "Tool1_Timetable2_Class2_Tuesday_Other5",
  "Tool1_Timetable2_Class2_Wednesday_Other1", "Tool1_Timetable2_Class2_Wednesday_Other2", "Tool1_Timetable2_Class2_Wednesday_Other3", "Tool1_Timetable2_Class2_Wednesday_Other4", "Tool1_Timetable2_Class2_Wednesday_Other5",
  "Tool1_Timetable2_Class2_Thursday_Other1", "Tool1_Timetable2_Class2_Thursday_Other2", 'Tool1_Timetable2_Class2_Thursday_Other3', "Tool1_Timetable2_Class2_Thursday_Other4", "Tool1_Timetable2_Class2_Thursday_Other5",
  
  "Tool1_Timetable3_Class_Name1", "Tool1_Timetable3_Class_Name2",
  
  "Tool1_Timetable3_Class1_Saturday_Other1", "Tool1_Timetable3_Class1_Saturday_Other2", "Tool1_Timetable3_Class1_Saturday_Other3", "Tool1_Timetable3_Class1_Saturday_Other4", "Tool1_Timetable3_Class1_Saturday_Other5",
  "Tool1_Timetable3_Class1_Sunday_Other1", "Tool1_Timetable3_Class1_Sunday_Other2", "Tool1_Timetable3_Class1_Sunday_Other3", "Tool1_Timetable3_Class1_Sunday_Other4", "Tool1_Timetable3_Class1_Sunday_Other5",
  "Tool1_Timetable3_Class1_Monday_Other1", "Tool1_Timetable3_Class1_Monday_Other2", "Tool1_Timetable3_Class1_Monday_Other3", "Tool1_Timetable3_Class1_Monday_Other4", "Tool1_Timetable3_Class1_Monday_Other5",
  "Tool1_Timetable3_Class1_Tuesday_Other1", "Tool1_Timetable3_Class1_Tuesday_Other2", "Tool1_Timetable3_Class1_Tuesday_Other3", "Tool1_Timetable3_Class1_Tuesday_Other4", "Tool1_Timetable3_Class1_Tuesday_Other5",
  "Tool1_Timetable3_Class1_Wednesday_Other1", "Tool1_Timetable3_Class1_Wednesday_Other2", "Tool1_Timetable3_Class1_Wednesday_Other3", "Tool1_Timetable3_Class1_Wednesday_Other4", "Tool1_Timetable3_Class1_Wednesday_Other5",
  "Tool1_Timetable3_Class1_Thursday_Other1", 'Tool1_Timetable3_Class1_Thursday_Other2', "Tool1_Timetable3_Class1_Thursday_Other3", "Tool1_Timetable3_Class1_Thursday_Other4", "Tool1_Timetable3_Class1_Thursday_Other5",
  "Tool1_Timetable3_Class2_Saturday_Other1", 'Tool1_Timetable3_Class2_Saturday_Other2', 'Tool1_Timetable3_Class2_Saturday_Other3', 'Tool1_Timetable3_Class2_Saturday_Other4', 'Tool1_Timetable3_Class2_Saturday_Other5',
  'Tool1_Timetable3_Class2_Sunday_Other1', 'Tool1_Timetable3_Class2_Sunday_Other2', 'Tool1_Timetable3_Class2_Sunday_Other3', 'Tool1_Timetable3_Class2_Sunday_Other4', 'Tool1_Timetable3_Class2_Sunday_Other5',
  'Tool1_Timetable3_Class2_Monday_Other1', 'Tool1_Timetable3_Class2_Monday_Other2', 'Tool1_Timetable3_Class2_Monday_Other3', 'Tool1_Timetable3_Class2_Monday_Other4', 'Tool1_Timetable3_Class2_Monday_Other5',
  'Tool1_Timetable3_Class2_Tuesday_Other1', 'Tool1_Timetable3_Class2_Tuesday_Other2', 'Tool1_Timetable3_Class2_Tuesday_Other3', 'Tool1_Timetable3_Class2_Tuesday_Other4', 'Tool1_Timetable3_Class2_Tuesday_Other5',
  'Tool1_Timetable3_Class2_Wednesday_Other1', 'Tool1_Timetable3_Class2_Wednesday_Other2', 'Tool1_Timetable3_Class2_Wednesday_Other3', 'Tool1_Timetable3_Class2_Wednesday_Other4', 'Tool1_Timetable3_Class2_Wednesday_Other5',
  'Tool1_Timetable3_Class2_Thursday_Other1', 'Tool1_Timetable3_Class2_Thursday_Other2', 'Tool1_Timetable3_Class2_Thursday_Other3', 'Tool1_Timetable3_Class2_Thursday_Other4', 'Tool1_Timetable3_Class2_Thursday_Other5',
  
  "Tool1_Timetable4_Class_Name1", "Tool1_Timetable4_Class_Name2",
  
  'Tool1_Timetable4_Class1_Saturday_Other1', 'Tool1_Timetable4_Class1_Saturday_Other2','Tool1_Timetable4_Class1_Saturday_Other3', 'Tool1_Timetable4_Class1_Saturday_Other4', 'Tool1_Timetable4_Class1_Saturday_Other5',
  'Tool1_Timetable4_Class1_Sunday_Other1', 'Tool1_Timetable4_Class1_Sunday_Other2', 'Tool1_Timetable4_Class1_Sunday_Other3', 'Tool1_Timetable4_Class1_Sunday_Other4', 'Tool1_Timetable4_Class1_Sunday_Other5',
  'Tool1_Timetable4_Class1_Monday_Other1', 'Tool1_Timetable4_Class1_Monday_Other2', 'Tool1_Timetable4_Class1_Monday_Other3', 'Tool1_Timetable4_Class1_Monday_Other4', 'Tool1_Timetable4_Class1_Monday_Other5',
  'Tool1_Timetable4_Class1_Tuesday_Other1', 'Tool1_Timetable4_Class1_Tuesday_Other2', 'Tool1_Timetable4_Class1_Tuesday_Other3', 'Tool1_Timetable4_Class1_Tuesday_Other4', 'Tool1_Timetable4_Class1_Tuesday_Other5',
  'Tool1_Timetable4_Class1_Wednesday_Other1', 'Tool1_Timetable4_Class1_Wednesday_Other2', 'Tool1_Timetable4_Class1_Wednesday_Other3', 'Tool1_Timetable4_Class1_Wednesday_Other4', 'Tool1_Timetable4_Class1_Wednesday_Other5',
  'Tool1_Timetable4_Class1_Thursday_Other1', 'Tool1_Timetable4_Class1_Thursday_Other2', 'Tool1_Timetable4_Class1_Thursday_Other3', 'Tool1_Timetable4_Class1_Thursday_Other4', 'Tool1_Timetable4_Class1_Thursday_Other5',
  'Tool1_Timetable4_Class2_Saturday_Other1', 'Tool1_Timetable4_Class2_Saturday_Other2', 'Tool1_Timetable4_Class2_Saturday_Other3', "Tool1_Timetable4_Class2_Saturday_Other4", "Tool1_Timetable4_Class2_Saturday_Other5",
  "Tool1_Timetable4_Class2_Sunday_Other1", "Tool1_Timetable4_Class2_Sunday_Other2", "Tool1_Timetable4_Class2_Sunday_Other3", "Tool1_Timetable4_Class2_Sunday_Other4", "Tool1_Timetable4_Class2_Sunday_Other5",
  "Tool1_Timetable4_Class2_Monday_Other1", "Tool1_Timetable4_Class2_Monday_Other2", "Tool1_Timetable4_Class2_Monday_Other3", "Tool1_Timetable4_Class2_Monday_Other4", "Tool1_Timetable4_Class2_Monday_Other5",
  "Tool1_Timetable4_Class2_Tuesday_Other1", "Tool1_Timetable4_Class2_Tuesday_Other2", "Tool1_Timetable4_Class2_Tuesday_Other3", "Tool1_Timetable4_Class2_Tuesday_Other4", "Tool1_Timetable4_Class2_Tuesday_Other5",
  "Tool1_Timetable4_Class2_Wednesday_Other1", "Tool1_Timetable4_Class2_Wednesday_Other2", "Tool1_Timetable4_Class2_Wednesday_Other3", "Tool1_Timetable4_Class2_Wednesday_Other4", "Tool1_Timetable4_Class2_Wednesday_Other5",
  "Tool1_Timetable4_Class2_Thursday_Other1", "Tool1_Timetable4_Class2_Thursday_Other2", "Tool1_Timetable4_Class2_Thursday_Other3", "Tool1_Timetable4_Class2_Thursday_Other4", "Tool1_Timetable4_Class2_Thursday_Other5"
)

missing_translations <- missing_translations |>
  filter(question_name %in% need_translation)


# double check unlogged translations --------------------------------------
un_logged_values <- bind_rows(
  ## Tool 0
  bind_rows(
    log_translation_cols(clean_data.tool0$data, need_translation) |> mutate(Tab_name = "data"),
    # log_translation_cols(clean_data.tool0$Tool3_Grades_Repeat, need_translation) |> mutate(Tab_name = "Tool3_Grades_Repeat"),
    log_translation_cols(clean_data.tool0$Tool3_Class_Attendance, need_translation) |> mutate(Tab_name = "Tool3_Class_Attendance"),
    # log_translation_cols(clean_data.tool0$Tool3_T3_N_Classes_Repeat, need_translation) |> mutate(Tab_name = "Tool3_T3_N_Classes_Repeat"),
    # log_translation_cols(clean_data.tool0$Tool3_Headcount, need_translation) |> mutate(Tab_name = "Tool3_Headcount"),
    # log_translation_cols(clean_data.tool0$Tool1_Timetable_Year, need_translation) |> mutate(Tab_name = "Tool1_Timetable_Year"),
    log_translation_cols(clean_data.tool0$Tool1_Timetable1_Repeat, need_translation) |> mutate(Tab_name = "Tool1_Timetable1_Repeat"),
    log_translation_cols(clean_data.tool0$Tool1_Timetable2_Repeat, need_translation) |> mutate(Tab_name = "Tool1_Timetable2_Repeat"),
    log_translation_cols(clean_data.tool0$Tool1_Timetable3_Repeat, need_translation) |> mutate(Tab_name = "Tool1_Timetable3_Repeat"),
    log_translation_cols(clean_data.tool0$Tool1_Timetable4_Repeat, need_translation) |> mutate(Tab_name = "Tool1_Timetable4_Repeat") |> mutate(KEY = as.character(KEY), old_value = as.character(old_value))
  ) |>
    mutate(tool = "Tool 0 - Data Entry", .before = question_name),
  
  ## Tool 1
  bind_rows(
    log_translation_cols(clean_data.tool1$data |> select(-C10), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool1$Support_Respondents, need_translation) |> mutate(Tab_Name = "Support_Respondents"),
    log_translation_cols(clean_data.tool1$School_Operationality, need_translation) |> mutate(Tab_Name = "School_Operationality"),
    log_translation_cols(clean_data.tool1$School_Operationality_Other_..., need_translation) |> mutate(Tab_Name = "School_Operationality_Other_..."),
    log_translation_cols(clean_data.tool1$Shifts_Detail, need_translation),
    log_translation_cols(clean_data.tool1$Other_Shifts_Detail, need_translation),
    log_translation_cols(clean_data.tool1$Headmasters, need_translation),
    log_translation_cols(clean_data.tool1$Curriculum_Changes, need_translation),
    log_translation_cols(clean_data.tool1$Weekly_Class_Schedule, need_translation),
    log_translation_cols(clean_data.tool1$Grades_Curriculum, need_translation),
    log_translation_cols(clean_data.tool1$Subjects_Detail |> select(-F9), need_translation) |> mutate(Tab_Name = "Subjects_Detail"),
    log_translation_cols(clean_data.tool1$Education_Quality, need_translation) |> mutate(Tab_Name = "Education_Quality"),
    log_translation_cols(clean_data.tool1$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 1 - Headmaster", .before = question_name),
  
  ## Tool 2
  bind_rows(
    log_translation_cols(clean_data.tool2$data |> select(-C10), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool2$Support_Respondents, need_translation) |> mutate(Tab_Name = "Support_Respondents"),
    log_translation_cols(clean_data.tool2$Attendance_Sheet_Photos, need_translation),
    log_translation_cols(clean_data.tool2$Public_Stationary_Kit_Group, need_translation) |> mutate(Tab_Name = "Public_Stationary_Kit_Group"),
    log_translation_cols(clean_data.tool2$Teachers_Pack_Group, need_translation) |> mutate(Tab_Name = "Teachers_Pack_Group"),
    log_translation_cols(clean_data.tool2$Students_Pack_Group, need_translation) |> mutate(Tab_Name = "Students_Pack_Group"),
    log_translation_cols(clean_data.tool2$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 2 - Light", .before = question_name),
  
  ## Tool 3
  bind_rows(
    log_translation_cols(clean_data.tool3$data |> select(-B2), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool3$Support_Respondents, need_translation) |> mutate(Tab_Name = "Support_Respondents"),
    log_translation_cols(clean_data.tool3$Grade_Details, need_translation),
    log_translation_cols(clean_data.tool3$Enrollement_Attendance_Summary, need_translation),
    log_translation_cols(clean_data.tool3$Todays_Attendance_Detail, need_translation),
    log_translation_cols(clean_data.tool3$LastWeek_Attendance_Detail, need_translation),
    log_translation_cols(clean_data.tool3$Student_Headcount, need_translation),
    log_translation_cols(clean_data.tool3$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 3 - Headcount", .before = question_name),
  
  ## Tool 4
  bind_rows(
    log_translation_cols(clean_data.tool4$data, need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool4$Additional_Subjects, need_translation),
    log_translation_cols(clean_data.tool4$Subjects_taught_by_this_teacher, need_translation) |> mutate(Tab_Name = "Subjects_taught_by_this_teacher"),
    log_translation_cols(clean_data.tool4$Subjects_Not_Being_Taught |> select(-F14), need_translation) |> mutate(Tab_Name = "Subjects_Not_Being_Taught"),
    log_translation_cols(clean_data.tool4$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 4 - Teacher", .before = question_name),

  ## Tool 5
  bind_rows(
    log_translation_cols(clean_data.tool5$data |> select(-C10, -C8_1, -C8_2), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool5$Under_Construction_Toilets, need_translation),
    log_translation_cols(clean_data.tool5$Useable_Toilets, need_translation),
    log_translation_cols(clean_data.tool5$Non_Useable_Toilets, need_translation),
    log_translation_cols(clean_data.tool5$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 5 - WASH", .before = question_name),
  
  ## Tool 6
  bind_rows(
    log_translation_cols(clean_data.tool6$data |> select(-F9, -C8_1, -C8_2), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool6$Subjects_Added, need_translation),
    log_translation_cols(clean_data.tool6$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 6 - Parent", .before = question_name),
  
  ## Tool 7
  bind_rows(
    log_translation_cols(clean_data.tool7$data |> mutate(E10_Other = as.character(E10_Other)) |> select(-C10), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool7$C6_list_members, need_translation),
    log_translation_cols(clean_data.tool7$Subjects_Added, need_translation),
    log_translation_cols(clean_data.tool7$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 7 - Shura", .before = question_name),
  
  ## Tool 8
  bind_rows(
    log_translation_cols(clean_data.tool8$data |> select(-C10), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool8$Classes, need_translation),
    log_translation_cols(clean_data.tool8$Adults_At_The_CBE, need_translation) |> mutate(Tab_Name = "Adults_At_The_CBE"),
    log_translation_cols(clean_data.tool8$Section_2_2_3_Attendance_Rec..., need_translation),
    log_translation_cols(clean_data.tool8$Section_2_2_4_Headcount, need_translation),
    log_translation_cols(clean_data.tool8$Students_Enrolment_Book, need_translation),
    log_translation_cols(clean_data.tool8$Section_2_4_Student_Ages, need_translation),
    log_translation_cols(clean_data.tool8$Classroom_Materials, need_translation) |> mutate(Tab_Name = "Classroom_Materials"),
    log_translation_cols(clean_data.tool8$Teacher_Kit, need_translation) |> mutate(Tab_Name = "Teacher_Kit"),
    log_translation_cols(clean_data.tool8$Student_Kit, need_translation) |> mutate(Tab_Name = "Student_Kit"),
    log_translation_cols(clean_data.tool8$V_list_of_all_members, need_translation),
    log_translation_cols(clean_data.tool8$Subjects_Added, need_translation),
    log_translation_cols(clean_data.tool8$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 8 - Class", .before = question_name),
  
  ## Tool 9
  bind_rows(
    log_translation_cols(clean_data.tool9$data |> select(-B2, -A2), need_translation) |> mutate(Tab_Name = "data"),
    log_translation_cols(clean_data.tool9$Relevant_photos, need_translation)
  ) |>
    mutate(tool = "Tool 9 - IP", .before = question_name)
)

# to double check in case of any untranslated but English phrased value
# SH some value does not translation but fixation
un_logged_values <- un_logged_values |> 
  anti_join(missing_translations, by = c("KEY", "tool", "question_name"))


# to be removed from environment ------------------------------------------
remove(missing_translation_func)
remove(log_translation_cols)
remove(need_translation)

