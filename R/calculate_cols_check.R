Coalesce = function(var) ifelse(is.na(var), 0, var)

# create the necessary columns --------------------------------------------
# Tool 1

clean_data.tool1$data <- clean_data.tool1$data |> 
  mutate(
    School_indx.re_calc = case_when(
      School_Type_SV == "Primary (1-6); Secondary (7-9); Higher Secondary (10-12)" ~ "1 2 3 4 5 6 7 8 9 10 11 12",
      School_Type_SV == "Primary (1-6); Secondary (7-9)" ~ "1 2 3 4 5 6 7 8 9",
      School_Type_SV == "Primary (1-6); Higher Secondary (10-12)" ~ "1 2 3 4 5 6 10 11 12",
      School_Type_SV == "Secondary (7-9); Higher Secondary (10-12)" ~ "7 8 9 10 11 12",
      School_Type_SV == "Primary (1-6)" ~ "1 2 3 4 5 6",
      School_Type_SV == "Secondary (7-9)" ~ "7 8 9",
      School_Type_SV == "Higher Secondary (10-12)" ~ "10 11 12",
      TRUE ~ NA_character_
    ),
    School_rep.re_calc = ifelse(!is.na(School_indx.re_calc),as.integer(str_count(School_indx.re_calc," ")+1),School_rep)
  )

clean_data.tool1$Curriculum_Changes <- clean_data.tool1$Curriculum_Changes |>
  left_join(
    clean_data.tool1$Weekly_Class_Schedule |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Weekly_Class_Schedule_Photo.re_calc = n()
      ), by = "KEY")

# Tool 2 
clean_data.tool2$data <- clean_data.tool2$data |>
  left_join(
    clean_data.tool2$Attendance_Sheet_Photos |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Attendance_Sheet_Photos.re_calc = n()
      )
    , by = "KEY")

# Tool 3
clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Support_Respondents |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Support_Respondents.re_calc = n()
      )
  , by = "KEY") 

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Enrollement_Attendance_Summary |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Enrollement_Attendance_Summary.re_calc = n()
      )
  , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Grade_Details |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Grade_Details.re_calc = n()
      )
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$Todays_Attendance_Detail |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Todays_Attendance_Detail.re_calc = n()
      )
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  left_join(
    clean_data.tool3$LastWeek_Attendance_Detail |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_LastWeek_Attendance_Detail.re_calc = n()
      )
    , by = "KEY")

clean_data.tool3$data <- clean_data.tool3$data |>
  mutate(
    N_Classes_Grade.re_calc = case_when(
      C9 > 3 ~ 3,
      TRUE ~ C9
    )
  )

# Tool 5
clean_data.tool5$data <- clean_data.tool5$data |> 
  left_join(
    clean_data.tool5$Useable_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Useable_Toilet_Photo.re_calc = n()
      )
    , by = "KEY") |>
  left_join( 
    clean_data.tool5$Non_Useable_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Non_Useable_Toilet_Photo.re_calc = n()
      )
    , by = "KEY") |>
  left_join(
    clean_data.tool5$Under_Construction_Toilets |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Under_Construction_Toilet_Photo.re_calc = n()
      )
    , by = "KEY")

# Tool 8
clean_data.tool8$data <- clean_data.tool8$data |>
  mutate(
    Total_Teachers_Present.re_calc = Coalesce(E7) + Coalesce(E8),
    Total_Teachers_Absent.re_calc = Coalesce(E12) + Coalesce(E13)
  )

clean_data.tool8$Section_2_2_4_Headcount <- clean_data.tool8$Section_2_2_4_Headcount |>
  mutate(
    Headcount_Total_Students.re_calc = Coalesce(Headcount_Male_Students) + Coalesce(Headcount_Female_Students)
  )

clean_data.tool8$data <- clean_data.tool8$data |>
  left_join(
    clean_data.tool8$Students_Enrolment_Book |>
      group_by(KEY = PARENT_KEY) |>
      summarise(
        Count_Students_Enrolment_Book_Photo.re_calc = n()
      )
    , by = "KEY")

