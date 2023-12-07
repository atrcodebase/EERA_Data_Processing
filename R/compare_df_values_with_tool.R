source("R/functions/check_sm_so_questions_value.R")

to_be_excluded_questions = c("Province_filter", "Surveyor_Name", "Site_Visit_ID", "Sample_Type")


wrong_choices_result <- rbind(
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
      df = select(clean_data.tool1$School_Operationality_Other_..., !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "School_Operationality_Other_..."),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Shifts_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Shifts_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Other_Shifts_Detail, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Other_Shifts_Detail"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Headmasters, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Headmasters"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Curriculum_Changes, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Curriculum_Changes"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Weekly_Class_Schedule, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Weekly_Class_Schedule"),
    
    check_so_sm_questions(
      df = select(clean_data.tool1$Grades_Curriculum, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool1$survey,
      kobotool.choices = kobo_tool.tool1$choices) |> 
      mutate(Tab_Name = "Grades_Curriculum"),
    
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
      mutate(Tab_Name = "data") |>
      left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
    
    check_so_sm_questions(
      df = select(clean_data.tool6$Subjects_Added, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool6$survey,
      kobotool.choices = kobo_tool.tool6$choices) |> 
      mutate(Tab_Name = "Subjects_Added") |>
      left_join(clean_data.tool6$Subjects_Added |> select(KEY, Sample_Type) , by = c("uuid" = "KEY")),
    
    check_so_sm_questions(
      df = select(clean_data.tool6$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool6$survey,
      kobotool.choices = kobo_tool.tool6$choices) |> 
      mutate(Tab_Name = "Relevant_photos") |>
      left_join(clean_data.tool6$Relevant_photos |> select(KEY, Sample_Type) , by = c("uuid" = "KEY"))
  ) |> 
    mutate(tool = "Tool 6 - Parent"),
  
  # Tool 7
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool7$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "data") |>
      left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
    
    # check_so_sm_questions(
    #   df = select(clean_data.tool7$C6_list_members, !any_of(to_be_excluded_questions)),
    #   kobotool.survey = kobo_tool.tool7$survey,
    #   kobotool.choices = kobo_tool.tool7$choices) |> 
    #   mutate(Tab_Name = "C6_list_members") |>
    #   left_join(clean_data.tool6$C6_list_members |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
    
    check_so_sm_questions(
      df = select(clean_data.tool7$Subjects_Added, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "Subjects_Added") |>
      left_join(clean_data.tool6$Subjects_Added |> select(KEY, Sample_Type), by = c("uuid" = "KEY")),
    
    check_so_sm_questions(
      df = select(clean_data.tool7$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool7$survey,
      kobotool.choices = kobo_tool.tool7$choices) |> 
      mutate(Tab_Name = "Relevant_photos") |>
      left_join(clean_data.tool6$Relevant_photos |> select(KEY, Sample_Type), by = c("uuid" = "KEY"))
  ) |> 
    mutate(tool = "Tool 7 - Shura"),
  
  # Tool 8
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool8$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Classes, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Classes"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Adults_At_The_CBE, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Adults_At_The_CBE"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Section_2_2_3_Attendance_Rec..., !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Section_2_2_3_Attendance_Rec..."),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Section_2_2_4_Headcount, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Section_2_2_4_Headcount"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Students_Enrolment_Book, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Students_Enrolment_Book"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Section_2_4_Student_Ages, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Section_2_4_Student_Ages"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Classroom_Materials, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Classroom_Materials"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Teacher_Kit, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Teacher_Kit"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Student_Kit, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Student_Kit"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$V_list_of_all_members, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "V_list_of_all_members"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Subjects_Added, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Subjects_Added"),
    
    check_so_sm_questions(
      df = select(clean_data.tool8$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool8$survey,
      kobotool.choices = kobo_tool.tool8$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
  ) |> 
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  
  # Tool 9
  rbind(
    check_so_sm_questions(
      df = select(clean_data.tool9$data, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool9$survey,
      kobotool.choices = kobo_tool.tool9$choices) |> 
      mutate(Tab_Name = "data"),
    
    check_so_sm_questions(
      df = select(clean_data.tool9$Relevant_photos, !any_of(to_be_excluded_questions)),
      kobotool.survey = kobo_tool.tool9$survey,
      kobotool.choices = kobo_tool.tool9$choices) |> 
      mutate(Tab_Name = "Relevant_photos")
    
  ) |> 
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE")
)

names(wrong_choices_result)[names(wrong_choices_result) == "invalid_opts"] = "old_value"


# removing extra elements from the environment
rm(list = c("check_so_sm_questions"))
