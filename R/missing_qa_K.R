source("R/functions/find_missing_qa.R")

# extracting the var names of indicators with image question type ---------
tool1_image_vars = c(
  "A32_QA" = "A32",
  "B19_QA" = "B19",
  "B20_QA" = "B20",
  "F2_QA" = "F2",
  "J24_QA" = "J24",
  "L2_QA" = "L2",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool2_image_vars = c(
  "B5_QA" = "B5", 
  "Photo_closure_1_QA" = "Photo_closure_1",
  "Photo_closure_2_QA" = "Photo_closure_2",
  "G6_QA" = "G6",
  "H12_QA" = "H12",
  "H15_QA" = "H15",
  "i12_QA" = "i12", 
  "i15_QA" = "i15",
  "J12_QA" = "J12",
  "J15_QA" = "J15",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool3_image_vars = c(
  "C1A2_QA" = "C1A2",
  "C1A2_2_QA" = "C1A2_2",
  "D4_QA" = "D4",
  "D4_2_QA" = "D4_2",
  "D8_QA" = "D8",
  "D8_2_QA" = "D8_2",
  "E2_QA" = "E2",
  "E2_2_QA" = "E2_2",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool4_image_vars = c(
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool5_image_vars = c(
  "C3_QA" = "C3",
  "Under_Construction_Toilet_Photo_QA" = "Under_Construction_Toilet_Photo",
  "Useable_Toilet_Photo_QA" = "Useable_Toilet_Photo",
  "Non_Useable_Toilet_Photo_QA" = "Non_Useable_Toilet_Photo",
  "C11_1_QA" = "C11",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool6_image_vars = c(
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool7_image_vars = c(
  "C10_image_QA" = "C10_image",
  "C10_image2_QA" = "C10_image2",
  "C10_image3_QA" = "C10_image3",
  "C10_image4_QA" = "C10_image4",
  "C10_image5_QA" = "C10_image5",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

photo_qaed_values <- c("Checked & Verified", "Checked - Irrelevant Photo", "Checked - Blur/Not Visible Photo", "Checked - Date Not Specified In The Photo", "Checked - Incomplete Information",
                       "Checked - Date Not Specified In The Photo;Checked - Incomplete Information", "Checked - Incomplete Information;Checked - Schedule Not Available For Some Grades",
                       "Checked - Date Not Specified In The Photo;Checked - Schedule Not Available For Some Grades", "Checked - Different Date In The Photo", "Checked - Document With No Signature",
                       "No_photo_received_from_the_field_during_first_days_of_data_collection"
)

# Checking QA's comments --------------------------------------------------
missing_qa <- rbind(
  # Tool 1
  rbind(
    missing_qa_func(data = clean_data.tool1$data |> mutate(across(c("A32_QA", "J24_QA", "L2_QA"), as.character)), obj_cols =  tool1_image_vars),
    missing_qa_func(clean_data.tool1$Weekly_Class_Schedule, tool1_image_vars),
    missing_qa_func(clean_data.tool1$Relevant_photos, tool1_image_vars)
  ) %>% 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  rbind(
    missing_qa_func(clean_data.tool2$data, tool2_image_vars),
    missing_qa_func(clean_data.tool2$Attendance_Sheet_Photos, tool2_image_vars),
    missing_qa_func(clean_data.tool2$Public_Stationary_Kit_Group, tool2_image_vars),
    missing_qa_func(clean_data.tool2$Teachers_Pack_Group, tool2_image_vars),
    missing_qa_func(clean_data.tool2$Students_Pack_Group, tool2_image_vars),
    missing_qa_func(clean_data.tool2$Relevant_photos, tool2_image_vars)
  ) %>%
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  rbind(
    missing_qa_func(clean_data.tool3$Enrollement_Attendance_Summary, tool3_image_vars),
    missing_qa_func(clean_data.tool3$Todays_Attendance_Detail, tool3_image_vars),
    missing_qa_func(clean_data.tool3$LastWeek_Attendance_Detail, tool3_image_vars),
    missing_qa_func(clean_data.tool3$Student_Headcount, tool3_image_vars),
    missing_qa_func(clean_data.tool3$Relevant_photos, tool3_image_vars)
  ) %>% 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    missing_qa_func(clean_data.tool4$Relevant_photos, tool4_image_vars)
  ) %>% 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  rbind(
    missing_qa_func(clean_data.tool5$data, tool5_image_vars),
    missing_qa_func(clean_data.tool5$Under_Construction_Toilets, tool5_image_vars),
    missing_qa_func(clean_data.tool5$Useable_Toilets, tool5_image_vars),
    missing_qa_func(clean_data.tool5$Non_Useable_Toilets, tool5_image_vars),
    missing_qa_func(clean_data.tool5$Relevant_photos, tool5_image_vars)
  ) %>% 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  missing_qa_func(clean_data.tool6$Relevant_photos, tool6_image_vars) %>% 
    mutate( tool = "Tool 6 - Parent", Sample_Type = "Public School"),
  
  # Tool 7
  rbind(
    missing_qa_func(clean_data.tool7$data, tool7_image_vars),
    missing_qa_func(clean_data.tool7$Relevant_photos, tool7_image_vars)
  ) %>% 
    mutate(tool = "Tool 7 - Shura", Sample_Type = "Public School")
) |> 
  mutate(Type = "Image") |> filter(!old_value %in% photo_qaed_values)

unique(missing_qa$old_value)
table(missing_qa$old_value)

# Checking the audio descriptions -----------------------------------------
audio_qaed_values <- c("No_audio_received_from_the_field", "Translation_is_from_a_callback", "No_audio_received_from_the_field/Translation_is_from_a_callback")


tool1.audio_vars = c(
  "A31_Audio_Translation" = "A31_Audio",
  "B12_Translation" = "B12",
  "B14_Translation" = "B14",
  "B16_Translation" = "B16",
  "B18_Translation" = "B18",
  "C9_Audio_Translation" = "C9_Audio",
  "D3_Translation" = "D3",
  "D4_Translation" = "D4",
  "E2_Other_Translation" = "E2_Other",
  "E3_Translation" = "E3",
  "E4_Translation" = "E4",
  "E10_Other_Translation" = "E10_Other",
  "E11_Translation" = "E11",
  "E12_Translation" = "E12",
  "E18_Other_Translation" = "E18_Other",
  "E19_Translation" = "E19",
  "E20_Translation" = "E20",
  "E26_Translation" = "E26",
  "E27_Translation" = "E27",
  "F10_Translation" = "F10",
  "F17_Translation" = "F17",
  "J3_Translation" = "J3",
  "J4_Translation" = "J4",
  "J22_Translation" = "J22",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool2.audio_vars = c(
  "B3_Audio_Translation" = "B3_Audio",
  "C14_Audio_Translation" = "C14_Audio",
  "C16_Yes_Translation" = "C16_Yes",
  "C17_Translation" = "C17",
  "Enumerator_Comments_Translation" = "Enumerator_Comments",
  "D59_Audio_Translation" = "D59_Audio",
  "H2_Audio_Translation" = "H2_Audio",
  "H16_Audio_Translation" = "H16_Audio",
  "i2_Audio_Translation" = "i2_Audio",
  "i16_Audio_Translation" = "i16_Audio",
  "J2_Audio_Translation" = "J2_Audio",
  "J16_Audio_Translation" = "J16_Yes",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool3.audio_vars = c(
  "B7_Audio_Translation" = "B7_Audio",
  "No_Please_Explain_Translation" = "No_Please_Explain",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool4.audio_vars = c(
  "E2_Other_Translation" = "E2_Other",
  "E3_Translation" = "E3",
  "E4_Translation" = "E4",
  "E10_Other_Translation" = "E10_Other",
  "E11_Translation" = "E11",
  "E12_Translation" = "E12",
  "E18_Other_Translation" = "E18_Other",
  "E19_Translation" = "E19",
  "E20_Translation" = "E20",
  "E26_Translation" = "E26",
  "F14_Translation" = "F14",
  "G8_Translation" = "G8",
  "H3_Translation" = "H3",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool5.audio_vars = c(
  "C5_Other_Audio_Translation" = "C5_Other_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool6.audio_vars = c(
  "C7_Audio_Translation" = "C7",
  "C8_Audio_Translation" = "C8",
  "D6_Audio_Translation" = "D6_Audio",
  "D7_Audio_Translation" = "D7_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool7.audio_vars = c(
  "C16_Translation" = "C16",
  "D6_Translation" = "D6",
  "D7_Translation" = "D7",
  "D12_Translation" = "D12",
  "E5_Audio_Translation" = "E5_Audio",
  "E6_Yes_Translation" = "E6_Yes",
  "G6_Translation" = "G6",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)



missing_audio_description <- rbind(
  # Tool 1
  rbind(
    missing_qa_func(data = clean_data.tool1$data |> mutate(across(names(tool1.audio_vars[which(names(tool1.audio_vars) %in% names(clean_data.tool1$data))]), as.character)), obj_cols = tool1.audio_vars),
    missing_qa_func(data = clean_data.tool1$Subjects_Detail  |> mutate(across(names(tool1.audio_vars[which(names(tool1.audio_vars) %in% names(clean_data.tool1$Subjects_Detail))]), as.character)), obj_cols = tool1.audio_vars)
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  rbind(
    missing_qa_func(clean_data.tool2$data, obj_cols = tool2.audio_vars),
    missing_qa_func(clean_data.tool2$Public_Stationary_Kit_Group, obj_cols = tool2.audio_vars),
    missing_qa_func(clean_data.tool2$Teachers_Pack_Group, obj_cols = tool2.audio_vars),
    missing_qa_func(clean_data.tool2$Students_Pack_Group, obj_cols = tool2.audio_vars)
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  rbind(
    missing_qa_func(clean_data.tool3$data, obj_cols = tool3.audio_vars)
  ) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    missing_qa_func(clean_data.tool4$data  |> mutate(across(names(tool4.audio_vars[which(names(tool4.audio_vars) %in% names(clean_data.tool4$data))]), as.character)), obj_cols = tool4.audio_vars),
    missing_qa_func(clean_data.tool4$Subjects_Not_Being_Taught, obj_cols = tool4.audio_vars)
  ) |> 
    mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  rbind(
    missing_qa_func(clean_data.tool5$data, obj_cols = tool5.audio_vars)
  ) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  missing_qa_func(clean_data.tool6$data, obj_cols = tool6.audio_vars) |> 
    mutate(tool = "Tool 6 - Parent", Sample_Type = "Public School"),
  
  # Tool 7
  missing_qa_func(clean_data.tool7$data, obj_cols = tool7.audio_vars) |> 
    mutate(tool = "Tool 7 - Shura", Sample_Type = "Public School")
) |>
  mutate(Type = "Audio") |>
  filter((old_value == "" | is.na(old_value)) | old_value %in% c("NO_CLEAR_VOICE") | link %in% audio_qaed_values)


missing_qa <-  rbind(
  missing_qa,
  missing_audio_description
)

# remove extra elements from environment
remove(missing_qa_func)

