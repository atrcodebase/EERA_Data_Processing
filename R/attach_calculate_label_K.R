## Append calculated vars label
meta_cols2 <- c("Site_Visit_ID", "EMIS_School_ID_CBE_KEY", "School_CBE_Name", "Region", "Province" , "District" , "Area_Type", "Sample_Type")

# Tool 0 
clean_data.tool0_for_client$Tool3_Grades_Repeat <- clean_data.tool0_for_client$Tool3_Grades_Repeat |>
  select(-Tool3_Grades_Field_Label) |>
  left_join(
    kobo_tool.tool0$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Tool3_Grades_Field_Label = "label"), by = c("Tool3_Grades_Field_Value" = "value")) |>
  select(any_of(meta_cols2), Tool3_Grades_Field_Value, Tool3_Grades_Field_Label, everything())

col_names_indx <- names(clean_data.tool0_for_client$data)[1:47]

# Comment out if data set has any label except English
# clean_data.tool0_for_client$Tool1_Timetable1_Repeat <- clean_data.tool0_for_client$Tool1_Timetable1_Repeat |>
#   select(-Tool1_Timetable1_Field_Label) |>
#   left_join(
#     kobo_tool.tool0$choices |>
#       filter(list_name == "grades") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Tool1_Timetable1_Field_Label = "label"), by = c("Tool1_Timetable1_Field_Value" = "value")) |>
#   select(any_of(meta_cols2), Tool1_Timetable1_Field_Value, Tool1_Timetable1_Field_Label, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable2_Repeat <- clean_data.tool0_for_client$Tool1_Timetable2_Repeat |>
#   select(-Tool1_Timetable2_Field_Label) |>
#   left_join(
#     kobo_tool.tool0$choices |>
#       filter(list_name == "grades") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Tool1_Timetable2_Field_Value = "label"), by = c("Tool1_Timetable2_Field_Value" = "value")) |>
#   select(any_of(meta_cols2), Tool1_Timetable2_Field_Value, Tool1_Timetable2_Field_Value, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable3_Repeat <- clean_data.tool0_for_client$Tool1_Timetable3_Repeat |>
#   select(-Tool1_Timetable3_Field_Label) |>
#   left_join(
#     kobo_tool.tool0$choices |>
#       filter(list_name == "grades") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Tool1_Timetable3_Field_Label = "label"), by = c("Tool1_Timetable3_Field_Value" = "value")) |>
#   select(any_of(meta_cols2), Tool1_Timetable3_Field_Value, Tool1_Timetable3_Field_Label, everything())
# 
# clean_data.tool0_for_client$Tool1_Timetable4_Repeat <- clean_data.tool0_for_client$Tool1_Timetable4_Repeat |>
#   select(-Tool1_Timetable4_Field_Label) |>
#   left_join(
#     kobo_tool.tool0$choices |>
#       filter(list_name == "grades") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Tool1_Timetable4_Field_Label = "label"), by = c("Tool1_Timetable4_Field_Value" = "value")) |>
#   select(any_of(meta_cols2), Tool1_Timetable4_Field_Value, Tool1_Timetable4_Field_Label, everything())


# Tool 1
clean_data.tool1_for_client$Shifts_Detail <- clean_data.tool1_for_client$Shifts_Detail |>
  select(-Shift_name) |>
  left_join(
    kobo_tool.tool1$choices |>
      filter(list_name == "shifts") |>
      mutate(value = as.integer(value)) |>
      select(value, Shift_name = "label"), by = c("Shift_indx" = "value")) |>
  select(any_of(meta_cols2), Shift_indx, Shift_name, everything())

clean_data.tool1_for_client$data <- clean_data.tool1_for_client$data |>
  mutate(
    School_Type_Final = case_when(
      School_Type_Final == 1 ~ "Primary",
      School_Type_Final == 2 ~ "Secondary",
      School_Type_Final == 3 ~ "Higher Secondary"
    )
  )
  
# 
# 
# clean_data.tool1_for_client$Other_Shifts_Detail <- clean_data.tool1_for_client$Other_Shifts_Detail |>
#   select(-Shift_name) |>
#   left_join(
#     kobo_tool.tool1$choices |>
#       filter(list_name == "shifts") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Shift_name = "label:English"), by = c("Shift_Value" = "value")) |>
#   select(any_of(meta_cols2), Shift_Value, Shift_name, everything())


# Tool2
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group |>
  select(-H6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "H5") |>
      mutate(value = as.integer(value)) |>
      select(value, H6_Field_Label = "label"), by = c("H6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), H6_Field_Value, H6_Field_Label, everything())


clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2_for_client$Teachers_Pack_Group |>
  select(-i6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "i5") |>
      select(value, i6_Field_Label = "label") |>
      mutate(value = as.integer(value))
    , by = c("i6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), i6_Field_Value, i6_Field_Label, everything())


clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2_for_client$Students_Pack_Group |>
  select(-J6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "J5") |>
      mutate(value = as.integer(value)) |>
      select(value, J6_Field_Label = "label"), by = c("J6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), J6_Field_Value, J6_Field_Label, everything())

# Tool 3
# E1_Field_Value	E1_Field_Label --> According to the tool these value should be taken from tool choice, but the E1_Field_Label is like text insertion values


# Tool 4
clean_data.tool4_for_client$Subjects_taught_by_this_teacher <- clean_data.tool4_for_client$Subjects_taught_by_this_teacher |>
  select(-D9_Field_Label) |>
  left_join(
    kobo_tool.tool4$choices |>
      filter(list_name == "subjects") |>
      mutate(value = as.integer(value)) |>
      select(value, D9_Field_Label = "label"), by = c("D9_Field_Value" = "value")) |>
  select(any_of(meta_cols2), D9_Field_Value, D9_Field_Label, everything())


clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4_for_client$Subjects_Not_Being_Taught |>
  select(-F12_Field_Label) |>
  left_join(
    kobo_tool.tool4$choices |>
      filter(list_name == "F1") |>
      mutate(value = as.integer(value)) |>
      select(value, F12_Field_Label = "label"), by = c("F12_Field_Value" = "value")) |>
  select(any_of(meta_cols2), F12_Field_Value, F12_Field_Label, everything())


# Tool 7
# clean_data.tool7_for_client$C6_list_members <- clean_data.tool7_for_client$C6_list_members |>
#   select(-Field_Label, -Field_Lablel_Final)|>
#   left_join(
#     kobo_tool.tool7$choices |>
#       filter(list_name == "C5") |>
#       mutate(value = as.integer(value)) |>
#       select(value, Field_Label = "label:English"), by = c("Field_Value" = "value")) |>
#   left_join(
#     clean_data.tool7_for_client$data |>
#       select(KEY, C5_Other), by = c("PARENT_KEY" = "KEY")) |>
#   mutate(
#     Field_Lablel_Final = case_when(
#       Field_Value == 7777 ~ C5_Other,
#       TRUE ~ Field_Label
#     )
#   ) |>
#   select(any_of(meta_cols2), Field_Value, Field_Label, Field_Lablel_Final, everything(), -C5_Other)

