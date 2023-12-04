# importing the apply correction log module
source("R/functions/apply_log_function.R")
source("R/functions/custom_functions.R")

get_col_names <- function(df_list) {
  if (is.data.frame(df_list)) {
    unique(names(df_list))
  } else {
    sapply(df_list, names) |>
      unlist() |>
      unique()
  }
}


get_keys <- function(df_list) {
  if (is.data.frame(df_list)) {
    unique(df_list$KEY)
  } else {
    sapply(df_list, function(x) x$KEY) |>
      unlist() |>
      unique()
  }
}

check_logs_for_df <- function(cleaning_log, df, tool_name, deleted_keys) {
  question_names <- get_col_names(df)
  keys <- get_keys(df)
  cleaning_log <- cleaning_log |>
    mutate(
      issue = case_when(
        tool == tool_name & !question %in% question_names ~ "Wrong question name, please provide the correct question name.",
        tool != tool_name & KEY %in% keys ~ glue::glue("Wrong tool name, the record doesn't belongs to {tool} tool"),
        tool == tool_name & question %in% question_names & !KEY %in% keys ~ "Wrong KEY, please review and provide the correct KEY.",
        tool == tool_name & substr(KEY, 1, 41) %in% deleted_keys ~ "KEY belongs to a rejected interview, please remove it from the cleaning logs sheet",
        TRUE ~ issue
      )
    )
  return(cleaning_log)
}

# form names
# form_names <- c()
form_names_ps <- unique(correction_log_ps$tool) |> na.omit()
form_names_cbe <- unique(correction_log_cbe$tool) |> na.omit()

