# getting the column names to exclude from data set for client ------------
# geopoint_vars = clean_data.tool1$data |> select(starts_with("geopoint")) |> names()
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")

extra_cols.tool1 <- c(
  # Meta cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "CBE_KEY",	"School_CBE_Name_DariPashto", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector",	"Line_Ministry_Name",	"Line_Ministry_Project_Id",	"Line_Ministry_SubProject_Id",	"Type_Of_Implementing_Partner",	"Type_Of_Site_Visit",	"Type_Of_Visit",
  "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",	"tpma_location_id", "Line_Ministry_Sub_Project_Name_And_Description",	
  "Reporting_Period",	"Class1_N_Sample",	"Class2_N_Sample",	"Class3_N_Sample",	"Class4_N_Sample",	"Class5_N_Sample",	"Class6_N_Sample",	"Class7_N_Sample",	"Class8_N_Sample",
  "Class9_N_Sample",	"Class10_N_Sample",	"Class11_N_Sample",	"Class12_N_Sample", "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Interviewee_Respondent_Type_Other",
  "Village", "instanceID", "formdef_version",
  
  # PII
  "B2", "B5A1", "B5A2","C5", "C6A1", "C6A2", "C12A1", "C12A4", "C15A1",
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URLs
  "text_audit_full",
  
  # Labels
  "Grade_Name_Dari",	"Grade_Name_Pashto",'Shift_Name_Dari',"Shift_Name_Pashto", "Sub_name_Dari",	"Sub_name_Pashto", "Feature_Dari",	"Feature_Pashto",
  
  
  # Captions
  "B19_Caption", "B20_Caption", "F2_Caption", "J24_Caption", "L2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "interview_to_be_conducted_with_English", "interview_to_be_conducted_with_Dari", "interview_to_be_conducted_with_Pashto", "Surveyor_Comments",
  "Surveyor_Comments_Translation",	"join_Grade_Name_Eng",	"join_Shift_Name_Eng", "Sample_Type",  "Count_Weekly_Class_Schedule_Photo.re_calc",
  
  # Repeat counter and SET-OFF
  "Support_Respondents_count", "SET-OF-Support_Respondents", "School_Operationality_count", "SET-OF-School_Operationality", # Do find and search for SET-OF and count
  "School_Operationality_Other_Grades_count",	"SET-OF-School_Operationality_Other_Grades",	"Shifts_Detail_count",	"SET-OF-Shifts_Detail",
  "Other_Shifts_Detail_count",	"SET-OF-Other_Shifts_Detail", "Headmasters_count",	"SET-OF-Headmasters", "Curriculum_Changes_count",	"SET-OF-Curriculum_Changes", 
  "SET-OF-Weekly_Class_Schedule",	"Count_Weekly_Class_Schedule_Photo",	"Grades_Curriculum_count", "SET-OF-Grades_Curriculum",
  "Subjects_Detail_count", "SET-OF-Subjects_Detail", "Education_Quality_count",	"SET-OF-Education_Quality", "SET-OF-Relevant_photos",
  
  # FDE Cols
  "FDE_Dari_Hours", "FDE_Mathematics_Hours", "FDE_Drawing_Hours", "FDE_Life_Skills_Hours", "FDE_Calligraphy_Hours", "FDE_English_Hours", "FDE_Pashto_Hours", "FDE_Social_Studies_Hours", "FDE_Arabic_Hours",
  "FDE_Civics_Hours", "FDE_Professional_Skills_Hours", "FDE_Biology_Hours", "FDE_Geography_Hours", "FDE_History_Hours", "FDE_Physics_Hours", "FDE_Chemistry_Hours", "FDE_Islamic_Studies_Hours",
  "FDE_Holy_Quran_Hours", "FDE_Tajweed_Hours", "FDE_Patriotism_Hours", "FDE_Other_Hours"
)

extra_cols.tool9 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other", "Interviewee_Respondent_Type", "Interviewee_Respondent_Type_Other", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  
  # PII 
  "Respondent_Full_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
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
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)