# compare the calculated values before and after logs replaced ----------------
calculate_issues <- rbind(
  # Tool 1
  clean_data.tool1$data |> 
    filter(School_indx != School_indx.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="school_indx",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_indx,
           new_value = School_indx.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$data |> 
    filter(School_rep != School_rep.re_calc) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="School_rep",
      tool = "Tool 1 - data",
      sheet = "data"
    ) |> 
    select(any_of(meta_cols), question, old_value = School_rep,
           new_value = School_rep.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool1$Curriculum_Changes |> 
    filter(Count_Weekly_Class_Schedule_Photo.re_calc != Count_Weekly_Class_Schedule_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Weekly_Class_Schedule_Photo",
      tool = "Tool 1 - Headmaster",
      sheet = "Curriculum_Changes"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Weekly_Class_Schedule_Photo,
           new_value = Count_Weekly_Class_Schedule_Photo.re_calc, issue, tool, sheet, KEY),
  
  # Tool 2
  clean_data.tool2$data |> 
    filter(Count_Attendance_Sheet_Photos.re_calc != Count_Attendance_Sheet_Photos) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Attendance_Sheet_Photos",
      tool = "Tool 2 - Light",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Attendance_Sheet_Photos,
           new_value = Count_Attendance_Sheet_Photos.re_calc, issue, tool, sheet, KEY),
  
  # Tool 3
  clean_data.tool3$data |> 
    filter(Count_Support_Respondents.re_calc != Count_Support_Respondents) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Support_Respondents",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Support_Respondents,
           new_value = Count_Support_Respondents.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Enrollement_Attendance_Summary.re_calc != Count_Enrollement_Attendance_Summary) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Enrollement_Attendance_Summary",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Enrollement_Attendance_Summary,
           new_value = Count_Enrollement_Attendance_Summary.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Grade_Details.re_calc != Count_Grade_Details) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Grade_Details",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Grade_Details,
           new_value = Count_Grade_Details.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(N_Classes_Grade.re_calc != N_Classes_Grade) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="N_Classes_Grade",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = N_Classes_Grade,
           new_value = N_Classes_Grade.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_Todays_Attendance_Detail.re_calc != Count_Todays_Attendance_Detail) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Todays_Attendance_Detail",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Todays_Attendance_Detail,
           new_value = Count_Todays_Attendance_Detail.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool3$data |> 
    filter(Count_LastWeek_Attendance_Detail.re_calc != Count_LastWeek_Attendance_Detail) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_LastWeek_Attendance_Detail",
      tool = "Tool 3 - Headcount",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_LastWeek_Attendance_Detail,
           new_value = Count_LastWeek_Attendance_Detail.re_calc, issue, tool, sheet, KEY),
  
  # Tool 5
  clean_data.tool5$data |> 
    filter(Count_Under_Construction_Toilet_Photo.re_calc != Count_Under_Construction_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Under_Construction_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Under_Construction_Toilet_Photo,
           new_value = Count_Under_Construction_Toilet_Photo.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool5$data |> 
    filter(Count_Useable_Toilet_Photo.re_calc != Count_Useable_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Useable_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Useable_Toilet_Photo,
           new_value = Count_Useable_Toilet_Photo.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool5$data |> 
    filter(Count_Non_Useable_Toilet_Photo.re_calc != Count_Non_Useable_Toilet_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Non_Useable_Toilet_Photo",
      tool = "Tool 5 - WASH",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Non_Useable_Toilet_Photo,
           new_value = Count_Non_Useable_Toilet_Photo.re_calc, issue, tool, sheet, KEY),
  
  # Tool 8
  
  clean_data.tool8$data |> 
    filter(Total_Teachers_Present.re_calc != Total_Teachers_Present) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Total_Teachers_Present",
      tool = "Tool 8 - Class",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Total_Teachers_Present,
           new_value = Total_Teachers_Present.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$data |> 
    filter(Total_Teachers_Absent.re_calc != Total_Teachers_Absent) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Total_Teachers_Absent",
      tool = "Tool 8 - Class",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Total_Teachers_Absent,
           new_value = Total_Teachers_Absent.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$data |> 
    filter(Count_Students_Enrolment_Book_Photo.re_calc != Count_Students_Enrolment_Book_Photo) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Count_Students_Enrolment_Book_Photo",
      tool = "Tool 8 - Class",
      sheet = "data"
    ) |> 
    select(all_of(meta_cols), question, old_value = Count_Students_Enrolment_Book_Photo,
           new_value = Count_Students_Enrolment_Book_Photo.re_calc, issue, tool, sheet, KEY),
  
  clean_data.tool8$Section_2_2_4_Headcount |> 
    filter(Headcount_Total_Students.re_calc != Headcount_Total_Students) |> 
    mutate(
      issue = "The changes in the dataset has affected this value, it should be recalculated.",
      question ="Headcount_Total_Students",
      tool = "Tool 8 - Class",
      sheet = "Section_2_2_4_Headcount"
    ) |> 
    select(all_of(meta_cols), question, old_value = Headcount_Total_Students,
           new_value = Headcount_Total_Students.re_calc, issue, tool, sheet, KEY)
  
)


# remove extra indicators that were created in above -------------------------------
clean_data.tool1$data <- clean_data.tool1$data |> select(-ends_with(".re_calc"))
clean_data.tool2$data <- clean_data.tool2$data |> select(-ends_with(".re_calc"))
clean_data.tool3$data <- clean_data.tool3$data |> select(-ends_with(".re_calc"))
clean_data.tool5$data <- clean_data.tool5$data |> select(-ends_with(".re_calc"))
clean_data.tool8$data <- clean_data.tool8$data |> select(-ends_with(".re_calc"))
