# getting the column names to exclude from data set for client ------------
# geopoint_vars = clean_data.tool1$data |> select(starts_with("geopoint")) |> names()
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")

extra_cols.tool1 <- c(
  # Meta cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "CBE_KEY",	"School_CBE_Name_DariPashto",
  "Line_Ministry_Sub_Project_Name_And_Description",	"If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", 
  
  # PII
  
  
  # URLs
  "text_audit_full",
  
  # Captions
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type",
  
  # Repeat counter and SET-OFF
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality",
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum", "Count_Weekly_Class_Schedule_Photo.re_calc",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos"
)

extra_cols.tool9 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "Respondent_Designation", # Confirm with Shahim to exclude this
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "A7_Photo1_Caption", "A7_Photo2_QA_Photo_Caption", "B2_Photo_Caption",
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF
  "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)


extra_cols.tool8 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Date_And_Time", "Surveyor_Name", "CBE_KEY", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "School_CBE_Name_DariPashto", "EMIS_School_ID_CBE_KEY", "Type_Of_School_CBE_Based_On_The_Sample", "Sector", "Line_Ministry_Name",
  "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "C2", "Respondent_Phone_Number1", "Respondent_Phone_Number2", "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "E18", 
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "B5_Caption", "E22_Photo1_Caption", "E22_Photo2_Caption", "E22_Photo3_Caption", "E22_Photo4_Caption", "E22_Photo5_Caption", "J4_Students_Enrolment_Book_Photo_Caption", "O7_Caption",
  "O10_Caption", "Q7_Photo_Caption", "Q10_Photo_Caption", "S7_Caption", "S10_Caption",  "W15_Caption",  "W18_Caption",  "W21_Caption",  "X6_Caption",  "Please_Add_Any_Relevant_Photo_caption",
  
  
  # Notes and Re-coded
  "Sample_Type", "Headcount_Total_Students.re_calc",
  
  # repeat counter and SET-OFF
  "Classes_count",	"SET-OF-Classes", "Adults_At_The_CBE_count",	"SET-OF-Adults_At_The_CBE", "Section_2_2_3_Attendance_Record_Check_CBS_count",	"SET-OF-Section_2_2_3_Attendance_Record_Check_CBS",
  "Section_2_2_4_Headcount_count",	"SET-OF-Section_2_2_4_Headcount", "SET-OF-Students_Enrolment_Book",	"Count_Students_Enrolment_Book_Photo", "Section_2_4_Student_Ages_count", "SET-OF-Section_2_4_Student_Ages",
  "Classroom_Materials_count",	"SET-OF-Classroom_Materials", "Teacher_Kit_count",	"SET-OF-Teacher_Kit", "Student_Kit_count",	"SET-OF-Student_Kit", "V_list_of_all_members_count",	"SET-OF-V_list_of_all_members",
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)


extra_cols.tool7 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "B5", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "B6", # Confirm with Shahim to exclude this
  

  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C10_image_Caption", "C10_image2_Caption", "C10_image3_Caption", "C10_image4_Caption", "C10_image5_Caption", "Please_Add_Any_Relevant_Photo_caption",
   
  
  # repeat counter and SET-OFF 
  "C6_list_members_count",	"SET-OF-C6_list_members", "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",

  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
  
)

extra_cols.tool6 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "", # Confirm with Shahim to exclude this
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # repeat counter and SET-OFF 
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  	
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
  
)

extra_cols.tool5 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C3_Caption", "Under_Construction_Toilet_Photo_Caption", "Useable_Toilet_Photo_Caption", "Non_Useable_Toilet_Photo_Caption", "C11_1_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "SET-OF-Under_Construction_Toilets",	"Count_Under_Construction_Toilet_Photo", "SET-OF-Useable_Toilets",	"Count_Useable_Toilet_Photo", "SET-OF-Non_Useable_Toilets",	"Count_Non_Useable_Toilet_Photo",
  "SET-OF-Relevant_photos",

  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)

extra_cols.tool4 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",

  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "Additional_Subjects_count",	"SET-OF-Additional_Subjects", "Subjects_taught_by_this_teacher_count",	"SET-OF-Subjects_taught_by_this_teacher", "Subjects_Not_Being_Taught_count",	"SET-OF-Subjects_Not_Being_Taught",
  "SET-OF-Relevant_photos",
  	
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)

