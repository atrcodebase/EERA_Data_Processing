### attach value labels
source("R/functions/labeler_function.R")

# Cloning df
clean_data.tool0_ulabeled <- clean_data.tool0
clean_data.tool1_ulabeled <- clean_data.tool1
clean_data.tool2_ulabeled <- clean_data.tool2
clean_data.tool3_ulabeled <- clean_data.tool3
clean_data.tool4_ulabeled <- clean_data.tool4
clean_data.tool5_ulabeled <- clean_data.tool5
clean_data.tool6_ulabeled <- clean_data.tool6
clean_data.tool7_ulabeled <- clean_data.tool7

# Tool 0 ------------------------------------------------------------------
for(sheet in names(clean_data.tool0)){
  # Label
  clean_data.tool0[[sheet]] <- labeler(
    data = clean_data.tool0[[sheet]], 
    tool.survey = kobo_tool.tool0$survey,
    tool.choices = kobo_tool.tool0$choices,
    survey_label = "label",
    choice_lable = "label")
}

# Tool 1 ------------------------------------------------------------------
clean_data.tool1$data <- labeler(
  data = clean_data.tool1$data, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Support_Respondents <- labeler(
  data = clean_data.tool1$Support_Respondents, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$School_Operationality <- labeler(
  data = clean_data.tool1$School_Operationality, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Shifts_Detail <- labeler(
  data = clean_data.tool1$Shifts_Detail, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Headmasters <- labeler(
  data = clean_data.tool1$Headmasters, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Weekly_Class_Schedule <- labeler(
  data = clean_data.tool1$Weekly_Class_Schedule, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Subjects_Detail <- labeler(
  data = clean_data.tool1$Subjects_Detail, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Education_Quality <- labeler(
  data = clean_data.tool1$Education_Quality, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool1$Relevant_photos <- labeler(
  data = clean_data.tool1$Relevant_photos, 
  tool.survey = kobo_tool.tool1$survey,
  tool.choices = kobo_tool.tool1$choices,
  survey_label = "label",
  choice_lable = "label")


# Tool 2 ------------------------------------------------------------------
clean_data.tool2$data <- labeler(
  data = clean_data.tool2$data, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Support_Respondents <- labeler(
  data = clean_data.tool2$Support_Respondents, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Attendance_Sheet_Photos <- labeler(
  data = clean_data.tool2$Attendance_Sheet_Photos, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Public_Stationary_Kit_Group <- labeler(
  data = clean_data.tool2$Public_Stationary_Kit_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Teachers_Pack_Group <- labeler(
  data = clean_data.tool2$Teachers_Pack_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Students_Pack_Group <- labeler(
  data = clean_data.tool2$Students_Pack_Group, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool2$Relevant_photos <- labeler(
  data = clean_data.tool2$Relevant_photos, 
  tool.survey = kobo_tool.tool2$survey,
  tool.choices = kobo_tool.tool2$choices,
  survey_label = "label",
  choice_lable = "label")

# Tool 3 ------------------------------------------------------------------
clean_data.tool3$data <- labeler(
  data = clean_data.tool3$data, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Support_Respondents <- labeler(
  data = clean_data.tool3$Support_Respondents, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Enrollement_Attendance_Summary <- labeler(
  data = clean_data.tool3$Enrollement_Attendance_Summary, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Grade_Details <- labeler(
  data = clean_data.tool3$Grade_Details, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Todays_Attendance_Detail <- labeler(
  data = clean_data.tool3$Todays_Attendance_Detail, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$LastWeek_Attendance_Detail <- labeler(
  data = clean_data.tool3$LastWeek_Attendance_Detail, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Student_Headcount <- labeler(
  data = clean_data.tool3$Student_Headcount, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool3$Relevant_photos <- labeler(
  data = clean_data.tool3$Relevant_photos, 
  tool.survey = kobo_tool.tool3$survey,
  tool.choices = kobo_tool.tool3$choices,
  survey_label = "label",
  choice_lable = "label")


# Tool 4 ------------------------------------------------------------------
clean_data.tool4$data <- labeler(
  data = clean_data.tool4$data, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool4$Additional_Subjects <- labeler(
  data = clean_data.tool4$Additional_Subjects, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool4$Subjects_taught_by_this_teacher <- labeler(
  data = clean_data.tool4$Subjects_taught_by_this_teacher, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool4$Subjects_Not_Being_Taught <- labeler(
  data = clean_data.tool4$Subjects_Not_Being_Taught, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool4$Relevant_photos <- labeler(
  data = clean_data.tool4$Relevant_photos, 
  tool.survey = kobo_tool.tool4$survey,
  tool.choices = kobo_tool.tool4$choices,
  survey_label = "label",
  choice_lable = "label")

# Tool 5 ------------------------------------------------------------------
clean_data.tool5$data <- labeler(
  data = clean_data.tool5$data, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool5$Under_Construction_Toilets <- labeler(
  data = clean_data.tool5$Under_Construction_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool5$Useable_Toilets <- labeler(
  data = clean_data.tool5$Useable_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool5$Non_Useable_Toilets <- labeler(
  data = clean_data.tool5$Non_Useable_Toilets, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool5$Relevant_photos <- labeler(
  data = clean_data.tool5$Relevant_photos, 
  tool.survey = kobo_tool.tool5$survey,
  tool.choices = kobo_tool.tool5$choices,
  survey_label = "label",
  choice_lable = "label")

# Tool 6 ------------------------------------------------------------------
clean_data.tool6$data <- labeler(
  data = clean_data.tool6$data, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool6$Subjects_Added <- labeler(
  data = clean_data.tool6$Subjects_Added, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool6$Relevant_photos <- labeler(
  data = clean_data.tool6$Relevant_photos, 
  tool.survey = kobo_tool.tool6$survey,
  tool.choices = kobo_tool.tool6$choices,
  survey_label = "label",
  choice_lable = "label")

# Tool 7 ------------------------------------------------------------------
clean_data.tool7$data <- labeler(
  data = clean_data.tool7$data, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool7$Subjects_Added <- labeler(
  data = clean_data.tool7$Subjects_Added, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices,
  survey_label = "label",
  choice_lable = "label")

clean_data.tool7$Relevant_photos <- labeler(
  data = clean_data.tool7$Relevant_photos, 
  tool.survey = kobo_tool.tool7$survey,
  tool.choices = kobo_tool.tool7$choices,
  survey_label = "label",
  choice_lable = "label")

# remove extra objects from environment  
rm("labeler")