extra_cols.tool8 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Date_And_Time", "Surveyor_Name", "CBE_KEY", "Province_filter",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "School_CBE_Name_DariPashto", "Type_Of_School_CBE_Based_On_The_Sample", "Sector", "Line_Ministry_Name",
  "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Interviewee_Respondent_Type_Other", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  
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
  "Surveyor_Comments",	"Surveyor_Comments_Translation", "C13",	"C13_Translation",
  
  
  # FDE
  "FDE_Confirm_The_Date_of_Visit_With_Attendance", "FDE_Overall_Present_Students_Male", "FDE_Overall_Present_Students_Female", "FDE_Overall_Absent_Students_Male", "FDE_Overall_Absent_Students_Female",
  "J4_Students_Enrolment_Book_Photo_Caption",  "FDE_Grade1_Male", "FDE_Grade1_Female", "FDE_Grade1_Total", "FDE_Grade2_Male", "FDE_Grade2_Female", "FDE_Grade2_Total", "FDE_Grade3_Male", "FDE_Grade3_Female",
  "FDE_Grade3_Total", "FDE_Grade4_Male", "FDE_Grade4_Female", "FDE_Grade4_Total", "FDE_Grade5_Male", "FDE_Grade5_Female", "FDE_Grade5_Total", "FDE_Grade6_Male", "FDE_Grade6_Female", "FDE_Grade6_Total",
  "FDE_Grade_Other_Male", "FDE_Grade_Other_Female", "FDE_Grade_Other_Total", "FDE_Total_Male", "FDE_Total_Female", "FDE_Total", "FDE_Level_1_1_2_Male", "FDE_Level_1_1_2_Female", "FDE_Total_Level_1_1_2",
  "FDE_Level_2_3_4_Male", "FDE_Level_2_3_4_Female", "FDE_Total_Level_2_3_4", "FDE_Level_3_5_6_Male", "FDE_Level_3_5_6_Female", "FDE_Total_Level_3_5_6"
)


extra_cols.tool7 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type",  "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  
  # PII 
  "B5", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C10_image_Caption", "C10_image2_Caption", "C10_image3_Caption", "C10_image4_Caption", "C10_image5_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  
  # repeat counter and SET-OFF 
  "C6_list_members_count",	"SET-OF-C6_list_members", "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
  
)

extra_cols.tool6 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Sample_info_correct", "Village",
  "instanceID", "formdef_version",
  
  # PII 
  "Respondent_Name", "Respondent1_Phone_Number", "Respondent2_Phone_Number",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "Please_Add_Any_Relevant_Photo_caption",
  
  # repeat counter and SET-OFF 
  "Subjects_Added_count",	"SET-OF-Subjects_Added", "SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
  
)

extra_cols.tool5 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Interviewee_Respondent_Type_Other", "Village",
  "instanceID", "formdef_version",
  
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
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool4 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	"Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Village",
  "instanceID", "formdef_version",
  
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
  "Surveyor_Comments",	"Surveyor_Comments_Translation"
)

extra_cols.tool3 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto",	 "School_Program_Sample", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "School_Property_Sample", "School_Shifts_Sample",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Class1_N_Sample", "Class2_N_Sample", "Class3_N_Sample", "Class4_N_Sample", "Class5_N_Sample", "Class6_N_Sample", "Class7_N_Sample", "Class8_N_Sample", "Class9_N_Sample",
  "Class10_N_Sample", "Class11_N_Sample", "Class12_N_Sample", "School_Status_Sample", "School_Status_EMIS",  "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name",
  "Classes", # To be confirmed
  "Interviewee_Respondent_Type", 'Interviewee_Respondent_Type_Other', "Village", "instanceID", "formdef_version",
  
  # PII 
  "B3", "B4A1", "B4A2", "B10A1", "B10A4",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "C1A2_Caption", "C1A2_2_Caption", "D4_Caption", "D4_2_Caption", "D8_Caption", "D8_2_Caption", "E2_Caption", "E2_2_Caption", "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "Count_Support_Respondents",	"SET-OF-Enrollement_Attendance_Summary", "Count_Enrollement_Attendance_Summary",	"Count_Grade_Details",
  "Grade_Details_count",	"SET-OF-Grade_Details	","Todays_Attendance_Detail_count",	"SET-OF-Todays_Attendance_Detail",	"Count_Todays_Attendance_Detail",
  "LastWeek_Attendance_Detail_count",	"SET-OF-LastWeek_Attendance_Detail",	"Count_LastWeek_Attendance_Detail", "Student_Headcount_count",	"SET-OF-Student_Headcount",	"SET-OF-Relevant_photos",
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation",
  
  # FDE COLUMN
  "FDE_C1A3", "FDE_C1A4_Male", "FDE_C1A4_Female", "FDE_C1A5_Male", "FDE_C1A5_Female", "FDE_C1A6_Male", "FDE_C1A6_Female", "FDE_Overall_Present_Male_Students_Today", "FDE_Number_Of_Absent_Male_Students_Today",
  "FDE_Overall_Present_Female_Students_Today", "FDE_Number_Of_Absent_Female_Students_Today", "FDE_Overall_Present_Male_Students_LastWeek", "FDE_Number_Of_Absent_Male_Students_LastWeek",
  "FDE_Overall_Present_Female_Students_LastWeek", "FDE_Number_Of_Absent_Female_Students_LastWeek", "FDE_E6A11", "FDE_E6A12", "FDE_E6A21", "FDE_E6A22", "FDE_E6A31", "FDE_E6A32"
)


