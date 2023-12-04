### attach value labels
source("R/functions/labeler_function.R")


# Tool 1 ------------------------------------------------------------------
clean_data.tool1$data <- labeler(
  data = clean_data.tool1$data, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Support_Respondents <- labeler(
  data = clean_data.tool1$Support_Respondents, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$School_Operationality <- labeler(
  data = clean_data.tool1$School_Operationality, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$School_Operationality_Other_... <- labeler(
  data = clean_data.tool1$School_Operationality_Other_..., 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Shifts_Detail <- labeler(
  data = clean_data.tool1$Shifts_Detail, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Other_Shifts_Detail <- labeler(
  data = clean_data.tool1$Other_Shifts_Detail, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Headmasters <- labeler(
  data = clean_data.tool1$Headmasters, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Curriculum_Changes <- labeler(
  data = clean_data.tool1$Curriculum_Changes, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Weekly_Class_Schedule <- labeler(
  data = clean_data.tool1$Weekly_Class_Schedule, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Grades_Curriculum <- labeler(
  data = clean_data.tool1$Grades_Curriculum, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Subjects_Detail <- labeler(
  data = clean_data.tool1$Subjects_Detail, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Education_Quality <- labeler(
  data = clean_data.tool1$Education_Quality, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)

clean_data.tool1$Relevant_photos <- labeler(
  data = clean_data.tool1$Relevant_photos, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices)


# Tool 2 ------------------------------------------------------------------
clean_data.tool2$data <- labeler(
  data = clean_data.tool2$data, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Support_Respondents <- labeler(
  data = clean_data.tool2$Support_Respondents, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Attendance_Sheet_Photos <- labeler(
  data = clean_data.tool2$Attendance_Sheet_Photos, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Public_Stationary_Kit_Group <- labeler(
  data = clean_data.tool2$Public_Stationary_Kit_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Teachers_Pack_Group <- labeler(
  data = clean_data.tool2$Teachers_Pack_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Students_Pack_Group <- labeler(
  data = clean_data.tool2$Students_Pack_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

clean_data.tool2$Relevant_photos <- labeler(
  data = clean_data.tool2$Relevant_photos, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices)

# Tool 3 ------------------------------------------------------------------
clean_data.tool3$data <- labeler(
  data = clean_data.tool3$data, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Support_Respondents <- labeler(
  data = clean_data.tool3$Support_Respondents, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Enrollement_Attendance_Summary <- labeler(
  data = clean_data.tool3$Enrollement_Attendance_Summary, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Grade_Details <- labeler(
  data = clean_data.tool3$Grade_Details, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Todays_Attendance_Detail <- labeler(
  data = clean_data.tool3$Todays_Attendance_Detail, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$LastWeek_Attendance_Detail <- labeler(
  data = clean_data.tool3$LastWeek_Attendance_Detail, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Student_Headcount <- labeler(
  data = clean_data.tool3$Student_Headcount, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)

clean_data.tool3$Relevant_photos <- labeler(
  data = clean_data.tool3$Relevant_photos, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices)


# Tool 4 ------------------------------------------------------------------
clean_data.tool4$data <- labeler(
  data = clean_data.tool4$data, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices)

clean_data.tool4$Additional_Subjects <- labeler(
  data = clean_data.tool4$Additional_Subjects, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices)

clean_data.tool4$Subjects_taught_by_this_teacher <- labeler(
  data = clean_data.tool4$Subjects_taught_by_this_teacher, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices)

clean_data.tool4$Subjects_Not_Being_Taught <- labeler(
  data = clean_data.tool4$Subjects_Not_Being_Taught, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices)

clean_data.tool4$Relevant_photos <- labeler(
  data = clean_data.tool4$Relevant_photos, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices)

# Tool 5 ------------------------------------------------------------------
clean_data.tool5$data <- labeler(
  data = clean_data.tool5$data, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices)

clean_data.tool5$Under_Construction_Toilets <- labeler(
  data = clean_data.tool5$Under_Construction_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices)

clean_data.tool5$Useable_Toilets <- labeler(
  data = clean_data.tool5$Useable_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices)

clean_data.tool5$Non_Useable_Toilets <- labeler(
  data = clean_data.tool5$Non_Useable_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices)

clean_data.tool5$Relevant_photos <- labeler(
  data = clean_data.tool5$Relevant_photos, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices)

# Tool 6 ------------------------------------------------------------------
clean_data.tool6$data <- labeler(
  data = clean_data.tool6$data, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices)

clean_data.tool6$Subjects_Added <- labeler(
  data = clean_data.tool6$Subjects_Added, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices)

clean_data.tool6$Relevant_photos <- labeler(
  data = clean_data.tool6$Relevant_photos, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices)

# Tool 7 ------------------------------------------------------------------
clean_data.tool7$data <- labeler(
  data = clean_data.tool7$data, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices)

clean_data.tool7$C6_list_members <- labeler(
  data = clean_data.tool7$C6_list_members, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices)

clean_data.tool7$Subjects_Added <- labeler(
  data = clean_data.tool7$Subjects_Added, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices)

clean_data.tool7$Relevant_photos <- labeler(
  data = clean_data.tool7$Relevant_photos, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices)

# Tool 8 ------------------------------------------------------------------
clean_data.tool8$data <- labeler(
  data = clean_data.tool8$data, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Classes <- labeler(
  data = clean_data.tool8$Classes, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Adults_At_The_CBE <- labeler(
  data = clean_data.tool8$Adults_At_The_CBE, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Section_2_2_3_Attendance_Rec... <- labeler(
  data = clean_data.tool8$Section_2_2_3_Attendance_Rec..., 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Section_2_2_4_Headcount <- labeler(
  data = clean_data.tool8$Section_2_2_4_Headcount, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Students_Enrolment_Book <- labeler(
  data = clean_data.tool8$Students_Enrolment_Book, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Section_2_4_Student_Ages <- labeler(
  data = clean_data.tool8$Section_2_4_Student_Ages, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Classroom_Materials <- labeler(
  data = clean_data.tool8$Classroom_Materials, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Teacher_Kit <- labeler(
  data = clean_data.tool8$Teacher_Kit, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Student_Kit <- labeler(
  data = clean_data.tool8$Student_Kit, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$V_list_of_all_members <- labeler(
  data = clean_data.tool8$V_list_of_all_members, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Subjects_Added <- labeler(
  data = clean_data.tool8$Subjects_Added, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

clean_data.tool8$Relevant_photos <- labeler(
  data = clean_data.tool8$Relevant_photos, 
  tool.survey = kobo_tool.tool8$survey,
  tool.choices = kobo_tool.tool8$choices)

# Tool 9 ------------------------------------------------------------------
clean_data.tool9$data <- labeler(
  data = clean_data.tool9$data, 
  tool.survey = kobo_tool.tool9$survey,
  tool.choices = kobo_tool.tool9$choices)

clean_data.tool9$Relevant_photos <- labeler(
  data = clean_data.tool9$Relevant_photos, 
  tool.survey = kobo_tool.tool9$survey,
  tool.choices = kobo_tool.tool9$choices)

# remove extra objects from environment  
rm("labeler")
