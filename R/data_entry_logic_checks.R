## Data Entry Logic Checks ------------------------------------------------------
#main sheet
lc_tool_data_entry <- rbind(
  # Flagging duplicated site visit ID - Tool 1
  clean_data.tool0$data |>
    filter(Tool == "Tool 1EERA School Indepth VisitPrincipal Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 1!",
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
  
  # Flagging duplicated site visit ID - Tool 2
  clean_data.tool0$data |>
    filter(Tool == "Tool 2EERA School Light VisitPrinciple Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated for Tool 2!",
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
  
  # Flagging duplicated site visit ID - Tool 3
  clean_data.tool0$data |>
    filter(Tool == "Tool 3EERA School Student Document and Headcount Monitoring") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 3!",
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
  
  # Flagging duplicated site visit ID - Tool 8
  clean_data.tool0$data |>
    filter(Tool == "Tool 8EERA CBETeacher Interview") |>
    filter(duplicated(Site_Visit_ID, fromLast = T) | duplicated(Site_Visit_ID, fromLast = F)) |> 
    mutate(
      Issue = "The Site Visit ID is duplicated For Tool 8!",
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
  
  #Flagging if the number of attendance books' page is less than the number of attendance book
  clean_data.tool0$data |>
  filter(Tool2_N_Attendance_Books > Tool2_N_Pages_Attendance_Books) |> 
    mutate(
      Issue = "The number of attendance books' page is less than the number of attendance book",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
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
  
  #Flagging if the number of attendance book is more than 0 and number of pages of attendance book is equal to 0
  clean_data.tool0$data |>
  filter(Tool2_N_Attendance_Books > 0 & Tool2_N_Pages_Attendance_Books == 0) |> 
    mutate(
      Issue = "The number of attendance book is more than 0 but the number of pages of attendance book is reported 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
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
  #Flagging if the number of attendace book 0 and number of pages of attendance book is more than 0
  clean_data.tool0$data |>
  filter(Tool2_N_Attendance_Books == 0 & Tool2_N_Pages_Attendance_Books > 0) |> 
    mutate(
      Issue = "The number of attendace book is 0 but number of pages of attendance book is reported more than 0 page/s",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
      Related_question = "Tool2_N_Pages_Attendance_Books",
      Related_value = Tool2_N_Pages_Attendance_Books
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
  #Flagging if the number of attendance book is less than 0
  clean_data.tool0$data |>
  filter(Tool2_N_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of attendace book is less than 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books,
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
  #Flagging if the number of pages of attendance book is less than 0
  clean_data.tool0$data |>
  filter(Tool2_N_Pages_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of pages of attendance book is less than 0",
      Question = "Tool2_N_Pages_Attendance_Books",
      Old_value = Tool2_N_Pages_Attendance_Books,
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
  #Flagging if the number of teacher staff attendance book is more than 0
  clean_data.tool0$data |>
  filter(Tool2_N_Teachers_Staff_All_Attendance_Books < 0) |> 
    mutate(
      Issue = "The number of teacher staff attendance book is reported less than 0",
      Question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Old_value = Tool2_N_Teachers_Staff_All_Attendance_Books ,
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
  #Flagging if the number of attendance book is 0 and the number of teacher staff attendance book is more than 0
  clean_data.tool0$data |>
  filter(Tool2_N_Attendance_Books == 0 & Tool2_N_Teachers_Staff_All_Attendance_Books > 0) |> 
    mutate(
      Issue = "The number of attendance book is 0 but the number of teacher staff attendance book is reported more than 0",
      Question = "Tool2_N_Attendance_Books",
      Old_value = Tool2_N_Attendance_Books ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of Male Teachers and Staff Present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Present_Male > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Male Teachers and Staff Present in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Present_Male",
      Old_value = Tool2_Teachers_Staff_Present_Male ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of Male Teachers and Staff absent in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Absent_Male > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Male Teachers and Staff Absent in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Absent_Male",
      Old_value = Tool2_Teachers_Staff_Absent_Male ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the total of male present and absent teacher and stuff is more than the teacher and stuff in attendance book
  clean_data.tool0$data |>
  filter(Tool2_Total_Teachers_Staff_Male > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The total of male present and absent teacher and stuff is more than the teacher and stuff in attendance book.",
      Question = "Tool2_Total_Teachers_Staff_Male",
      Old_value = Tool2_Total_Teachers_Staff_Male ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of female Teachers and Staff present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Present_Female > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Female Teachers and Staff Present in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Present_Female",
      Old_value = Tool2_Teachers_Staff_Present_Female ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of female Teachers and Staff absent in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Absent_Female > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of Female Teachers and Staff Absent in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Absent_Female",
      Old_value = Tool2_Teachers_Staff_Absent_Female ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the total of female present and absent teacher and stuff is more than the teacher and stuff in attendance book
  clean_data.tool0$data |>
  filter(Tool2_Total_Teachers_Staff_Female > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The total of female present and absent teacher and stuff is more than the teacher and stuff in attendance book.",
      Question = "Tool2_Total_Teachers_Staff_Female",
      Old_value = Tool2_Total_Teachers_Staff_Female ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of not identifiable gender of Teachers and Staff present in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Present_Gender_Not_Identifiable > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of not identifiable gender of Teachers and Staff present in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Present_Gender_Not_Identifiable",
      Old_value = Tool2_Teachers_Staff_Present_Gender_Not_Identifiable ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the number of not identifiable gender of Teachers and Staff absent in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The number of not identifiable gender of Teachers and Staff absent in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable",
      Old_value = Tool2_Teachers_Staff_Absent_Gender_Not_Identifiable ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  #Flagging if the total of not identifiable gender of Teachers and Staff in attendance book is more than the number of all teachers and staff in Attendance Books
  clean_data.tool0$data |>
  filter(Tool2_Total_Teachers_Staff_Gender_Not_Identifiable > Tool2_N_Teachers_Staff_All_Attendance_Books) |> 
    mutate(
      Issue = "The total of not identifiable gender of Teachers and Staff in attendance book is more than the number of all teachers and staff in Attendance Books.",
      Question = "Tool2_Total_Teachers_Staff_Gender_Not_Identifiable ",
      Old_value = Tool2_Total_Teachers_Staff_Gender_Not_Identifiable ,
      Related_question = "Tool2_N_Teachers_Staff_All_Attendance_Books",
      Related_value = Tool2_N_Teachers_Staff_All_Attendance_Books
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
  
  # Flagging if the type of school is boys and the FDE overall present female students is reported more than 0
  clean_data.tool0$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool8_FDE_Overall_Present_Students_Female > 0) |>
    mutate(
      Issue = "The type of school is boys and the FDE overall present female students is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool8_FDE_Overall_Present_Students_Female",
      Related_value = Tool8_FDE_Overall_Present_Students_Female
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
  
  # Flagging if the type of school is girls and the FDE overall present male students is reported more than 0
  clean_data.tool0$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool8_FDE_Overall_Present_Students_Male > 0) |>
    mutate(
      Issue = "The type of school is girls and the FDE overall present male students is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool8_FDE_Overall_Present_Students_Male",
      Related_value = Tool8_FDE_Overall_Present_Students_Male
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
  
  # Flagging if the type of school is boys and the FDE overall present female students is reported more than 0
  clean_data.tool0$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool8_FDE_Overall_Absent_Students_Female > 0) |>
    mutate(
      Issue = "The type of school is boys and the FDE overall present female students is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool8_FDE_Overall_Absent_Students_Female",
      Related_value = Tool8_FDE_Overall_Absent_Students_Female
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
  
  # Flagging if the type of school is girls and the FDE overall present male students is reported more than 0
  clean_data.tool0$data |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool8_FDE_Overall_Absent_Students_Male > 0) |>
    mutate(
      Issue = "The type of school is girls and the FDE overall present male students is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool8_FDE_Overall_Absent_Students_Male",
      Related_value = Tool8_FDE_Overall_Absent_Students_Male
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
  
  
)
 

## Tool 3 Grades Repeat --------------------------------------------------------
lc_DE_tool3.grades_repeat <- rbind(
  # Enrollment
  #Flagging if the school type is for boys and the number of girls enrollment is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
  filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_N_Students_Enrolled_Grade_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls enrollment is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = Tool3_N_Students_Enrolled_Grade_Female
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
  #Flagging if the school type is for Girls and the number of boys enrollment is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
  filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_N_Students_Enrolled_Grade_Male > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys enrollment is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male",
      Related_value = Tool3_N_Students_Enrolled_Grade_Male
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
  # Attendance
  #Flagging if the school type is for boys and the number of girls with regular attendance is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_N_Students_Class_Female_Regular_Attendance > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls with regular attendance is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Class_Female_Regular_Attendance",
      Related_value = Tool3_N_Students_Class_Female_Regular_Attendance
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
  #Flagging if the school type is for girls and the number of boys with regular attendance is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_N_Students_Class_Male_Regular_Attendance > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys with regular attendance is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Class_Male_Regular_Attendance",
      Related_value = Tool3_N_Students_Class_Male_Regular_Attendance
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
  # Permanent Absent
  #Flagging if the school type is for boys and the number of permanent absent girls is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_N_Students_Class_Female_Permanently_Absent > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of permanent absent girls is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Class_Female_Permanently_Absent",
      Related_value = Tool3_N_Students_Class_Female_Permanently_Absent
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
  
  #Flagging if the school type is for girls and the number of permanent absent boys is more than 0
  clean_data.tool0$Tool3_Grades_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_N_Students_Class_Male_Permanently_Absent > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of permanent absent boys is more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_N_Students_Class_Male_Permanently_Absent",
      Related_value = Tool3_N_Students_Class_Male_Permanently_Absent
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
  
  #Flagging if the number of students regularly attendance is more than the number of enrolled grade male -- Double Check
  clean_data.tool0$Tool3_Grades_Repeat |>
    filter(Tool3_N_Students_Class_Male_Regular_Attendance > Tool3_N_Students_Enrolled_Grade_Male) |> 
    mutate(
      Issue = "The number of students regularly attendance is more than the number of enrolled grade male .",
      Question = "Tool3_N_Students_Class_Male_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Male_Regular_Attendance,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Male",
      Related_value = Tool3_N_Students_Enrolled_Grade_Male
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
  
  #Flagging if the number of students regularly attendance is more than the number of enrolled grade female
  clean_data.tool0$Tool3_Grades_Repeat |>
    filter(Tool3_N_Students_Class_Female_Regular_Attendance > Tool3_N_Students_Enrolled_Grade_Female) |> 
    mutate(
      Issue = "The number of female students regularly attendance is more than the number of enrolled grade female .",
      Question = "Tool3_N_Students_Class_Female_Regular_Attendance",
      Old_value = Tool3_N_Students_Class_Female_Regular_Attendance,
      Related_question = "Tool3_N_Students_Enrolled_Grade_Female",
      Related_value = Tool3_N_Students_Enrolled_Grade_Female
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
  
)

## Tool 3 Class Attendance --------------------------------------------------------
# Tool3_Class_Attendance
lc_DE_tool3.class_attendance <- rbind(
  # Regular Present
  #Flagging if The school type is for boys based on the sampling and the number of girls regularly present is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_Total_Regularly_Present_Students_Attendance_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls regularly present is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Regularly_Present_Students_Attendance_Female",
      Related_value = Tool3_Total_Regularly_Present_Students_Attendance_Female
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys regularly present is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_Total_Regularly_Present_Students_Attendance_Male > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys regularly present is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Regularly_Present_Students_Attendance_Male",
      Related_value = Tool3_Total_Regularly_Present_Students_Attendance_Male
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
  
  # Absent
  #Flagging if The school type is for boys based on the sampling and the number of girls absent is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_Total_Permanently_Absent_Students_Attendance_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls absent is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Permanently_Absent_Students_Attendance_Female",
      Related_value = Tool3_Total_Permanently_Absent_Students_Attendance_Female
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys absent is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_Total_Permanently_Absent_Students_Attendance_Male > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys absent is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Permanently_Absent_Students_Attendance_Male",
      Related_value = Tool3_Total_Permanently_Absent_Students_Attendance_Male
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
  
  # Enrolled
  #Flagging if The school type is for boys based on the sampling and the number of girls enrolled is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_Total_Enrolled_Students_Attendance_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls enrolled is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_Female",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_Female
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys enrolled is reported more than 0.
  clean_data.tool0$Tool3_Class_Attendance |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_Total_Enrolled_Students_Attendance_Male > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys enrolled is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_Male",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_Male
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

    #Flagging if the number of regularly present male is more than the total student enrolled in attendance sheet male
  clean_data.tool0$Tool3_Class_Attendance |> 
    filter(Tool3_Total_Regularly_Present_Students_Attendance_Male > Tool3_Total_Enrolled_Students_Attendance_Male) |> 
    mutate(
      Issue = "The number of regularly present male is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_Total_Regularly_Present_Students_Attendance_Male",
      Old_value = Tool3_Total_Regularly_Present_Students_Attendance_Male,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_Male",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_Male
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
  # Total Enrolled
  #Flagging if the number of regularly present female is more than the total student enrolled in attendance sheet female
  clean_data.tool0$Tool3_Class_Attendance |> 
  filter(Tool3_Total_Regularly_Present_Students_Attendance_Female > Tool3_Total_Enrolled_Students_Attendance_Female) |> 
    mutate(
      Issue = "The number of regularly present female is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_Total_Regularly_Present_Students_Attendance_Female",
      Old_value = Tool3_Total_Regularly_Present_Students_Attendance_Female,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_Female",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_Female
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
  
  #Flagging if the Total number of regularly present students as per the attendance - Gender could not identified is more than the total of gender not identified enrolled in attendance sheet
  clean_data.tool0$Tool3_Class_Attendance |> 
  filter(Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified > Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified) |> 
    mutate(
      Issue = "The number of regularly present students as per the attendance - Gender could not identified is more than the total of gender not identified enrolled in attendance sheet.",
      Question = "Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified",
      Old_value = Tool3_Total_Regularly_Present_Students_Attendance_Gender_Not_Identified,
      Related_question = "Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified",
      Related_value = Tool3_Total_Enrolled_Students_Attendance_Gender_Not_Identified
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
)


## Tool 3 Classes Repeat --------------------------------------------------------
lc_DE_tool3.n_classes_repeat <- rbind(
  # Regular Present
  #Flagging if The school type is for boys based on the sampling and the number of girls regularly present is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_T3_N_Students_Class_Female_Regular_Attendance > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls regularly present is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Class_Female_Regular_Attendance",
      Related_value = Tool3_T3_N_Students_Class_Female_Regular_Attendance
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys regularly present is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_T3_N_Students_Class_Male_Regular_Attendance > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys regularly present is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Class_Male_Regular_Attendance",
      Related_value = Tool3_T3_N_Students_Class_Male_Regular_Attendance
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
  
  
  # Absent
  #Flagging if The school type is for boys based on the sampling and the number of girls absent is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_T3_N_Students_Class_Female_Permanently_Absent > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls absent is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Class_Female_Permanently_Absent",
      Related_value = Tool3_T3_N_Students_Class_Female_Permanently_Absent
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys absent is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_T3_N_Students_Class_Male_Permanently_Absent > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys absent is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Class_Male_Permanently_Absent",
      Related_value = Tool3_T3_N_Students_Class_Male_Permanently_Absent
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
  
  # Enrolled
  #Flagging if The school type is for boys based on the sampling and the number of girls enrolled is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_T3_N_Students_Enrolled_Class_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls enrolled is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Female",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Female
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys enrolled is reported more than 0.
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_T3_N_Students_Enrolled_Class_Male > 0 ) |> 
    mutate(
      Issue = "The school type is for girls based on the sampling and the number of boys enrolled is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Male",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Male
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
  
  #Flagging if the number of regularly present male is more than the total student enrolled in attendance sheet male
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |> 
    filter(Tool3_T3_N_Students_Class_Male_Regular_Attendance > Tool3_T3_N_Students_Enrolled_Class_Male) |> 
    mutate(
      Issue = "The number of regularly present male is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_T3_N_Students_Class_Male_Regular_Attendance",
      Old_value = Tool3_T3_N_Students_Class_Male_Regular_Attendance,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Male",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Male
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
  # Total Enrolled
  #Flagging if the number of regularly present female is more than the total student enrolled in attendance sheet female
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |> 
    filter(Tool3_T3_N_Students_Class_Female_Regular_Attendance > Tool3_T3_N_Students_Enrolled_Class_Female) |> 
    mutate(
      Issue = "The number of regularly present female is more than the total student enrolled in attendance sheet.",
      Question = "Tool3_T3_N_Students_Class_Female_Regular_Attendance",
      Old_value = Tool3_T3_N_Students_Class_Female_Regular_Attendance,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Female",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Female
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
  
  #Flagging if the Total number of regularly present students as per the attendance - Gender could not identified is more than the total of gender not identified enrolled in attendance sheet
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |> 
    filter(Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance > Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified) |> 
    mutate(
      Issue = "The number of regularly present students as per the attendance - Gender could not identified is more than the total of gender not identified enrolled in attendance sheet.",
      Question = "Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance",
      Old_value = Tool3_T3_N_Students_Class_Gender_Not_Identified_Regular_Attendance,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Gender_Not_Identified
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
  # Total Absent
  #Flagging if the number of permanently absent female is more than the total student enrolled in attendance sheet female
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |> 
    filter(Tool3_T3_N_Students_Class_Female_Permanently_Absent > Tool3_T3_N_Students_Enrolled_Class_Female) |> 
    mutate(
      Issue = "The number of permanently absent female is more than the total student enrolled in attendance sheet female.",
      Question = "Tool3_T3_N_Students_Class_Female_Permanently_Absent",
      Old_value = Tool3_T3_N_Students_Class_Female_Permanently_Absent,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Female",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Female
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
  
  #Flagging if the number of permanently absent male is more than the total student enrolled in attendance sheet male
  clean_data.tool0$Tool3_T3_N_Classes_Repeat |> 
    filter(Tool3_T3_N_Students_Class_Male_Permanently_Absent > Tool3_T3_N_Students_Enrolled_Class_Male) |> 
    mutate(
      Issue = "The number of permanently absent male is more than the total student enrolled in attendance sheet male.",
      Question = "Tool3_T3_N_Students_Class_Male_Permanently_Absent",
      Old_value = Tool3_T3_N_Students_Class_Male_Permanently_Absent,
      Related_question = "Tool3_T3_N_Students_Enrolled_Class_Male",
      Related_value = Tool3_T3_N_Students_Enrolled_Class_Male
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
)

## Tool 3 Headcount --------------------------------------------------------
lc_DE_tool3.headcount <- rbind(
  #Flagging if The school type is for boys based on the sampling and the number of girls during the headcount is reported more than 0.
  clean_data.tool0$Tool3_Headcount |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Boys" & Tool3_Headcount_Female > 0 ) |> 
    mutate(
      Issue = "The school type is for boys based on the sampling and the number of girls during the headcount is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Headcount_Female",
      Related_value = Tool3_Headcount_Female
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
  
  #Flagging if The school type is for girls based on the sampling and the number of boys during the headcount is reported more than 0
  clean_data.tool0$Tool3_Headcount |>
    left_join(select(clean_data.tool0$data, PARENT_KEY = KEY, School_CBE_Gender_Based_On_The_Sample), by = "PARENT_KEY") |>
    filter(School_CBE_Gender_Based_On_The_Sample == "Girls" & Tool3_Headcount_Male > 0 ) |> 
    mutate(
      Issue = "school type is for girls based on the sampling and the number of boys during the headcount is reported more than 0.",
      Question = "School_CBE_Gender_Based_On_The_Sample",
      Old_value = School_CBE_Gender_Based_On_The_Sample ,
      Related_question = "Tool3_Headcount_Male",
      Related_value = Tool3_Headcount_Male
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
)

## Timetable Year --------------------------------------------------------------
all_school_op_and_op_other_grades = bind_rows(
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
) |> pull(Grade_ID_v) |> unique()


all_school_op_and_op_other_grades_no_operational = bind_rows(
  clean_data.tool1$School_Operationality |>
    select(Site_Visit_ID ,Grade_ID, is_operational = C13A1, Grade_Name_Eng) |>
    mutate(sheet = "School_Operationality", Grade_Value = str_extract(Grade_Name_Eng, "\\d+"), Grade_ID_v = paste0(Site_Visit_ID,"-",Grade_Value)) |>
    filter(is_operational == "No" & !is.na(Grade_ID) & Grade_ID != "") |>
    select(Site_Visit_ID, is_operational, Grade_Value, Grade_ID_v)
  ,
  clean_data.tool1$School_Operationality_Other_... |>
    filter(!is.na(Grade_Value) & Grade_Value != "" & C13A6 == "No") |>
    mutate(Grade_ID = paste0(Site_Visit_ID,"-", Grade_Value), sheet = "School_Operationality_Other_...", Grade_Value = as.character(Grade_Value), Grade_ID_v = paste0(Site_Visit_ID,"-",Grade_Value)) |>
    # select(Site_Visit_ID ,Grade_ID, is_operational = C13A6,  sheet, Grade_Value)
    select(Site_Visit_ID, is_operational = C13A6, Grade_Value, Grade_ID_v)
) |> pull(Grade_ID_v) |> unique()



lc_tool1.timetable_year <- rbind(
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 1
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable1_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable1_1:Tool1_How_Many_Timetable1_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the first timetable covered is not reported neither in Tool 1 (School Operationality and School Operationlity Other Sheets) nor in Sampling Census."),
      Question = "Tool1_How_Many_Timetable1",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 1
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable1_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable1_1:Tool1_How_Many_Timetable1_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the first timetable covered is not reported as an operational grade in Tool 1 (School Operationality and School Operationlity Other Sheets)"),
      Question = "Tool1_How_Many_Timetable1",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 2
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable2_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable2_1:Tool1_How_Many_Timetable2_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the second timetable covered is not reported neither in Tool 1 (School Operationality and School Operationlity Other Sheets) nor in Sampling Census."),
      Question = "Tool1_How_Many_Timetable2",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 2
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable2_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable2_1:Tool1_How_Many_Timetable2_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the second timetable covered is not reported as an operational grade in Tool 1 (School Operationality and School Operationlity Other Sheets)"),
      Question = "Tool1_How_Many_Timetable2",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 3
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable3_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable3_1:Tool1_How_Many_Timetable3_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the third timetable covered is not reported neither in Tool 1 (School Operationality and School Operationlity Other Sheets) nor in Sampling Census."),
      Question = "Tool1_How_Many_Timetable3",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 3
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable3_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable3_1:Tool1_How_Many_Timetable3_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the third timetable covered is not reported as an operational grade in Tool 1 (School Operationality and School Operationlity Other Sheets)"),
      Question = "Tool1_How_Many_Timetable3",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if the selected grade is not reported as part of possible operational grades in TOOl 1 - timetable 4
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable4_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable4_1:Tool1_How_Many_Timetable4_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(!Grade_ID_calc %in% all_school_op_and_op_other_grades) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the fourth timetable covered is not reported neither in Tool 1 (School Operationality and School Operationlity Other Sheets) nor in Sampling Census."),
      Question = "Tool1_How_Many_Timetable4",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
  
  # Flagging if selected grade is not and operational grade in the school reported in tool 1 -  timetable 4
  clean_data.tool0$Tool1_Timetable_Year |>
    select(Site_Visit_ID, PARENT_KEY, KEY, starts_with("Tool1_How_Many_Timetable4_")) |>
    pivot_longer(cols = Tool1_How_Many_Timetable4_1:Tool1_How_Many_Timetable4_12 , names_to = "grades") |>
    filter(value == 1) |>
    mutate(
      grades = str_extract(grades, "(?<=_)\\d+"),
      Grade_ID_calc = paste0(Site_Visit_ID, "-", grades)
    ) |>
    filter(Grade_ID_calc %in% all_school_op_and_op_other_grades_no_operational) |>
    mutate(
      Issue = paste0("The Grade ", grades ," that is reported in the fourth timetable covered is not reported as an operational grade in Tool 1 (School Operationality and School Operationlity Other Sheets)"),
      Question = "Tool1_How_Many_Timetable4",
      Old_value = grades ,
      Related_question = "",
      Related_value = "",
      starttime = NA_Date_,
      Region = "",
      Province = "",
      District = "",
      Area_Type = "",
      Sample_Type = ""
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
)


## Data Entry Final Output -----------------------------------------------------
logic_check_data_entry_final <- rbind(
  lc_tool_data_entry,
  lc_DE_tool3.grades_repeat,
  lc_DE_tool3.class_attendance,
  lc_DE_tool3.headcount,
  lc_DE_tool3.n_classes_repeat,
  lc_tool1.timetable_year
) #|> # Filter old value or related value not 6666
  # filter(Old_value != c(6666, "6666")) |>
  # filter(Related_value != c(6666, "6666"))
  

rm(list = ls(pattern = "lc_*"))