extra_cols.tool2 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Province_Climate", "Survey_Language", "Survey_Language_Other", "IP_Name", "Interviewee_Respondent_Type", "Interviewee_Respondent_Type_Other",
  "Village", "instanceID", "formdef_version",
  
  # PII 
  "C4_Respondent_name", "C6_Respondent_phone_number1", "C6_Respondent_phone_number2", "D5", "Respondent1_Phone_Number", "Respondent2_Phone_Number", "D10", "D11",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # Captions
  "B5_Caption", "Photo_closure_1_Caption", "Photo_closure_2_Caption", "G6_Caption", "H12_Caption", "H15_Caption", "i12_Caption", "i15_Caption", "J12_Caption", "J15_Caption" ,
  "Please_Add_Any_Relevant_Photo_caption",
  
  # Notes and Re-coded
  "Sample_Type",
  
  # repeat counter and SET-OFF 
  "Support_Respondents_count",	"SET-OF-Support_Respondents", "SET-OF-Attendance_Sheet_Photos",	"Count_Attendance_Sheet_Photos", "Public_Stationary_Kit_Group_count",	"SET-OF-Public_Stationary_Kit_Group",
  "Teachers_Pack_Group_count",	"SET-OF-Teachers_Pack_Group", "Students_Pack_Group_count",	"SET-OF-Students_Pack_Group",	"SET-OF-Relevant_photos",
  
  # FDE
  "FDE_Present_Teachers_Male", "FDE_Absent_Teachers_Male", "FDE_Total_Teachers_Male", "FDE_Present_Teachers_Female", "FDE_Absent_Teachers_Female", "FDE_Total_Teachers_Female",
  
  # Labels
  
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation", "Enumerator_Comments", "Enumerator_Comments_Translation"
)


extra_cols.tool0 <- c(
  # Meta Cols
  "Passcode", "deviceid", "subscriberid", "simid", "devicephonenum", "username", "duration", "device_info", "comments", "Surveyor_Name", "Province_filter", "CBE_KEY",
  "Province_DariPashto", "District_DariPashto", "Region_Pcode", "Village_DariPashto", "Date_And_Time", "School_CBE_Name_DariPashto", "Type_Of_School_CBE_Based_On_The_Sample",
  "Sector", "Line_Ministry_Name", "Line_Ministry_Project_Id", "Line_Ministry_SubProject_Id", "Province_Climate",
  "Line_Ministry_Sub_Project_Name_And_Description", "Type_Of_Implementing_Partner", "Type_Of_Site_Visit", "Type_Of_Visit", "If_not_a_first_Site_Visit_state_Original_Site_Visit_ID",
  "Reporting_Period", "tpma_location_id", "Survey_Language", "Survey_Language_Other", "IP_Name", "Sample_info_correct", "Village", "instanceID", "formdef_version",
  
  # PII 
  "Data_Entry_Clerk_Name",
  
  # GPS
  "Geopoint1-Latitude",	"Geopoint1-Longitude",	"Geopoint1-Altitude",	"Geopoint1-Accuracy",
  
  # URL
  "text_audit_full",
  
  # repeat counter and SET-OFF 
  "SET-OF-Tool3_Grades_Repeat", "Tool3_Class_Attendance_count",	"SET-OF-Tool3_Class_Attendance", "Tool3_T3_N_Classes_Repeat_count",	"SET-OF-Tool3_T3_N_Classes_Repeat",
  "Tool3_Headcount_count", "SET-OF-Tool3_Headcount", "Tool1_Timetable_Year_count",	"SET-OF-Tool1_Timetable_Year", "Tool3_Grades_Repeat_count",
  "Tool1_Timetable1_Repeat_count",	"SET-OF-Tool1_Timetable1_Repeat", "Tool1_Timetable2_Repeat_count",	"SET-OF-Tool1_Timetable2_Repeat",
  "Tool1_Timetable3_Repeat_count",	"SET-OF-Tool1_Timetable3_Repeat", "Tool1_Timetable4_Repeat_count",	"SET-OF-Tool1_Timetable4_Repeat",
  
  # Labels
  
  # Surveyor Comments
  "Surveyor_Comments",	"Surveyor_Comments_Translation" # Confirm with Shahim
)



