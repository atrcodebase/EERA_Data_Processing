library(glue)
Coalesce = function(var) ifelse(is.na(var), 0, var)
# LOGIC CHECK

lc_tool1 <- plyr::rbind.fill(
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
  
  # 3 Flagging if the school is closed due to WASH issues or lack of building but at the same time it is used as clinic, hospital or for MoE programs
  clean_data.tool1$data |>
    filter(
      B6 == "The school does not have a building or has infrastructural and WASH issues" &
        B7 %in% c("Clinic/hospital", "For other MoE programs", "Stock", "For other governmental administration")
    ) |> 
    mutate(
      Issue = "The school has no building or it has WASH issues but at the same time it is reported the building is being used for other purposes!",
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
  
  # 6 Flagging if respondent reported "No" to confirm the n of male teachers but later reported the same number of male teachers as it's in the sample
  # clean_data.tool1$data |>
  #   filter(D2 == N_Male_Teachers) |>
  #   mutate(
  #     Issue = "The respondent reported 'No' to confirm the n of male teachers in (D1), but later reported the same number of male teachers as it's in the sample",
  #     Question = "D2",
  #     Old_value = D2,
  #     Related_question = "N_Male_Teachers",
  #     Related_value = N_Male_Teachers
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
  
  # 8 Flagging if respondent reported "No" to confirm the n of female teachers but later reported the same number of female teachers as it's in the sample
  # clean_data.tool1$data |>
  #   filter(D6 == N_Female_Teachers) |>
  #   mutate(
  #     Issue = "The respondent reported 'No' to confirm the n of female teachers in (D5), but later reported the same number of female teachers as it's in the sample",
  #     Question = "D6",
  #     Old_value = D6,
  #     Related_question = "N_Female_Teachers",
  #     Related_value = N_Female_Teachers
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
  
  # 9 Flagging if the school is type female but male students are there
  # RM
  # clean_data.tool1$data |>
  #   filter(
  #     School_CBE_Gender_Based_On_The_Sample == "Girls" &
  #       A34 %in% c("Yes, school is open, and teachers and students (both male and female) are inside", "Yes, it is open and there are students (only male) and teachers inside")
  #   ) |>
  #   mutate(
  #     Issue = "The school is type female but male students are there!",
  #     Question = "School_CBE_Gender_Based_On_The_Sample",
  #     Old_value = School_CBE_Gender_Based_On_The_Sample,
  #     Related_question = "A34",
  #     Related_value = A34
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
  
  # 10 Flagging if the school is type male but female students are there
  # RM
  # clean_data.tool1$data |>
  #   filter(
  #     School_CBE_Gender_Based_On_The_Sample == "Boys" &
  #       A34 %in% c("Yes, school is open, and teachers and students (both male and female) are inside", "Yes, it is open and there are students (only female) and teachers inside")
  #   ) |>
  #   mutate(
  #     Issue = "The school is type male but female students are there!",
  #     Question = "School_CBE_Gender_Based_On_The_Sample",
  #     Old_value = School_CBE_Gender_Based_On_The_Sample,
  #     Related_question = "A34",
  #     Related_value = A34
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
  
  # 13 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  # RM
  # clean_data.tool1$data |>
  #   filter(A31 == "Madrassa (public)" & B9_3 == 1) |>
  #   mutate(
  #     Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!",
  #     Question = "A31",
  #     Old_value = A31,
  #     Related_question = "B9",
  #     Related_value = B9
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
  
  # 14 Flagging if The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B9!
  # RM
  # clean_data.tool1$data |>
  #   filter(A31 == "Madrassa (public)" & B10_3 == 1) |>
  #   mutate(
  #     Issue = "The School with type of 'Madrassa (public) is reported closed, but also reported male children and adults are going to madrassa in Q B10!",
  #     Question = "A31",
  #     Old_value = A31,
  #     Related_question = "B10",
  #     Related_value = B10
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
  #RM
  # clean_data.tool1$data |>
  #   filter(C8 == "Yes, fully converted to Islamic studies" & A30 != "Yes, fully converted to Islamic studies") |>
  #   mutate(
  #     Issue = "The question C8 and A30 has different responses",
  #     Question = "C8",
  #     Old_value = C8,
  #     Related_question = "A30",
  #     Related_value = A30
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
  
  # 21 Flagging if The question C8 and A30 has different responses.
  # RM
  # clean_data.tool1$data |>
  #   filter(C8 == "Yes, partially converted to Islamic studies" & A30 != "Yes, partially converted to Islamic studies") |>
  #   mutate(
  #     Issue = "The question C8 and A30 has different responses",
  #     Question = "C8",
  #     Old_value = C8,
  #     Related_question = "A30",
  #     Related_value = A30
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
  
  # 22 Flagging if The question C8 and A30 has different responses.
  # RM
  # clean_data.tool1$data |>
  #   filter(C8 == "No, the school is a general studies school" & A30 != "No") |>
  #   mutate(
  #     Issue = "The question C8 and A30 has different responses",
  #     Question = "C8",
  #     Old_value = C8,
  #     Related_question = "A30",
  #     Related_value = A30
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
  
  # 23 Flagging if The question C9 and A31 has different responses.
  # RM
  # clean_data.tool1$data |>
  #   filter(C9 != A31) |>
  #   mutate(
  #     Issue = "The question C9 and A31 has different responses",
  #     Question = "C9",
  #     Old_value = C9,
  #     Related_question = "A31",
  #     Related_value = A31
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
  
  # 24 -  Flagging if the school shift in question C1 is reported Single but later in shift details and shift details others reported more than one shift
  clean_data.tool1$data |> 
    mutate(
      shift_count = case_when(
        is.na(C14A1) | C14A1 == "" ~ 0,
        TRUE ~ (str_count(C14A1,";")+1)
      )
    ) |>
    filter(C1 == "Single" & shift_count > 1) |> 
    mutate(
      Issue = "The school shift in question C1 is reported Single but in question C14A1 more than one shift is reported",
      Question = "C1",
      Old_value = C1,
      Related_question = "C14A1",
      Related_value = C14A1
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
  
  # 25 - Flagging if the school shift in question C1 is reported Multiple but later in shift details and shift details others reported only one shift
  clean_data.tool1$data |> 
    mutate(
      shift_count = case_when(
        is.na(C14A1) | C14A1 == "" ~ 0,
        TRUE ~ (str_count(C14A1,";")+1)
      )
    )|> 
    filter(C1 == "Multiple" & shift_count == 1) |> 
    mutate(
      Issue = "The school shift in question C1 is reported Multiple but in question C14A1 only one shift is reported",
      Question = "C1",
      Old_value = C1,
      Related_question = "C14A1",
      Related_value = C14A1
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
  
  # 26 - Flagging if The school type does not match with grades reported in school Operationality and Operationality Other sheets
  clean_data.tool1$data |>
    filter(
      (School_Type_Final %in% c(1,"1") & School_indx != "1 2 3 4 5 6") |
      (School_Type_Final %in% c(2,"2") & School_indx != "1 2 3 4 5 6 7 8 9") |
      (School_Type_Final %in% c(3,"3") & School_indx != "1 2 3 4 5 6 7 8 9 10 11 12")
    ) |> 
    mutate(
      Issue = "The final school type does not match with grades indices in School_Indx question",
      Question = "School_Type_Final",
      Old_value = School_Type_Final,
      Related_question = "School_indx",
      Related_value = School_indx
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
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "data")


lc_tool1.school_operationality <- plyr::rbind.fill(
  # Flagging if Grade_Name_Eng is blank
  clean_data.tool1$School_Operationality |>
    filter(is.na(Grade) | Grade == "") |> 
    mutate(
      Issue = "The Grade is reported BLANK for this Site Visit ID!",
      Question = "Grade",
      Old_value = Grade,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
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
    mutate(Grade_ID = paste0(Site_Visit_ID,"-", Grade)) |>
    filter(duplicated(Grade_ID, fromLast = T) | duplicated(Grade_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Grade is reported more than one time for the Site Visit ID!",
      Question = "Grade",
      Old_value = Grade,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
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
  
  # Flagging if It is reported that Grade's classes are running for both Girls and Boys which is differed with Sampling information.
  # RM
  # clean_data.tool1$School_Operationality |>
  #   filter(C13A2 == "Both" & School_CBE_Gender_Based_On_The_Sample != "Mixed") |>
  #   mutate(
  #     Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running for both Girls and Boys which is differed with Sampling information."),
  #     Question = "C13A2",
  #     Old_value = C13A2,
  #     Related_question = "School_CBE_Gender_Based_On_The_Sample",
  #     Related_value = School_CBE_Gender_Based_On_The_Sample
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
  
  # Flagging if It is reported that Grade's classes are running only for Boys which is differed with Sampling information.
  # RM
  # clean_data.tool1$School_Operationality |>
  #   filter(C13A2 == "Boys" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Girls")) |>
  #   mutate(
  #     Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running only for Boys which is differed with Sampling information."),
  #     Question = "C13A2",
  #     Old_value = C13A2,
  #     Related_question = "School_CBE_Gender_Based_On_The_Sample",
  #     Related_value = School_CBE_Gender_Based_On_The_Sample
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
  
  # Flagging if It is reported that Grade's classes are running only for Girls which is differed with Sampling information.
  # RM
  # clean_data.tool1$School_Operationality |>
  #   filter(C13A2 == "Girls" & School_CBE_Gender_Based_On_The_Sample %in% c("Mixed", "Boys")) |>
  #   mutate(
  #     Issue = paste0("It is reported that ", Grade_Name_Eng, "'s classes are running only for Girls which is differed with Sampling information."),
  #     Question = "C13A2",
  #     Old_value = C13A2,
  #     Related_question = "School_CBE_Gender_Based_On_The_Sample",
  #     Related_value = School_CBE_Gender_Based_On_The_Sample
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
  
) |> mutate(tool = "Tool 1 - Headmaster", sheet = "School_Operationality", Old_value = as.character(Old_value))

shifts_and_operationality <- clean_data.tool1$Shifts_Detail |>
  select(Shift_indx, Shift_name, starts_with("C14A2"), PARENT_KEY, KEY, all_of(meta_cols)) |>
  filter(!is.na(C14A2_1)) |>
  left_join(
    clean_data.tool1$School_Operationality |>
      select(PARENT_KEY, Grade, C13A1) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(C13A1 == "No"), by = "PARENT_KEY")


lc_tool1.shift <- plyr::rbind.fill(
  # Flagging if Shift index is blank
  clean_data.tool1$Shifts_Detail |>
    filter(is.na(Shift_indx) | Shift_indx == "") |> 
    mutate(
      Issue = "The Shift Index is reported BLANK for this Site Visit ID!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
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
  
  # Flagging if Shift Name is blank
  clean_data.tool1$Shifts_Detail |>
    filter(is.na(Shift_name) | Shift_name == "") |> 
    mutate(
      Issue = "The Shift Name is reported BLANK for this Site Visit ID!",
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
  
  # Flagging duplicated Grade ID
  clean_data.tool1$Shifts_Detail |>
    mutate(
      Shift_ID = paste0(Site_Visit_ID,"-",Shift_indx)
    ) |>
    filter(duplicated(Shift_ID, fromLast = T) | duplicated(Shift_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Shift is reported more than once for this Site Visit ID!",
      Question = "Shift_indx",
      Old_value = Shift_indx,
      Related_question = "Site_Visit_ID",
      Related_value = Site_Visit_ID
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
  ) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Shifts_Detail", Old_value = as.character(Old_value))
  
  
  
  
if(nrow(shifts_and_operationality) > 0){
  
  lc_tool1.shifts_and_operationality <-
    rbind(
      # Flagging if a not operational grade is reported for the shift
      # Grade 1
      shifts_and_operationality |>
        filter(C14A2_1 == 1 & grade_1 == 1) |>
        mutate(
          Issue = "Grade 1 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 2
      shifts_and_operationality |>
        filter(C14A2_2 == 1 & grade_2 == 1) |>
        mutate(
          Issue = "Grade 2 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 3
      shifts_and_operationality |>
        filter(C14A2_3 == 1 & grade_3 == 1) |>
        mutate(
          Issue = "Grade 3 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 4
      shifts_and_operationality |>
        filter(C14A2_4 == 1 & grade_4 == 1) |>
        mutate(
          Issue = "Grade 4 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 5
      shifts_and_operationality |>
        filter(C14A2_5 == 1 & grade_5 == 1) |>
        mutate(
          Issue = "Grade 5 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 6
      shifts_and_operationality |>
        filter(C14A2_6 == 1 & grade_6 == 1) |>
        mutate(
          Issue = "Grade 6 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 7
      shifts_and_operationality |>
        filter(C14A2_7 == 1 & grade_7 == 1) |>
        mutate(
          Issue = "Grade 7 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 8
      shifts_and_operationality |>
        filter(C14A2_8 == 1 & grade_8 == 1) |>
        mutate(
          Issue = "Grade 8 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 9
      shifts_and_operationality |>
        filter(C14A2_9 == 1 & grade_9 == 1) |>
        mutate(
          Issue = "Grade 9 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 10
      shifts_and_operationality |>
        filter(C14A2_10 == 1 & grade_10 == 1) |>
        mutate(
          Issue = "Grade 10 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 11
      shifts_and_operationality |>
        filter(C14A2_11 == 1 & grade_11 == 1) |>
        mutate(
          Issue = "Grade 11 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
      # Grade 12
      shifts_and_operationality |>
        filter(C14A2_12 == 1 & grade_12 == 1) |>
        mutate(
          Issue = "Grade 12 selected as conducted grade for this shift is reported not operational in Operationality sheet!",
          Question = "C14A2",
          Old_value = C14A2,
          Related_question = "C13A1(School_Operationality)",
          Related_value = C13A1
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
    ) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Shifts_Detail", Old_value = as.character(Old_value))
  
}


headmasters_supervised_non_opt_grades <- clean_data.tool1$Headmasters |>
  left_join(
    clean_data.tool1$School_Operationality |>
      select(PARENT_KEY, Grade, C13A1) |>
      arrange(PARENT_KEY, Grade) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length) |>
      filter(C13A1 == "No"), by = "PARENT_KEY")


headmaster_not_exist_grades <- clean_data.tool1$Headmasters |>
  left_join(
    clean_data.tool1$School_Operationality |>
      select(PARENT_KEY, Grade) |>
      arrange(PARENT_KEY, Grade) |>
      pivot_wider(names_from = Grade, values_from = Grade, values_fill = 0, names_prefix = "grade_", values_fn = length), by = "PARENT_KEY")


if(nrow(headmasters_supervised_non_opt_grades) > 0 ){
  lc_tool1.headmaster_operationality_and_other <- plyr::rbind.fill(
    # Flagging if a not operational grade is reported for the shift
    # Grade 1
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_1 == 1 & grade_1 == 1) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 2
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_2 == 1 & grade_2 == 1) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 3
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_3 == 1 & grade_3 == 1) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 4
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_4 == 1 & grade_4 == 1) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 5
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_5 == 1 & grade_5 == 1) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 6
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_6 == 1 & grade_6 == 1) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 7 
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_7 == 1 & grade_7 == 1) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 8
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_8 == 1 & grade_8 == 1) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 9
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_9 == 1 & grade_9 == 1) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 10
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_10 == 1 & grade_10 == 1) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 11
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_11 == 1 & grade_11 == 1) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
    # Grade 12
    headmasters_supervised_non_opt_grades |>
      filter(C15A2_12 == 1 & grade_12 == 1) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not operational in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
        Related_question = "C13A1(School_Operationality)",
        Related_value = C13A1
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
  ) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Headmasters", Old_value = as.character(Old_value))
}

if(nrow(headmaster_not_exist_grades) > 0){
  lc_tool1.headmaster_operationality_and_other <- plyr::rbind.fill(
    lc_tool1.headmaster_operationality_and_other,
    # Flagging if headmaster reported supervising a grade which is not reported in operationality and operationality other sheets
    # Grade 1
    headmaster_not_exist_grades |>
      filter(C15A2_1 == 1 & grade_1 == 0) |>
      mutate(
        Issue = "Grade 1 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    
    # Grade 2
    headmaster_not_exist_grades |>
      filter(C15A2_2 == 1 & grade_2 == 0) |>
      mutate(
        Issue = "Grade 2 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 3
    headmaster_not_exist_grades |>
      filter(C15A2_3 == 1 & grade_3 == 0) |>
      mutate(
        Issue = "Grade 3 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 4
    headmaster_not_exist_grades |>
      filter(C15A2_4 == 1 & grade_4 == 0) |>
      mutate(
        Issue = "Grade 4 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 5
    headmaster_not_exist_grades |>
      filter(C15A2_5 == 1 & grade_5 == 0) |>
      mutate(
        Issue = "Grade 5 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 6
    headmaster_not_exist_grades |>
      filter(C15A2_6 == 1 & grade_6 == 0) |>
      mutate(
        Issue = "Grade 6 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 7
    headmaster_not_exist_grades |>
      filter(C15A2_7 == 1 & grade_7 == 0) |>
      mutate(
        Issue = "Grade 7 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 8
    headmaster_not_exist_grades |>
      filter(C15A2_8 == 1 & grade_8 == 0) |>
      mutate(
        Issue = "Grade 8 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 9
    headmaster_not_exist_grades |>
      filter(C15A2_9 == 1 & grade_9 == 0) |>
      mutate(
        Issue = "Grade 9 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 10
    headmaster_not_exist_grades |>
      filter(C15A2_10 == 1 & grade_10 == 0) |>
      mutate(
        Issue = "Grade 10 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 11
    headmaster_not_exist_grades |>
      filter(C15A2_11 == 1 & grade_11 == 0) |>
      mutate(
        Issue = "Grade 11 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
    # Grade 12
    headmaster_not_exist_grades |>
      filter(C15A2_12 == 1 & grade_12 == 0) |>
      mutate(
        Issue = "Grade 12 selected as supervised grade for the headmaster but is not existed/reported in Operationality sheet!",
        Question = "C15A2",
        Old_value = C15A2,
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
  ) |> mutate(tool = "Tool 1 - Headmaster", sheet = "Headmasters", Old_value = as.character(Old_value))
}
  


# Logging issues in Tool 2 ------------------------------------------------
lc_tool2 <- plyr::rbind.fill(
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
  # RM
  # clean_data.tool2$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A30.tool1 = A30, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(B3 != A30.tool1) |> 
  #   mutate(
  #     Issue = "The answer to conversion of school to an Islamic school is inconsistent across tool 1 and tool 2!",
  #     Question = "B3",
  #     Old_value = B3,
  #     Related_question = "A30.tool1",
  #     Related_value = A30.tool1
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
  
  # flagging if the answer to question related to open/closed status of school is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(A34.tool1 = A34, Site_Visit_ID),
      by = "Site_Visit_ID"
    ) |> 
    mutate(
      B7 = str_trim(B7),
      A34.tool1 = str_trim(A34.tool1)
    ) |>
    filter(B7 != A34.tool1) |> 
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
  
  # flagging if the answer to 'What is the school building being used for?' is inconsistent across tool 1 and tool 2
  clean_data.tool2$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(B7.tool1 = B7, Site_Visit_ID) |>
        mutate(
          B7.tool1 = case_when(
            B7.tool1 == "Refused to respond" ~ "Don’t wish to respond",
            TRUE ~  B7.tool1
          )), by = "Site_Visit_ID") |> 
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

  # Flagging if shift types differs between tool 2 and tool 1
  clean_data.tool2$data |>
    left_join(
      clean_data.tool1$data |> select( Site_Visit_ID, C1.tool1 = C1),  by = "Site_Visit_ID") |>
    filter(D1 != C1.tool1) |>
    mutate(
      Issue = "The shift types differs between tool 2 and tool 1!",
      Question = "D1",
      Old_value = D1,
      Related_question ="C1 (Tool 1)",
      Related_value = C1.tool1
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
lc_tool3 <- plyr::rbind.fill(
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
  # RM
  # clean_data.tool3$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A30.tool1 = A30, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(
  #     B6 != A30.tool1 &
  #       !(B6 == "No, the school is a general studies school" & A30.tool1 == "No") &
  #       !(B6 == "Yes , fully converted to Islamic studies" & A30.tool1 == "Yes, fully converted to Islamic studies")
  #   ) |> 
  #   mutate(
  #     Issue = "The answer to 'Is the school Islamic education school?' is inconsistent across tool 1 and tool 3!",
  #     Question = "B6",
  #     Old_value = B6,
  #     Related_question = "A30.tool1",
  #     Related_value = A30.tool1,
  #     sheet = "data"
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue,
  #     sheet
  #   ),
  
  # flagging if the answer to 'If yes, what type of Islamic school is it?' is inconsistent across tool 1 and tool 3
  # RM
  # clean_data.tool3$data |>
  #   distinct(Site_Visit_ID, .keep_all = T) |> 
  #   left_join(
  #     clean_data.tool1$data |>
  #       select(A31.tool1 = A31, Site_Visit_ID),
  #     by = "Site_Visit_ID"
  #   ) |> 
  #   filter(B7 != A31.tool1) |> 
  #   mutate(
  #     Issue = "The answer to 'If yes, what type of Islamic school is it?' is inconsistent across tool 1 and tool 3!",
  #     Question = "B7",
  #     Old_value = B7,
  #     Related_question = "A31.tool1",
  #     Related_value = A31.tool1,
  #     sheet = "data"
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue,
  #     sheet
  #   ),
  
  # flagging if the answer to 'School type' is inconsistent across tool 1 and tool 3
  clean_data.tool3$data |>
    distinct(Site_Visit_ID, .keep_all = T) |> 
    left_join(
      clean_data.tool1$data |>
        select(School_Type_SV, Site_Visit_ID),
      by = "Site_Visit_ID",
      suffix = c("", ".tool1")
    ) |> 
    filter(School_Type_SV!= School_Type_SV.tool1) |> 
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
  # RM : E3A2 is removed in new tool
  # clean_data.tool3$Student_Headcount |>
  #   left_join(
  #     clean_data.tool3$data |> 
  #       select(School_CBE_Gender_Based_On_The_Sample, KEY),
  #     by = join_by(PARENT_KEY == KEY)
  #   ) |> 
  #   filter(E3A2 > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
  #   mutate(
  #     Issue = "The school is type male, but in the count female students are reported!",
  #     Question = "E3A2",
  #     Old_value = E3A2,
  #     Related_question = "School_CBE_Gender_Based_On_The_Sample",
  #     Related_value = School_CBE_Gender_Based_On_The_Sample,
  #     sheet = "Student_Headcount"
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue,
  #     sheet
  #   ),
  
  # flagging if school is type male but females are among the students
  # RM E5_Female is removed from tool
  # clean_data.tool3$Student_Headcount |>
  #   left_join(
  #     clean_data.tool3$data |> 
  #       select(School_CBE_Gender_Based_On_The_Sample, KEY),
  #     by = join_by(PARENT_KEY == KEY)
  #   ) |> 
  #   filter(E5_Female > 0 & School_CBE_Gender_Based_On_The_Sample == "Boys") |>
  #   mutate(
  #     Issue = "The school is type male, but in the count female students are reported!",
  #     Question = "E5_Female",
  #     Old_value = E5_Female,
  #     Related_question = "School_CBE_Gender_Based_On_The_Sample",
  #     Related_value = School_CBE_Gender_Based_On_The_Sample,
  #     sheet = "Student_Headcount"
  #   ) |> 
  #   select(
  #     all_of(meta_cols),
  #     Question,
  #     Old_value,
  #     Related_question,
  #     Related_value,
  #     KEY,
  #     Issue,
  #     sheet
  #   ),
  
  # flagging if school is type female but males are among the students
  clean_data.tool3$Student_Headcount |>
    left_join(
      clean_data.tool3$data |> 
        select(School_CBE_Gender_Based_On_The_Sample, School_Type_Final, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E3A1 > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls" & School_Type_Final %in% c(2,3,"2","3")) |>
    mutate(
      Issue = "The school is type female, but in the count male students are reported (The type of school is considered using School_Type_Final)!",
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
        select(School_CBE_Gender_Based_On_The_Sample, School_Type_Final, KEY),
      by = join_by(PARENT_KEY == KEY)
    ) |> 
    filter(E5_Male > 0 & School_CBE_Gender_Based_On_The_Sample == "Girls" & School_Type_Final %in% c(2,3,"2","3")) |>
    mutate(
      Issue = "The school is type female, but in the count male students are reported(The type of school is considered using School_Type_Final)!",
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
lc_tool4 <- plyr::rbind.fill(
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
    group_by(Site_Visit_ID, Region, Province, District, Area_Type) |>
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
        filter(!is.na(Grade) & Grade != "") |>
        mutate(Grade_ID_calc = paste0(Site_Visit_ID,"-",Grade)) |> 
        filter(Grade_ID_calc != "" & !is.na(Grade_ID_calc) & !(duplicated(Grade_ID_calc, fromLast = T) | duplicated(Grade_ID_calc, fromLast = F))) |>
        select(C13A1, Grade_ID_calc),
      by = "Grade_ID_calc"
    ) |>
    filter(C13A1 == "No") |>
    mutate(
      Issue = paste0("Grade ", grade ," which is being tought by the teacher is reported non-operational in question C13A1 of tool 1!"),
      Question = "D8",
      Old_value = grade,
      Related_question = "C13A1(Tool 1 - School Operationality Sheet)",
      Related_value = C13A1
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
  mutate(tool = "Tool 4 - Teacher", sheet = "data", Old_value = as.character(Old_value))


# Logging issues in Tool 5 ------------------------------------------------
lc_tool5 <- plyr::rbind.fill(
  # Flagging interview conducted before the first day of data collection
  clean_data.tool5$data |>
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
    filter(C5 == "The toilets are under construction" & (Coalesce(C6_Male) + Coalesce(C6_Female) + Coalesce(C6_Unisex)) <= 0) |> 
    mutate(
      Issue = "All type of Toilets (Male, Female, Unisex) is reported 0 but also reported Toilets are under construction",
      Question = "C5",
      Old_value = C5,
      Related_question = "C6_Male + C6_Female + C6_Unisex",
      Related_value = as.character(Coalesce(C6_Male) + Coalesce(C6_Female) + Coalesce(C6_Unisex))
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
    filter((Coalesce(C9_1) + Coalesce(C9_2) + Coalesce(C9_3)) <= 0) |> 
    mutate(
      Issue = "All type of Usable and non-Usable Toilets (Male, Female, Unisex) is reported 0",
      Question = "C9_1 + C9_2 + C9_3",
      Old_value = as.character(Coalesce(C9_1) + Coalesce(C9_2) + Coalesce(C9_3)),
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
lc_tool6 <- plyr::rbind.fill(
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
  
  # Flagging more or less than 4 sites visit ID - Public School
  clean_data.tool6$data |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type) |>
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
      Issue = "The combination of Respondent Name and his/her phone numbers are duplicated for the Site Visit ID",
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
      Issue = "The combination of Respondent Name and his/her first phone number is duplicated for the Site Visit ID",
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
      Issue = "The Respondent Name is duplicated for the Site Visit ID",
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
    )
  
  # Flagging if The reason for improvement of education quality is reported 'More teachers', but also repoted lack of teacher for decreasing attendance
  # clean_data.tool6$data |>
  #   filter(D13_2 == 1 & (C10_3 == 1 | C7_1 == 1)) |>
  #   mutate(
  #     Issue = "The reason for improvement of education quality is reported 'More teachers', but also reported lack of teacher for decreasing attendance",
  #     Question = "D13",
  #     Old_value = D13,
  #     Related_question = "C10 | C7",
  #     Related_value = paste0(C10, " | ", C7)
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
  
  # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  # clean_data.tool6$data |>
  #   filter(E3_3 == 1 & E5_2 == 1) |>
  #   mutate(
  #     Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
  #     Question = "E3",
  #     Old_value = E3,
  #     Related_question = "E5",
  #     Related_value = E5
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
  
  # Flagging if reported that it is Safer to traveling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school
  # clean_data.tool6$data |>
  #   filter(F3 == "Safer" & F11 == "Female" & F12_1 == "Extremely vulnerable") |>
  #   mutate(
  #     Issue = "Reported that it is Safer to traverling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school",
  #     Question = "F3",
  #     Old_value = F3,
  #     Related_question = "F12_1",
  #     Related_value = F12_1
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
  
  # Flagging if reported that it is Less safe to traveling to/from school, but also reported his/her girl is extremely vulnerable to traveling to/from school
  # clean_data.tool6$data |>
  #   filter(F3 == "Less safe" & F11 == "Female" & F12_1 == "Not vulnerable") |>
  #   mutate(
  #     Issue = "Reported that it is less safer to traverling to/from school, but also reported his/her girl is not vulnerable to traveling to/from school",
  #     Question = "F3",
  #     Old_value = F3,
  #     Related_question = "F12_1",
  #     Related_value = F12_1
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
  
  
  # Flagging if reported that it is Safer to traveling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school
  # clean_data.tool6$data |>
  #   filter(F6 == "Safer" & F11 == "Male" & F12_1 == "Extremely vulnerable") |>
  #   mutate(
  #     Issue = "Reported that it is Safer to traverling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school",
  #     Question = "F6",
  #     Old_value = F6,
  #     Related_question = "F12_1",
  #     Related_value = F12_1
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
  
  # # Flagging if reported that it is Less safe to traveling to/from school, but also reported his/her boy is extremely vulnerable to traveling to/from school
  # clean_data.tool6$data |>
  #   filter(F6 == "Less safe" & F11 == "Male" & F12_1 == "Not vulnerable") |>
  #   mutate(
  #     Issue = "Reported that it is less safer to traverling to/from school, but also reported his/her boy is not vulnerable to traveling to/from school",
  #     Question = "F6",
  #     Old_value = F6,
  #     Related_question = "F12_1",
  #     Related_value = F12_1
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
  mutate(tool = "Tool 6 - Parent", sheet = "data", Old_value = as.character(Old_value))


# Logging issues in Tool 7 ------------------------------------------------
# Flagging interview conducted before the first day of data collection - Public School
lc_tool7 <- plyr::rbind.fill(
  clean_data.tool7$data |>
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
  
  # Flagging more or less than 2 sites visit ID - Public School
  clean_data.tool7$data |>
    group_by(Site_Visit_ID, Region, Province, District, Area_Type) |>
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
    )
  
  # Flagging if The reason for improvement of education quality is reported 'More teachers', but also reported lack of teacher for decreasing attendance
  # clean_data.tool7$data |>
  #   filter(E12_2 == 1 & (D6_1 == 1 | D9_3 == 1)) |>
  #   mutate(
  #     Issue = "The reason for improvement of education quality is reported 'More teachers', but also repoted lack of teacher for decreasing attendance",
  #     Question = "E12",
  #     Old_value = as.character(E12),
  #     Related_question = "D6 | D9",
  #     Related_value = paste0(D6, " | ", D9)
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
  # 
  # # Flagging if More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook
  # clean_data.tool7$data |>
  #   filter(F4_2 == 1 & F2_3 == 1) |>
  #   mutate(
  #     Issue = "More dedicated time on religious studies is reported but also reported Decreased reliance on religious materials/textbook",
  #     Question = "F4",
  #     Old_value = as.character(F4),
  #     Related_question = "F2",
  #     Related_value = F2
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
  mutate(tool = "Tool 7 - Shura", sheet = "data", Old_value = as.character(Old_value))

# Combination of all tools logic checks --------------------------------------
Logic_check_result <- plyr::rbind.fill(
  lc_tool1,
  lc_tool1.school_operationality,
  lc_tool1.shift,
  lc_tool2,
  lc_tool3,
  lc_tool4,
  lc_tool5,
  lc_tool6,
  lc_tool7
)

if(nrow(shifts_and_operationality) > 0){
  Logic_check_result <- plyr::rbind.fill(
    Logic_check_result, 
    lc_tool1.shifts_and_operationality
  )
}

if(nrow(headmasters_supervised_non_opt_grades) > 0 | nrow(headmaster_not_exist_grades) > 0){
  Logic_check_result <- plyr::rbind.fill(
    Logic_check_result,
    lc_tool1.headmaster_operationality_and_other
  )
}

rm(list = ls(pattern = "lc_tool.*"))

source("R/data_entry_logic_checks_K.R")
