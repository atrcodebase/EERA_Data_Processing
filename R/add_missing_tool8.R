path_miss_tool8_raw <- "input/raw_data_tool8_missing/EERA CBE - Class Level Tool Callbacks.xlsx"
path_miss_tool8 <- "input/raw_data_tool8_missing/EERA CBE - Class Level Tool Callbacks_Kobo Tool.xlsx"

raw_data.tool8_miss <- read_xlsx_sheets(path_miss_tool8_raw)
names(raw_data.tool8_miss) <- c("data", "V_list_of_all_members")
kobo_tool.tool8_miss <- read_xlsx_sheets(path_miss_tool8)

# Question to be applied to main data set of tool 8 - data sheet
question_tobe_added_data <- c(
  "V1", "V1_Other", "V2", "V2_Other", "V3",  "V3_Other",  "V4",  "V4_Other",  "V6",  "V6_Other",  "V7",  "V7_Other",
  "V8",  "V9",  "V9_Other",  "V10",  "V10_Other",  "V11",  "V12",  "V13",  "V13_Other",  "V14",  "V15",  "V15_Other",
  "V16",  "V17",  "V17_Other",  "V18",  "V19",  "V19_Other"
)

# Question to be applied to main data set of tool 8 - V_list sheet
# question_tobe_added_V_list <- c(
#   "V_Field_Value", "V_Field_Label", "V_Male_Member", "V_Female_Member"
# )

# # Adding actual KEYs and full Site Visit ID to data sheet
# raw_data.tool8_miss$data <- raw_data.tool8_miss$data |>
#   left_join(
#     kobo_tool.tool8_miss$choices |>
#       filter(list_name == "Site_Visit_ID") |>
#       select(Site_Visit_ID = name, Site_Visit_ID_full = label) #|>
#       # mutate(Site_Visit_ID = as.integer(Site_Visit_ID))
#   , by = "Site_Visit_ID")
# 
# raw_data.tool8_miss$data <- raw_data.tool8_miss$data |>
#   left_join(
#     kobo_tool.tool8_miss$choices |>
#       filter(list_name == "key") |>
#       select(KEY_Class = name, KEY = label) |>
#       mutate(KEY_Class = as.integer(KEY_Class))
#     , by = "KEY_Class")

# Adding actual KEYs and full Site Visit ID to V_list sheet
# raw_data.tool8_miss$V_list_of_all_members <- raw_data.tool8_miss$V_list_of_all_members |>
#   left_join(
#     raw_data.tool8_miss$data |> 
#       select(PARENT_KEY = KEY, Site_Visit_ID_full, "_uuid")
#   , by = c("_submission__uuid"="_uuid")) 

raw_data.tool8_miss$V_list_of_all_members <- raw_data.tool8_miss$V_list_of_all_members |>
  mutate(
    V_Field_Value = as.integer(V_Field_Value)
  ) |>
  select(-`_submission__id`)

# Fixing UNIQUE KEY and all values to be combined with V_list sheet in actual data
# raw_data.tool8_miss$V_list_of_all_members <- raw_data.tool8_miss$V_list_of_all_members |>
#   # The QA team must make sure to not include KEY_UNIQUE which its parent is not existed in main sheet, in the call back data set
#   filter(!is.na(PARENT_KEY)) |>
#   mutate(
#     UNIQUE_KEY_part2 = str_extract(UNIQUE_KEY, "(?<=/)(.*)"),
#     KEY = paste0(PARENT_KEY,"/",UNIQUE_KEY_part2),
#     `SET-OF-V_list_of_all_members` = KEY,
#     V_Field_Value = as.integer(V_Field_Value)
#     ) |>
#   select(V_Field_Value, V_Field_Label, V_Male_Member, V_Female_Member, PARENT_KEY, KEY, "SET-OF-V_list_of_all_members")

raw_data.tool8_miss_only_req_qsn <- raw_data.tool8_miss$data |>
  select(Site_Visit_ID, KEY, all_of(question_tobe_added_data))

# i = "V1"
# r = 1

## a copy of data for testing
raw_data.tool8_clone <- raw_data.tool8


## replace values for sheet data -----------------------------------------------
question <- vector()
new_value <- vector()
old_value <- vector()
key <- vector()
row <- vector()
# "uuid:50cdd750-9e5d-4b23-8627-36c4aee471da"

