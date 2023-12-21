source("R/functions/find_missing_qa.R")

# extracting the var names of indicators with image question type ---------
tool1_image_vars = c(
  # "B19_Caption" = "B19",
  "B19_QA" = "B19",
  # "B20_Caption" = "B20",
  "B20_QA" = "B20",
  # "F2_Caption" = "F2",
  "F2_QA" = "F2",
  # "J24_Caption" = "J24",
  "J24_QA" = "J24",
  # "L2_Caption" = "L2",
  "L2_QA" = "L2",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
  # "FDE_Dari_Hours" = "FDE_Dari_Hours",
  # "FDE_Mathematics_Hours" = "FDE_Mathematics_Hours",
  # "FDE_Drawing_Hours" = "FDE_Drawing_Hours",
  # "FDE_Life_Skills_Hours" = "FDE_Life_Skills_Hours",
  # "FDE_Calligraphy_Hours" = "FDE_Calligraphy_Hours",
  # "FDE_English_Hours" = "FDE_English_Hours",
  # "FDE_Pashto_Hours" = "FDE_Pashto_Hours",
  # "FDE_Social_Studies_Hours" = "FDE_Social_Studies_Hours",
  # "FDE_Arabic_Hours" = "FDE_Arabic_Hours",
  # "FDE_Civics_Hours" = "FDE_Civics_Hours",
  # "FDE_Professional_Skills_Hours" = "FDE_Professional_Skills_Hours",
  # "FDE_Biology_Hours" = "FDE_Biology_Hours",
  # "FDE_Geography_Hours" = "FDE_Geography_Hours",
  # "FDE_History_Hours" = "FDE_History_Hours",
  # "FDE_Physics_Hours" = "FDE_Physics_Hours",
  # "FDE_Chemistry_Hours" = "FDE_Chemistry_Hours",
  # "FDE_Islamic_Studies_Hours" = "FDE_Islamic_Studies_Hours",
  # "FDE_Holy_Quran_Hours" = "FDE_Holy_Quran_Hours",
  # "FDE_Tajweed_Hours" = "FDE_Tajweed_Hours",
  # "FDE_Patriotism_Hours" = "FDE_Patriotism_Hours",
  # "FDE_Other_Hours" = "FDE_Other_Hours"
)

tool2_image_vars = c(
  # "B5_Caption" = "B5_Caption",
  "B5_QA" = "B5", 
  # "Photo_closure_1_Caption" = "Photo_closure_1",
  "Photo_closure_1_QA" = "Photo_closure_1",
  # "Photo_closure_2_Caption" = "Photo_closure_2",
  "Photo_closure_2_QA" = "Photo_closure_2",
  # "G6_Caption" = "G6",
  "G6_QA" = "G6",
  # "H12_Caption" = "H12",
  "H12_QA" = "H12",
  # "H15_Caption" = "H15", 
  "H15_QA" = "H15",
  # "i12_Caption" = "i12",
  "i12_QA" = "i12",
  # "i15_Caption" = "i15",  
  "i15_QA" = "i15",
  # "J12_Caption" = "J12",
  "J12_QA" = "J12",
  # "J15_Caption" = "J15",
  "J15_QA" = "J15",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
  # "FDE_Present_Teachers_Male" = "FDE_Present_Teachers_Male",
  # "FDE_Absent_Teachers_Male" = "FDE_Absent_Teachers_Male",
  # "FDE_Total_Teachers_Male" = "FDE_Total_Teachers_Male",
  # "FDE_Present_Teachers_Female" = "FDE_Present_Teachers_Female",
  # "FDE_Absent_Teachers_Female" = "FDE_Absent_Teachers_Female",
  # "FDE_Total_Teachers_Female" = "FDE_Total_Teachers_Female"
)