# cloning clean datasets for client version
clean_data.tool0_for_client_ulabeled <- clean_data.tool0_ulabeled
clean_data.tool1_for_client_ulabeled <- clean_data.tool1_ulabeled
clean_data.tool2_for_client_ulabeled <- clean_data.tool2_ulabeled
clean_data.tool3_for_client_ulabeled <- clean_data.tool3_ulabeled
clean_data.tool4_for_client_ulabeled <- clean_data.tool4_ulabeled
clean_data.tool5_for_client_ulabeled <- clean_data.tool5_ulabeled
clean_data.tool6_for_client_ulabeled <- clean_data.tool6_ulabeled
clean_data.tool7_for_client_ulabeled <- clean_data.tool7_ulabeled
clean_data.tool8_for_client_ulabeled <- clean_data.tool8_ulabeled
clean_data.tool9_for_client_ulabeled <- clean_data.tool9_ulabeled


# Remove extra cols -------------------------------------------------------
clean_data.tool0_for_client_ulabeled$data <- clean_data.tool0_ulabeled$data %>% select(-any_of(c(extra_cols.tool0, qa_cols)))
clean_data.tool0_for_client_ulabeled$Tool3_Grades_Repeat <- clean_data.tool0_ulabeled$Tool3_Grades_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool3_Class_Attendance <- clean_data.tool0_ulabeled$Tool3_Class_Attendance %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool3_T3_N_Classes_Repeat <- clean_data.tool0_ulabeled$Tool3_T3_N_Classes_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool3_Headcount <- clean_data.tool0_ulabeled$Tool3_Headcount %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool1_Timetable_Year <- clean_data.tool0_ulabeled$Tool1_Timetable_Year %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool1_Timetable1_Repeat <- clean_data.tool0_ulabeled$Tool1_Timetable1_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool1_Timetable2_Repeat <- clean_data.tool0_ulabeled$Tool1_Timetable2_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool1_Timetable3_Repeat <- clean_data.tool0_ulabeled$Tool1_Timetable3_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  left_join(clean_data.tool0_for_client_ulabeled$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool0_for_client_ulabeled$Tool1_Timetable4_Repeat <- clean_data.tool0_ulabeled$Tool1_Timetable4_Repeat %>% select(-any_of(c(extra_cols.tool0, qa_cols, "starttime"))) |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(clean_data.tool0_for_client_ulabeled$Tool1_Timetable_Year |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())


clean_data.tool1_for_client_ulabeled$data <- clean_data.tool1_ulabeled$data %>% select(-any_of(c(extra_cols.tool1, qa_cols)))
clean_data.tool1_for_client_ulabeled$Support_Respondents <- clean_data.tool1_ulabeled$Support_Respondents %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$School_Operationality <- clean_data.tool1_ulabeled$School_Operationality %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$School_Operationality_Other_... <- clean_data.tool1_ulabeled$School_Operationality_Other_... %>% select(-any_of(c(extra_cols.tool1, qa_cols,"School_CBE_Gender_Based_On_The_Sample", "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Shifts_Detail <- clean_data.tool1_ulabeled$Shifts_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Other_Shifts_Detail <- clean_data.tool1_ulabeled$Other_Shifts_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Headmasters <- clean_data.tool1_ulabeled$Headmasters %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Curriculum_Changes <- clean_data.tool1_ulabeled$Curriculum_Changes %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Weekly_Class_Schedule <- clean_data.tool1_ulabeled$Weekly_Class_Schedule %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$Curriculum_Changes |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Grades_Curriculum <- clean_data.tool1_ulabeled$Grades_Curriculum %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$Curriculum_Changes |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Subjects_Detail <- clean_data.tool1_ulabeled$Subjects_Detail %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Education_Quality <- clean_data.tool1_ulabeled$Education_Quality %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool1_for_client_ulabeled$Relevant_photos <- clean_data.tool1_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool1, qa_cols, "starttime"))) |>
  left_join(clean_data.tool1_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())


clean_data.tool2_for_client_ulabeled$data <- clean_data.tool2_ulabeled$data %>% select(-any_of(c(extra_cols.tool2, qa_cols)))

clean_data.tool2_for_client_ulabeled$Support_Respondents <- clean_data.tool2_ulabeled$Support_Respondents %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool2_for_client_ulabeled$Attendance_Sheet_Photos <- clean_data.tool2_ulabeled$Attendance_Sheet_Photos %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool2_for_client_ulabeled$Public_Stationary_Kit_Group <- clean_data.tool2_ulabeled$Public_Stationary_Kit_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool2_for_client_ulabeled$Teachers_Pack_Group <- clean_data.tool2_ulabeled$Teachers_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool2_for_client_ulabeled$Students_Pack_Group <- clean_data.tool2_ulabeled$Students_Pack_Group %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool2_for_client_ulabeled$Relevant_photos <- clean_data.tool2_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool2, qa_cols, "starttime"))) |>
  left_join(clean_data.tool2_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())


clean_data.tool3_for_client_ulabeled$data <- clean_data.tool3_ulabeled$data %>% select(-any_of(c(extra_cols.tool3, qa_cols)))

clean_data.tool3_for_client_ulabeled$Support_Respondents <- clean_data.tool3_ulabeled$Support_Respondents %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$Enrollement_Attendance_Summary <- clean_data.tool3_ulabeled$Enrollement_Attendance_Summary %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$Grade_Details <- clean_data.tool3_ulabeled$Grade_Details %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$Todays_Attendance_Detail <- clean_data.tool3_ulabeled$Todays_Attendance_Detail %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$LastWeek_Attendance_Detail <- clean_data.tool3_ulabeled$LastWeek_Attendance_Detail %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$Student_Headcount <- clean_data.tool3_ulabeled$Student_Headcount %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool3_for_client_ulabeled$Relevant_photos <- clean_data.tool3_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool3, qa_cols, "starttime"))) |>
  left_join(clean_data.tool3_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())


