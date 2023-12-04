# to compare the counts between supposed counts (based on main sheet) and rows in child sheet
compare_row_counts <- function(supposed_count_df, child_df, child_sheet_name = "") {
  return(
    rbind(
      supposed_count_df |> 
        left_join(
          child_df |> 
            group_by(KEY = PARENT_KEY) |>
            summarise(current_row_count = n()),
          by = "KEY"
        ) |> 
        mutate(
          current_row_count = if_else(is.na(current_row_count), 0, current_row_count),
          issue = case_when(
            supposed_row_count > current_row_count ~ paste0("There is ", supposed_row_count - current_row_count, " missing row for the logged KEY in '", child_sheet_name, "' sheet"),
            supposed_row_count < current_row_count ~ paste0("There is ", current_row_count - supposed_row_count, " extra row for the logged KEY in '", child_sheet_name, "' sheet"),
            TRUE ~ "okay"
          ),
          sheet_name = child_sheet_name
        ) |>
        filter(issue != "okay") |>
        select(PARENT_KEY = KEY, issue, supposed_row_count, current_row_count, sheet_name), 
      
      child_df |> 
        group_by(KEY = PARENT_KEY) |>
        summarise(current_row_count = n()) |> 
        left_join(
          supposed_count_df,
          by = "KEY"
        ) |> 
        mutate(
          supposed_row_count = if_else(is.na(supposed_row_count), 0, supposed_row_count),
          issue = case_when(
            supposed_row_count > current_row_count ~ paste0("There is ", supposed_row_count - current_row_count, " missing row for the logged KEY in '", child_sheet_name, "' sheet"),
            supposed_row_count < current_row_count ~ paste0("There is ", current_row_count - supposed_row_count, " extra row for the logged KEY in '", child_sheet_name, "' sheet"),
            TRUE ~ "okay"
          ),
          sheet_name = child_sheet_name
        ) |>
        filter(issue != "okay") |>
        select(PARENT_KEY = KEY, issue, supposed_row_count, current_row_count, sheet_name)
    ) |> distinct(PARENT_KEY, issue, sheet_name, .keep_all = T)
  )
}

# to count select multiple's selected choices
count_sm_selected_choices <- function(df, question) {
    sm.binaries <- names(df)[grepl(paste0("^", question, "_\\d"), names(df), ignore.case = T)]
    data.frame(
      supposed_row_count = apply(df[sm.binaries], 1, sum, na.rm = T),
      KEY = df$KEY
    )
}