tool3_image_vars = c(
  # "C1A2_Caption" = "C1A2",
  "C1A2_QA" = "C1A2",
  # "C1A2_2_Caption" = "C1A2_2",
  "C1A2_2_QA" = "C1A2_2",
  # "D4_Caption" = "D4",
  "D4_QA" = "D4",
  # "D4_2_Caption" = "D4_2",
  "D4_2_QA" = "D4_2",
  # "D8_Caption" = "D8",
  "D8_QA" = "D8",
  # "D8_2_Caption" = "D8_2",
  "D8_2_QA" = "D8_2",
  # "E2_Caption" = "E2",
  "E2_QA" = "E2",
  # "E2_2_Caption" = "E2_2",
  "E2_2_QA" = "E2_2",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
  # "FDE_C1A3" = "FDE_C1A3",
  # "FDE_C1A4_Male" = "FDE_C1A4_Male",
  # "FDE_C1A4_Female" = "FDE_C1A4_Female",
  # "FDE_C1A5_Male" = "FDE_C1A5_Male",
  # "FDE_C1A5_Female" = "FDE_C1A5_Female",
  # "FDE_C1A6_Male" = "FDE_C1A6_Male",
  # "FDE_C1A6_Female" = "FDE_C1A6_Female",
  # "FDE_Overall_Present_Male_Students_Today" = "FDE_Overall_Present_Male_Students_Today",
  # "FDE_Number_Of_Absent_Male_Students_Today" = "FDE_Number_Of_Absent_Male_Students_Today",
  # "FDE_Overall_Present_Female_Students_Today" = "FDE_Overall_Present_Female_Students_Today",
  # "FDE_Number_Of_Absent_Female_Students_Today" = "FDE_Number_Of_Absent_Female_Students_Today",
  # "FDE_Overall_Present_Male_Students_LastWeek" = "FDE_Overall_Present_Male_Students_LastWeek",
  # "FDE_Number_Of_Absent_Male_Students_LastWeek" = "FDE_Number_Of_Absent_Male_Students_LastWeek",
  # "FDE_Overall_Present_Female_Students_LastWeek" = "FDE_Overall_Present_Female_Students_LastWeek",
  # "FDE_Number_Of_Absent_Female_Students_LastWeek" = "FDE_Number_Of_Absent_Female_Students_LastWeek",
  # "FDE_E6A11" = "FDE_E6A11",
  # "FDE_E6A12" = "FDE_E6A12",
  # "FDE_E6A21" = "FDE_E6A21",
  # "FDE_E6A22" = "FDE_E6A22",
  # "FDE_E6A31" = "FDE_E6A31",
  # "FDE_E6A32" = "FDE_E6A32"
  
)