clean_data.tool4_for_client_ulabeled$data <- clean_data.tool4_ulabeled$data %>% select(-any_of(c(extra_cols.tool4, qa_cols)))

clean_data.tool4_for_client_ulabeled$Additional_Subjects <- clean_data.tool4_ulabeled$Additional_Subjects %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  left_join(clean_data.tool4_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool4_for_client_ulabeled$Subjects_taught_by_this_teacher <- clean_data.tool4_ulabeled$Subjects_taught_by_this_teacher %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  left_join(clean_data.tool4_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool4_for_client_ulabeled$Subjects_Not_Being_Taught <- clean_data.tool4_ulabeled$Subjects_Not_Being_Taught %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  left_join(clean_data.tool4_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool4_for_client_ulabeled$Relevant_photos <- clean_data.tool4_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool4, qa_cols, "starttime"))) |>
  left_join(clean_data.tool4_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())



clean_data.tool5_for_client_ulabeled$data <- clean_data.tool5_ulabeled$data %>% select(-any_of(c(extra_cols.tool5, qa_cols)))

clean_data.tool5_for_client_ulabeled$Under_Construction_Toilets <- clean_data.tool5_ulabeled$Under_Construction_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool5_for_client_ulabeled$Useable_Toilets <- clean_data.tool5_ulabeled$Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool5_for_client_ulabeled$Non_Useable_Toilets <- clean_data.tool5_ulabeled$Non_Useable_Toilets %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool5_for_client_ulabeled$Relevant_photos <- clean_data.tool5_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool5, qa_cols, "starttime"))) |>
  left_join(clean_data.tool5_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())



