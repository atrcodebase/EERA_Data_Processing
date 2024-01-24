# importing the apply correction log module
source("R/functions/apply_log_function.R")
source("R/functions/custom_functions.R")
sm_variables <- read_excel("input/select_multiple_questions_K.xlsx") %>% pull(name)
options(scipen = 999)

check_logs_for_df <- function(cleaning_log, df, tool_name) {
  # Log issues in all the sheets
  sheet = "data"
  for(sheet in names(df)){
    question_names <- names(df[[sheet]]) # All Columns
    keys <- df[[sheet]][["KEY"]] # Keys
    
    # Flag if question or key is not in dataset
    tool_sheet_indexes <- (cleaning_log$tool %in% tool_name & cleaning_log$Tab_Name %in% sheet) # Logs for the current tool and sheet
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$question %notin% question_names] <- "Question can't be found in the given sheet"
    cleaning_log$issue[tool_sheet_indexes & cleaning_log$KEY %notin% keys] <- "KEY can't be found in the given sheet"
  }
  return(cleaning_log)
}


form_names_ps <- unique(correction_log_ps$tool) |> na.omit()

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
      !tool %in% form_names_ps ~ "Wrong tool name, please provide the correct tool name.", # Not necessary
      tool == "Tool 1 - Headmaster" & !Tab_Name %in% names(raw_data.tool1) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 2 - Light" & !Tab_Name %in% names(raw_data.tool2) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 3 - Headcount" & !Tab_Name %in% names(raw_data.tool3) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 4 - Teacher" & !Tab_Name %in% names(raw_data.tool4) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 5 - WASH" & !Tab_Name %in% names(raw_data.tool5) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 6 - Parent" & !Tab_Name %in% names(raw_data.tool6) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Tool 7 - Shura" & !Tab_Name %in% names(raw_data.tool7) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      tool == "Data_entry" & !Tab_Name %in% names(raw_data.tool0) ~ "Wrong Tab/Sheet name, please provide the correct Tab name",
      duplicated(paste0(KEY, question), fromLast = T) | duplicated(paste0(KEY, question), fromLast = F) ~ "Duplicate log records, please solve the duplication.",
      TRUE ~ NA_character_
    ),
    new_value = case_when(
      question %in% sm_variables ~ str_replace_all(new_value, "-|,|  | - ", " ") %>% str_squish(), # Unify the separator in SM questions
      TRUE ~ str_squish(new_value)
    ),
    Sample_Type = "Public School"
  ) |> 
  select(KEY, question, old_value, new_value, issue, tool, Tab_Name, Sample_Type)

# Log incorrect sheet name and UUIDs
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool0, tool_name = "Data_entry")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool1, tool_name = "Tool 1 - Headmaster")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool2, tool_name = "Tool 2 - Light")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool3, tool_name = "Tool 3 - Headcount")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool4, tool_name = "Tool 4 - Teacher")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool5, tool_name = "Tool 5 - WASH")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool6, tool_name = "Tool 6 - Parent")
correction_log_issues_ps <- correction_log_issues_ps |> check_logs_for_df(df = raw_data.tool7, tool_name = "Tool 7 - Shura")

## Correction Log ready to apply
correction_log_ready_ps <- correction_log_issues_ps |>
  filter(is.na(issue))

## Correction Log issues
correction_log_issues_ps <- correction_log_issues_ps |>
  filter(!is.na(issue)) |>
  arrange(KEY, question)

# Clone Sheets for log apply verification -------------------------------------
clean_data.tool0 <- raw_data.tool0
clean_data.tool1 <- raw_data.tool1
clean_data.tool2 <- raw_data.tool2
clean_data.tool3 <- raw_data.tool3
clean_data.tool4 <- raw_data.tool4
clean_data.tool5 <- raw_data.tool5
clean_data.tool6 <- raw_data.tool6
clean_data.tool7 <- raw_data.tool7

# Apply logs -------------------------------------------------------------------
# Tool 0
for(sheet in names(clean_data.tool0)){
  # Apply Log
  clean_data.tool0[[sheet]] <- apply_log(data=clean_data.tool0[[sheet]], log = filter(correction_log_ready_ps, tool == "Data_entry" & Tab_Name == sheet))
}

# Tool 1
tool_name <- "Tool 1 - Headmaster"
if (any(correction_log_ready_ps$tool == tool_name)) {
  # data = raw_data.tool1$data
  
  clean_data.tool1$data <- raw_data.tool1$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents")) > 0){
    clean_data.tool1$Support_Respondents <- raw_data.tool1$Support_Respondents |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Support_Respondents"))
  }
  clean_data.tool1$School_Operationality <- raw_data.tool1$School_Operationality |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "School_Operationality"))

  clean_data.tool1$Shifts_Detail <- raw_data.tool1$Shifts_Detail |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Shifts_Detail"))

  clean_data.tool1$Headmasters <- raw_data.tool1$Headmasters |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Headmasters"))

  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Class_Schedule")) > 0){
    clean_data.tool1$Weekly_Class_Schedule <- raw_data.tool1$Weekly_Class_Schedule |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Weekly_Class_Schedule")) # error
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