tool4_image_vars = c(
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool5_image_vars = c(
  # "C3_Caption" = "C3",
  "C3_QA" = "C3",
  # "Under_Construction_Toilet_Photo_Caption" = "Under_Construction_Toilet_Photo",
  "Under_Construction_Toilet_Photo_QA" = "Under_Construction_Toilet_Photo",
  "Useable_Toilet_Photo_QA" = "Useable_Toilet_Photo",
  "Non_Useable_Toilet_Photo_QA" = "Non_Useable_Toilet_Photo",
  "C11_1_QA" = "C11",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool6_image_vars = c(
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
  )

tool7_image_vars = c(
  # "C10_image_Caption" = "C10_image",
  "C10_image_QA" = "C10_image",
  # "C10_image2_Caption" = "C10_image2",
  "C10_image2_QA" = "C10_image2",
  # "C10_image3_Caption" = "C10_image3",
  "C10_image3_QA" = "C10_image3",
  # "C10_image4_Caption" = "C10_image4",
  "C10_image4_QA" = "C10_image4",
  # "C10_image5_Caption" = "C10_image5",
  "C10_image5_QA" = "C10_image5",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool8_image_vars = c(
  # "B5_Caption" = "B5",
  "B5_QA" = "B5",
  # "E22_Photo1_Caption" = "E22_Photo1",
  "E22_Photo1_QA" = "E22_Photo1",
  # "E22_Photo2_Caption" = "E22_Photo2",
  "E22_Photo2_QA" = "E22_Photo2",
  # "E22_Photo3_Caption" = "E22_Photo3",
  "E22_Photo3_QA" = "E22_Photo3",
  # "E22_Photo4_Caption" = "E22_Photo4",
  "E22_Photo4_QA" = "E22_Photo4",
  # "E22_Photo5_Caption" = "E22_Photo5",
  "E22_Photo5_QA" = "E22_Photo5",
  # "FDE_Confirm_The_Date_of_Visit_With_Attendance" = "FDE_Confirm_The_Date_of_Visit_With_Attendance",
  # "FDE_Overall_Present_Students_Male" = "FDE_Overall_Present_Students_Male",
  # "FDE_Overall_Present_Students_Female" = "FDE_Overall_Present_Students_Female",
  # "FDE_Overall_Absent_Students_Male" = "FDE_Overall_Absent_Students_Male",
  # "FDE_Overall_Absent_Students_Female" = "FDE_Overall_Absent_Students_Female",
  # "J4_Students_Enrolment_Book_Photo_Caption" = "J4_Students_Enrolment_Book_Photo",
  "J4_Students_Enrolment_Book_Photo_QA" = "J4_Students_Enrolment_Book_Photo",
  
  # "FDE_Grade1_Male" = "FDE_Grade1_Male",
  # "FDE_Grade1_Female" = "FDE_Grade1_Female",
  # "FDE_Grade1_Total" = "FDE_Grade1_Total",
  # "FDE_Grade2_Male" = "FDE_Grade2_Male",
  # "FDE_Grade2_Female" = "FDE_Grade2_Female",
  # "FDE_Grade2_Total" = "FDE_Grade2_Total",
  # "FDE_Grade3_Male" = "FDE_Grade3_Male",
  # "FDE_Grade3_Female" = "FDE_Grade3_Female",
  # "FDE_Grade3_Total" = "FDE_Grade3_Total",
  # "FDE_Grade4_Male" = "FDE_Grade4_Male",
  # "FDE_Grade4_Female" = "FDE_Grade4_Female",
  # "FDE_Grade4_Total" = "FDE_Grade4_Total",
  # "FDE_Grade5_Male" = "FDE_Grade5_Male",
  # "FDE_Grade5_Female" = "FDE_Grade5_Female",
  # "FDE_Grade5_Total" = "FDE_Grade5_Total",
  # "FDE_Grade6_Male" = "FDE_Grade6_Male",
  # "FDE_Grade6_Female" = "FDE_Grade6_Female",
  # "FDE_Grade6_Total" = "FDE_Grade6_Total",
  # "FDE_Grade_Other_Male" = "FDE_Grade_Other_Male",
  # "FDE_Grade_Other_Female" = "FDE_Grade_Other_Female",
  # "FDE_Grade_Other_Total" = "FDE_Grade_Other_Total",
  # "FDE_Total_Male" = "FDE_Total_Male",
  # "FDE_Total_Female" = "FDE_Total_Female",
  # "FDE_Total" = "FDE_Total",
  # "FDE_Level_1_1_2_Male" = "FDE_Level_1_1_2_Male",
  # "FDE_Level_1_1_2_Female" = "FDE_Level_1_1_2_Female",
  # "FDE_Total_Level_1_1_2" = "FDE_Total_Level_1_1_2",
  # "FDE_Level_2_3_4_Male" = "FDE_Level_2_3_4_Male",
  # "FDE_Level_2_3_4_Female" = "FDE_Level_2_3_4_Female",
  # "FDE_Total_Level_2_3_4" = "FDE_Total_Level_2_3_4",
  # "FDE_Level_3_5_6_Male" = "FDE_Level_3_5_6_Male",
  # "FDE_Level_3_5_6_Female" = "FDE_Level_3_5_6_Female",
  # "FDE_Total_Level_3_5_6" = "FDE_Total_Level_3_5_6",
  
  # "O7_Caption" = "O7",
  "O7_QA" = "O7",
  # "O10_Caption" = "O10",
  "O10_QA" = "O10",
  # "Q7_Photo_Caption" = "Q7_Photo",
  "Q7_Photo_QA" = "Q7_Photo",
  # "Q10_Photo_Caption" = "Q10_Photo",
  "Q10_Photo_QA" = "Q10_Photo",
  # "S7_Caption" = "S7",
  "S7_QA" = "S7",
  # "S10_Caption" = "S10",
  "S10_QA" = "S10",
  # "W15_Caption" = "W15",
  "W15_QA" = "W15",
  # "W18_Caption" = "W18",
  "W18_QA" = "W18",
  # "W21_Caption" = "W21",
  "W21_QA" = "W21",
  # "X6_Caption" = "X6",
  "X6_QA" = "X6",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = "Please_Add_Any_Relevant_Photo"
)

tool9_image_vars = c(
  # "A7_Photo1_Caption" = "A7_Photo1",
  "A7_Photo1_QA" = "A7_Photo1",
  # "A7_Photo2_QA_Photo_Caption" = "A7_Photo2_QA_Photo",
  "A7_Photo2_QA_Photo_QA" = "A7_Photo2_QA_Photo",
  # "B2_Photo_Caption" = "B2_Photo",
  "B2_Photo_QA" = "B2_Photo",
  # "Please_Add_Any_Relevant_Photo_caption" = "Please_Add_Any_Relevant_Photo",
  "Please_Add_Any_Relevant_Photo_QA" = 'Please_Add_Any_Relevant_Photo'
)

# photo_qaed_values = c("Checked & Verified", "Checked &amp; Verified", "Checked &amp; Verified-", "Checked - Blur/Not Visible Photo", "Checked - Irrelevant Photo", "Checked &amp; verified", "Checked and Verified", 
#                       "Checked and Verified", "-Checked &amp; Verified", "-Checked - Irrelevant Photo", "Checked - Irrelevant Phot", "Checked and Irrelevant photo", "Checked and verified", "Checked - Incomplete Information",
#                       "Checked - Date Not Specified In The Photo", "Checked - Incomplete Information;Checked - Schedule Not Available For Some Grades", "Relevant Photo", "Checked - Blur/Not Visible Phot",
#                       "Checked - Date Not Specified In The Photo;Checked - Incomplete Information", "Checked &amp; VerifiedChecked &amp; Verified", "Check &amp; Verified", "-checked &amp; verified", "-checked and no relevant",
#                       "-checked and not verified", "checked &amp; Verified", "-Checked & Verified", "checked &amp; relevant", "-aChecked &amp; Verified", "-checked $ not relevant", "-checked $ verified",
#                       "-checked and verified", "Checked &amp; Verified]", "checked and relevant","Irrelevant Photo", "-checked and relevant", "-checked &amp; relevant", "-checked &amp; Relevant", "-checked &amp; Verified"
#                       ,as.character(seq(0, 150))
#                     )

photo_qaed_values <- c("Checked & Verified", "Checked - Irrelevant Photo", "Checked - Blur/Not Visible Photo", "Checked - Date Not Specified In The Photo", "Checked - Incomplete Information",
                       "Checked - Date Not Specified In The Photo;Checked - Incomplete Information", "Checked - Incomplete Information;Checked - Schedule Not Available For Some Grades",
                       "Checked - Date Not Specified In The Photo;Checked - Schedule Not Available For Some Grades", "Checked - Different Date In The Photo", "Checked - Document With No Signature"
                       )

# Checking QA's comments --------------------------------------------------
missing_qa <- rbind(
  # Tool 1
  rbind(
    missing_qa_func(clean_data.tool1$data,tool1_image_vars), # Should be double-checked
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
    mutate(
      tool = "Tool 6 - Parent",
      PARENT_KEY = str_sub(KEY, 1, 41)
      ) %>% 
    left_join(clean_data.tool6$data %>% select(KEY, Sample_Type) , by = c("PARENT_KEY" = "KEY")) %>% 
    select(-PARENT_KEY),
  
  # Tool 7
  rbind(
    missing_qa_func(clean_data.tool7$data, tool7_image_vars) %>% 
      left_join(clean_data.tool7$data %>% select(KEY, Sample_Type) , by ="KEY"),
    
    missing_qa_func(clean_data.tool7$Relevant_photos, tool7_image_vars) %>% 
      mutate(
        PARENT_KEY = str_sub(KEY, 1, 41)
      ) %>% 
      left_join(clean_data.tool7$data %>% select(KEY, Sample_Type) , by = c("PARENT_KEY" = "KEY")) %>% 
      select(-PARENT_KEY)
  ) %>% 
    mutate(tool = "Tool 7 - Shura", .before = "Sample_Type"),
  
  # Tool 8
  rbind(
    missing_qa_func(clean_data.tool8$data, tool8_image_vars),
    missing_qa_func(clean_data.tool8$Section_2_2_3_Attendance_Rec..., tool8_image_vars),
    missing_qa_func(clean_data.tool8$Students_Enrolment_Book, tool8_image_vars),
    missing_qa_func(clean_data.tool8$Classroom_Materials, tool8_image_vars),
    missing_qa_func(clean_data.tool8$Teacher_Kit, tool8_image_vars),
    missing_qa_func(clean_data.tool8$Student_Kit, tool8_image_vars),
    missing_qa_func(clean_data.tool8$Relevant_photos, tool8_image_vars)
  ) %>%
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  
  # Tool 9
  rbind(
    missing_qa_func(clean_data.tool9$data, tool9_image_vars),
    missing_qa_func(clean_data.tool9$Relevant_photos, tool9_image_vars)
  ) %>% 
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE")
  
) |> 
  mutate(Type = "Image") |> filter(!old_value %in% photo_qaed_values)

unique(missing_qa$old_value)
table(missing_qa$old_value)

# Checking the audio descriptions -----------------------------------------
tool1.audio_vars = c(
  "B12_Translation" = "B12",
  "B14_Translation" = "B14",
  "B16_Translation" = "B16",
  "B18_Translation" = "B18",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool2.audio_vars = c(
  "C14_Audio_Translation" = "C14_Audio",
  "C16_Yes_Translation" = "C16_Yes",
  "C17_Translation" = "C17",
  "Enumerator_Comments_Translation" = "Enumerator_Comments",
  "H2_Audio_Translation" = "H2_Audio",
  "H16_Audio_Translation" = "H16_Audio",
  "i2_Audio_Translation" = "i2_Audio",
  # "i16_Audio_Translation" = "i16_Audio", # The Translation column for this Audio is missing in the tool 2 raw data - Teacher Pack Group
  "J2_Audio_Translation" = "J2_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool3.audio_vars = c(
  "No_Please_Explain_Translation" = "No_Please_Explain",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool4.audio_vars = c(
  "G8_Translation" = "G8",
  "H3_Translation" = "H3",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool5.audio_vars = c(
  "C5_Other_Audio_Translation" = "C5_Other_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool6.audio_vars = c(
  "D6_Audio_Translation" = "D6_Audio",
  "D7_Audio_Translation" = "D7_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool7.audio_vars = c(
  "C16_Translation" = "C16",
  "D12_Translation" = "D12",
  "E5_Audio_Translation" = "E5_Audio",
  "E6_Yes_Translation" = "E6_Yes",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool8.audio_vars = c(
  "C12_Translation" = "C12",
  "C13_Translation" = "C13",
  "E19_Audio_Translation" = "E19_Audio",
  "J6_Translation" = "J6",
  "N2_Audio_Translation" = "N2_Audio",
  "O11_Audio_Translation" = "O11_Audio",
  "P2_Audio_Translation" = "P2_Audio",
  "Q11_Audio_Translation" = "Q11_Audio",
  "R2_Audio_Translation" = "R2_Audio",
  "S11_Audio_Translation" = "S11_Audio",
  "T5_Audio_Translation" = "T5_Audio",
  "W7_Audio_Translation" = "W7_Audio",
  "W8_Translation" = "W8",
  "W13_Translation" = "W13",
  "W16_Translation" = "W16",
  "W19_Translation" = "W19",
  "W22_Translation" = "W22",
  "Y6_Audio_Translation" = "Y6_Audio",
  "Y7_Audio_Translation" = "Y7_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

tool9.audio_vars = c(
  "A6_Audio_Translation" = "A6_Audio",
  "A15_Audio_Translation" = "A15_Audio",
  "B3_Audio_Translation" = "B3_Audio",
  "B9_Audio_Translation" = "B9_Audio",
  "C3_Audio_Translation" = "C3_Audio",
  "C5_Audio_Translation" = "C5_Audio",
  "Surveyor_Comments_Translation" = "Surveyor_Comments"
)

missing_audio_description <- rbind(
  # Tool 1
  rbind(
    missing_qa_func(clean_data.tool1$data, obj_cols = tool1.audio_vars)
  ) |> 
    mutate(tool = "Tool 1 - Headmaster", Sample_Type = "Public School"),
  
  # Tool 2
  rbind(
    missing_qa_func(clean_data.tool2$data, obj_cols = tool2.audio_vars),
    missing_qa_func(clean_data.tool2$Public_Stationary_Kit_Group, obj_cols = tool2.audio_vars)
  ) |> 
    mutate(tool = "Tool 2 - Light", Sample_Type = "Public School"),
  
  # Tool 3
  rbind(
    missing_qa_func(clean_data.tool3$data, obj_cols = tool3.audio_vars)
  ) |> 
    mutate(tool = "Tool 3 - Headcount", Sample_Type = "Public School"),
  
  # Tool 4
  rbind(
    missing_qa_func(clean_data.tool4$data, obj_cols = tool4.audio_vars)
  ) |> 
  mutate(tool = "Tool 4 - Teacher", Sample_Type = "Public School"),
  
  # Tool 5
  rbind(
    missing_qa_func(clean_data.tool5$data, obj_cols = tool5.audio_vars)
  ) |> 
    mutate(tool = "Tool 5 - WASH", Sample_Type = "Public School"),
  
  # Tool 6
  missing_qa_func(clean_data.tool6$data, obj_cols = tool6.audio_vars) |> 
    mutate(tool = "Tool 6 - Parent") |>
    left_join(clean_data.tool6$data |> select(KEY, Sample_Type), by = "KEY"),
  
  # Tool 7
  missing_qa_func(clean_data.tool7$data, obj_cols = tool7.audio_vars) |> 
    mutate(tool = "Tool 7 - Shura") |>
    left_join(clean_data.tool7$data |> select(KEY, Sample_Type), by = "KEY"),
  
  # Tool 8
  rbind(
    missing_qa_func(clean_data.tool8$data, obj_cols = tool8.audio_vars),
    missing_qa_func(clean_data.tool8$Section_2_2_3_Attendance_Rec..., obj_cols = tool8.audio_vars),
    missing_qa_func(clean_data.tool8$Classroom_Materials, obj_cols = tool8.audio_vars),
    missing_qa_func(clean_data.tool8$Teacher_Kit, obj_cols = tool8.audio_vars),
    missing_qa_func(clean_data.tool8$Student_Kit, obj_cols = tool8.audio_vars)
  ) |> 
    mutate(tool = "Tool 8 - Class", Sample_Type = "CBE"),
  
  missing_qa_func(clean_data.tool9$data, obj_cols = tool9.audio_vars) |> 
    mutate(tool = "Tool 9 - IP", Sample_Type = "CBE")
) |>
  mutate(Type = "Audio") |>
  filter(old_value == "" | is.na(old_value) | old_value == "NO CLEAR VOICE")


missing_qa <-  rbind(
  missing_qa,
  missing_audio_description
  )

# remove extra elements from environment
remove(missing_qa_func)

