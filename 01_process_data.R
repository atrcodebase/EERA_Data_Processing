# Organization:   ATR
# Date:           Nov 2023
# Script:         EERA Data Processing
# Author:         ATR Data Management Department

# Load required packages -----------------------------------------------------------------
rm(list = ls())
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(googlesheets4)) install.packages("googlesheets4")
if(!require(openxlsx)) install.packages("openxlsx")
if(!require(readxl)) install.packages("readxl")
if(!require(readxl)) install.packages("lubridate")
if(!require(readxl)) install.packages("janitor")
`%notin%` <- Negate(`%in%`)

source("R/functions/read_xlsx_all_sheets.R")
source("R/functions/convert_numbers_to_date.R")


# Declaring Global Variables ----------------------------------------------
# convert_to_na = c("I don’t know", "Refused to respond") 
# READ ME: will use these values while writing the data set, other wise it would cause error in functions like relevancy checker
data_collection_start_date_cbe = as.Date("08.11.2023", format("%d.%m.%Y"))
data_collection_start_date_ps = as.Date("11.11.2023", format("%d.%m.%Y"))

qa_sheet_url_cbe = "https://docs.google.com/spreadsheets/d/1xV_1CI13j-td2eaCWtU_1ffdscqshOalaI_MTXB0_zo/edit#gid=1005923888"
qa_sheet_url_ps = "https://docs.google.com/spreadsheets/d/1VZF0KCZ__Ulp6N6Nx2VIcXZNwM50wpTPjZu3ewrDyrI/edit#gid=1005923888"
data_entry_url = "https://docs.google.com/spreadsheets/d/1vM9YUQW5UkehLQmGhlf-nWLuh3keHg_lc0hW_MFNl3E/edit#gid=1568445961"

output_data_path = "output/"
sample_files_path = list.files("input/sample_files/", full.names = T)
raw_data_path = list.files("input/raw_data/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d).*", "tool\\1", .))
kobo_tools_path = list.files("input/tools/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d).*", "tool\\1", .))
relevancy_files_path = list.files("input/relevancy_files/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*tool(\\d).*", "tool\\1", .))
meta_cols <- c("Site_Visit_ID", "starttime", "Region", "Province", "District", "Area_Type", "Sample_Type")
meta_cols.qa_sheet <- c(Visit_ID = "Site_Visit_ID", "School Code", "Sample_Type", Survey_Date = "SubmissionDate", Region = "Region", "KEY")

# Read inputs --------------------------------------------------------------
# reading the datasets
raw_data.tool0 = read_xlsx_sheets(raw_data_path$tool0)
# raw_data.tool0$data <- raw_data.tool0$data |> mutate(Sample_Type = "Public School") # Double-check
raw_data.tool1 = read_xlsx_sheets(raw_data_path$tool1)
raw_data.tool1$data <- raw_data.tool1$data |> mutate(Sample_Type = "Public School")
raw_data.tool2 = read_xlsx_sheets(raw_data_path$tool2)
raw_data.tool2$data <- raw_data.tool2$data |> mutate(Sample_Type = "Public School")
raw_data.tool3 = read_xlsx_sheets(raw_data_path$tool3) 
# Need to be fixed by QA team in SCTO
raw_data.tool3$data <- raw_data.tool3$data %>% select(-`E1__`) |> mutate(Sample_Type = "Public School")
raw_data.tool4 = read_xlsx_sheets(raw_data_path$tool4)
raw_data.tool4$data <- raw_data.tool4$data |> mutate(Sample_Type = "Public School")
raw_data.tool5 = read_xlsx_sheets(raw_data_path$tool5)
raw_data.tool5$data <- raw_data.tool5$data |> mutate(Sample_Type = "Public School")
raw_data.tool6 = read_xlsx_sheets(raw_data_path$tool6)
raw_data.tool7 = read_xlsx_sheets(raw_data_path$tool7)
raw_data.tool8 = read_xlsx_sheets(raw_data_path$tool8)
raw_data.tool8$data <- raw_data.tool8$data |> mutate(Sample_Type = "CBE")
raw_data.tool9 = read_xlsx_sheets(raw_data_path$tool9)
raw_data.tool9$data <- raw_data.tool9$data |> mutate(Sample_Type = "CBE")

# Rename: Duplicate column name
names(raw_data.tool7$data)[which(names(raw_data.tool7$data) %in% "C14_1")[2]] <- "C14_A"

# read the kobo Tools
kobo_tool.tool0 = read_xlsx_sheets(kobo_tools_path$tool0)
kobo_tool.tool1 = read_xlsx_sheets(kobo_tools_path$tool1)
kobo_tool.tool2 = read_xlsx_sheets(kobo_tools_path$tool2)
kobo_tool.tool3 = read_xlsx_sheets(kobo_tools_path$tool3)
kobo_tool.tool4 = read_xlsx_sheets(kobo_tools_path$tool4)
kobo_tool.tool5 = read_xlsx_sheets(kobo_tools_path$tool5)
kobo_tool.tool6 = read_xlsx_sheets(kobo_tools_path$tool6)
kobo_tool.tool7 = read_xlsx_sheets(kobo_tools_path$tool7)
kobo_tool.tool8 = read_xlsx_sheets(kobo_tools_path$tool8)
kobo_tool.tool9 = read_xlsx_sheets(kobo_tools_path$tool9)