extra_cols.tool3 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	 "School_Program_Sample", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
  "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",
  "Classes", # To be confirmed
  
  # PII 
  "B3", "B4A1", "B4A2", "B10A1",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C1A2_Caption", "C1A2_2_Caption", "D4_Caption", "D4_2_Caption", "D8_Caption", "D8_2_Caption", "E2_Caption", "E2_2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "Count_Support_Respondents",	"SET-OF-Enrollement_Attendance_Summary", "Count_Enrollement_Attendance_Summary",	"Count_Grade_Details",
  "Grade_Details_count",	"SET-OF-Grade_Details	","Todays_Attendance_Detail_count",	"SET-OF-Todays_Attendance_Detail",	"Count_Todays_Attendance_Detail",
  "LastWeek_Attendance_Detail_count",	"SET-OF-LastWeek_Attendance_Detail",	"Count_LastWeek_Attendance_Detail", "Student_Headcount_count",	"SET-OF-Student_Headcount",	"SET-OF-Relevant_photos",

  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)


extra_cols.tool2 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"EMIS_School_ID_CBE_KEY",	 "School_Program_Sample", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "IP_Name", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
  "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",
  "Classes", # To be confirmed
  
  # PII 
  "", "", "", "",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "", "", "", "", "", "", "", "", "",
  
  # Notes and Re-coded
  "Sample_Type", "",
  
  # repeat counter and SET-OFF 
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)


# extra_cols <- c(
#   "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
#   "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "CBE_KEY",	"School_CBE_Name_DariPashto",
#   "Line_Ministry_Sub_Project_Name_And_Description",	"If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
#   "Reporting_Period",
#   "A27", "A28", # we need this in Tool 1 but it needs to be checked if it's a PII question in any other tool
#   "B2", # Needs to be checked if PII in all tools
#   "B5A1", "B5A2", "C4", # It is also an important variable in tool 1 -- need to be fixed **
#   "C5", # Needs to be checked if PII in all tools
#   "C6A1", "C6A2", "C12A1", "C12A2", "C12A3", "C12A3_Other", "C12A4", "C15A1", "B1", # Important question in tool 8
#   "C4_Respondent_name", "C6_Respondent_phone_number1", # Needs to be checked if PII in all tools
#   "C6_Respondent_phone_number2", "Respondent1_Phone_Number", "D5", # It is also an important variable in tool 1 -- need to be fixed 
#   "Respondent2_Phone_Number", "D10", "D11", "B3", # An important question in tool 9
#   "B4A1","B4A2", "B10A1", "B10A4", 
#   # "C10",
#   # "Respondent_Designation",
#   
#   "Respondent_Full_Name","E18", # It is also an important variable in tool 1 -- need to be fixed
#   "Respondent1_Phone_Number","Respondent2_Phone_Number","A2", # AN important question in tool 8
#   "Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "B2","B5", # An important question in tool 9 
#   "Respondent1_Phone_Number", "Respondent2_Phone_Number",
#   "C2", # It is also an important variable in tool 1 -- need to be fixed
#   "Respondent_Phone_Number1", "Respondent_Phone_Number2", "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "B2", "Respondent_Full_Name", "Respondent1_Phone_Number",
#   "Respondent2_Phone_Number",geopoint_vars, qa_cols, url_vars.tool1, captions
# )



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
clean_data.tool1_for_client$data <- clean_data.tool1$data %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Support_Respondents <- clean_data.tool1$Support_Respondents %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$School_Operationality <- clean_data.tool1$School_Operationality %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$School_Operationality_Other_... <- clean_data.tool1$School_Operationality_Other_... %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Shifts_Detail <- clean_data.tool1$Shifts_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Other_Shifts_Detail <- clean_data.tool1$Other_Shifts_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Headmasters <- clean_data.tool1$Headmasters %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Curriculum_Changes <- clean_data.tool1$Curriculum_Changes %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Grades_Curriculum <- clean_data.tool1$Grades_Curriculum %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Subjects_Detail <- clean_data.tool1$Subjects_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Education_Quality <- clean_data.tool1$Education_Quality %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client$Relevant_photos <- clean_data.tool1$Relevant_photos %>% select(-any_of(c(extra_cols.tool1, qa_cols)))


clean_data.tool2_for_client$data <- clean_data.tool2$data %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Support_Respondents <- clean_data.tool2$Support_Respondents %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols)))
clean_data.tool2_for_client$Relevant_photos <- clean_data.tool2$Relevant_photos %>% select(-any_of(c(extra_cols.tool2, qa_cols)))