repeat_sheet_issues <- rbind(
  # Tool 1
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Support_Respondents_count, KEY),
      child_df = clean_data.tool1$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Support_Respondents_count"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = School_Operationality_count, KEY),
      child_df = clean_data.tool1$School_Operationality,
      child_sheet_name = "School_Operationality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_Operationality_count"),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = School_Operationality_Other_Grades_count, KEY),
      child_df = clean_data.tool1$School_Operationality_Other_...,
      child_sheet_name = "School_Operationality_Other_..."
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "School_Operationality_Other_Grades_count"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Shifts_Detail_count, KEY),
      child_df = clean_data.tool1$Shifts_Detail,
      child_sheet_name = "Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Shifts_Detail_count"),
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Other_Shifts_Detail_count, KEY),
      child_df = clean_data.tool1$Other_Shifts_Detail,
      child_sheet_name = "Other_Shifts_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Other_Shifts_Detail_count"),
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Headmasters_count, KEY),
      child_df = clean_data.tool1$Headmasters,
      child_sheet_name = "Headmasters"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Headmasters_count"),
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Curriculum_Changes_count, KEY),
      child_df = clean_data.tool1$Curriculum_Changes,
      child_sheet_name = "Curriculum_Changes"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Curriculum_Changes_count"),
    # 8 - According to the tool the repeat sheet does not have a counter
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool1$Curriculum_Changes, supposed_row_count = F1, KEY),
    #   child_df = clean_data.tool1$Weekly_Class_Schedule,
    #   child_sheet_name = "Weekly_Class_Schedule"
    # ) |> mutate(Row_count_from_tab = "Curriculum_Changes", Row_count_column_name = "F1"),
    # 9
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$Curriculum_Changes, supposed_row_count = Grades_Curriculum_count, KEY),
      child_df = clean_data.tool1$Grades_Curriculum,
      child_sheet_name = "Grades_Curriculum"
    ) |> mutate(Row_count_from_tab = "Curriculum_Changes", Row_count_column_name = "Grades_Curriculum_count"),
    # 10
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Subjects_Detail_count, KEY),
      child_df = clean_data.tool1$Subjects_Detail,
      child_sheet_name = "Subjects_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_Detail_count"),
    # 11
    compare_row_counts(
      supposed_count_df = select(clean_data.tool1$data, supposed_row_count = Education_Quality_count, KEY),
      child_df = clean_data.tool1$Education_Quality,
      child_sheet_name = "Education_Quality"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Education_Quality_count")
    # ,
    # # 12
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool1$data, supposed_row_count = School_Operationality_count, KEY),
    #   child_df = clean_data.tool1$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # )
  ) |> 
    mutate(tool = "Tool 1 - Headmaster"),
  
  # Tool 2
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = Support_Respondents_count, KEY),
      child_df = clean_data.tool2$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Support_Respondents_count"),
    # 2 - The repeat does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool2$data, supposed_row_count = Support_Respondents_count, KEY),
    #   child_df = clean_data.tool2$Attendance_Sheet_Photos,
    #   child_sheet_name = "Attendance_Sheet_Photos"
    # ),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = Public_Stationary_Kit_Group_count, KEY),
      child_df = clean_data.tool2$Public_Stationary_Kit_Group,
      child_sheet_name = "Public_Stationary_Kit_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Public_Stationary_Kit_Group_count"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = Teachers_Pack_Group_count, KEY),
      child_df = clean_data.tool2$Teachers_Pack_Group,
      child_sheet_name = "Teachers_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Teachers_Pack_Group_count"),
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool2$data, supposed_row_count = Students_Pack_Group_count, KEY),
      child_df = clean_data.tool2$Students_Pack_Group,
      child_sheet_name = "Students_Pack_Group"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Students_Pack_Group_count")
    # 6 - Does not have repeat counter
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool2$data, supposed_row_count = SET-OF-Relevant_photos, KEY),
    #   child_df = clean_data.tool2$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # ) 
  ) |> 
    mutate(tool = "Tool 2 - Light"),
  
  # Tool 3
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = Support_Respondents_count, KEY),
      child_df = clean_data.tool3$Support_Respondents,
      child_sheet_name = "Support_Respondents"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Support_Respondents_count"),
    # 2 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool3$data, supposed_row_count = , KEY),
    #   child_df = clean_data.tool3$Enrollement_Attendance_Summary,
    #   child_sheet_name = "Enrollement_Attendance_Summary"
    # ),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = Grade_Details_count, KEY),
      child_df = clean_data.tool3$Grade_Details,
      child_sheet_name = "Grade_Details"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Grade_Details_count"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = Todays_Attendance_Detail_count, KEY),
      child_df = clean_data.tool3$Todays_Attendance_Detail,
      child_sheet_name = "Todays_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Todays_Attendance_Detail_count"),
    # 5
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = LastWeek_Attendance_Detail_count, KEY),
      child_df = clean_data.tool3$LastWeek_Attendance_Detail,
      child_sheet_name = "LastWeek_Attendance_Detail"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "LastWeek_Attendance_Detail_count"),
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool3$data, supposed_row_count = Student_Headcount_count, KEY),
      child_df = clean_data.tool3$Student_Headcount,
      child_sheet_name = "Student_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Student_Headcount_count")
 
  # 7 - Does not have repeat count in the tool
  # compare_row_counts(
  #   supposed_count_df = select(clean_data.tool3$data, supposed_row_count = , KEY),
  #   child_df = clean_data.tool3$Relevant_photos,
  #   child_sheet_name = "Relevant_photos"
  # )
  ) |> 
    mutate(tool = "Tool 3 - Headcount"),
  
  # Tool 4
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data, KEY, supposed_row_count = Additional_Subjects_count),
      child_df = clean_data.tool4$Additional_Subjects,
      child_sheet_name = "Additional_Subjects"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Additional_Subjects_count"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data, KEY, supposed_row_count = Subjects_taught_by_this_teacher_count),
      child_df = clean_data.tool4$Subjects_taught_by_this_teacher,
      child_sheet_name = "Subjects_taught_by_this_teacher"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_taught_by_this_teacher_count"),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool4$data, KEY, supposed_row_count = Subjects_Not_Being_Taught_count),
      child_df = clean_data.tool4$Subjects_Not_Being_Taught,
      child_sheet_name = "Subjects_Not_Being_Taught"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_Not_Being_Taught_count")
    # 4 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool4$data, KEY, supposed_row_count = ),
    #   child_df = clean_data.tool4$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # ) 
  ) |> 
    mutate(tool = "Tool 4 - Teacher"),
  
  # Tool 5
  # 1 - Does not have repeat count in the tool
  # compare_row_counts(
  #   supposed_count_df = select(clean_data.tool5$data, supposed_row_count = , KEY),
  #   child_df = clean_data.tool5$Under_Construction_Toilets,
  #   child_sheet_name = "Under_Construction_Toilets"
  # ), 
  # 2 - Does not have repeat count in the tool
  # compare_row_counts(
  #   supposed_count_df = select(clean_data.tool5$data, supposed_row_count = , KEY),
  #   child_df = clean_data.tool5$Useable_Toilets,
  #   child_sheet_name = "Useable_Toilets"
  # ), 
  # 3 - Does not have repeat count in the tool
  # compare_row_counts(
  #   supposed_count_df = select(clean_data.tool5$data, supposed_row_count = , KEY),
  #   child_df = clean_data.tool5$Non_Useable_Toilets,
  #   child_sheet_name = "Non_Useable_Toilets"
  # ),
  # 4 - Does not have repeat count in the tool
  # compare_row_counts(
  #   supposed_count_df = select(clean_data.tool5$data, supposed_row_count = , KEY),
  #   child_df = clean_data.tool5$Relevant_photos,
  #   child_sheet_name = "Relevant_photos"
  # )
  # |> 
  #   mutate(tool = "Tool 5 - WASH")
  
  # Tool 6
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool6$data, KEY, supposed_row_count = Subjects_Added_count),
      child_df = clean_data.tool6$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_Added_count")
    # 2 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool6$data, KEY, supposed_row_count = ),
    #   child_df = clean_data.tool6$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # ) 
  ) |> 
    mutate(tool = "Tool 6 - Parent"),
  
  # Tool 7
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = C6_list_members_count),
      child_df = clean_data.tool7$C6_list_members,
      child_sheet_name = "C6_list_members"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "C6_list_members_count"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = Subjects_Added_count),
      child_df = clean_data.tool7$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_Added_count")
    # 3 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool7$data, KEY, supposed_row_count = ),
    #   child_df = clean_data.tool7$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # ) 
  ) |> 
    mutate(tool = "Tool 7 - Shura"),
  
  # Tool 8
  rbind(
    # 1
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Classes_count),
      child_df = clean_data.tool8$Classes,
      child_sheet_name = "Classes"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Classes_count"),
    # 2
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Adults_At_The_CBE_count),
      child_df = clean_data.tool8$Adults_At_The_CBE,
      child_sheet_name = "Adults_At_The_CBE"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Adults_At_The_CBE_count"),
    # 3
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Section_2_2_3_Attendance_Record_Check_CBS_count),
      child_df = clean_data.tool8$Section_2_2_3_Attendance_Rec...,
      child_sheet_name = "Section_2_2_3_Attendance_Rec..."
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Section_2_2_3_Attendance_Record_Check_CBS_count"),
    # 4
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Section_2_2_4_Headcount_count),
      child_df = clean_data.tool8$Section_2_2_4_Headcount,
      child_sheet_name = "Section_2_2_4_Headcount"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Section_2_2_4_Headcount_count"),
    # 5 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = ),
    #   child_df = clean_data.tool8$Students_Enrolment_Book,
    #   child_sheet_name = "Students_Enrolment_Book"
    # ),
    # 6
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Section_2_4_Student_Ages_count),
      child_df = clean_data.tool8$Section_2_4_Student_Ages,
      child_sheet_name = "Section_2_4_Student_Ages"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Section_2_4_Student_Ages_count"),
    # 7
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Classroom_Materials_count),
      child_df = clean_data.tool8$Classroom_Materials,
      child_sheet_name = "Classroom_Materials"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Classroom_Materials_count"),
    # 8
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Teacher_Kit_count),
      child_df = clean_data.tool8$Teacher_Kit,
      child_sheet_name = "Teacher_Kit"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Teacher_Kit_count"),
    # 9
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Student_Kit_count),
      child_df = clean_data.tool8$Student_Kit,
      child_sheet_name = "Student_Kit"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Student_Kit_count"),
    # 10
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = V_list_of_all_members_count),
      child_df = clean_data.tool8$V_list_of_all_members,
      child_sheet_name = "V_list_of_all_members"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "V_list_of_all_members_count"),
    # 11
    compare_row_counts(
      supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = Subjects_Added_count),
      child_df = clean_data.tool8$Subjects_Added,
      child_sheet_name = "Subjects_Added"
    ) |> mutate(Row_count_from_tab = "data", Row_count_column_name = "Subjects_Added_count")
    
    # 12 - Does not have repeat count in the tool
    # compare_row_counts(
    #   supposed_count_df = select(clean_data.tool8$data, KEY, supposed_row_count = ),
    #   child_df = clean_data.tool8$Relevant_photos,
    #   child_sheet_name = "Relevant_photos"
    # ) 
  ) |>
    mutate(tool = "Tool 8 - Class")

   
    
  
  # Tool 9
)


# Remove Unnecessary Objects from Environment --------------------------------------------------------------
rm(list = c("count_sm_selected_choices", "compare_row_counts"))