# Rename
kobo_tool.tool7$survey <- kobo_tool.tool7$survey %>% 
  mutate(name = case_when(
    name == "C14_1" ~ "C14_A", 
    TRUE ~ name))

# read the relevancy files
relevancy_file.tool0 = read_xlsx_sheets(relevancy_files_path$tool0)
relevancy_file.tool1 = read_xlsx_sheets(relevancy_files_path$tool1)
relevancy_file.tool2 = read_xlsx_sheets(relevancy_files_path$tool2)
relevancy_file.tool3 = read_xlsx_sheets(relevancy_files_path$tool3)
relevancy_file.tool4 = read_xlsx_sheets(relevancy_files_path$tool4)
relevancy_file.tool5 = read_xlsx_sheets(relevancy_files_path$tool5)
relevancy_file.tool6 = read_xlsx_sheets(relevancy_files_path$tool6)
relevancy_file.tool7 = read_xlsx_sheets(relevancy_files_path$tool7)
relevancy_file.tool8 = read_xlsx_sheets(relevancy_files_path$tool8)
relevancy_file.tool9 = read_xlsx_sheets(relevancy_files_path$tool9)

# read the sample file
sample_file.ps = read.xlsx(sample_files_path[6])
sample_file.cbe = read.xlsx(sample_files_path[2])
sample_file.cencus = read.csv(sample_files_path[5])
sample_file.ip = read.csv(sample_files_path[3])

# read QA log from Google sheet - Public School -------------------------------
qa_sheet_ps = read_sheet(qa_sheet_url_ps, sheet = "QA_Log")
# to select the user to authenticate
2
correction_log_ps = bind_rows(
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headmaster") |> mutate(Tool = "Tool 1 - Headmaster", Index = as.character(Index1), old_value = as.character(old_value), New_Value = as.character(New_Value)) |> 
    select(-Index1),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Light") |> mutate(Tool = "Tool 2 - Light", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headcount") |> mutate(Tool = "Tool 3 - Headcount", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Teacher") |> mutate(Tool = "Tool 4 - Teacher", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log WASH") |> mutate(Tool = "Tool 5 - WASH", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)),
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Parent ") |> rename(Key = KEY) |> mutate(Tool = "Tool 6 - Parent", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value), Remarks = as.character(Remarks)),
  read_sheet(qa_sheet_url_ps, sheet = "Correction _Log Shura ") |> mutate(Tool = "Tool 7 - Shura", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)),
  read_sheet(data_entry_url, sheet = "Correction_Log") |> mutate(Tool = "Data_entry", old_value = as.character(old_value), New_Value = as.character(New_Value), KEY_Unique=Key)
)

deletion_log_ps <- read_sheet(qa_sheet_url_ps, sheet = "To be removed from dataset")

# read QA log from Google sheet - CBE -----------------------------------------
qa_sheet_cbe = read_sheet(qa_sheet_url_cbe, sheet = "QA_Log")

correction_log_cbe = bind_rows(
  read_sheet(qa_sheet_url_cbe, sheet = "Correction_Log Parent Interview") |> mutate(Tool = "Tool 6 - Parent", old_value = as.character(old_value), new_value = as.character(new_value)),
  read_sheet(qa_sheet_url_cbe, sheet = "Correction_Log Shura Interview") |>
    rename(KEY = KEY_Unique, question = Question, new_value = New_Value) |> mutate(Tool = "Tool 7 - Shura", old_value = as.character(old_value), new_value = as.character(new_value)),
  read_sheet(qa_sheet_url_cbe, sheet = "Correction_Log Class Level") |> mutate(Tool = "Tool 8 - Class", old_value = as.character(old_value), new_value = as.character(new_value)),
  read_sheet(qa_sheet_url_cbe, sheet = "Correction_Log IP Level") |> mutate(Tool = "Tool 9 - IP", old_value = as.character(old_value), new_value = as.character(new_value))
)

deletion_log_cbe <- read_sheet(qa_sheet_url_cbe, sheet = "To be removed from dataset")

# Prepare Datasets - Public School ---------------------------------------------
qa_sheet_ps <- qa_sheet_ps |>
  rename(
    qa_status = "QA Status",
    tool = `Tool`) |>
  mutate(
    qa_status = toupper(qa_status), 
    qa_status = case_when(
      is.na(qa_status) ~ "PENDING",
      TRUE ~ qa_status
    )
  )

table(qa_sheet_ps$qa_status, useNA = "always")
# Extract Approved Interviews' uuids 
# TS : Including NOT QA'ED QA category into approved interviews as informed by QA team on DEC 11 
approved_keys_ps = qa_sheet_ps |> 
  filter(qa_status %in% c("APPROVED", "NOT QA'ED")) |> 
  pull(KEY) |> unique()