clean_data.tool3_for_client$data <- clean_data.tool3$data %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Support_Respondents <- clean_data.tool3$Support_Respondents %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Enrollement_Attendance_Summary <- clean_data.tool3$Enrollement_Attendance_Summary %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Grade_Details <- clean_data.tool3$Grade_Details %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$LastWeek_Attendance_Detail <- clean_data.tool3$LastWeek_Attendance_Detail %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Student_Headcount <- clean_data.tool3$Student_Headcount %>% select(-any_of(c(extra_cols.tool3, qa_cols)))
clean_data.tool3_for_client$Relevant_photos <- clean_data.tool3$Relevant_photos %>% select(-any_of(c(extra_cols.tool3, qa_cols)))


clean_data.tool4_for_client$data <- clean_data.tool4$data %>% select(-any_of(c(extra_cols.tool4, qa_cols)))
clean_data.tool4_for_client$Additional_Subjects <- clean_data.tool4$Additional_Subjects %>% select(-any_of(c(extra_cols.tool4, qa_cols)))
clean_data.tool4_for_client$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher %>% select(-any_of(c(extra_cols.tool4, qa_cols)))
clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught %>% select(-any_of(c(extra_cols.tool4, qa_cols)))
clean_data.tool4_for_client$Relevant_photos <- clean_data.tool4$Relevant_photos %>% select(-any_of(c(extra_cols.tool4, qa_cols)))


clean_data.tool5_for_client$data <- clean_data.tool5$data %>% select(-any_of(c(extra_cols.tool5, qa_cols)))
clean_data.tool5_for_client$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols)))
clean_data.tool5_for_client$Useable_Toilets <- clean_data.tool5$Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols)))
clean_data.tool5_for_client$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols)))
clean_data.tool5_for_client$Relevant_photos <- clean_data.tool5$Relevant_photos %>% select(-any_of(c(extra_cols.tool5, qa_cols)))


clean_data.tool6_for_client$data <- clean_data.tool6$data %>% select(-any_of(c(extra_cols.tool6, qa_cols)))
clean_data.tool6_for_client$Subjects_Added <- clean_data.tool6$Subjects_Added %>% select(-any_of(c(extra_cols.tool6, qa_cols)))
clean_data.tool6_for_client$Relevant_photos <- clean_data.tool6$Relevant_photos %>% select(-any_of(c(extra_cols.tool6, qa_cols)))


clean_data.tool7_for_client$data <- clean_data.tool7$data %>% select(-any_of(c(extra_cols.tool7, qa_cols)))
clean_data.tool7_for_client$C6_list_members <- clean_data.tool7$C6_list_members %>% select(-any_of(c(extra_cols.tool7, qa_cols)))
clean_data.tool7_for_client$Subjects_Added <- clean_data.tool7$Subjects_Added %>% select(-any_of(c(extra_cols.tool7, qa_cols)))
clean_data.tool7_for_client$Relevant_photos <- clean_data.tool7$Relevant_photos %>% select(-any_of(c(extra_cols.tool7, qa_cols)))


clean_data.tool8_for_client$data <- clean_data.tool8$data %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Classes <- clean_data.tool8$Classes %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Adults_At_The_CBE <- clean_data.tool8$Adults_At_The_CBE %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Section_2_2_3_Attendance_Rec... <- clean_data.tool8$Section_2_2_3_Attendance_Rec... %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Students_Enrolment_Book <- clean_data.tool8$Students_Enrolment_Book %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Section_2_4_Student_Ages <- clean_data.tool8$Section_2_4_Student_Ages %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8$Classroom_Materials %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8$Teacher_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Student_Kit <- clean_data.tool8$Student_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8$V_list_of_all_members %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Subjects_Added <- clean_data.tool8$Subjects_Added %>% select(-any_of(c(extra_cols.tool8, qa_cols)))
clean_data.tool8_for_client$Relevant_photos <- clean_data.tool8$Relevant_photos %>% select(-any_of(c(extra_cols.tool8, qa_cols)))


clean_data.tool9_for_client$data <- clean_data.tool9$data %>% select(-any_of(c(extra_cols.tool9, qa_cols)))
clean_data.tool9_for_client$Relevant_photos <- clean_data.tool9$Relevant_photos %>% select(-any_of(c(extra_cols.tool9, qa_cols)))

# remove extra objects from environment  
remove(list = c("qa_cols"))