# Reviewing the correction log ------------------------------------------------- Public School
# Identify correction log's issue
correction_log_issues_ps <- correction_log_ps |>
  # Remove the filter for the last runs
  filter(!is.na(KEY) & !is.na(question)) |>
  mutate(
    issue = case_when(
      # general checks
      is.na(KEY) | KEY == "" ~ "KEY can't be null, please provide the correct KEY.",
      is.na(question) | question == "" ~ "Question name can't be null, please provide the correct question name.",
      is.na(tool) | tool == "" ~ "Tool name can't be null, please provide the correct tool name.",
      is.na(Tab_Name) | Tab_Name == "" ~ "Tab/Sheet name can't be null, please provide the correct Tab name.",
      !tool %in% form_names_ps ~ "Wrong tool name, please provide the correct tool name.",
      tool == "Tool 1 - Headmaster" & !Tab_Name %in% names(raw_data.tool1) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 2 - Light" & !Tab_Name %in% names(raw_data.tool2) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 3 - Headcount" & !Tab_Name %in% names(raw_data.tool3) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 4 - Teacher" & !Tab_Name %in% names(raw_data.tool4) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 5 - WASH" & !Tab_Name %in% names(raw_data.tool5) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 6 - Parent" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 7 - Shura" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY, question), fromLast = T) | duplicated(paste0(KEY, question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    new_value = str_squish(new_value)
  ) |> 
  select(KEY, question, old_value, new_value, issue, tool, Tab_Name)

correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool1, tool_name = "Tool 1 - Headmaster", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool2, tool_name = "Tool 2 - Light", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool3, tool_name = "Tool 3 - Headcount", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool4, tool_name = "Tool 4 - Teacher", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool5, tool_name = "Tool 5 - WASH", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent", deleted_keys = deleted_keys_ps)
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura", deleted_keys = deleted_keys_ps)

## Correction Log ready to apply
correction_log_ready_ps <- correction_log_issues_ps |>
  filter(is.na(issue))


## Correction Log issues
correction_log_issues_ps <- correction_log_issues_ps |>
  filter(!is.na(issue)) |>
  arrange(KEY, question)

# Reviewing the correction log ------------------------------------------------- CBE
# Identify correction log's issue
correction_log_issues_cbe <- correction_log_cbe |>
  # Remove the filter for the last runs
  filter(!is.na(KEY) & !is.na(question)) |>
  mutate(
    issue = case_when(
      # general checks
      is.na(KEY) | KEY == "" ~ "KEY can't be null, please provide the correct KEY.",
      is.na(question) | question == "" ~ "Question name can't be null, please provide the correct question name.",
      is.na(tool) | tool == "" ~ "Tool name can't be null, please provide the correct tool name.",
      is.na(Tab_Name) | Tab_Name == "" ~ "Tab/Sheet name can't be null, please provide the correct Tab name.",
      !tool %in% form_names_cbe ~ "Wrong tool name, please provide the correct tool name.",
      tool == "Tool 6 - Parent" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 7 - Shura" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 8 - Class" & !Tab_Name %in% names(raw_data.tool8) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 9 - IP" & !Tab_Name %in% names(raw_data.tool9) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY, question), fromLast = T) | duplicated(paste0(KEY, question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    new_value = str_squish(new_value)
  ) |> 
  select(KEY, question, old_value, new_value, issue, tool, Tab_Name)


correction_log_issues_cbe <- correction_log_issues_cbe |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent", deleted_keys = deleted_keys_cbe)
correction_log_issues_cbe <- correction_log_issues_cbe |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura", deleted_keys = deleted_keys_cbe)
correction_log_issues_cbe <- correction_log_issues_cbe |> check_logs_for_df(df = raw_data.tool8, tool_name = "Tool 8 - Class", deleted_keys = deleted_keys_cbe)
correction_log_issues_cbe <- correction_log_issues_cbe |> check_logs_for_df(df = raw_data.tool9, tool_name = "Tool 9 - IP", deleted_keys = deleted_keys_cbe)

## Correction Log ready to apply
correction_log_ready_cbe <- correction_log_issues_cbe |>
  filter(is.na(issue))


## Correction Log issues
correction_log_issues_cbe <- correction_log_issues_cbe |>
  filter(!is.na(issue)) |>
  arrange(KEY, question)


# Clone Sheets for log apply verification -------------------------------------
clean_data.tool1 <- raw_data.tool1
clean_data.tool2 <- raw_data.tool2
clean_data.tool3 <- raw_data.tool3
clean_data.tool4 <- raw_data.tool4
clean_data.tool5 <- raw_data.tool5
clean_data.tool6 <- raw_data.tool6
clean_data.tool7 <- raw_data.tool7
clean_data.tool8 <- raw_data.tool8
clean_data.tool9 <- raw_data.tool9

# Apply logs -------------------------------------------------------------------
# Tool 1
tool_name <- "Tool 1 - Headmaster"
if (any(correction_log_ready_ps$tool == tool_name)) {
  # data = raw_data.tool1$data

  clean_data.tool1$data <- raw_data.tool1$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents")) > 0){
    clean_data.tool1$Support_Respondents <- raw_data.tool1$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  }
  clean_data.tool1$School_Operationality <- raw_data.tool1$School_Operationality |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality_Other_...")) > 0){
    clean_data.tool1$School_Operationality_Other_... <- raw_data.tool1$School_Operationality_Other_... |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality_Other_..."))
  }
  clean_data.tool1$Shifts_Detail <- raw_data.tool1$Shifts_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Shifts_Detail"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Other_Shifts_Detail")) > 0){
    clean_data.tool1$Other_Shifts_Detail <- raw_data.tool1$Other_Shifts_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Other_Shifts_Detail")) # error
  }
  clean_data.tool1$Headmasters <- raw_data.tool1$Headmasters |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Headmasters"))
  clean_data.tool1$Curriculum_Changes <- raw_data.tool1$Curriculum_Changes |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Curriculum_Changes"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Class_Schedule")) > 0){
    clean_data.tool1$Weekly_Class_Schedule <- raw_data.tool1$Weekly_Class_Schedule |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Class_Schedule")) # error
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Grades_Curriculum")) > 0){
    clean_data.tool1$Grades_Curriculum <- raw_data.tool1$Grades_Curriculum |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Grades_Curriculum")) # error
  }
  clean_data.tool1$Subjects_Detail <- raw_data.tool1$Subjects_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Detail"))
  clean_data.tool1$Education_Quality <- raw_data.tool1$Education_Quality |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Education_Quality"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool1$Relevant_photos <- raw_data.tool1$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) # error
  }
}