for(i in question_tobe_added_data){
  # print(i)
  for(r in 1:nrow(raw_data.tool8_miss_only_req_qsn)){
    v <- raw_data.tool8_miss_only_req_qsn[[r, i]]
    if(raw_data.tool8_miss_only_req_qsn[[r, "KEY"]] %in% raw_data.tool8$data$KEY){
      question <- c(question, i)
      ## CHECK if old_value and new_value were same
      old_value <- c(old_value, raw_data.tool8$data[raw_data.tool8$data$KEY == raw_data.tool8_miss_only_req_qsn[[r, "KEY"]], i] |> unlist() |> unname())
      new_value <- c(new_value, v)
      key <- c(key, raw_data.tool8_miss_only_req_qsn[[r, "KEY"]])
      row <- c(row, r)
    }else{
      question <- c(question, i)
      ## CHECK if old_value and new_value were same
      old_value <- c(old_value, "KEY NOT FOUND")
      new_value <- c(new_value, v)
      key <- c(key, "KEY NOT FOUND")
      row <- c(row, r)
    }
      
      # Replace new collected data with old
    raw_data.tool8$data[raw_data.tool8$data$KEY == raw_data.tool8_miss_only_req_qsn[[r, "KEY"]], i] <- v
      
  }
}

change_result <- data.frame(question, old_value, new_value, key, row) |>
  mutate(
    duplicated = case_when(
      old_value == new_value ~ "Duplicated",
      is.na(old_value) & is.na(new_value) ~ "Duplicated",
      TRUE ~ "Not Duplicated"
    )
  )

only_changed <- change_result |>
  filter(duplicated == "Not Duplicated") |>
  mutate(
    changed = case_when(
      new_value != old_value ~ "Changed",
      !is.na(new_value) & is.na(old_value) ~ "Changed",
      is.na(new_value) & !is.na(old_value) ~ "Changed",
      is.na(new_value) & is.na(old_value) ~ "Not Changed",
      TRUE ~ "Not Changed"
    ),
    key_unique = paste(key, question, old_value, new_value, sep = "-")
  ) |>
  left_join(
    raw_data.tool8$data |> select(KEY, Site_Visit_ID, starttime, Region, Province, District, Area_Type, Sample_Type)
  ,by = c("key" = "KEY")) |>
  mutate(Issue = "The value has been replaced from CBE Tool 8 Callback datasest.",
         Related_question = "",
         Related_value = "",
         tool = "Tool 8 - Class",
         sheet = "data") |>
  select(
    any_of(meta_cols),
    Question = question,
    Old_value = old_value,
    New_value = new_value,
    Related_question,
    Related_value,
    KEY = key,
    Issue,
    tool,
    sheet
  )


## Checking if the data applied correctly --------------------------------------
# source("R/functions/custom_functions.R")
# 
# discrep_in_applying <- compare_dt(raw_data.tool8$data, raw_data.tool8_clone$data) |>
#   mutate(key_unique = paste(KEY, question,old_value, new_value , sep = "-"))
# 
# 
# only_changed[which(!only_changed$key_unique %in% discrep_in_applying$key_unique),]
# discrep_in_applying[which(!discrep_in_applying$key_unique %in% only_changed$key_unique),]


  
## Appending values for sheet V_list -------------------------------------------
raw_data.tool8$V_list_of_all_members <- bind_rows(
  raw_data.tool8$V_list_of_all_members,
  raw_data.tool8_miss$V_list_of_all_members 
)


## Appending values for sheet Weekly Class Schedule
weekly_class_schedule_missing <- readxl::read_excel(path = "./input/raw_data_tool8_missing/Tool 1 Headmaster - Weekly Schedule Photos.xlsx", guess_max=5000000, na=c("N/A", "-", " "))

# Fix the link
url_image <- "https://artftpm.surveycto.com/view/submission-attachment/"
url_param <- "?uuid=uuid%"

weekly_class_schedule_missing <- weekly_class_schedule_missing |>
  mutate(
    KEY_tojoin = str_sub(PARENT_KEY, 1, 41),
    F2_image = F2,
    F2 = paste0(url_image, F2_image, url_param, KEY_tojoin)
  ) |>
  select(-KEY_tojoin, -F2_image)

raw_data.tool1$Weekly_Class_Schedule <- bind_rows(
  raw_data.tool1$Weekly_Class_Schedule,
  weekly_class_schedule_missing
)






