# deleted_keys = c()
deleted_keys_ps = deletion_log_ps |> pull(KEY_Unique)

# deleted_keys_ps <- c(
#   deleted_keys_ps,
#   raw_data.tool1$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool2$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool3$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool4$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool5$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool6$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps & Sample_Type == "Public School") |> pull(KEY),
#   raw_data.tool7$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps & Sample_Type == "Public School") |> pull(KEY)
# ) |> unique()

correction_log_ps <- correction_log_ps %>% 
  mutate(across(everything(), as.character)) |> 
  rename(
    KEY = "KEY_Unique",
    question = "Question",
    new_value = "New_Value",
    tool = "Tool"
  )

# Prepare Datasets - CBE ------------------------------------------------
qa_sheet_cbe <- qa_sheet_cbe |>
  rename(
    qa_status = "QA Status",
    tool = `Tools`) |>
  mutate(
    qa_status = toupper(qa_status), 
    qa_status = case_when(
      is.na(qa_status) ~ "PENDING",
      TRUE ~ qa_status
    )
  )

table(qa_sheet_cbe$qa_status, useNA = "always")

# Extract Approved Interviews' uuids
# TS : Including NOT QA'ED QA category into approved interviews as informed by QA team on DEC 11 
approved_keys_cbe = qa_sheet_cbe |> 
  filter(qa_status %in% c("APPROVED", "NOT QA'ED")) |> 
  pull(KEY) |> unique()

# deleted_keys = c()
deleted_keys_cbe <- deletion_log_cbe |> pull(KEY_Unique)

# deleted_keys_ps <- c(
#   deleted_keys_ps,
#   raw_data.tool1$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool2$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool3$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool4$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool5$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps) |> pull(KEY),
#   raw_data.tool6$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps & Sample_Type == "Public School") |> pull(KEY),
#   raw_data.tool7$data |> filter(convert_to_date(starttime) < data_collection_start_date_ps & Sample_Type == "Public School") |> pull(KEY)
# ) |> unique()

correction_log_cbe <- correction_log_cbe %>% 
  mutate(across(everything(), as.character)) |> 
  rename(
    tool = "Tool"
  )


# convert numeric dates to date and time formats -------------------------- DONE
source("R/convert_numbers_to_date_time.R")


# looking for interviews that are not QAed -------------------------------- DONE
source("R/log_qa_log_inconsistencies.R")

# Apply correction log ---------------------------------------------------- DONE
if(nrow(correction_log_ps) > 0 | nrow(correction_log_cbe)) source("R/apply_correction_log.R")


# remove the rejected and pilot interviews -------------------------------- DONE
source("R/remove_rejected_interviews.R")


# merge meta data from main sheet to repeating groups --------------------- DONE
source("R/main_sheet_to_repeat_sheets.R")


# double - check repeat sheet count --------------------------------------- DONE
source("R/check_repeat_sheet_counts.R") ## Double-check


# apply translation log --------------------------------------------------- PENDING
# file.edit("R/apply_translation_log.R")


# missing translations (for QA)-------------------------------------------- DONE
source("R/create_translation_log.R") ## Double-check


# missing qa (for QA)------------------------------------------------------ DONE
source("R/missing_qa.R") ## Double-check


# update select multiple binary variables --------- ----------------------- DONE
source("R/fix_select_multiple_questions.R") 


# Check select multiple variables ----------------------------------------- DONE
source("R/check_select_multiple_questions.R")


# re-calculate the calculated variables and compare any changes not applied - DONE
source("R/calculate_cols_check.R") ## Double-check


# Outlier Check ----------------------------------------------------------- DONE
source("R/check_outliers.R") ## Double-check


# Compare Number of Interviews with Sample -------------------------------- DONE
source("R/compare_sample_vs_df.R") ## Double-check


# Relevancy Check --------------------------------------------------------- DONE
source("R/check_relevancies.R") # Add relevancies for Tool 0


# Check the responses with the tool --------------------------------------- DONE
source("R/compare_df_values_with_tool.R") ## Double-check


# GPS Check --------------------------------------------------------------- Omitted
# source("R/check_gps_points.R")


# attach value labels  ---------------------------------------------------- DONE
source("R/attach_labels.R") ## Double-check onward


# re-code variables ------------------------------------------------------- PENDING - On-going
source("R/recoded_vars.R") 


# Logical inconsistencies ------------------------------------------------- PENDING - On-going
source("R/logical_checks.R")


# change 7777, 8888, 9999 to NA  ------------------------------------------ DONE - Confirm the numbers need to be NAed with QA team before running this part
# source("R/recode_to_na.R")


# prepare data sets to export  -------------------------------------------- DONE
## remove extra columns
source("R/remove_extra_columns.R")


# export data sets and issues --------------------------------------------- DONE
source("R/export_outputs.R")