# Tool 2
tool_name <- "Tool 2 - Light"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool2$data <- raw_data.tool2$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  clean_data.tool2$Support_Respondents <- raw_data.tool2$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  clean_data.tool2$Attendance_Sheet_Photos <- raw_data.tool2$Attendance_Sheet_Photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Attendance_Sheet_Photos"))
  clean_data.tool2$Public_Stationary_Kit_Group <- raw_data.tool2$Public_Stationary_Kit_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Public_Stationary_Kit_Group"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Teachers_Pack_Group"))>0){
    clean_data.tool2$Teachers_Pack_Group <- raw_data.tool2$Teachers_Pack_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Teachers_Pack_Group"))
  }
  clean_data.tool2$Students_Pack_Group <- raw_data.tool2$Students_Pack_Group |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Students_Pack_Group"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool2$Relevant_photos <- raw_data.tool2$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 3
tool_name <- "Tool 3 - Headcount"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool3$data <- raw_data.tool3$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  clean_data.tool3$Support_Respondents <- raw_data.tool3$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Enrollement_Attendance_Summary")) > 0){
    clean_data.tool3$Enrollement_Attendance_Summary <- raw_data.tool3$Enrollement_Attendance_Summary |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Enrollement_Attendance_Summary"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Grade_Details")) > 0){
    clean_data.tool3$Grade_Details <- raw_data.tool3$Grade_Details |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Grade_Details"))
  }
  clean_data.tool3$Todays_Attendance_Detail <- raw_data.tool3$Todays_Attendance_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Todays_Attendance_Detail"))
  clean_data.tool3$LastWeek_Attendance_Detail <- raw_data.tool3$LastWeek_Attendance_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "LastWeek_Attendance_Detail"))
  clean_data.tool3$Student_Headcount <- raw_data.tool3$Student_Headcount |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Student_Headcount"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool3$Relevant_photos <- raw_data.tool3$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 4
tool_name <- "Tool 4 - Teacher"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool4$data <- raw_data.tool4$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Additional_Subjects")) > 0){
    clean_data.tool4$Additional_Subjects <- raw_data.tool4$Additional_Subjects |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Additional_Subjects"))
  }
  clean_data.tool4$Subjects_taught_by_this_teacher <- raw_data.tool4$Subjects_taught_by_this_teacher |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_taught_by_this_teacher"))
  clean_data.tool4$Subjects_Not_Being_Taught <- raw_data.tool4$Subjects_Not_Being_Taught |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Not_Being_Taught"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool4$Relevant_photos <- raw_data.tool4$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 5
