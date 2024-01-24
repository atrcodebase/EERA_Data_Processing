### merge information from main sheet to child-sheets  --------------------------------------------------------------------
## Tool 0: -----
for(sheet in names(clean_data.tool0)[-1]){
  # Join
  clean_data.tool0[[sheet]] <- clean_data.tool0[[sheet]] %>%
    mutate(KEY_join=str_split_fixed(PARENT_KEY, "/", 2)[,1]) %>% 
    left_join(select(clean_data.tool0$data, any_of(meta_cols), KEY), by = c("KEY_join" = "KEY")) |>
    select(any_of(meta_cols), everything(), -KEY_join)
}

## Tool 1: -----
clean_data.tool1$Support_Respondents <- clean_data.tool1$Support_Respondents |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$School_Operationality <- clean_data.tool1$School_Operationality |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Shifts_Detail <- clean_data.tool1$Shifts_Detail |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Headmasters <- clean_data.tool1$Headmasters |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Weekly_Class_Schedule <- clean_data.tool1$Weekly_Class_Schedule |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Subjects_Detail <- clean_data.tool1$Subjects_Detail |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Education_Quality <- clean_data.tool1$Education_Quality |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool1$Relevant_photos <- clean_data.tool1$Relevant_photos |>
  left_join(select(clean_data.tool1$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 2: -----
clean_data.tool2$Support_Respondents <- clean_data.tool2$Support_Respondents |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Attendance_Sheet_Photos <- clean_data.tool2$Attendance_Sheet_Photos |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Public_Stationary_Kit_Group <- clean_data.tool2$Public_Stationary_Kit_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Teachers_Pack_Group <- clean_data.tool2$Teachers_Pack_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Students_Pack_Group <- clean_data.tool2$Students_Pack_Group |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool2$Relevant_photos <- clean_data.tool2$Relevant_photos |>
  left_join(select(clean_data.tool2$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 3: -----
clean_data.tool3$Support_Respondents <- clean_data.tool3$Support_Respondents |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Enrollement_Attendance_Summary <- clean_data.tool3$Enrollement_Attendance_Summary |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Grade_Details <- clean_data.tool3$Grade_Details |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Todays_Attendance_Detail <- clean_data.tool3$Todays_Attendance_Detail |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$LastWeek_Attendance_Detail <- clean_data.tool3$LastWeek_Attendance_Detail |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Student_Headcount <- clean_data.tool3$Student_Headcount |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool3$Relevant_photos <- clean_data.tool3$Relevant_photos |>
  left_join(select(clean_data.tool3$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 4: -----
clean_data.tool4$Additional_Subjects <- clean_data.tool4$Additional_Subjects |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Subjects_taught_by_this_teacher <- clean_data.tool4$Subjects_taught_by_this_teacher |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Subjects_Not_Being_Taught <- clean_data.tool4$Subjects_Not_Being_Taught |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool4$Relevant_photos <- clean_data.tool4$Relevant_photos |>
  left_join(select(clean_data.tool4$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 5: -----
clean_data.tool5$Under_Construction_Toilets <- clean_data.tool5$Under_Construction_Toilets |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Useable_Toilets <- clean_data.tool5$Useable_Toilets |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Non_Useable_Toilets <- clean_data.tool5$Non_Useable_Toilets |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool5$Relevant_photos <- clean_data.tool5$Relevant_photos |>
  left_join(select(clean_data.tool5$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 6: -----
clean_data.tool6$Subjects_Added <- clean_data.tool6$Subjects_Added |>
  left_join(select(clean_data.tool6$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool6$Relevant_photos <- clean_data.tool6$Relevant_photos |>
  left_join(select(clean_data.tool6$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

## Tool 7: -----
clean_data.tool7$Subjects_Added <- clean_data.tool7$Subjects_Added |>
  mutate(PARENT_KEY = as.character(PARENT_KEY)) |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())

clean_data.tool7$Relevant_photos <- clean_data.tool7$Relevant_photos |>
  left_join(select(clean_data.tool7$data, any_of(meta_cols), KEY), by = c("PARENT_KEY" = "KEY")) |>
  select(any_of(meta_cols), everything())