clean_data.tool6_for_client_ulabeled$data <- clean_data.tool6_ulabeled$data %>% select(-any_of(c(extra_cols.tool6, qa_cols)))

clean_data.tool6_for_client_ulabeled$Subjects_Added <- clean_data.tool6_ulabeled$Subjects_Added %>% select(-any_of(c(extra_cols.tool6, qa_cols, "starttime"))) |>
  left_join(clean_data.tool6_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool6_for_client_ulabeled$Relevant_photos <- clean_data.tool6_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool6, qa_cols, "starttime"))) |>
  left_join(clean_data.tool6_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())


clean_data.tool7_for_client_ulabeled$data <- clean_data.tool7_ulabeled$data %>% select(-any_of(c(extra_cols.tool7, qa_cols)))

clean_data.tool7_for_client_ulabeled$C6_list_members <- clean_data.tool7_ulabeled$C6_list_members %>% select(-any_of(c(extra_cols.tool7, qa_cols, "starttime", "Field_Label",	"Field_Lablel_Final"))) |>
  left_join(clean_data.tool7_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool7_for_client_ulabeled$Subjects_Added <- clean_data.tool7_ulabeled$Subjects_Added %>% select(-any_of(c(extra_cols.tool7, qa_cols, "starttime"))) |>
  left_join(clean_data.tool7_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool7_for_client_ulabeled$Relevant_photos <- clean_data.tool7_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool7, qa_cols, "starttime"))) |>
  left_join(clean_data.tool7_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())



clean_data.tool8_for_client_ulabeled$data <- clean_data.tool8_ulabeled$data %>% select(-any_of(c(extra_cols.tool8, qa_cols)))

clean_data.tool8_for_client_ulabeled$Classes <- clean_data.tool8_ulabeled$Classes %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "Class_Name"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Adults_At_The_CBE <- clean_data.tool8_ulabeled$Adults_At_The_CBE %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Section_2_2_3_Attendance_Rec... <- clean_data.tool8_ulabeled$Section_2_2_3_Attendance_Rec... %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "Class_Name_CBE"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Section_2_2_4_Headcount <- clean_data.tool8_ulabeled$Section_2_2_4_Headcount %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "School_CBE_Gender_Based_On_The_Sample", "Class_Name_CBE_Headcount"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Students_Enrolment_Book <- clean_data.tool8_ulabeled$Students_Enrolment_Book %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Section_2_4_Student_Ages <- clean_data.tool8_ulabeled$Section_2_4_Student_Ages %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "Class_Name_CBE_Student_Ages"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Classroom_Materials <- clean_data.tool8_ulabeled$Classroom_Materials %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "O_Field_Label"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Teacher_Kit <- clean_data.tool8_ulabeled$Teacher_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "O2_Field_Label"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Student_Kit <- clean_data.tool8_ulabeled$Student_Kit %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "S1_Field_Label"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$V_list_of_all_members <- clean_data.tool8_ulabeled$V_list_of_all_members %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime", "V_Field_Label"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Subjects_Added <- clean_data.tool8_ulabeled$Subjects_Added %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())

clean_data.tool8_for_client_ulabeled$Relevant_photos <- clean_data.tool8_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool8, qa_cols, "starttime"))) |>
  left_join(clean_data.tool8_for_client_ulabeled$data |> select(KEY, EMIS_School_ID_CBE_KEY, School_CBE_Name), by = c("PARENT_KEY" = "KEY")) |> 
  select(Site_Visit_ID, EMIS_School_ID_CBE_KEY, School_CBE_Name, everything())



clean_data.tool9_for_client_ulabeled$data <- clean_data.tool9_ulabeled$data %>% select(-any_of(c(extra_cols.tool9, qa_cols)))
clean_data.tool9_for_client_ulabeled$Relevant_photos <- clean_data.tool9_ulabeled$Relevant_photos %>% select(-any_of(c(extra_cols.tool9, qa_cols, "starttime"))) |>
  left_join(clean_data.tool9_ulabeled$data |> select(KEY, IP_Name), by = c("PARENT_KEY"="KEY")) |>
  select(Site_Visit_ID, IP_Name, everything())

# remove extra objects from environment  
remove(list = c("qa_cols"))
