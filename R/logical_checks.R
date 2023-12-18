library(glue)
# LOGIC CHECK

# Logging issues in Tool 1 ------------------------------------------------
# other_shifts <- clean_data.tool1$Other_Shifts_Detail |> 
#   left_join(
#     kobo_tool.tool1$choices |> 
#       filter(list_name == "shifts") |> 
#       mutate(Shift_Value = as.numeric(value)) |> 
#       select(Shift_Value, shift_name_other = 'label:English'),
#     by = "Shift_Value"
#   ) |> 
#   mutate(other_sifts = paste0(shift_name_other, "_", PARENT_KEY)) |> 
#   pull(other_sifts) |> 
#   unique()
  
lc_tool1 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool1$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 0 Flagging duplicated site visit ID
  clean_data.tool1$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 1 flagging if the gender of interviewee and her position is inconsistent
  clean_data.tool1$data |>
    filter(Gender_Of_Interviewee == "Female" & Interviewee_Respondent_Type == "Mullah Imam") |> 
    mutate(
      Issue = "The repondent's position doesn't match her gender!",
      Question = "Gender_Of_Interviewee",
      Old_value = Gender_Of_Interviewee,
      Related_question = "Interviewee_Respondent_Type",
      Related_value = Interviewee_Respondent_Type
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # # flagging inconsistent answers in A30 and C8
  # clean_data.tool1$data |>
  #   filter(
  #     (A30 == "Yes, fully converted to Islamic studies" & C8 != "Yes, fully converted to Islamic studies") |
  #     (A30 == "Yes, partially converted to Islamic studies" & C8 != "Yes, partially converted to Islamic studies") |
  #     (A30 != "Yes, fully converted to Islamic studies" & C8 == "Yes, fully converted to Islamic studies") |
  #     (A30 != "Yes, partially converted to Islamic studies" & C8 == "Yes, partially converted to Islamic studies")
  # ) |> 
  #   mutate(
  #     Issue = "The answer to A30 and C8 is inconsistent!",
  #     Question = "A30",
  #     Old_value = A30,
  #     Related_question = "C8",
  #     Related_value = C8
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
 
  # 3 Flagging if the school is closed due to WASH issues or lack of building but at the same time it is used as clinic, hospital or for MoE programs
  clean_data.tool1$data |>
    filter(
      B6 == "The school does not have a building or has infrastructural and WASH issues" &
        B7 %in% c("School building being used as a clinic/hospital", "School building being used for other MoE programs")
    ) |> 
    mutate(
      Issue = "The school has no building or it has WASH issues but at the same time it is used for MoE programs or as clinic/hospital!",
      Question = "B6",
      Old_value = B6,
      Related_question = "B7",
      Related_value = B7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ), 
  
  # 4 Flagging if both supportive respondents have the same position (especially when they are from position that there is only one in each school)
  clean_data.tool1$Support_Respondents |>
    filter(C12A3 %in% c("Deputy Teaching Affairs", "Executive Manager")) |> 
    group_by(PARENT_KEY) |> 
    filter(n() > 1) |> 
    mutate(
      Issue = glue("Both supportive respondents has the same position {C12A3}!"),
      Question = "C12A3",
      Old_value = C12A3,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 5 Flagging if the same shift is reported in both shift details sheet and other shift details sheet
  # clean_data.tool1$Shifts_Detail |>
  #   mutate(shifts_key = paste0(Shift_Name_Eng, "_", PARENT_KEY)) |> 
  #   filter(shifts_key %in% other_shifts) |> 
  #   mutate(
  #     Issue = "The same shift is reported in both shift details and other shift details sheets",
  #     Question = "Shift_Name_Eng",
  #     Old_value = Shift_Name_Eng,
  #     Related_question = "",
  #     Related_value = ""
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # 6 Flagging if respondent reported "No" to confirm the n of male teachers but later reported the same number of male teachers as it's in the sample
  clean_data.tool1$data |>
    filter(D2 == N_Male_Teachers) |>
    mutate(
      Issue = "The respondent reported 'No' to confirm the n of male teachers in (D1), but later reported the same number of male teachers as it's in the sample",
      Question = "D2",
      Old_value = D2,
      Related_question = "N_Male_Teachers",
      Related_value = N_Male_Teachers
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 8 Flagging if respondent reported "No" to confirm the n of female teachers but later reported the same number of female teachers as it's in the sample
  clean_data.tool1$data |>
    filter(D6 == N_Female_Teachers) |>
    mutate(
      Issue = "The respondent reported 'No' to confirm the n of female teachers in (D5), but later reported the same number of female teachers as it's in the sample",
      Question = "D6",
      Old_value = D6,
      Related_question = "N_Female_Teachers",
      Related_value = N_Female_Teachers
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 9 Flagging if the school is type female but male students are there
  clean_data.tool1$data |>
    filter(
      School_CBE_Gender_Based_On_The_Sample == "Girls" &
        A34 %in% c("Yes, school is open, and teachers and students (both male and female) are inside", "Yes, it is open and there are students (only male) and teachers inside")
      ) |>
    mutate(
      Issue = "The school is type female but male students are there!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "A34",
      Related_value = A34
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 10 Flagging if the school is type male but female students are there
  clean_data.tool1$data |>
    filter(
      School_CBE_Gender_Based_On_The_Sample == "Boys" &
        A34 %in% c("Yes, school is open, and teachers and students (both male and female) are inside", "Yes, it is open and there are students (only female) and teachers inside")
      ) |>
    mutate(
      Issue = "The school is type male but female students are there!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "A34",
      Related_value = A34
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 11 Flagging if the school is reported open without student and teacher, but reported a reason that it is closed - Light Issue
  # clean_data.tool1$data |>
  #   filter(A34 == "Yes, school is open, and there are only staff members but there are no teachers and students inside" & !is.na(B6) & B6 != "8888") |>
  #   mutate(
  #     Issue = "The school is reported open without student and teacher, but reported a reason that it is closed!",
  #     Question = "A34",
  #     Old_value = A34,
  #     Related_question = "B6",
  #     Related_value = B6
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # 12 Flagging if the school is type male but reported there are no female teachers as a result of recent bans as a reason for the closure of school
  clean_data.tool1$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & B6_3 == 1) |>
    mutate(
      Issue = "The school is type male but reported 'there are no female teachers as a result of recent bans' as a reason for the closure of school!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "B6",
      Related_value = B6
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 13 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  clean_data.tool1$data |>
    filter(A31 == "Madrassa (public)" & B9_3 == 1) |>
    mutate(
      Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!",
      Question = "A31",
      Old_value = A31,
      Related_question = "B9",
      Related_value = B9
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 14 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  clean_data.tool1$data |>
    filter(A31 == "Madrassa (public)" & B10_3 == 1) |>
    mutate(
      Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B10!",
      Question = "A31",
      Old_value = A31,
      Related_question = "B10",
      Related_value = B10
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 15 Flagging if the Consent is No
  clean_data.tool1$data |>
    filter(C3 == "No") |>
    mutate(
      Issue = "Consent is reported 'No'!",
      Question = "C3",
      Old_value = C3,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 16 Flagging if The School has only headmaster(s) but the designation of respondent is reported either Official or Acting Principal
  clean_data.tool1$data |>
    filter(C2 == "The school has only headmaster(s)" & C4 %in% c("Official Principal", "Acting Principal")) |>
    mutate(
      Issue = "The School has only headmaster(s) but the designation of respondent is reported either Official or Acting Principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4",
      Related_value = C4
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 17 Flagging if The School has only a deputy teaching manager and headmaster(s) but the designation of respondent is reported either Official or Acting Principal
  clean_data.tool1$data |>
    filter(C2 == "The school has a deputy teaching manager and headmaster(s) but not a principal" & C4 %in% c("Official Principal", "Acting Principal")) |>
    mutate(
      Issue = "The School has only a deputy teaching manager and headmaster(s) but the designation of respondent is reported either Official or Acting Principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4",
      Related_value = C4
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 18 Flagging if The School has a principal but in question C4_1 it is reported that school does not have a principal
  clean_data.tool1$data |>
    filter(C2 %in% c("The school has a principal, deputy teaching manager, and headmaster(s)", "The school has a principal and headmaster(s) but not a deputy teaching manager") &
             C4_1 == "The school does not have a principal and I fulfil the duties and responsibilities of the principal for this school") |>
    mutate(
      Issue = "The School has a principal but in question C4_1 it is reported that school does not have a principal",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4_1",
      Related_value = C4_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 19 Flagging if The School does not have a principal, but in question C4_1 it is reported either Principal is not present today or does not want to participate in the interview.
  clean_data.tool1$data |>
    filter(C2 %in% c("The school has a deputy teaching manager and headmaster(s) but not a principal", "The school has only headmaster(s)") &
             C4_1 %in% c("The school principal is not present today and I am officially acting principal in his/her absence",
                         "The school principal does not want to participate in interview, and I am officially delegated to participate in the interviews in his/her absence")) |>
    mutate(
      Issue = "The School does not have a principal, but in question C4_1 it is reported either Principal is not present today or does not want to participate in the interview.",
      Question = "C2",
      Old_value = C2,
      Related_question = "C4_1",
      Related_value = C4_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 20 Flagging if The question C8 and A30 has different responses.
  clean_data.tool1$data |>
    filter(C8 == "Yes, fully converted to Islamic studies" & A30 != "Yes, fully converted to Islamic studies") |>
    mutate(
      Issue = "The question C8 and A30 has different responses",
      Question = "C8",
      Old_value = C8,
      Related_question = "A30",
      Related_value = A30
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 21 Flagging if The question C8 and A30 has different responses.
  clean_data.tool1$data |>
    filter(C8 == "Yes, partially converted to Islamic studies" & A30 != "Yes, partially converted to Islamic studies") |>
    mutate(
      Issue = "The question C8 and A30 has different responses",
      Question = "C8",
      Old_value = C8,
      Related_question = "A30",
      Related_value = A30
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 22 Flagging if The question C8 and A30 has different responses.
  clean_data.tool1$data |>
    filter(C8 == "No, the school is a general studies school" & A30 != "No") |>
    mutate(
      Issue = "The question C8 and A30 has different responses",
      Question = "C8",
      Old_value = C8,
      Related_question = "A30",
      Related_value = A30
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # 23 Flagging if The question C9 and A31 has different responses.
  clean_data.tool1$data |>
    filter(C9 != A31) |>
    mutate(
      Issue = "The question C9 and A31 has different responses",
      Question = "C9",
      Old_value = C9,
      Related_question = "A31",
      Related_value = A31
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
  
  # 24 
  
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "data")


lc_tool1.school_operationality <- rbind(
  # Flagging if Grade ID is blank
  clean_data.tool1$School_Operationality |>
    filter(is.na(Grade_ID) | Grade_ID == "") |> 
    mutate(
      Issue = "The Grade ID is reported BLANK for this Site Visit ID!",
      Question = "Grade_ID",
      Old_value = Grade_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Grade_Name_Eng is blank
  clean_data.tool1$School_Operationality |>
    filter(is.na(Grade_Name_Eng) | Grade_Name_Eng == "") |> 
    mutate(
      Issue = "The Grade_Name_Eng is reported BLANK for this Site Visit ID!",
      Question = "Grade_Name_Eng",
      Old_value = Grade_Name_Eng,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated Grade ID
  clean_data.tool1$School_Operationality |>
    filter(duplicated(Grade_ID, fromLast = T) | duplicated(Grade_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Grade ID is duplicated for this Site Visit ID!",
      Question = "Grade_ID",
      Old_value = Grade_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if It is reported that Grade's classes are running for both Girls and Boys which is differed with Sampling information.
  clean_data.tool1$School_Operationality |>
    filter(C13A2 == "Both" & School_CBE_Gender_Based_On_The_Sample != "Mixed") |>
    mutate(
      Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running for both Girls and Boys which is differed with Sampling information."),
      Question = "C13A2",
      Old_value = C13A2,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if It is reported that Grade's classes are running only for Boys which is differed with Sampling information.
  clean_data.tool1$School_Operationality |>
    filter(C13A2 == "Boys" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Girls")) |>
    mutate(
      Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running only for Boys which is differed with Sampling information."),
      Question = "C13A2",
      Old_value = C13A2,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if It is reported that Grade's classes are running only for Girls which is differed with Sampling information.
  clean_data.tool1$School_Operationality |>
    filter(C13A2 == "Girls" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Boys")) |>
    mutate(
      Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running only for Girls which is differed with Sampling information."),
      Question = "C13A2",
      Old_value = C13A2,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if any Grade from census sampling were not included in the data for the Site Visit ID
  left_join(
    sample_file.cencus |>
      group_by(Visit_ID,Grade_ID) |>
      summarise(
        total_grade_sample = n()
      ) |> ungroup(),
    
    clean_data.tool1$School_Operationality |>
      group_by(Site_Visit_ID,Grade_ID) |>
      summarise(
        total_grades = n()
      ) |> ungroup()
    , by = "Grade_ID") |>
    filter(total_grade_sample != total_grades | is.na(total_grades)) |>
    mutate(
      Issue = "The Grade in sampling is not existed in dataset OR The Grade is existed more than 1",
      Question = "Grade_ID",
      Old_value = Grade_ID,
      Related_question = "Number in Sampling - Number in Data",
      Related_value = paste0(total_grade_sample," - ", total_grades),
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = "Public School",
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
    
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "School_Operationality", Old_value = as.character(Old_value))


lc_tool1.school_operationality_other <- rbind(
  # Flagging if It is reported that Grade's classes are running for both Girls and Boys which is differed with Sampling information.
  clean_data.tool1$School_Operationality_Other_... |>
    filter(C13A7 == "Both" & School_CBE_Gender_Based_On_The_Sample != "Mixed") |>
    mutate(
      Issue = paste0("It is reported that ", Grade_name, "'s classes are running for both Girls and Boys which is differed with Sampling information."),
      Question = "C13A7",
      Old_value = C13A7,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if It is reported that Grade's classes are running only for Boys which is differed with Sampling information.
  clean_data.tool1$School_Operationality_Other_... |>
    filter(C13A7 == "Boys" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Girls")) |>
    mutate(
      Issue = paste0("It is reported that ", Grade_name, "'s classes are running only for Boys which is differed with Sampling information."),
      Question = "C13A7",
      Old_value = C13A7,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
    
      # Flagging if It is reported that Grade's classes are running only for Girls which is differed with Sampling information.
  clean_data.tool1$School_Operationality_Other_... |>
    filter(C13A7 == "Girls" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Boys")) |>
    mutate(
      Issue = paste0("It is reported that ", Grade_name, "'s classes are running only for Girls which is differed with Sampling information."),
      Question = "C13A7",
      Old_value = C13A7,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "School_Operationality_Other_...", Old_value = as.character(Old_value))


lc_tool1.school_ope_both <- rbind(
  
  # Flagging if Duplicated Grade/s (Already reported in Operationality Sheet) reported in School Operationality Other
  bind_rows(
    clean_data.tool1$School_Operationality |>
      select(Site_Visit_ID, PARENT_KEY, Grade_Value = Grade_Name_Eng) |>
      group_by(Site_Visit_ID, PARENT_KEY, Grade_Value) |>
      mutate(Grade_Value = str_extract(Grade_Value,"\\d+"), sheet = "School_Operationality", Grade_ID_v = paste0(Site_Visit_ID,"-",Grade_Value)) |>
      filter(!is.na(Grade_Value) & Grade_Value != "" & !(duplicated(Grade_ID_v, fromLast = T) | duplicated(Grade_ID_v, fromLast = F))) |> ungroup() |> arrange(Grade_ID_v),
    
    clean_data.tool1$School_Operationality_Other_... |>
      select(Site_Visit_ID,PARENT_KEY,Grade_Value) |>
      group_by(Site_Visit_ID, PARENT_KEY, Grade_Value) |>
      mutate(Grade_Value = as.character(Grade_Value), sheet = "School_Operationality_Other_...", Grade_ID_v = paste0(Site_Visit_ID,"-",Grade_Value))  |>
      ungroup() |>
      filter(!is.na(Grade_Value) & Grade_Value != "" & !(duplicated(Grade_ID_v, fromLast = T) | duplicated(Grade_ID_v, fromLast = F))) |> arrange(Grade_ID_v)
  ) |>
    filter(duplicated(Grade_ID_v, fromLast = T) | duplicated(Grade_ID_v, fromLast = F)) |>
    arrange(Grade_ID_v) |>
    mutate(
      Issue = "The Grade reported in School Operationality Other sheet is already reported in School Operationality Sheet",
      Question = "Grade_ID",
      Old_value = Grade_ID_v,
      Related_question = "",
      Related_value = "",
      Sample_Type = "Public School",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      KEY = PARENT_KEY,
      tool = "Tool 1 - Headmaster",
      sheet = "School_Operationality & School_Operationality_Other_..."
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      tool,
      sheet
    )
  
)

lc_tool1.shift <- rbind(
  # Flagging if Grade ID is blank
  clean_data.tool1$Shifts_Detail |>
    filter(is.na(Shift_ID) | Shift_ID == "") |> 
    mutate(
      Issue = "The Shift ID is reported BLANK for this Site Visit ID!",
      Question = "Shift_ID",
      Old_value = Shift_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Shift_Name_Eng is blank
  clean_data.tool1$Shifts_Detail |>
    filter(is.na(Shift_Name_Eng) | Shift_Name_Eng == "") |> 
    mutate(
      Issue = "The Shift English Name is reported BLANK for this Site Visit ID!",
      Question = "Shift_Name_Eng",
      Old_value = Shift_Name_Eng,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated Grade ID
  clean_data.tool1$Shifts_Detail |>
    filter(duplicated(Shift_ID, fromLast = T) | duplicated(Shift_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Shift_ID is duplicated for this Site Visit ID!",
      Question = "Shift_ID",
      Old_value = Shift_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if any Shift from census sampling were not included in the data for the Site Visit ID
  left_join(
    sample_file.cencus |>
      group_by(Shift_ID) |>
      summarise(
        total_shift_sample = n()
      ) |> ungroup(),
    
    clean_data.tool1$Shifts_Detail |>
      group_by(Shift_ID) |>
      summarise(
        total_shifts_data = n()
      ) |> ungroup()
    , by = "Shift_ID") |>
    filter(total_shift_sample != total_shifts_data | is.na(total_shifts_data)) |>
    mutate(
      Issue = "The Shift in the sampling is not existed in dataset OR The Shift reported more than 1",
      Question = "Shift_ID",
      Old_value = Shift_ID,
      Related_question = "Number in Sampling - Number in Data",
      Related_value = paste0(total_shift_sample," - ", total_shifts_data),
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = "Public School",
      KEY = "",
      Site_Visit_ID = Shift_ID
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
  
)  |> mutate(tool = "Tool 1 - Headmaster", sheet = "Shifts_Detail", Old_value = as.character(Old_value))

lc_tool1.shift_other <- rbind(
  # Flagging if Grade ID is blank
  clean_data.tool1$Other_Shifts_Detail |>
     filter(is.na(Shift_name) | Shift_name == "") |> 
    mutate(
      Issue = "The Shift name is reported BLANK for this Site Visit ID!",
      Question = "Shift_name",
      Old_value = Shift_name,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Shift_Name_Eng is blank
  clean_data.tool1$Other_Shifts_Detail |>
    filter(is.na(Shift_Value) | Shift_Value == "") |> 
    mutate(
      Issue = "The Shift Value is reported BLANK for this Site Visit ID!",
      Question = "Shift_Value",
      Old_value = Shift_Value,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated Grade ID
  clean_data.tool1$Other_Shifts_Detail |>
    mutate(Shift_ID = paste0(Site_Visit_ID,"-",Shift_Value)) |>
    filter(duplicated(Shift_ID, fromLast = T) | duplicated(Shift_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Shift_ID is duplicated for this Site Visit ID!",
      Question = "Shift_ID",
      Old_value = Shift_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Other_Shifts_Detail", Old_value = as.character(Old_value))


lc_tool1.shift_both <- rbind(
  # Flagging if Duplicated Shift/s (Already reported in Shifts_Details Sheet) reported in Other_Shifts_Detail
  bind_rows(
    clean_data.tool1$Shifts_Detail |>
      select(Site_Visit_ID, PARENT_KEY, Shift_Name_Eng) |>
      group_by(Site_Visit_ID, PARENT_KEY, Shift_Name_Eng) |>
      filter(!is.na(Shift_Name_Eng) & Shift_Name_Eng != "") |>
      mutate(Sh_ID = paste0(Site_Visit_ID,"-", Shift_Name_Eng), sheet = "Shifts_Detail") |> ungroup(),
    
    clean_data.tool1$Other_Shifts_Detail |> 
      left_join(
        kobo_tool.tool1$choices |> 
          filter(list_name == "shifts") |> 
          mutate(Shift_Value = as.numeric(value)) |> 
          select(Shift_Value, Shift_Name_Eng = 'label:English'),
        by = "Shift_Value"
      ) |>
      select(Site_Visit_ID,PARENT_KEY,Shift_Name_Eng) |>
      group_by(Site_Visit_ID, PARENT_KEY, Shift_Name_Eng) |>
      filter(!is.na(Shift_Name_Eng) & Shift_Name_Eng != "") |>
      mutate(Sh_ID = paste0(Site_Visit_ID,"-", Shift_Name_Eng), sheet = "Other_Shifts_Detail") |> ungroup()
  ) |>
    filter(duplicated(Sh_ID, fromLast = T) | duplicated(Sh_ID, fromLast = F)) |>
    arrange(Sh_ID) |>
    mutate(
      Issue = "The Shift reported in Other_Shifts_Detail sheet is already reported in Shift_Detail Sheet",
      Question = "Shift ID (Calculated)",
      Old_value = Sh_ID,
      Related_question = "",
      Related_value = "",
      Sample_Type = "Public School",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      KEY = PARENT_KEY
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Shifts_Detail & Other_Shifts_Detail", Old_value = as.character(Old_value))


shifts_and_operationality <- clean_data.tool1$Shifts_Detail |>
  left_join(
    bind_rows(
      clean_data.tool1$School_Operationality |>
        select(Site_Visit_ID ,Grade_ID, is_operational = C13A1, Grade_Name_Eng) |>
        mutate(sheet = "School_Operationality", Grade_Value = str_extract(Grade_Name_Eng, "\\d+")) |>
        filter(is_operational == "No" & !is.na(Grade_ID) & Grade_ID != "") |> # is_operational == "Yes" &
        # select(Site_Visit_ID, Grade_ID, is_operational,  sheet, Grade_Value)
        select(Site_Visit_ID, is_operational, Grade_Value)
      ,
      clean_data.tool1$School_Operationality_Other_... |>
        filter(!is.na(Grade_Value) & Grade_Value != "" & C13A6 == "No") |>
        mutate(Grade_ID = paste0(Site_Visit_ID,"-", Grade_Value), sheet = "School_Operationality_Other_...", Grade_Value = as.character(Grade_Value)) |>
        # select(Site_Visit_ID ,Grade_ID, is_operational = C13A6,  sheet, Grade_Value)
        select(Site_Visit_ID, is_operational = C13A6, Grade_Value)
    ) |>
      # arrange(Grade_ID) |>
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length)
    , by = "Site_Visit_ID" ) |>
  filter(is_operational == "No")

lc_tool1.shift_operationality_and_other <- rbind(
  # Flagging if a not operational grade is reported for the shift
  # Grade 1
  if("grade_1" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_1 == 1 & grade_1 == 1) |>
      mutate(
        Issue = "Grade 1 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 2
  if("grade_2" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_2 == 1 & grade_2 == 1) |>
      mutate(
        Issue = "Grade 2 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 3
  if("grade_3" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_3 == 1 & grade_3 == 1) |>
      mutate(
        Issue = "Grade 3 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 4
  if("grade_4" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_4 == 1 & grade_4 == 1) |>
      mutate(
        Issue = "Grade 4 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 5
  if("grade_5" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_5 == 1 & grade_5 == 1) |>
      mutate(
        Issue = "Grade 5 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 6
  if("grade_6" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_6 == 1 & grade_6 == 1) |>
      mutate(
        Issue = "Grade 6 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 7
  if("grade_7" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_7 == 1 & grade_7 == 1) |>
      mutate(
        Issue = "Grade 7 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 8
  if("grade_8" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_8 == 1 & grade_8 == 1) |>
      mutate(
        Issue = "Grade 8 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 9
  if("grade_9" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_9 == 1 & grade_9 == 1) |>
      mutate(
        Issue = "Grade 9 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 10
  if("grade_10" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_10 == 1 & grade_10 == 1) |>
      mutate(
        Issue = "Grade 10 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 11
  if("grade_11" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_11 == 1 & grade_11 == 1) |>
      mutate(
        Issue = "Grade 11 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 12
  if("grade_12" %in% names(shifts_and_operationality)){
    shifts_and_operationality |>
      filter(C14A2_12 == 1 & grade_12 == 1) |>
      mutate(
        Issue = "Grade 12 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A2",
        Old_value = C14A2,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  }
)  |> mutate(tool = "Tool 1 - Headmaster", sheet = "Shifts_Detail", Old_value = as.character(Old_value))


shifts_other_and_operationality <- clean_data.tool1$Other_Shifts_Detail |>
  left_join(
    bind_rows(
      clean_data.tool1$School_Operationality |>
        select(Site_Visit_ID ,Grade_ID, is_operational = C13A1, Grade_Name_Eng) |>
        mutate(sheet = "School_Operationality", Grade_Value = str_extract(Grade_Name_Eng, "\\d+")) |>
        filter(is_operational == "No" & !is.na(Grade_ID) & Grade_ID != "") |> # is_operational == "Yes" &
        # select(Site_Visit_ID, Grade_ID, is_operational,  sheet, Grade_Value)
        select(Site_Visit_ID, is_operational, Grade_Value)
      ,
      clean_data.tool1$School_Operationality_Other_... |>
        filter(!is.na(Grade_Value) & Grade_Value != "" & C13A6 == "No") |>
        mutate(Grade_ID = paste0(Site_Visit_ID,"-", Grade_Value), sheet = "School_Operationality_Other_...", Grade_Value = as.character(Grade_Value)) |>
        # select(Site_Visit_ID ,Grade_ID, is_operational = C13A6,  sheet, Grade_Value)
        select(Site_Visit_ID, is_operational = C13A6, Grade_Value)
    ) |>
      # arrange(Grade_ID) |>
      pivot_wider(names_from = Grade_Value, values_from = Grade_Value, values_fill = 0, names_prefix = "grade_", values_fn = length)
    , by = "Site_Visit_ID" ) |>
  filter(is_operational == "No")


lc_tool1.shift_other_operationality_and_other <- rbind(
  # Flagging if a not operational grade is reported for the shift
  # Grade 1
  if("grade_1" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_1 == 1 & grade_1 == 1) |>
      mutate(
        Issue = "Grade 1 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 2
  if("grade_2" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_2 == 1 & grade_2 == 1) |>
      mutate(
        Issue = "Grade 2 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 3
  if("grade_3" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_3 == 1 & grade_3 == 1) |>
      mutate(
        Issue = "Grade 3 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 4
  if("grade_4" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_4 == 1 & grade_4 == 1) |>
      mutate(
        Issue = "Grade 4 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 5
  if("grade_5" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_5 == 1 & grade_5 == 1) |>
      mutate(
        Issue = "Grade 5 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 6
  if("grade_6" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_6 == 1 & grade_6 == 1) |>
      mutate(
        Issue = "Grade 6 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 7
  if("grade_7" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_7 == 1 & grade_7 == 1) |>
      mutate(
        Issue = "Grade 7 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 8
  if("grade_8" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_8 == 1 & grade_8 == 1) |>
      mutate(
        Issue = "Grade 8 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 9
  if("grade_9" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_9 == 1 & grade_9 == 1) |>
      mutate(
        Issue = "Grade 9 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 10
  if("grade_10" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_10 == 1 & grade_10 == 1) |>
      mutate(
        Issue = "Grade 10 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 11
  if("grade_11" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_11 == 1 & grade_11 == 1) |>
      mutate(
        Issue = "Grade 11 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  },
  # Grade 12
  if("grade_12" %in% names(shifts_other_and_operationality)){
    shifts_other_and_operationality |>
      filter(C14A3_12 == 1 & grade_12 == 1) |>
      mutate(
        Issue = "Grade 12 selected as conducted grade for this shift is reported not operational in either Operationality or Operationality Other sheet!",
        Question = "C14A3",
        Old_value = C14A3,
        Related_question = "C13A1 OR C13A6(School_Operationality OR School_Operationality_Other_...)",
        Related_value = is_operational
      ) |> 
      select(
        all_of(meta_cols),
        Question,
        Old_value,
        Related_question,
        Related_value,
        KEY,
        Issue
      )
  }
  
)  |> mutate(tool = "Tool 1 - Headmaster", sheet = "Other_Shifts_Detail", Old_value = as.character(Old_value))

# Logging issues in Tool 2 ------------------------------------------------
lc_tool2 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool2$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool2$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the school name is confirmed in tool1 but not confirmed here or vice versa
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A27.tool1 = A27, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(B1 != A27.tool1) |> 
    mutate(
      Issue = "The school name is confirmed in tool1 but not confirmed tool 2 or vice versa!",
      Question = "B1",
      Old_value = B1,
      Related_question = "A27.tool1",
      Related_value = A27.tool1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the answer to conversion of school to a Islamic school is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A30.tool1 = A30, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(B3 != A30.tool1) |> 
    mutate(
      Issue = "The answer to conversion of school to an Islamic school is inconsistent across tool 1 and tool 2!",
      Question = "B3",
      Old_value = B3,
      Related_question = "A30.tool1",
      Related_value = A30.tool1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the answer to question related to open/closed status of school is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A34.tool1 = A34, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(
      (B7 == "Yes, school is open, teachers and students (both male and female) are inside" & A34.tool1 != "Yes, school is open, and teachers and students (both male and female) are inside ") |
        (B7 == "Yes, it is open and there are students (only male) and teachers inside" & A34.tool1 != "Yes, it is open and there are students (only male) and teachers inside ") |
        (B7 == "Yes, it is open and there are students (only female) and teachers inside" & A34.tool1 != "Yes, it is open and there are students (only female) and teachers inside ")|
        (B7 == "Yes, school is open and there are only teachers and no students inside" & A34.tool1 != "Yes, school is open and there are only teachers and no students inside")|
        (B7 == "Yes, school is open, and there are only staff members but there are no teachers and students inside" & A34.tool1 != "Yes, school is open, and there are only staff members but there are no teachers and students inside")|
        (B7 == "No, school is closed and there is no one inside" & A34.tool1 != "No, school is closed and there is no one inside")
    ) |> 
    mutate(
      Issue = "The answer to question related to open/closed status of school is inconsistent across tool 1 and tool 2!",
      Question = "B7",
      Old_value = B7,
      Related_question = "A34.tool1",
      Related_value = A34.tool1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if any of the choices of C7 is selected in tool 1 but not in tool 2 or vice versa
  # Omitted
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(starts_with("B6"), Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(
  #     C7_1 != B6_1 | C7_2 != B6_2 | C7_3 != B6_3 | C7_4 != B6_4 | C7_5 != B6_5 | C7_6 != B6_6 | C7_7 != B6_7 | C7_8 != B6_8 | C7_9!= B6_9 |
  #       C7_10 != B6_10 | C7_11 != B6_11 | C7_12 != B6_12 | C7_12 != B6_12 | C7_13 != B6_13 | C7_14 != B6_14 | C7_15 != B6_15
  #   ) |> 
  #   mutate(
  #     Issue = "Same response to 'Can you tell me why this school is closed?' across tool 1 and tool 2 is inconsistent!",
  #     Question = "C7",
  #     Old_value = C7,
  #     Related_question = "B6",
  #     Related_value = B6
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   ),
  
  # flagging if the answer to 'What is the school building being used for?' is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(B7.tool1 = B7, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(C8 != B7.tool1) |> 
    mutate(
      Issue = "The answer to 'What is the school building being used for?' is inconsistent across tool 1 and tool 2!",
      Question = "C8",
      Old_value = C8,
      Related_question = "B7.tool1",
      Related_value = B7.tool1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the answer to 'When did the school close?' is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(B8.tool1 = B8, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(C10 != B8.tool1) |> 
    mutate(
      Issue = "The answer to 'When did the school close?' is inconsistent across tool 1 and tool 2!",
      Question = "C10",
      Old_value = C10,
      Related_question = "B8.tool1",
      Related_value = B8.tool1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the answer to 'Where are male children and adults going for schooling since the school was closed?' is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |>
    left_join(
      clean_data.tool1$data |>
        select(starts_with("B9"), Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |>
    filter(
      C11_1 != B9_1 |
        C11_2 != B9_2 |
        C11_3 != B9_3 |
        C11_4 != B9_4 |
        C11_5 != B9_5 |
        C11_6 != B9_6
    ) |>
    mutate(
      Issue = "The answer to this question is inconsistent across tool 1 and tool 2!",
      Question = "C11",
      Old_value = C11,
      Related_question = "B9",
      Related_value = B9
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # flagging if the answer to 'Where are female children and adults going for schooling since the school was closed?' is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |>
    left_join(
      clean_data.tool1$data |>
        select(starts_with("B10"), Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |>
    filter(
      C12_1 != B10_1 |
      C12_2 != B10_2 |
      C12_3 != B10_3 |
      C12_4 != B10_4 |
      C12_5 != B10_5 |
      C12_6 != B10_6
      ) |>
    mutate(
      Issue = "The answer to this question is inconsistent across tool 1 and tool 2!",
      Question = "C12",
      Old_value = C12,
      Related_question = "B10",
      Related_value = B10
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if number of Shifts in tool 2 Question D1 is inconsistent with Tool1 - Shifts Details Sheet  Total Running Shifts
  clean_data.tool2$data |>
    left_join(
      clean_data.tool1$Shifts_Detail |>
        filter(C14A1 == "Yes") |>
        group_by(Site_Visit_ID) |>
        summarise(total_running_shifts = n()) |>
        ungroup() , by = "Site_Visit_ID") |>
    filter(!is.na(total_running_shifts) & ((D1 == "Single" & total_running_shifts > 1) | (D1 == "Multiple" & total_running_shifts == 1))) |>
    mutate(
      Issue = "The number of Shifts in tool 2 Question D1 is inconsistent with Tool1 - Shifts Details Sheet for Total Running Shifts!",
      Question = "D1",
      Old_value = D1,
      Related_question ="", #"Total Running Shift (Tool 1 - Shifts_Detail Sheet)",
      Related_value = total_running_shifts
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if The Head staff of school reported different between tool 2 and tool 1
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |>
    left_join(
      clean_data.tool1$data |>
        select(C2.tool1 = C2, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |>
    filter(!is.na(C2.tool1) & (D2 != "Other" & C2.tool1 != "Other") & D2 != C2.tool1) |>
    mutate(
      Issue = "The Head staff of school reported different between tool 2 and tool 1",
      Question = "D2",
      Old_value = D2,
      Related_question = "C2(Tool 1)",
      Related_value = C2.tool1
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
  
  
  ) |> 
  mutate(tool = "Tool 2 - Light", sheet = "data", Old_value = as.character(Old_value))

# Logging issues in Tool 3 ------------------------------------------------
lc_tool3 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool3$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps)),
      sheet = "data"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool3$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = "",
      sheet = "data"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the answer to 'Is the school Islamic education school?' is inconsistent across tool 1 and tool 3
  clean_data.tool3$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A30.tool1 = A30, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(
      B6 != A30.tool1 &
        !(B6 == "No, the school is a general studies school" & A30.tool1 == "No") &
        !(B6 == "Yes , fully converted to Islamic studies" & A30.tool1 == "Yes, fully converted to Islamic studies")
    ) |> 
    mutate(
      Issue = "The answer to 'Is the school Islamic education school?' is inconsistent across tool 1 and tool 3!",
      Question = "B6",
      Old_value = B6,
      Related_question = "A30.tool1",
      Related_value = A30.tool1,
      sheet = "data"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the answer to 'If yes, what type of Islamic school is it?' is inconsistent across tool 1 and tool 3
  clean_data.tool3$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A31.tool1 = A31, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    filter(B7 != A31.tool1) |> 
    mutate(
      Issue = "The answer to 'If yes, what type of Islamic school is it?' is inconsistent across tool 1 and tool 3!",
      Question = "B7",
      Old_value = B7,
      Related_question = "A31.tool1",
      Related_value = A31.tool1,
      sheet = "data"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the answer to 'School type' is inconsistent across tool 1 and tool 3
  clean_data.tool3$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(starts_with("School_Type_SV"), Site_Visit_ID),
      by = "Site_Visit_ID",
      suffix = c("", ".tool1")
    ) |> 
    filter(
      School_Type_SV_1 != School_Type_SV_1.tool1 |
      School_Type_SV_2 != School_Type_SV_2.tool1 |
      School_Type_SV_3 != School_Type_SV_3.tool1
      ) |> 
    mutate(
      Issue = "The answer to 'School type' is inconsistent across tool 1 and tool 3!",
      Question = "School_Type_SV",
      Old_value = School_Type_SV,
      Related_question = "School_Type_SV.tool1",
      Related_value = School_Type_SV.tool1,
      sheet = "data"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is equal to survey date but no is selected in D3
  clean_data.tool3$Todays_Attendance_Detail |>
    filter(D2 == format.Date(starttime, "%Y-%m-%d") & D3 == "No") |>  # FIXME: make sure to convert the D2 var to date in convert_numbers_to_date_module
    mutate(
      Issue = "The date in D2 is equal to survey date, but in D3 'No' is selected!",
      Question = "D2",
      Old_value = D2,
      Related_question = "D3",
      Related_value = D3,
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is not equal to survey date but yes is selected in D3
  clean_data.tool3$Todays_Attendance_Detail |>
    filter(D1 == "Yes" & D2 != format.Date(starttime, "%Y-%m-%d") & D3 == "Yes") |> 
    mutate(
      Issue = "The date in D2 is not equal to survey date, but in D3(confirmed D2 is equal to the day of interview) 'Yes' is selected!",
      Question = "D2",
      Old_value = as.character(D2),
      Related_question = "D3",
      Related_value = D3,
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the selected date in D2 is in future
  clean_data.tool3$Todays_Attendance_Detail |>
    filter(D2 > format.Date(starttime, "%Y-%m-%d")) |>
    mutate(
      Issue = "The date in D2 is in the future!",
      Question = "D2",
      Old_value = as.character(D2),
      Related_question = "",
      Related_value = "", 
      sheet = "Todays_Attendance_Detail"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if the recorded date in D5 is greater than today
  clean_data.tool3$LastWeek_Attendance_Detail |>
    filter(D5 >= format.Date(starttime, "%Y-%m-%d")) |> #FIXME: make sure to include D5 in convert_numbers_to_date_time.R
    mutate(
      Issue = "The date in D5 is in future!",
      Question = "D5",
      Old_value = as.character(D5),
      Related_question = "",
      Related_value = "",
      sheet = "LastWeek_Attendance_Detail"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if school is type male but females are among the students
  clean_data.tool3$Student_Headcount |>
    left_join(
      clean_data.tool3$data |> 
        select(School_CBE_Gender_Based_On_The_Sample, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E3A2 > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
    mutate(
      Issue = "The school is type male, but in the count female students are reported!",
      Question = "E3A2",
      Old_value = E3A2,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample,
      sheet = "Student_Headcount"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if school is type male but females are among the students
  clean_data.tool3$Student_Headcount |>
    left_join(
      clean_data.tool3$data |> 
        select(School_CBE_Gender_Based_On_The_Sample, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E5_Female > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
    mutate(
      Issue = "The school is type male, but in the count female students are reported!",
      Question = "E5_Female",
      Old_value = E5_Female,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample,
      sheet = "Student_Headcount"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if school is type female but males are among the students
  clean_data.tool3$Student_Headcount |>
    left_join(
      clean_data.tool3$data |> 
        select(School_CBE_Gender_Based_On_The_Sample, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E3A1 > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls") |>
    mutate(
      Issue = "The school is type female, but in the count male students are reported!",
      Question = "E3A1",
      Old_value = E3A1,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample,
      sheet = "Student_Headcount"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    ),
  
  # flagging if school is type female but males are among the students
  clean_data.tool3$Student_Headcount |>
    left_join(
      clean_data.tool3$data |> 
        select(School_CBE_Gender_Based_On_The_Sample, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E5_Male > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls") |>
    mutate(
      Issue = "The school is type female, but in the count male students are reported!",
      Question = "E5_Male",
      Old_value = E5_Male,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample,
      sheet = "Student_Headcount"
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue,
      sheet
    )
  ) |> 
  mutate(tool = "Tool 3 - Headcount", sheet = "Student_Headcount", Old_value = as.character(Old_value))


# Logging issues in Tool 4 ------------------------------------------------
lc_tool4 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool4$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging more or less than 3 sites visit ID
  clean_data.tool4$data |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type, Sample_Type) |>
    summarise(n_site_visit_ids = n()) |>
    filter(n_site_visit_ids != 3) |> 
    mutate(
      Issue = "There are either less or more than 3 interviews for this Site Visit ID!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "n_site_visit_ids",
      Related_value = as.character(n_site_visit_ids),
      starttime =as.character( NA_POSIXct_),
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the grades selected in D8 but reported nonoperational in C13A1 of tool 1
  clean_data.tool4$data |>
    select(all_of(meta_cols), starts_with("D8"), -D8, KEY) |>
    pivot_longer(cols = D8_1:D8_12, names_to = "grade") |>
    filter(value == 1) |>
    mutate(
      grade = str_extract(grade, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grade)
    ) |>
    select(-value) |>
    left_join(
      clean_data.tool1$School_Operationality |>
        filter(!is.na(Grade_Name_Eng) & Grade_Name_Eng != "") |>
        mutate(Grade_ID_calc_v = str_extract(Grade_Name_Eng, "\\d+"), Grade_ID_calc = paste0(Site_Visit_ID,"-",Grade_ID_calc_v)) |> 
        filter(Grade_ID_calc != "" & !is.na(Grade_ID_calc) & !(duplicated(Grade_ID_calc, fromLast = T) | duplicated(Grade_ID_calc, fromLast = F))) |>
        select(Grade_ID, C13A1, Grade_ID_calc),
      by = "Grade_ID_calc"
    ) |>
    filter(C13A1 == "No") |>
    mutate(
      Issue = "The selected grade in D8 is reported non-operational in question C13A1 of tool 1!",
      Question = "D8",
      Old_value = grade,
      Related_question = "C13A1 (Tool 1) AND Grade_ID (Tool 1)",
      Related_value = paste0(C13A1," AND ",Grade_ID)
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
  
  # Flagging if the changes in girls enrollment is inconsistent in comparison to tool 1
  # TS : Omitted for now
  # clean_data.tool4$data |>
  #   left_join(
  #     clean_data.tool1$data |> 
  #       distinct(Site_Visit_ID, .keep_all = T) |> 
  #       select(E1.tool1 = E1, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(E1 != E1.tool1) |> 
  #   mutate(
  #     Issue = "The changes in girls enrollment is inconsistent in comparison to tool 1!",
  #     Question = "E1",
  #     Old_value = E1,
  #     Related_question = "E1.tool1",
  #     Related_value = E1.tool1
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue
  #   )
) |> 
  mutate(tool = "Tool 4 - Teacher", sheet = "data", Old_value = as.character(Old_value))


# Logging issues in Tool 5 ------------------------------------------------
lc_tool5 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool5$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool5$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Flagging if all type of Toilets (Male, Female, Unisex) is reported 0 but also reported Toilets are under construction
  clean_data.tool5$data |>
    filter(C5 == "The toilets are under construction" & (C6_Male + C6_Female + C6_Unisex) <= 0) |> 
    mutate(
      Issue = "All type of Toilets (Male, Female, Unisex) is reported 0 but also reported Toilets are under construction",
      Question = "C5",
      Old_value = C5,
      Related_question = "C6_Male + C6_Female + C6_Unisex",
      Related_value = as.character(C6_Male + C6_Female + C6_Unisex)
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if all type of Usable and non-usable Toilets (Male, Female, Unisex) is reported 0
  clean_data.tool5$data |>
    filter((C9_1 + C9_2 + C9_3) <= 0) |> 
    mutate(
      Issue = "All type of Usable and non-Usable Toilets (Male, Female, Unisex) is reported 0",
      Question = "C9_1 + C9_2 + C9_3",
      Old_value = as.character(C9_1 + C9_2 + C9_3),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if A Usable toilet is reported but no photo taken for it in repeat sheet Useable_Toilets
  clean_data.tool5$data |>
    left_join(
      clean_data.tool5$Useable_Toilets |>
        group_by(KEY = PARENT_KEY) |>
        summarise(total_photo = n()) |>
        ungroup(), by = "KEY") |>
    mutate(
      total_usable_toilets = rowSums(across(c(C9_4, C9_5, C9_6)), na.rm = T)
    ) |>
    filter(total_usable_toilets > 0 & (total_photo < 2 | is.na(total_photo)) ) |>
    mutate(
      Issue = "Usable toilet is reported but no photo taken for it in repeat sheet Useable_Toilets",
      Question = "total_usable_toilets(Calculated)",
      Old_value = total_usable_toilets,
      Related_question = "total_photo(Calculated)",
      Related_value = total_photo
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if A Non-Usable toilet is reported but no photo taken for it in repeat sheet Non_Useable_Toilets
  clean_data.tool5$data |>
    left_join(
      clean_data.tool5$Non_Useable_Toilets |>
        group_by(KEY = PARENT_KEY) |>
        summarise(total_photo = n()) |>
        ungroup(), by = "KEY") |>
    mutate(
      total_nonusable_toilets = rowSums(across(c(C9_7, C9_8, C9_9)), na.rm = T)
    ) |>
    filter(total_nonusable_toilets > 0 & (total_photo < 2 | is.na(total_photo)) ) |>
    mutate(
      Issue = "Non-Usable toilet is reported but no photo taken for it in repeat sheet Non_Useable_Toilets",
      Question = "total_nonusable_toilets(Calculated)",
      Old_value = total_nonusable_toilets,
      Related_question = "total_photo(Calculated)",
      Related_value = total_photo
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 5 - WASH", sheet = "data", Old_value = as.character(Old_value))

# Logging issues in Tool 6 ------------------------------------------------
lc_tool6 <- rbind(
  # Flagging interview conducted before the first day of data collection - Public School
  clean_data.tool6$data |>
    filter(Sample_Type == "Public School" & starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging interview conducted before the first day of data collection - CBE
  clean_data.tool6$data |>
    filter(Sample_Type == "CBE" & starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging more or less than 4 sites visit ID - Public School
  clean_data.tool6$data |>
    filter(Sample_Type == "Public School") |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type, Sample_Type) |>
    summarise(n_site_visit_ids = n()) |>
    filter(n_site_visit_ids != 4) |> 
    mutate(
      Issue = "There are either less or more than 4 interviews for this Site Visit ID!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "n_site_visit_ids",
      Related_value = as.character(n_site_visit_ids),
      starttime = as.character(NA_POSIXct_),
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging more or less than 4 sites visit ID - CBE
  clean_data.tool6$data |>
    filter(Sample_Type == "CBE") |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type, Sample_Type) |>
    summarise(n_site_visit_ids = n()) |>
    filter(n_site_visit_ids != 4) |> 
    mutate(
      Issue = "There are either less or more than 4 interviews for this Site Visit ID!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "n_site_visit_ids",
      Related_value = as.character(n_site_visit_ids),
      starttime = as.character(NA_POSIXct_),
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Duplicated combination of Respondent Name and both Phone Numbers for a Site Visit ID
  clean_data.tool6$data |>
    mutate(
      parent_id = paste(Sample_Type, Site_Visit_ID, Respondent_Name, Respondent1_Phone_Number, Respondent2_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(parent_id, fromLast = T) | duplicated(parent_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her phone numbers are duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Duplicated combination of Respondent Name and first Phone Number for a Site Visit ID
  clean_data.tool6$data |>
    mutate(
      parent_id = paste(Sample_Type, Site_Visit_ID, Respondent_Name, Respondent1_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(parent_id, fromLast = T) | duplicated(parent_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her first phone number is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Duplicated Respondent Name for a Site Visit ID
  clean_data.tool6$data |>
    mutate(
      parent_id = paste(Sample_Type, Site_Visit_ID, Respondent_Name, sep = "-")
    ) |>
    filter(duplicated(parent_id, fromLast = T) | duplicated(parent_id, fromLast = F)) |>
    mutate(
      Issue = "The Respondent Name is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Flagging if the household size reported 1 or less
  clean_data.tool6$data |>
    filter(B3 <= 1 | is.na(B3)) |>
    mutate(
      Issue = "The Household size is reported less than or equal to 1!",
      Question = "B3",
      Old_value = B3,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the HH members involved in income earning is reported more than HH members
  clean_data.tool6$data |>
    filter(B4 > B3) |>
    mutate(
      Issue = "The Household members involved in income earning is reported more than Household members!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B3",
      Related_value = B3
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the HH members involved in income earning is reported 0 but also an occupation is selected
  clean_data.tool6$data |>
    filter(B4 <= 0 & B5 %in% c("Daily labourer (construction)","Driver","Farmer","Health care worker","Shop owner","Trader","Teacher", "Other")) |>
    mutate(
      Issue = "The Household members involved in income earning is reported 0 but also an occupation is selected!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B5",
      Related_value = B5
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the HH members involved in income earning is reported more than 0 but also reported no occupation
  clean_data.tool6$data |>
    filter(B4 > 0 & B5 %in% c("No occupation and live based on remittance","No occupation and live based on humanitarian assistance")) |>
    mutate(
      Issue = "The Household members involved in income earning is reported more than 0 but also reported no occupation for question B5!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B5",
      Related_value = B5
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the HH members involved in income earning is reported 0 but also reported a monthly income
  clean_data.tool6$data |>
    filter(B4 <= 0 & (B6 > 0 & B6 != 8888 & B6 != 9999)) |>
    mutate(
      Issue = "The Household members involved in income earning is reported 0 but also reported a monthly income!",
      Question = "B4",
      Old_value = B4,
      Related_question = "B6",
      Related_value = B6
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if All is selected for girls between 13-18 yrs old attending school
  clean_data.tool6$data |>
    filter(C5 == "All") |>
    mutate(
      Issue = "'All' is selected for question girls between 13-18 years old attending school, please confirm the response.",
      Question = "C5",
      Old_value = C5,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
    
  # Flagging if Reported Subject has been added but reported 0 for the number of subjects
  clean_data.tool6$data |>
    filter(D3_2 == 1 & D4_N <= 0) |>
    mutate(
      Issue = "Reported Subject has been added but also reported 0 for the number of subjects",
      Question = "D4_N",
      Old_value = D4_N,
      Related_question = "D3",
      Related_value = D3
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if The reason for improvement of education quality is reported 'More teachers', but also repoted lack of teacher for decreasing attendance
  clean_data.tool6$data |>
    filter(D13_2 == 1 & (C10_3 == 1 | C7_1 == 1)) |>
    mutate(
      Issue = "The reason for improvement of education quality is reported 'More teachers', but also reported lack of teacher for decreasing attendance",
      Question = "D13",
      Old_value = D13,
      Related_question = "C10 | C7",
      Related_value = paste0(C10, " | ", C7)
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  clean_data.tool6$data |>
    filter(E3_3 == 1 & E5_2 == 1) |>
    mutate(
      Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
      Question = "E3",
      Old_value = E3,
      Related_question = "E5",
      Related_value = E5
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if reported that it is Safer to traveling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school
  clean_data.tool6$data |>
    filter(F3 == "Safer" & F11 == "Female" & F12_1 == "Extremely vulnerable") |>
    mutate(
      Issue = "Reported that it is Safer to traverling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school",
      Question = "F3",
      Old_value = F3,
      Related_question = "F12_1",
      Related_value = F12_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if reported that it is Less safe to traveling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school
  clean_data.tool6$data |>
    filter(F3 == "Less safe" & F11 == "Female" & F12_1 == "Not vulnerable") |>
    mutate(
      Issue = "Reported that it is less safer to traverling to/from school, but also reported his/her girl is not vulnerable to traveling to/from school",
      Question = "F3",
      Old_value = F3,
      Related_question = "F12_1",
      Related_value = F12_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  
  # Flagging if reported that it is Safer to traveling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school
  clean_data.tool6$data |>
    filter(F6 == "Safer" & F11 == "Male" & F12_1 == "Extremely vulnerable") |>
    mutate(
      Issue = "Reported that it is Safer to traverling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school",
      Question = "F6",
      Old_value = F6,
      Related_question = "F12_1",
      Related_value = F12_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if reported that it is Less safe to traveling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school
  clean_data.tool6$data |>
    filter(F6 == "Less safe" & F11 == "Male" & F12_1 == "Not vulnerable") |>
    mutate(
      Issue = "Reported that it is less safer to traverling to/from school, but also reported his/her boy is not vulnerable to traveling to/from school",
      Question = "F6",
      Old_value = F6,
      Related_question = "F12_1",
      Related_value = F12_1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 6 - Parent", sheet = "data", Old_value = as.character(Old_value))


# Logging issues in Tool 7 ------------------------------------------------
# Flagging interview conducted before the first day of data collection - Public School
lc_tool7 <- rbind(
  clean_data.tool7$data |>
    filter(Sample_Type == "Public School" & starttime < janitor::convert_to_date(data_collection_start_date_ps)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_ps",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_ps))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging interview conducted before the first day of data collection - CBE
  clean_data.tool7$data |>
    filter(Sample_Type == "CBE" & starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging more or less than 2 sites visit ID - Public School
  clean_data.tool7$data |>
    filter(Sample_Type == "Public School") |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type, Sample_Type) |>
    summarise(n_site_visit_ids = n()) |>
    filter(n_site_visit_ids != 2) |> 
    mutate(
      Issue = "There are either less or more than 2 interviews for this Site Visit ID!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "n_site_visit_ids",
      Related_value = as.character(n_site_visit_ids),
      starttime = as.character(NA_POSIXct_),
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging more or less than 2 sites visit ID - CBE
  clean_data.tool7$data |>
    filter(Sample_Type == "CBE") |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type, Sample_Type) |>
    summarise(n_site_visit_ids = n()) |>
    filter(n_site_visit_ids != 2) |> 
    mutate(
      Issue = "There are either less or more than 2 interviews for this Site Visit ID!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "n_site_visit_ids",
      Related_value = as.character(n_site_visit_ids),
      starttime = as.character(NA_POSIXct_),
      KEY = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Duplicated combination of Respondent Name and both Phone Numbers for a Site Visit ID
  clean_data.tool7$data |>
    mutate(
      shura_mem_id = paste(Sample_Type, Site_Visit_ID, B5, Respondent1_Phone_Number, Respondent2_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(shura_mem_id, fromLast = T) | duplicated(shura_mem_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her phone numbers are duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Duplicated combination of Respondent Name and first Phone Number for a Site Visit ID
  clean_data.tool7$data |>
    mutate(
      shura_mem_id = paste(Sample_Type, Site_Visit_ID, B5, Respondent1_Phone_Number, sep = "-")
    ) |>
    filter(duplicated(shura_mem_id, fromLast = T) | duplicated(shura_mem_id, fromLast = F)) |>
    mutate(
      Issue = "The combination of Respondent Name and his/her first phone number is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Duplicated Respondent Name for a Site Visit ID
  clean_data.tool7$data |>
    mutate(
      shura_mem_id = paste(Sample_Type, Site_Visit_ID, B5, sep = "-")
    ) |>
    filter(duplicated(shura_mem_id, fromLast = T) | duplicated(shura_mem_id, fromLast = F)) |>
    mutate(
      Issue = "The Respondent Name is duplicated for the Site Visit ID and sample type",
      Question = "",
      Old_value = "",
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Flagging if confirmed s/he is a Shura member but also reported the school/CBE never had a Shura
  clean_data.tool7$data |>
    filter(B8 == "Yes" &  C0 == "No, the school/CBE never had a shura") |>
    mutate(
      Issue = "It is confirmed that s/he is a Shura member but also reported the school/CBE never had a Shura",
      Question = "B8",
      Old_value = B8,
      Related_question = "C0",
      Related_value = C0
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if All is selected for girls between 13-18 yrs old attending school
  clean_data.tool7$data |>
    filter(D4 == "All") |>
    mutate(
      Issue = "'All' is selected for question girls between 13-18 years old attending school, please confirm the response.",
      Question = "D4",
      Old_value = D4,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Reported Subject has been added but reported 0 for the number of subjects
  clean_data.tool7$data |>
    filter(E2_2 == 1 & E4_N <= 0) |>
    mutate(
      Issue = "Reported Subject has been added but also reported 0 for the number of subjects",
      Question = "E4_N",
      Old_value = as.character(E4_N),
      Related_question = "E2",
      Related_value = E2
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if The reason for improvement of education quality is reported 'More teachers', but also reported lack of teacher for decreasing attendance
  clean_data.tool7$data |>
    filter(E12_2 == 1 & (D6_1 == 1 | D9_3 == 1)) |>
    mutate(
      Issue = "The reason for improvement of education quality is reported 'More teachers', but also repoted lack of teacher for decreasing attendance",
      Question = "E12",
      Old_value = as.character(E12),
      Related_question = "D6 | D9",
      Related_value = paste0(D6, " | ", D9)
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  clean_data.tool7$data |>
    filter(F4_2 == 1 & F2_3 == 1) |>
    mutate(
      Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
      Question = "F4",
      Old_value = as.character(F4),
      Related_question = "F2",
      Related_value = F2
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 7 - Shura", sheet = "data", Old_value = as.character(Old_value))


lc_tool7.list_members <- rbind(
  # Flagging if number the sum of Male and Female for the shura postion is reported 0 or less
  clean_data.tool7$C6_list_members |>
    filter(C6_Number_Male + C6_Number_Female <= 0) |>
    mutate(
      Issue = paste0("The sum of male and female members for the shura position ", Field_Label, " is reported 0 or less"),
      Question = "C6_Number_Male",
      Old_value = as.character(C6_Number_Male),
      Related_question = "C6_Number_Female",
      Related_value = as.character(C6_Number_Female)
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 7 - Shura", sheet = "C6_list_members", Old_value = as.character(Old_value))


# Logging issues in Tool 8 ------------------------------------------------

lc_tool8 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool8$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool8$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Flagging if the school is type female but male students are there
  clean_data.tool8$data |>
    filter(
      School_CBE_Gender_Based_On_The_Sample == "Girls" &
        B7 %in% c("Yes, It is open and there are students (both male and female) and teachers inside", "Yes, It is open and there are students (only male) and teachers inside")
    ) |>
    mutate(
      Issue = "The school is type female but male students are there!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "B7",
      Related_value = B7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the school is type male but female students are there
  clean_data.tool8$data |>
    filter(
      School_CBE_Gender_Based_On_The_Sample == "Boys" &
        B7 %in% c("Yes, It is open and there are students (both male and female) and teachers inside", "Yes, It is open and there are students (only female) and teachers inside")
    ) |>
    mutate(
      Issue = "The school is type male but female students are there!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "B7",
      Related_value = B7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if the school is type male but reported there are no female teachers as a result of recent bans as a reason for the closure of school
  clean_data.tool8$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & C6 == "There are no female teachers as a result of recent bans") |>
    mutate(
      Issue = "The school is type male but reported 'there are no female teachers as a result of recent bans' as a reason for the closure of school!",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample,
      Related_question = "C6",
      Related_value = C6
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Enumerator observed that CBE is closed temporarily but respondent reported permanent closure. 
  clean_data.tool8$data |>
    filter(B7 == "No, it is closed temporarily" & C7 == "Permanent") |>
    mutate(
      Issue = "Enumerator observed that CBE is closed temporarily but respondent reported permanent closure. ",
      Question = "B7",
      Old_value = B7,
      Related_question = "C7",
      Related_value = C7
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if respondent reported permanent closure for the CBE but also reported plan for reopening it. 
  clean_data.tool8$data |>
    filter(C7 == "Permanent" & C11 == "Yes") |>
    mutate(
      Issue = "Respondent reported permanent closure for the CBE but also reported plan for reopening it",
      Question = "C7",
      Old_value = C7,
      Related_question = "C11",
      Related_value = C11
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if type of CBE does not match in questions A1 and D7 
  clean_data.tool8$data |>
    filter((D7 == "ALC (covering more than one grade in one academic year)" & A1 != "ALC (covering more than one grade in one academic year)") |
             (D7 == "CBC (covering one grade in one academic year)" & A1 != "CBC (covering one grade in one academic year)") |
             (D7 == "CBC and ALC" & A1 != "Both CBC and ALC")) |>
    mutate(
      Issue = "Type of CBE does not match in questions A1 and D7 ",
      Question = "D7",
      Old_value = D7,
      Related_question = "A1",
      Related_value = A1
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if ALC level is inconsistent with Grades actively being taught in CBE
  clean_data.tool8$data |>
    filter((D9_1 == 1 & (D8_1 == 0 | D8_2 == 0)) | (D9_2 == 1 & (D8_3 == 0 | D8_4 == 0)) | (D9_3 == 1 & (D8_5 == 0 | D8_6 == 0)) ) |>
    mutate(
      Issue = "ALC level is inconsistent with Grades actively being taught in CBE",
      Question = "D9",
      Old_value = D9,
      Related_question = "D8",
      Related_value = D8
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if The number of classes is reported 0 or less.
  clean_data.tool8$data |>
    filter(E2 <= 0) |>
    mutate(
      Issue = "The number of classes is reported 0 or less.",
      Question = "E2",
      Old_value = as.character(E2),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if The Number of Male teacher is reported less than 0.
  clean_data.tool8$data |>
    filter(E7 < 0) |>
    mutate(
      Issue = "The Number of Male teacher is reported less than 0.",
      Question = "E7",
      Old_value = E7,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging if The Number of Female teacher is reported less than 0.
  clean_data.tool8$data |>
    filter(E8 < 0) |>
    mutate(
      Issue = "The number of Female teacher is reported less than 0.",
      Question = "E8",
      Old_value = as.character(E8),
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging if the number of number of absent teacher is equal to 0
  clean_data.tool8$data |>
    filter(E11 == "Yes" & (E12 + E13) <= 0) |>
    mutate(
      Issue = "It is reported that there are other teacher at the CBE other than who are present but the sum male and female other teachers are reported 0.",
      Question = "E11",
      Old_value = E11,
      Related_question = "E12 - E13",
      Related_value = paste0(E12,"-",E13)
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging if there are other adult present during the observation but the number is reported 0
  clean_data.tool8$data |>
    filter(E16 == "Yes" & E17 <= 0) |>
    mutate(
      Issue = "It is reported that there are other adult present during the observation but the number is reported 0.",
      Question = "E16",
      Old_value = E16,
      Related_question = "E17",
      Related_value = E17
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),

  # Flagging if The school gender is female based on sample but total male students enrolled at this CBE is reported more than 0
  clean_data.tool8$data |>
    filter(J2 > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls") |>
    mutate(
      Issue = "The school gender is female based on sample but total male students enrolled at this CBE is reported more than 0.",
      Question = "J2",
      Old_value = as.character(J2),
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging if The school gender is male based on sample but total female students enrolled at this CBE is reported more than 0
  clean_data.tool8$data |>
    filter(J3 > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
    mutate(
      Issue = "The school gender is male based on sample but total female students enrolled at this CBE is reported more than 0.",
      Question = "J3",
      Old_value = as.character(J3),
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flag if The total number of male and female students enrolled at this CBE is less than that CBE's headcount of male and female students
  clean_data.tool8$data |>
    left_join(
      clean_data.tool8$Section_2_2_4_Headcount |>
        mutate(
          total_headcount_m_f = Headcount_Male_Students + Headcount_Female_Students
        ) |>
        group_by(KEY = PARENT_KEY) |>
        summarise(
          total_headcount_student = sum(total_headcount_m_f, na.rm = T)
        ) |> select(KEY, total_headcount_student) , by = "KEY") |>
    filter((J2 + J3) < total_headcount_student) |>
    mutate(
      Issue = "The total number of male and female students enrolled at this CBE is less than that CBE's headcount of male and female students.",
      Question = "J2 + J3",
      Old_value = as.character(J2+J3),
      Related_question = "total_headcount_student",
      Related_value = total_headcount_student
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 8 - Class", sheet = "data", Old_value = as.character(Old_value))

lc_tool8.classes <- rbind(
  # Flagging if Selected Class Type does not match with Class Type in the main Sheet
  clean_data.tool8$Classes |>
    left_join( select(clean_data.tool8$data, D7.main_sheet = D7, KEY), by = c("PARENT_KEY" = "KEY")) |>
    filter(Class_Type == "CBC and ALC" & D7.main_sheet %in% c("ALC (covering more than one grade in one academic year)","CBC (covering one grade in one academic year)")) |>
    mutate(
      Issue = "The Class type is selected Both CBC and ALC for the Class, but the they type of CBE is reported either ALC or CBC (Not both) in the question D7.",
      Question = "Class_Type",
      Old_value = Class_Type,
      Related_question = "D7.main_sheet",
      Related_value = D7.main_sheet
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  # Flagging if Selected Class Type does not match with Class Type in the main Sheet
  clean_data.tool8$Classes |>
    left_join(select(clean_data.tool8$data, D7.main_sheet = D7, KEY), by = c("PARENT_KEY" = "KEY")) |>
    filter(Class_Type == "ALC (covering more than one grade in one academic year)" & D7.main_sheet == "CBC (covering one grade in one academic year)" | 
           Class_Type == "CBC (covering one grade in one academic year)" & D7.main_sheet == "ALC (covering more than one grade in one academic year)") |>
    mutate(
      Issue = "The Class type for the class does not match with Type of CBE in question D7.",
      Question = "Class_Type",
      Old_value = Class_Type,
      Related_question = "D7.main_sheet",
      Related_value = D7.main_sheet
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 8 - Class", sheet = "Classes", Old_value = as.character(Old_value))

lc_tool8.attendance_record <- rbind(
  # Flagging if The date for the attendance sheet equal to the interview date is confirmed, but also there is a difference between those dates
  clean_data.tool8$Section_2_2_3_Attendance_Rec... |>
    filter(E21 == "Yes" & janitor::convert_to_date(E20) != janitor::convert_to_date(starttime)) |>
    mutate(
      Issue = "The date for the attendance sheet equal to the interview date is confirmed, but also there is a difference between those dates.",
      Question = "E20",
      Old_value = E20,
      Related_question = "starttime",
      Related_value = as.character(janitor::convert_to_date(starttime))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 8 - Class", sheet = "Section_2_2_3_Attendance_Rec...", Old_value = as.character(Old_value))

lc_tool8.headcount <- rbind(
  #Flag if The school gender is female based on sample but headcount male students is reported more than 0
  clean_data.tool8$Section_2_2_4_Headcount |>
    filter(Headcount_Male_Students > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls") |>
    mutate(
      Issue = "The school gender is female based on sample but headcount male students is reported more than 0.",
      Question = "Headcount_Male_Students",
      Old_value = Headcount_Male_Students,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flag if The school gender is male based on sample but headcount female students is reported more than 0
  clean_data.tool8$Section_2_2_4_Headcount |>
    filter(Headcount_Female_Students > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
    mutate(
      Issue = "The school gender is male based on sample but headcount female students is reported more than 0.",
      Question = "Headcount_Female_Students",
      Old_value = Headcount_Female_Students,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flag if The school gender is female based on sample but headcount female students is reported 0 (No students for class)
  clean_data.tool8$Section_2_2_4_Headcount |>
    filter(Headcount_Female_Students == 0 & School_CBE_Gender_Based_On_The_Sample == "Girls") |>
    mutate(
      Issue = "The school gender is female based on sample but headcount female students is reported 0 (No students for class).",
      Question = "Headcount_Female_Students",
      Old_value = Headcount_Female_Students,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  #Flag if The school gender is male based on sample but headcount female students is reported 0 (No students for class)
  clean_data.tool8$Section_2_2_4_Headcount |>
    filter(Headcount_Male_Students == 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
    mutate(
      Issue = "The school gender is male based on sample but headcount female students is reported 0 (No students for class).",
      Question = "Headcount_Male_Students",
      Old_value = Headcount_Male_Students,
      Related_question = "School_CBE_Gender_Based_On_The_Sample",
      Related_value = School_CBE_Gender_Based_On_The_Sample
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |>
  mutate(tool = "Tool 8 - Class", sheet = "Section_2_2_4_Headcount", Old_value = as.character(Old_value))


lc_tool8.v_list_member <- rbind(
  # Flagging if the sum of both Male and Female members is reported 0
  clean_data.tool8$V_list_of_all_members |>
    filter((V_Male_Member + V_Female_Member) <= 0) |>
    mutate(
      Issue = "The sum of both Male and Female members is reported 0.",
      Question = "V_Male_Member",
      Old_value = V_Male_Member,
      Related_question = "V_Female_Member",
      Related_value = V_Female_Member
    ) |>
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |>
  mutate(tool = "Tool 8 - Class", sheet = "V_list_of_all_members", Old_value = as.character(Old_value))



# Logging issues in Tool 9 ------------------------------------------------
lc_tool9 <- rbind(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool9$data |>
    filter(starttime < janitor::convert_to_date(data_collection_start_date_cbe)) |> 
    mutate(
      Issue = "The interview is conducted before first day of data collection!",
      Question = "starttime",
      Old_value = as.character(starttime),
      Related_question = "data_collection_start_date_cbe",
      Related_value = as.character(janitor::convert_to_date(data_collection_start_date_cbe))
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging duplicated site visit ID
  clean_data.tool9$data |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The site visit ID is duplicated!",
      Question = "Site_Visit_ID",
      Old_value = Site_Visit_ID,
      Related_question = "",
      Related_value = ""
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ) |>
    arrange(Old_value),
  
  # Flagging if Sum of Female and Male of GRC is reported 0
  clean_data.tool9$data |>
    filter((A12_Female_Numbers + A12_Male_Numbers) <= 0) |>
    mutate(
      Issue = "Sum of Female and Male of GRC is reported 0!",
      Question = "A12_Female_Numbers",
      Old_value = A12_Female_Numbers,
      Related_question = "A12_Male_Numbers",
      Related_value = A12_Male_Numbers
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    ),
  
  # Flagging if Sum of Female and Male of GRC for women is reported 0
  clean_data.tool9$data |>
    filter((A14_Female_Numbers + A14_Male_Numbers) <= 0) |>
    mutate(
      Issue = "Sum of Female and Male of GRC for women is reported 0!",
      Question = "A14_Female_Numbers",
      Old_value = A14_Female_Numbers,
      Related_question = "A14_Male_Numbers",
      Related_value = A14_Male_Numbers
    ) |> 
    select(
      all_of(meta_cols),
      Question,
      Old_value,
      Related_question,
      Related_value,
      KEY,
      Issue
    )
) |> 
  mutate(tool = "Tool 9 - IP", sheet = "data", Old_value = as.character(Old_value))

# Combination of all tools logic checks --------------------------------------
Logic_check_result <- rbind(
  lc_tool1,
  lc_tool1.school_operationality,
  lc_tool1.school_operationality_other,
  lc_tool1.school_ope_both,
  lc_tool1.shift,
  lc_tool1.shift_other,
  lc_tool1.shift_both,
  lc_tool1.shift_operationality_and_other,
  lc_tool1.shift_other_operationality_and_other,
  lc_tool2,
  lc_tool3,
  lc_tool4,
  lc_tool5,
  lc_tool6,
  lc_tool7,
  lc_tool7.list_members,
  lc_tool8,
  lc_tool8.classes,
  lc_tool8.attendance_record,
  lc_tool8.headcount,
  lc_tool8.v_list_member,
  lc_tool9
)

rm(list = ls(pattern = "lc_tool.*"))

source("R/data_entry_logic_checks.R")