tool_name <- "Tool 5 - WASH"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool5$data <- raw_data.tool5$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Under_Construction_Toilets")) > 0){
    clean_data.tool5$Under_Construction_Toilets <- raw_data.tool5$Under_Construction_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Under_Construction_Toilets"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Useable_Toilets")) > 0){
    clean_data.tool5$Useable_Toilets <- raw_data.tool5$Useable_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Useable_Toilets"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Non_Useable_Toilets")) > 0){
    clean_data.tool5$Non_Useable_Toilets <- raw_data.tool5$Non_Useable_Toilets |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Non_Useable_Toilets"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0) {
    clean_data.tool5$Relevant_photos <- raw_data.tool5$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 6
tool_name <- "Tool 6 - Parent"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool6$data <- raw_data.tool6$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added")) > 0){
    clean_data.tool6$Subjects_Added <- raw_data.tool6$Subjects_Added |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool6$Relevant_photos <- raw_data.tool6$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

if (any(correction_log_ready_cbe$tool == tool_name)) {
  clean_data.tool6$data <- raw_data.tool6$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added")) > 0){
    clean_data.tool6$Subjects_Added <- raw_data.tool6$Subjects_Added |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool6$Relevant_photos <- raw_data.tool6$Relevant_photos |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}



# Tool 7
tool_name <- "Tool 7 - Shura"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool7$data <- raw_data.tool7$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "C6_list_members"))>0){
    clean_data.tool7$C6_list_members <- raw_data.tool7$C6_list_members |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "C6_list_members"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))>0){
    clean_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))>0){
    clean_data.tool7$Relevant_photos <- raw_data.tool7$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

if (any(correction_log_ready_cbe$tool == tool_name)) {
  clean_data.tool7$data <- raw_data.tool7$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  clean_data.tool7$C6_list_members <- raw_data.tool7$C6_list_members |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "C6_list_members"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))>0){
    clean_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))>0){
    clean_data.tool7$Relevant_photos <- raw_data.tool7$Relevant_photos |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 8
tool_name <- "Tool 8 - Class"
if (any(correction_log_ready_cbe$tool == tool_name)) {
  # data = raw_data.tool8$Section_2_2_3_Attendance_Rec...
  clean_data.tool8$data <- raw_data.tool8$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Classes"))> 0){
    clean_data.tool8$Classes <- raw_data.tool8$Classes |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Classes"))
  }
  clean_data.tool8$Adults_At_The_CBE <- raw_data.tool8$Adults_At_The_CBE |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Adults_At_The_CBE"))
  clean_data.tool8$Section_2_2_3_Attendance_Rec... <- raw_data.tool8$Section_2_2_3_Attendance_Rec... |> mutate(E20 = as.character(E20)) |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Section_2_2_3_Attendance_Rec..."))
  clean_data.tool8$Section_2_2_4_Headcount <- raw_data.tool8$Section_2_2_4_Headcount |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Section_2_2_4_Headcount"))
  clean_data.tool8$Students_Enrolment_Book <- raw_data.tool8$Students_Enrolment_Book |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Students_Enrolment_Book"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Section_2_4_Student_Ages"))>0){
    clean_data.tool8$Section_2_4_Student_Ages <- raw_data.tool8$Section_2_4_Student_Ages |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Section_2_4_Student_Ages"))
  }
  clean_data.tool8$Classroom_Materials <- raw_data.tool8$Classroom_Materials |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Classroom_Materials"))
  clean_data.tool8$Teacher_Kit <- raw_data.tool8$Teacher_Kit |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Teacher_Kit"))
  clean_data.tool8$Student_Kit <- raw_data.tool8$Student_Kit |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Student_Kit"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "V_list_of_all_members"))>0){
    clean_data.tool8$V_list_of_all_members <- raw_data.tool8$V_list_of_all_members |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "V_list_of_all_members"))
  }
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))>0){
    clean_data.tool8$Subjects_Added <- raw_data.tool8$Subjects_Added |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos")) > 0){
    clean_data.tool8$Relevant_photos <- raw_data.tool8$Relevant_photos |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Tool 9
tool_name <- "Tool 9 - IP"
if (any(correction_log_ready_cbe$tool == tool_name)) {
  clean_data.tool9$data <- raw_data.tool9$data |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))>0){
    clean_data.tool9$Relevant_photos <- raw_data.tool9$Relevant_photos |> apply_log(log = correction_log_ready_cbe |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}


# Correction Log apply check --------------------------------------------------
message("Verifying Correction log, please wait!")

correction_log_discrep <- rbind(
  # Tool 1
  compare_dt(clean_data.tool1$data, raw_data.tool1$data) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "data"),

  compare_dt(clean_data.tool1$Support_Respondents, raw_data.tool1$Support_Respondents) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Support_Respondents"),

  compare_dt(clean_data.tool1$School_Operationality, raw_data.tool1$School_Operationality) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "School_Operationality"),

  compare_dt(clean_data.tool1$School_Operationality_Other_..., raw_data.tool1$School_Operationality_Other_...) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "School_Operationality_Other_..."),

  compare_dt(clean_data.tool1$Shifts_Detail, raw_data.tool1$Shifts_Detail) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Shifts_Detail"),

  compare_dt(clean_data.tool1$Other_Shifts_Detail, raw_data.tool1$Other_Shifts_Detail) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Other_Shifts_Detail"),

  compare_dt(clean_data.tool1$Headmasters, raw_data.tool1$Headmasters) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Headmasters"),

  compare_dt(clean_data.tool1$Curriculum_Changes, raw_data.tool1$Curriculum_Changes) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Curriculum_Changes"),

  compare_dt(clean_data.tool1$Weekly_Class_Schedule, raw_data.tool1$Weekly_Class_Schedule) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Weekly_Class_Schedule"),

  compare_dt(clean_data.tool1$Grades_Curriculum, raw_data.tool1$Grades_Curriculum) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Grades_Curriculum"),

  compare_dt(clean_data.tool1$Subjects_Detail, raw_data.tool1$Subjects_Detail) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Subjects_Detail"),

  compare_dt(clean_data.tool1$Education_Quality, raw_data.tool1$Education_Quality) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Education_Quality"),

  compare_dt(clean_data.tool1$Relevant_photos, raw_data.tool1$Relevant_photos) |>
    mutate(tool = "Tool 1 - Headmaster", `Sheet Name` = "Relevant_photos"),


  # Tool 2
  compare_dt(clean_data.tool2$data, raw_data.tool2$data) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "data"),

  compare_dt(clean_data.tool2$Support_Respondents, raw_data.tool2$Support_Respondents) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Support_Respondents"),

  compare_dt(clean_data.tool2$Attendance_Sheet_Photos, raw_data.tool2$Attendance_Sheet_Photos) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Attendance_Sheet_Photos"),

  compare_dt(clean_data.tool2$Public_Stationary_Kit_Group, raw_data.tool2$Public_Stationary_Kit_Group) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Public_Stationary_Kit_Group"),

  compare_dt(clean_data.tool2$Teachers_Pack_Group, raw_data.tool2$Teachers_Pack_Group) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Teachers_Pack_Group"),

  compare_dt(clean_data.tool2$Students_Pack_Group, raw_data.tool2$Students_Pack_Group) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Students_Pack_Group"),

  compare_dt(clean_data.tool2$Relevant_photos, raw_data.tool2$Relevant_photos) |>
    mutate(tool = "Tool 2 - Light", `Sheet Name` = "Relevant_photos"),


  # Tool 3
  compare_dt(clean_data.tool3$data, raw_data.tool3$data) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "data"),

  compare_dt(clean_data.tool3$Support_Respondents, raw_data.tool3$Support_Respondents) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Support_Respondents"),

  compare_dt(clean_data.tool3$Enrollement_Attendance_Summary, raw_data.tool3$Enrollement_Attendance_Summary) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Enrollement_Attendance_Summary"),

  compare_dt(clean_data.tool3$Grade_Details, raw_data.tool3$Grade_Details) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Grade_Details"),

  compare_dt(clean_data.tool3$Todays_Attendance_Detail, raw_data.tool3$Todays_Attendance_Detail) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Todays_Attendance_Detail"),

  compare_dt(clean_data.tool3$LastWeek_Attendance_Detail, raw_data.tool3$LastWeek_Attendance_Detail) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "LastWeek_Attendance_Detail"),

  compare_dt(clean_data.tool3$Student_Headcount, raw_data.tool3$Student_Headcount) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Student_Headcount"),

  compare_dt(clean_data.tool3$Relevant_photos, raw_data.tool3$Relevant_photos) |>
    mutate(tool = "Tool 3 - Headcount", `Sheet Name` = "Relevant_photos"),


  # Tool 4
  compare_dt(clean_data.tool4$data, raw_data.tool4$data) |>
    mutate(tool = "Tool 4 - Teacher", `Sheet Name` = "data"),

  compare_dt(clean_data.tool4$Additional_Subjects, raw_data.tool4$Additional_Subjects) |>
    mutate(tool = "Tool 4 - Teacher", `Sheet Name` = "Additional_Subjects"),

  compare_dt(clean_data.tool4$Subjects_taught_by_this_teacher, raw_data.tool4$Subjects_taught_by_this_teacher) |>
    mutate(tool = "Tool 4 - Teacher", `Sheet Name` = "Subjects_taught_by_this_teacher"),

  compare_dt(clean_data.tool4$Subjects_Not_Being_Taught, raw_data.tool4$Subjects_Not_Being_Taught) |>
    mutate(tool = "Tool 4 - Teacher", `Sheet Name` = "Subjects_Not_Being_Taught"),

  compare_dt(clean_data.tool4$Relevant_photos, raw_data.tool4$Relevant_photos) |>
    mutate(tool = "Tool 4 - Teacher", `Sheet Name` = "Relevant_photos"),

  # Tool 5
  compare_dt(clean_data.tool5$data, raw_data.tool5$data) |>
    mutate(tool = "Tool 5 - WASH", `Sheet Name` = "data"),

  compare_dt(clean_data.tool5$Under_Construction_Toilets, raw_data.tool5$Under_Construction_Toilets) |>
    mutate(tool = "Tool 5 - WASH", `Sheet Name` = "Under_Construction_Toilets"),

  compare_dt(clean_data.tool5$Useable_Toilets, raw_data.tool5$Useable_Toilets) |>
    mutate(tool = "Tool 5 - WASH", `Sheet Name` = "Useable_Toilets"),

  compare_dt(clean_data.tool5$Non_Useable_Toilets, raw_data.tool5$Non_Useable_Toilets) |>
    mutate(tool = "Tool 5 - WASH", `Sheet Name` = "Non_Useable_Toilets"),

  compare_dt(clean_data.tool5$Relevant_photos, raw_data.tool5$Relevant_photos) |>
    mutate(tool = "Tool 5 - WASH", `Sheet Name` = "Relevant_photos"),

  # Tool 6
  compare_dt(clean_data.tool6$data, raw_data.tool6$data) |>
    mutate(tool = "Tool 6 - Parent", `Sheet Name` = "data"),

  compare_dt(clean_data.tool6$Subjects_Added, raw_data.tool6$Subjects_Added) |>
    mutate(tool = "Tool 6 - Parent", `Sheet Name` = "Subjects_Added"),

  compare_dt(clean_data.tool6$Relevant_photos, raw_data.tool6$Relevant_photos) |>
    mutate(tool = "Tool 6 - Parent", `Sheet Name` = "Relevant_photos"),

  # Tool 7
  compare_dt(clean_data.tool7$data, raw_data.tool7$data) |>
    mutate(tool = "Tool 7 - Shura", `Sheet Name` = "data"),

  compare_dt(clean_data.tool7$C6_list_members, raw_data.tool7$C6_list_members) |>
    mutate(tool = "Tool 7 - Shura", `Sheet Name` = "C6_list_members"),

  compare_dt(clean_data.tool7$Subjects_Added, raw_data.tool7$Subjects_Added) |>
    mutate(tool = "Tool 7 - Shura", `Sheet Name` = "Subjects_Added"),

  compare_dt(clean_data.tool7$Relevant_photos, raw_data.tool7$Relevant_photos) |>
    mutate(tool = "Tool 7 - Shura", `Sheet Name` = "Relevant_photos"),

  # Tool 8
  compare_dt(clean_data.tool8$data, raw_data.tool8$data) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "data"),

  compare_dt(clean_data.tool8$Classes, raw_data.tool8$Classes) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Classes"),

  compare_dt(clean_data.tool8$Adults_At_The_CBE, raw_data.tool8$Adults_At_The_CBE) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Adults_At_The_CBE"),

  compare_dt(clean_data.tool8$Section_2_2_3_Attendance_Rec..., raw_data.tool8$Section_2_2_3_Attendance_Rec...) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Section_2_2_3_Attendance_Rec..."),

  compare_dt(clean_data.tool8$Section_2_2_4_Headcount, raw_data.tool8$Section_2_2_4_Headcount) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Section_2_2_4_Headcount"),

  compare_dt(clean_data.tool8$Students_Enrolment_Book, raw_data.tool8$Students_Enrolment_Book) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Students_Enrolment_Book"),

  compare_dt(clean_data.tool8$Section_2_4_Student_Ages, raw_data.tool8$Section_2_4_Student_Ages) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Section_2_4_Student_Ages"),

  compare_dt(clean_data.tool8$Classroom_Materials, raw_data.tool8$Classroom_Materials) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Classroom_Materials"),

  compare_dt(clean_data.tool8$Teacher_Kit, raw_data.tool8$Teacher_Kit) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Teacher_Kit"),

  compare_dt(clean_data.tool8$Student_Kit, raw_data.tool8$Student_Kit) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Student_Kit"),

  compare_dt(clean_data.tool8$V_list_of_all_members, raw_data.tool8$V_list_of_all_members) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "V_list_of_all_members"),

  compare_dt(clean_data.tool8$Subjects_Added, raw_data.tool8$Subjects_Added) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Subjects_Added"),

  compare_dt(clean_data.tool8$Relevant_photos, raw_data.tool8$Relevant_photos) |>
    mutate(tool = "Tool 8 - Class", `Sheet Name` = "Relevant_photos"),
  
  # Tool 9
  compare_dt(clean_data.tool9$data, raw_data.tool9$data) |>
    mutate(tool = "Tool 9 - IP", `Sheet Name` = "data"),

  compare_dt(clean_data.tool9$Relevant_photos, raw_data.tool9$Relevant_photos) |>
    mutate(tool = "Tool 9 - IP", `Sheet Name` = "Relevant_photos")
) %>% 
  rename(
    Tab_Name = "Sheet Name"
  )

