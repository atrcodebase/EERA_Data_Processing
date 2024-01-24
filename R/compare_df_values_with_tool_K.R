source("R/functions/check_sm_so_questions_value.R")

to_be_excluded_questions = c("Province_filter", "Surveyor_Name", "Site_Visit_ID", "Sample_Type", "Data_Entry_Clerk_Name")


wrong_choices_result <- rbind(
  # Tool 0
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool0$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool3_Grades_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool3_Grades_Repeat"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool3_Class_Attendance, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool3_Class_Attendance"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool3_T3_N_Classes_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool3_T3_N_Classes_Repeat"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool3_Headcount, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool3_Headcount"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool1_Timetable_Year, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool1_Timetable_Year"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool1_Timetable1_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool1_Timetable1_Repeat"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool1_Timetable2_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool1_Timetable2_Repeat"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool1_Timetable3_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool1_Timetable3_Repeat"),
    
    check_so_sm_questions(
      df = select(clean_data.tool0$Tool1_Timetable4_Repeat, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool0$survey,
      kobotool.choices = kobo_tool.tool0$choices) |> 
      mutate(Tab_Name = "Tool1_Timetable4_Repeat")
  ) |> 
    mutate(tool = "Tool Data Entry", Sample_Type = ""),
  
  # Tool 1
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool1$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Support_Respondents, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Support_Respondents"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$School_Operationality, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "School_Operationality"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Shifts_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Shifts_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Headmasters, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Headmasters"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Weekly_Class_Schedule, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Weekly_Class_Schedule"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Subjects_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Subjects_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Education_Quality, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Education_Quality"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
    
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool2$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Support_Respondents, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Support_Respondents"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Attendance_Sheet_Photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Attendance_Sheet_Photos"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Public_Stationary_Kit_Group, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Public_Stationary_Kit_Group"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Teachers_Pack_Group, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Teachers_Pack_Group"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Students_Pack_Group, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Students_Pack_Group"),
    
    check_so_sm_questions(
      df = select(clean_data.tool2$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool2$survey,
      kobotool.choices = kobo_tool.tool2$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool3$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "data"), 
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Support_Respondents, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Support_Respondents"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Enrollement_Attendance_Summary, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Enrollement_Attendance_Summary"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Grade_Details, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Grade_Details"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Todays_Attendance_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Todays_Attendance_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$LastWeek_Attendance_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "LastWeek_Attendance_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Student_Headcount, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Student_Headcount"),
    
    check_so_sm_questions(
      df = select(clean_data.tool3$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool3$survey,
      kobotool.choices = kobo_tool.tool3$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool4$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool4$survey,
      kobotool.choices = kobo_tool.tool4$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool4$Additional_Subjects, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool4$survey,
      kobotool.choices = kobo_tool.tool4$choices) |> 
      mutate(Tab_Name = "Additional_Subjects"),
    
    check_so_sm_questions(
      df = select(clean_data.tool4$Subjects_taught_by_this_teacher, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool4$survey,
      kobotool.choices = kobo_tool.tool4$choices) |> 
      mutate(Tab_Name = "Subjects_taught_by_this_teacher"),
    
    check_so_sm_questions(
      df = select(clean_data.tool4$Subjects_Not_Being_Taught, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool4$survey,
      kobotool.choices = kobo_tool.tool4$choices) |> 
      mutate(Tab_Name = "Subjects_Not_Being_Taught"),
    
    check_so_sm_questions(
      df = select(clean_data.tool4$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool4$survey,
      kobotool.choices = kobo_tool.tool4$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool5$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool5$survey,
      kobotool.choices = kobo_tool.tool5$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool5$Under_Construction_Toilets, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool5$survey,
      kobotool.choices = kobo_tool.tool5$choices) |> 
      mutate(Tab_Name = "Under_Construction_Toilets"),
    
    check_so_sm_questions(
      df = select(clean_data.tool5$Useable_Toilets, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool5$survey,
      kobotool.choices = kobo_tool.tool5$choices) |> 
      mutate(Tab_Name = "Useable_Toilets"),
    
    check_so_sm_questions(
      df = select(clean_data.tool5$Non_Useable_Toilets, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool5$survey,
      kobotool.choices = kobo_tool.tool5$choices) |> 
      mutate(Tab_Name = "Non_Useable_Toilets"),
    
    check_so_sm_questions(
      df = select(clean_data.tool5$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool5$survey,
      kobotool.choices = kobo_tool.tool5$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
    
  ) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool6$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool6$survey,
      kobotool.choices = kobo_tool.tool6$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool6$Subjects_Added, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool6$survey,
      kobotool.choices = kobo_tool.tool6$choices) |> 
      mutate(Tab_Name = "Subjects_Added"),
    
    check_so_sm_questions(
      df = select(clean_data.tool6$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool6$survey,
      kobotool.choices = kobo_tool.tool6$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 6 - Parent", Sample_Type = "Public School"),
  
  # Tool 7
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool7$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool7$Subjects_Added, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "Subjects_Added"),
    
    check_so_sm_questions(
      df = select(clean_data.tool7$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 7 - Shura", Sample_Type = "Public School")
  
)

names(wrong_choices_result)[names(wrong_choices_result) == "invalid_opts"] = "old_value"


# removing extra elements from the environment
rm(list = c("check_so_sm_questions"))
