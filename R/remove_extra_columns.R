# getting the column names to exclude from data set for client ------------
geopoint_vars = clean_data.tool1$data |> select(starts_with("geopoint")) |> names()
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")

url_vars.tool1 <- c(
  "text_audit_full"
)

captions <- c(
  # Tool1 
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption"
  
  # Tool2
  
)

notes <- c(
  # Tool1
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type"
  
  # Tool2
  

  
  
)

counters_set_of <- c(
  # Tool1 
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality",
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum", "Count_Weekly_Class_Schedule_Photo.re_calc",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos"
  
  # Tool2

  


  
)

extra_cols <- c(
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "CBE_KEY",	"School_CBE_Name_DariPashto",
  "Line_Ministry_Sub_Project_Name_And_Description",	"If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", 
  "A27", "A28", # we need this in Tool 1 but it needs to be checked if it's a PII question in any other tool
  "B2", # Needs to be checked if PII in all tools
  "B5A1", "B5A2", "C4", # It is also an important variable in tool 1 -- need to be fixed **
  "C5", # Needs to be checked if PII in all tools
  "C6A1", "C6A2", "C12A1", "C12A2", "C12A3", "C12A3_Other", "C12A4", "C15A1", "B1", "C4_Respondent_name", "C6_Respondent_phone_number1", # Needs to be checked if PII in all tools
  "C6_Respondent_phone_number2", "Respondent1_Phone_Number", "D5", # It is also an important variable in tool 1 -- need to be fixed 
  "Respondent2_Phone_Number", "D10", "D11", "B3", "B4A1","B4A2", "B10A1", "B10A4", 
  # "C10",
  # "Respondent_Designation",
  
  "Respondent_Full_Name","E18", # It is also an important variable in tool 1 -- need to be fixed
  "Respondent1_Phone_Number","Respondent2_Phone_Number","A2","Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "B2","B5", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  "C2", # It is also an important variable in tool 1 -- need to be fixed
  "Respondent_Phone_Number1", "Respondent_Phone_Number2", "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "B2", "Respondent_Full_Name", "Respondent1_Phone_Number",
  "Respondent2_Phone_Number",geopoint_vars, qa_cols, url_vars.tool1, captions
)



# cloning clean datasets for client version
clean_data.tool1_for_client <- clean_data.tool1
clean_data.tool2_for_client <- clean_data.tool2
clean_data.tool3_for_client <- clean_data.tool3
clean_data.tool4_for_client <- clean_data.tool4
clean_data.tool5_for_client <- clean_data.tool5
clean_data.tool6_for_client <- clean_data.tool6
clean_data.tool7_for_client <- clean_data.tool7
clean_data.tool8_for_client <- clean_data.tool8
clean_data.tool9_for_client <- clean_data.tool9

# Remove extra cols -------------------------------------------------------
clean_data.tool1_for_client$data <- clean_data.tool1$data %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Support_Respondents <- clean_data.tool1$Support_Respondents %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$School_Operationality <- clean_data.tool1$School_Operationality %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$School_Operationality_Other_... <- clean_data.tool1$School_Operationality_Other_... %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Shifts_Detail <- clean_data.tool1$Shifts_Detail %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Other_Shifts_Detail <- clean_data.tool1$Other_Shifts_Detail %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Headmasters <- clean_data.tool1$Headmasters %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Curriculum_Changes <- clean_data.tool1$Curriculum_Changes %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Grades_Curriculum <- clean_data.tool1$Grades_Curriculum %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Subjects_Detail <- clean_data.tool1$Subjects_Detail %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Education_Quality <- clean_data.tool1$Education_Quality %>% select(-any_of(extra_cols))
clean_data.tool1_for_client$Relevant_photos <- clean_data.tool1$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool2_for_client$data <- clean_data.tool2$data %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Support_Respondents <- clean_data.tool2$Support_Respondents %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group %>% select(-any_of(extra_cols))
clean_data.tool2_for_client$Relevant_photos <- clean_data.tool2$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool3_for_client$data <- clean_data.tool3$data %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Support_Respondents <- clean_data.tool3$Support_Respondents %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Enrollement_Attendance_Summary <- clean_data.tool3$Enrollement_Attendance_Summary %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Grade_Details <- clean_data.tool3$Grade_Details %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$LastWeek_Attendance_Detail <- clean_data.tool3$LastWeek_Attendance_Detail %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Student_Headcount <- clean_data.tool3$Student_Headcount %>% select(-any_of(extra_cols))
clean_data.tool3_for_client$Relevant_photos <- clean_data.tool3$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool4_for_client$data <- clean_data.tool4$data %>% select(-any_of(extra_cols))
clean_data.tool4_for_client$Additional_Subjects <- clean_data.tool4$Additional_Subjects %>% select(-any_of(extra_cols))
clean_data.tool4_for_client$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher %>% select(-any_of(extra_cols))
clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught %>% select(-any_of(extra_cols))
clean_data.tool4_for_client$Relevant_photos <- clean_data.tool4$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool5_for_client$data <- clean_data.tool5$data %>% select(-any_of(extra_cols))
clean_data.tool5_for_client$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets %>% select(-any_of(extra_cols))
clean_data.tool5_for_client$Useable_Toilets <- clean_data.tool5$Useable_Toilets %>% select(-any_of(extra_cols))
clean_data.tool5_for_client$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets %>% select(-any_of(extra_cols))
clean_data.tool5_for_client$Relevant_photos <- clean_data.tool5$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool6_for_client$data <- clean_data.tool6$data %>% select(-any_of(extra_cols))
clean_data.tool6_for_client$Subjects_Added <- clean_data.tool6$Subjects_Added %>% select(-any_of(extra_cols))
clean_data.tool6_for_client$Relevant_photos <- clean_data.tool6$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool7_for_client$data <- clean_data.tool7$data %>% select(-any_of(extra_cols))
clean_data.tool7_for_client$C6_list_members <- clean_data.tool7$C6_list_members %>% select(-any_of(extra_cols))
clean_data.tool7_for_client$Subjects_Added <- clean_data.tool7$Subjects_Added %>% select(-any_of(extra_cols))
clean_data.tool7_for_client$Relevant_photos <- clean_data.tool7$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool8_for_client$data <- clean_data.tool8$data %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Classes <- clean_data.tool8$Classes %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Adults_At_The_CBE <- clean_data.tool8$Adults_At_The_CBE %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Section_2_2_3_Attendance_Rec... <- clean_data.tool8$Section_2_2_3_Attendance_Rec... %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Students_Enrolment_Book <- clean_data.tool8$Students_Enrolment_Book %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Section_2_4_Student_Ages <- clean_data.tool8$Section_2_4_Student_Ages %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8$Classroom_Materials %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8$Teacher_Kit %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Student_Kit <- clean_data.tool8$Student_Kit %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8$V_list_of_all_members %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Subjects_Added <- clean_data.tool8$Subjects_Added %>% select(-any_of(extra_cols))
clean_data.tool8_for_client$Relevant_photos <- clean_data.tool8$Relevant_photos %>% select(-any_of(extra_cols))


clean_data.tool9_for_client$data <- clean_data.tool9$data %>% select(-any_of(extra_cols))
clean_data.tool9_for_client$Relevant_photos <- clean_data.tool9$Relevant_photos %>% select(-any_of(extra_cols))

# remove extra objects from environment  
remove(list = c("geopoint_vars", "qa_cols", "extra_cols"))
