## Append calculated vars label
meta_cols2 <- c("Site_Visit_ID", "EMIS_School_ID_CBE_KEY", "School_CBE_Name", "Region", "Province" , "District" , "Area_Type", "Sample_Type")

# Tool 1
clean_data.tool1_for_client$School_Operationality_Other_... <- clean_data.tool1_for_client$School_Operationality_Other_... |>
  select(-Grade_name) |>
  left_join(
    kobo_tool.tool1$choices |>
      filter(list_name == "grades") |>
      mutate(value = as.integer(value)) |>
      select(value, Grade_name = "label:English"), by = c("Grade_Value" = "value")) |>
  select(any_of(meta_cols2), Grade_Value, Grade_name, everything())


clean_data.tool1_for_client$Other_Shifts_Detail <- clean_data.tool1_for_client$Other_Shifts_Detail |>
  select(-Shift_name) |>
  left_join(
    kobo_tool.tool1$choices |>
      filter(list_name == "shifts") |>
      mutate(value = as.integer(value)) |>
      select(value, Shift_name = "label:English"), by = c("Shift_Value" = "value")) |>
  select(any_of(meta_cols2), Shift_Value, Shift_name, everything())


# Tool2
clean_data.tool2_for_client$Public_Stationary_Kit_Group <- clean_data.tool2_for_client$Public_Stationary_Kit_Group |>
  select(-H6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "H5") |>
      mutate(value = as.integer(value)) |>
      select(value, H6_Field_Label = "label:English"), by = c("H6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), H6_Field_Value, H6_Field_Label, everything())


clean_data.tool2_for_client$Teachers_Pack_Group <- clean_data.tool2_for_client$Teachers_Pack_Group |>
  select(-i6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "i5") |>
      select(value, i6_Field_Label = "label:English"), by = c("i6_Field_Value" = "value")) |>
  select(any_of(meta_cols2), i6_Field_Value, i6_Field_Label, everything())


clean_data.tool2_for_client$Students_Pack_Group <- clean_data.tool2_for_client$Students_Pack_Group |>
  select(-J6_Field_Label) |>
  left_join(
    kobo_tool.tool2$choices |>
      filter(list_name == "J5") |>
      mutate(value = as.integer(value)) |>
      select(value, J6_Field_Label = "label:English"), by = c("J6_Field_Value" = "value")) |>
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
      select(value, D9_Field_Label = "label:English"), by = c("D9_Field_Value" = "value")) |>
  select(any_of(meta_cols2), D9_Field_Value, D9_Field_Label, everything())


clean_data.tool4_for_client$Subjects_Not_Being_Taught <- clean_data.tool4_for_client$Subjects_Not_Being_Taught |>
  select(-F12_Field_Label) |>
  left_join(
    kobo_tool.tool4$choices |>
      filter(list_name == "F1") |>
      mutate(value = as.integer(value)) |>
      select(value, F12_Field_Label = "label:English"), by = c("F12_Field_Value" = "value")) |>
  select(any_of(meta_cols2), F12_Field_Value, F12_Field_Label, everything())


# Tool 7
clean_data.tool7_for_client$C6_list_members <- clean_data.tool7_for_client$C6_list_members |>
  select(-Field_Label, -Field_Lablel_Final)|>
  left_join(
    kobo_tool.tool7$choices |>
      filter(list_name == "C5") |>
      mutate(value = as.integer(value)) |>
      select(value, Field_Label = "label:English"), by = c("Field_Value" = "value")) |>
  left_join(
    clean_data.tool7_for_client$data |>
      select(KEY, C5_Other), by = c("PARENT_KEY" = "KEY")) |>
  mutate(
    Field_Lablel_Final = case_when(
      Field_Value == 7777 ~ C5_Other,
      TRUE ~ Field_Label
    )
  ) |>
  select(any_of(meta_cols2), Field_Value, Field_Label, Field_Lablel_Final, everything(), -C5_Other)


# Tool 8
clean_data.tool8_for_client$Classroom_Materials <- clean_data.tool8_for_client$Classroom_Materials |>
  select(-O_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "N5") |>
      mutate(value = as.integer(value)) |>
      select(value, O_Field_Label = "label:English"), by = c("O_Field_Value" = "value")) |>
  select(any_of(meta_cols2), O_Field_Value, O_Field_Label, everything())


clean_data.tool8_for_client$Teacher_Kit <- clean_data.tool8_for_client$Teacher_Kit |>
  select(-O2_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "P5") |>
      mutate(value = as.integer(value)) |>
      select(value, O2_Field_Label = "label:English"), by = c("O2_Field_Value" = "value")) |>
  select(any_of(meta_cols2), O2_Field_Value, O2_Field_Label, everything())


clean_data.tool8_for_client$Student_Kit <- clean_data.tool8_for_client$Student_Kit |>
  select(-S1_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "R5") |>
      mutate(value = as.integer(value)) |>
      select(value, S1_Field_Label = "label:English"), by = c("S1_Field_Value" = "value")) |>
  select(any_of(meta_cols2), S1_Field_Value, S1_Field_Label, everything())


clean_data.tool8_for_client$V_list_of_all_members <- clean_data.tool8_for_client$V_list_of_all_members |>
  select(-V_Field_Label) |>
  left_join(
    kobo_tool.tool8$choices |>
      filter(list_name == "V4") |>
      mutate(value = as.integer(value)) |>
      select(value, V_Field_Label = "label:English"), by = c("V_Field_Value" = "value")) |>
  select(any_of(meta_cols2), V_Field_Value, V_Field_Label, everything())