# Tool 7
tool_name <- "Tool 7 - Shura"
if (any(correction_log_ready_ps$tool == tool_name)) {
  clean_data.tool7$data <- raw_data.tool7$data |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "data"))

  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))>0){
    clean_data.tool7$Subjects_Added <- raw_data.tool7$Subjects_Added |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Subjects_Added"))
  }
  if(nrow(correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))>0){
    clean_data.tool7$Relevant_photos <- raw_data.tool7$Relevant_photos |> apply_log(log = correction_log_ready_ps |> filter(tool == tool_name & Tab_Name == "Relevant_photos"))
  }
}

# Correction Log apply check --------------------------------------------------
message("Verifying Correction log, please wait!")

correction_log_discrep <- rbind(
  # Tool 1
  compare_dt(clean_data.tool1$data, raw_data.tool1$data) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "data"),
  
  compare_dt(clean_data.tool1$Support_Respondents, raw_data.tool1$Support_Respondents) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Support_Respondents"),
  
  compare_dt(clean_data.tool1$School_Operationality, raw_data.tool1$School_Operationality) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "School_Operationality"),
  
  compare_dt(clean_data.tool1$Shifts_Detail, raw_data.tool1$Shifts_Detail) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Shifts_Detail"),
  
  compare_dt(clean_data.tool1$Headmasters, raw_data.tool1$Headmasters) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Headmasters"),
  
  compare_dt(clean_data.tool1$Weekly_Class_Schedule, raw_data.tool1$Weekly_Class_Schedule) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Weekly_Class_Schedule"),
  
  compare_dt(clean_data.tool1$Subjects_Detail, raw_data.tool1$Subjects_Detail) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Subjects_Detail"),
  
  compare_dt(clean_data.tool1$Education_Quality, raw_data.tool1$Education_Quality) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Education_Quality"),
  
  compare_dt(clean_data.tool1$Relevant_photos, raw_data.tool1$Relevant_photos) |>
    mutate(tool = "Tool 1 - Headmaster", Tab_Name = "Relevant_photos"),
  
  
  # Tool 2
  compare_dt(clean_data.tool2$data, raw_data.tool2$data) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "data"),
  
  compare_dt(clean_data.tool2$Support_Respondents, raw_data.tool2$Support_Respondents) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Support_Respondents"),
  
  compare_dt(clean_data.tool2$Attendance_Sheet_Photos, raw_data.tool2$Attendance_Sheet_Photos) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Attendance_Sheet_Photos"),
  
  compare_dt(clean_data.tool2$Public_Stationary_Kit_Group, raw_data.tool2$Public_Stationary_Kit_Group) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Public_Stationary_Kit_Group"),
  
  compare_dt(clean_data.tool2$Teachers_Pack_Group, raw_data.tool2$Teachers_Pack_Group) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Teachers_Pack_Group"),
  
  compare_dt(clean_data.tool2$Students_Pack_Group, raw_data.tool2$Students_Pack_Group) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Students_Pack_Group"),
  
  compare_dt(clean_data.tool2$Relevant_photos, raw_data.tool2$Relevant_photos) |>
    mutate(tool = "Tool 2 - Light", Tab_Name = "Relevant_photos"),
  
  
  # Tool 3
  compare_dt(clean_data.tool3$data, raw_data.tool3$data) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "data"),
  
  compare_dt(clean_data.tool3$Support_Respondents, raw_data.tool3$Support_Respondents) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Support_Respondents"),
  
  compare_dt(clean_data.tool3$Enrollement_Attendance_Summary, raw_data.tool3$Enrollement_Attendance_Summary) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Enrollement_Attendance_Summary"),
  
  compare_dt(clean_data.tool3$Grade_Details, raw_data.tool3$Grade_Details) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Grade_Details"),
  
  compare_dt(clean_data.tool3$Todays_Attendance_Detail, raw_data.tool3$Todays_Attendance_Detail) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Todays_Attendance_Detail"),
  
  compare_dt(clean_data.tool3$LastWeek_Attendance_Detail, raw_data.tool3$LastWeek_Attendance_Detail) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "LastWeek_Attendance_Detail"),
  
  compare_dt(clean_data.tool3$Student_Headcount, raw_data.tool3$Student_Headcount) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Student_Headcount"),
  
  compare_dt(clean_data.tool3$Relevant_photos, raw_data.tool3$Relevant_photos) |>
    mutate(tool = "Tool 3 - Headcount", Tab_Name = "Relevant_photos"),
  
  
  # Tool 4
  compare_dt(clean_data.tool4$data, raw_data.tool4$data) |>
    mutate(tool = "Tool 4 - Teacher", Tab_Name = "data"),
  
  compare_dt(clean_data.tool4$Additional_Subjects, raw_data.tool4$Additional_Subjects) |>
    mutate(tool = "Tool 4 - Teacher", Tab_Name = "Additional_Subjects"),
  
  compare_dt(clean_data.tool4$Subjects_taught_by_this_teacher, raw_data.tool4$Subjects_taught_by_this_teacher) |>
    mutate(tool = "Tool 4 - Teacher", Tab_Name = "Subjects_taught_by_this_teacher"),
  
  compare_dt(clean_data.tool4$Subjects_Not_Being_Taught, raw_data.tool4$Subjects_Not_Being_Taught) |>
    mutate(tool = "Tool 4 - Teacher", Tab_Name = "Subjects_Not_Being_Taught"),
  
  compare_dt(clean_data.tool4$Relevant_photos, raw_data.tool4$Relevant_photos) |>
    mutate(tool = "Tool 4 - Teacher", Tab_Name = "Relevant_photos"),
  
  # Tool 5
  compare_dt(clean_data.tool5$data, raw_data.tool5$data) |>
    mutate(tool = "Tool 5 - WASH", Tab_Name = "data"),
  
  compare_dt(clean_data.tool5$Under_Construction_Toilets, raw_data.tool5$Under_Construction_Toilets) |>
    mutate(tool = "Tool 5 - WASH", Tab_Name = "Under_Construction_Toilets"),
  
  compare_dt(clean_data.tool5$Useable_Toilets, raw_data.tool5$Useable_Toilets) |>
    mutate(tool = "Tool 5 - WASH", Tab_Name = "Useable_Toilets"),
  
  compare_dt(clean_data.tool5$Non_Useable_Toilets, raw_data.tool5$Non_Useable_Toilets) |>
    mutate(tool = "Tool 5 - WASH", Tab_Name = "Non_Useable_Toilets"),
  
  compare_dt(clean_data.tool5$Relevant_photos, raw_data.tool5$Relevant_photos) |>
    mutate(tool = "Tool 5 - WASH", Tab_Name = "Relevant_photos"),
  
  # Tool 6
  compare_dt(clean_data.tool6$data, raw_data.tool6$data) |>
    mutate(tool = "Tool 6 - Parent", Tab_Name = "data"),
  
  compare_dt(clean_data.tool6$Subjects_Added, raw_data.tool6$Subjects_Added) |>
    mutate(tool = "Tool 6 - Parent", Tab_Name = "Subjects_Added"),
  
  compare_dt(clean_data.tool6$Relevant_photos, raw_data.tool6$Relevant_photos) |>
    mutate(tool = "Tool 6 - Parent", Tab_Name = "Relevant_photos"),
  
  # Tool 7
  compare_dt(clean_data.tool7$data, raw_data.tool7$data) |>
    mutate(tool = "Tool 7 - Shura", Tab_Name = "data"),
  
  compare_dt(clean_data.tool7$Subjects_Added, raw_data.tool7$Subjects_Added) |>
    mutate(tool = "Tool 7 - Shura", Tab_Name = "Subjects_Added"),
  
  compare_dt(clean_data.tool7$Relevant_photos, raw_data.tool7$Relevant_photos) |>
    mutate(tool = "Tool 7 - Shura", Tab_Name = "Relevant_photos")
) 
# Data Entry tool
for(sheet in names(clean_data.tool0)){
  # Compare
  correction_log_discrep <- rbind(
    correction_log_discrep, 
    compare_dt(df1 = clean_data.tool0[[sheet]], df2 = raw_data.tool0[[sheet]]) %>%
      mutate(tool="Data_entry", Tab_Name = sheet)
  )
}

# Exclude the correction logs
required_cols <- c("KEY", "question", "old_value", "new_value", "tool", "Tab_Name")

correction_log_discrep <- correction_log_discrep |>
  select(all_of(required_cols)) |>
  anti_join(correction_log_ready_ps |> 
              mutate(
                new_value = case_when(
                  new_value == "NULL" | is.null(new_value) ~ NA_character_,
                  TRUE ~ new_value
                )
              ), by = c("KEY", "question", "new_value", "Tab_Name")) |>
  left_join(correction_log_ready_ps |> # Join Sample Type
              select(KEY, question, Tab_Name, Sample_Type), by = c("KEY", "question", "Tab_Name")) |> 
  mutate(issue = "The new_value is not applied correctly, plz check if new_value is consistent with the question!")

# Join with Correction log issues
correction_log_discrep <- rbind( 
  correction_log_discrep,
  correction_log_issues_ps |>
    select(all_of(required_cols), Sample_Type, "issue")
)

# Removing extra objects -------------------------------------------------------
rm(list = c("correction_log_issues_ps",
            "correction_log_ready_ps",
            "tool_name", "form_names_ps", "check_logs_for_df", "compare_dt", "apply_log"))