required_cols <- c("KEY", "question", "old_value", "new_value", "tool", "Tab_Name")


correction_log_discrep <- rbind( ## DOUBLE CHECK HERE
  correction_log_issues_ps |>
    select(all_of(required_cols), "issue"),
  
  correction_log_issues_cbe |>
    select(all_of(required_cols), "issue"),

  correction_log_discrep |>
    select(all_of(required_cols)) |>
    anti_join(bind_rows(correction_log_ready_ps, correction_log_ready_cbe) |> 
                mutate(
                  new_value = case_when(
                    new_value == "NULL" | is.null(new_value) ~ NA_character_,
                    TRUE ~ new_value
                  )
                ), by = c("KEY", "question", "new_value", "Tab_Name")) |>
    mutate(issue = "The changes is not logged in correction log sheet.")
  ,
  bind_rows(correction_log_ready_ps, correction_log_ready_cbe) |>
    mutate(
      new_value = case_when(
        new_value == "NULL" | is.null(new_value) ~ NA_character_,
        TRUE ~ new_value
      )
    ) |>
    select(any_of(required_cols)) |>
    anti_join(correction_log_discrep, by = c("KEY", "question", "new_value", "Tab_Name")) |>
    mutate(issue = "The log is not applied in the dataset.")
)



# Removing extra objects -------------------------------------------------------
rm(list = c("correction_log_issues_ps", "correction_log_issues_cbe",
            "correction_log_ready_ps", "correction_log_ready_cbe", 
            "tool_name", "form_names_ps", "form_names_cbe", "check_logs_for_df",  "get_keys", 
            "get_col_names", "compare_dt", "apply_log"))
