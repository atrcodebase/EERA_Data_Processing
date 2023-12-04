### remove extra columns

## Wash and Infrastructure
geopoint_vars = c("geopoint-Latitude", "geopoint-Longitude", "geopoint-Altitude", "geopoint-Accuracy")
qa_cols <- c("review_status", "review_quality", "review_comments", "review_corrections")
wash_infra.extra_cols <- c(
  "Passcode", "Deviceid", "Subscriberid", "Simid", "Devicephonenum", "Username", "Surveyor_Name",
  "Province_DariPashto", "District_DariPashto", "Institute_Type_Dari_Pashto", "Institute_Gender_Sample_Dari_Pashto",
  "Location_Type_Sample_Dari_Pashto", "Institute_Status_Dari_Pashto", "Respondent_Full_Name", "Respondent_Position",
  "Respondent_Position_Other", "Contact_Number_Of_Respondent", "Alternative_Contact_Number_Of_Respondent", "Tvet_Type_Confirmation_Label", geopoint_vars, qa_cols)

wash_infra.main <- wash_infra.main %>% select(-any_of(wash_infra.extra_cols))
wash_infra.practical_sessions <- wash_infra.practical_sessions %>%
  select(-any_of(wash_infra.extra_cols))
wash_infra.school_institute_relevant_photos <- wash_infra.school_institute_relevant_photos %>%
  select(-any_of(wash_infra.extra_cols))
wash_infra.dormitory_relevant_photos <- wash_infra.dormitory_relevant_photos %>%
  select(-any_of(wash_infra.extra_cols))


## Students and Teachers Enrollment
student_teacher_enroll.extra_cols <- c(
  "Passcode", "Deviceid", "Subscriberid", "Simid", "Devicephonenum", "Username",
  "Surveyor_Name", "Province_DariPashto", "District_DariPashto", "Grades_Based_On_Sample_Dari",
  "Grades_Based_On_Sample_Pashto", "Respondent_Full_Name", "Respondent_Position","Respondent_Position_Other",
  "Contact_Number_Of_Respondent", "Alternative_Contact_Number_Of_Respondent", geopoint_vars, qa_cols)

student_teacher_enroll.main <- student_teacher_enroll.main %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.educational_fields_group <- student_teacher_enroll.educational_fields_group %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.fields_changes_pre <- student_teacher_enroll.fields_changes_pre %>%
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.fields_changes <- student_teacher_enroll.fields_changes %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.academic_year <- student_teacher_enroll.academic_year %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.educational_fields <- student_teacher_enroll.educational_fields %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.educational_grades <- student_teacher_enroll.educational_grades %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.apprenticeship <- student_teacher_enroll.apprenticeship %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.apprenticeship_edu_grades <- student_teacher_enroll.apprenticeship_edu_grades %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.scholarship <- student_teacher_enroll.scholarship %>% 
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.scholarship_grades <- student_teacher_enroll.scholarship_grades %>%
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.academic_year_teachers <- student_teacher_enroll.academic_year_teachers %>% 
  select(-any_of(student_teacher_enroll.extra_cols))

student_teacher_enroll.teachers1 <- student_teacher_enroll.teachers1 %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.teachers3 <- student_teacher_enroll.teachers3 %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.teachers4 <- student_teacher_enroll.teachers4 %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.temp_assigned_teach_here <- student_teacher_enroll.temp_assigned_teach_here %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.temp_assigned_teach_outside <- student_teacher_enroll.temp_assigned_teach_outside %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.teacher_salary_report <- student_teacher_enroll.teacher_salary_report %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.academic_year_staff <- student_teacher_enroll.academic_year_staff %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.staff <- student_teacher_enroll.staff %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.teacher_staff_list <- student_teacher_enroll.teacher_staff_list %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.dormitory_edu_fields <- student_teacher_enroll.dormitory_edu_fields %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  
student_teacher_enroll.dormitory_summary_photo <- student_teacher_enroll.dormitory_summary_photo %>% 
  select(-any_of(student_teacher_enroll.extra_cols))
  


## Curriculum
curriculum.extra_cols <- c(
  "Passcode", "Deviceid", "Subscriberid", "Simid", "Devicephonenum", "Username", "Surveyor_Name",
  "Province_DariPashto", "District_DariPashto", "Institute_Type_Dari_Pashto", "Institute_Gender_Sample_Dari_Pashto",
  "Location_Type_Sample_Dari_Pashto", "Institute_Status_Dari_Pashto", "Respondent_Full_Name", "Respondent_Position",
  "Respondent_Position_Other", "Contact_Number_Of_Respondent", "Alternative_Contact_Number_Of_Respondent", geopoint_vars, qa_cols)

curriculum.main <- curriculum.main %>%
  select(-any_of(curriculum.extra_cols))

curriculum.edu_fields <- curriculum.edu_fields %>%
  select(-any_of(curriculum.extra_cols))
  
curriculum.edu_grades <- curriculum.edu_grades %>%
  select(-any_of(curriculum.extra_cols))

curriculum.edu_subjects <- curriculum.edu_subjects %>%
  select(-any_of(curriculum.extra_cols))

curriculum.subjects <- curriculum.subjects %>%
  select(-any_of(curriculum.extra_cols))

curriculum.subject_changes <- curriculum.subject_changes %>%
  select(-any_of(curriculum.extra_cols))

curriculum.content_changes <- curriculum.content_changes %>%
  select(-any_of(curriculum.extra_cols))
  

## Teachers and Staff Members
teacher_staff.extra_cols <- c(
  "Passcode", "Deviceid", "Subscriberid", "Simid", "Devicephonenum", "Username", "Surveyor_Name",
  "Province_DariPashto", "District_DariPashto", "Institute_Type_Dari_Pashto", "Institute_Gender_Sample_Dari_Pashto",
  "Location_Type_Sample_Dari_Pashto", "Institute_Status_Dari_Pashto", "Respondent_Full_Name",
  "Respondent_Position_Other", "Contact_Number_Of_Respondent", "Alternative_Contact_Number_Of_Respondent", qa_cols)

teacher_staff.main <- teacher_staff.main %>%
  select(-any_of(teacher_staff.extra_cols), -starts_with("geopoint"))

teacher_staff.teacher_staff_verification <- teacher_staff.teacher_staff_verification %>%
  select(-any_of(teacher_staff.extra_cols), -starts_with("geopoint"))
  
teacher_staff.educational_fields <- teacher_staff.educational_fields %>%
  select(-any_of(teacher_staff.extra_cols))
  
teacher_staff.months <- teacher_staff.months %>%
  select(-any_of(teacher_staff.extra_cols))
  
  
# remove extra objects from environment  
remove(wash_infra.extra_cols)
remove(student_teacher_enroll.extra_cols)
remove(curriculum.extra_cols)
remove(teacher_staff.extra_cols)

