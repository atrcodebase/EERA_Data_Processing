# Organization:   ATR
# Date:           Jan 2024
# Script:         EERA Data Processing (Kandahar)
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
# READ ME: will use these values while writing the data set, other wise it would cause error in functions like relevancy checker
data_collection_start_date_ps = as.Date("11.01.2024", format("%d.%m.%Y"))

# qa_sheet_url_cbe = "https://docs.google.com/spreadsheets/d/1xV_1CI13j-td2eaCWtU_1ffdscqshOalaI_MTXB0_zo/edit#gid=1005923888"
qa_sheet_url_ps = "https://docs.google.com/spreadsheets/d/1VZF0KCZ__Ulp6N6Nx2VIcXZNwM50wpTPjZu3ewrDyrI/edit#gid=1005923888"
data_entry_url = "https://docs.google.com/spreadsheets/d/1vM9YUQW5UkehLQmGhlf-nWLuh3keHg_lc0hW_MFNl3E/edit#gid=1568445961"

output_data_path = "output/"
sample_files_path = list.files("input/sample_file_Kandahar/", full.names = T)
# default_wd_path = getwd()
# raw_data_rename_path = paste0(default_wd_path,"/input/raw_data/rename_data.bat")
# system(raw_data_rename_path, wait = T)

raw_data_path = list.files("input/raw_data/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d).*", "tool\\1", .))
kobo_tools_path = list.files("input/tools_Kandahar/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*Tool (\\d).*", "tool\\1", .))
relevancy_files_path = list.files("input/relevancy_files/", full.names = T) %>% .[!grepl("/\\~\\$", .)] |> as.list() %>% setNames(gsub(".*tool(\\d).*", "tool\\1", .)) # Should be checked later
meta_cols <- c("Site_Visit_ID", "starttime", "Region", "Province", "District", "Area_Type")
meta_cols.qa_sheet <- c(Visit_ID = "Site_Visit_ID", "School Code", "Sample_Type", Survey_Date = "SubmissionDate", Region = "Region", "KEY")

# Read inputs --------------------------------------------------------------
# reading the datasets
raw_data.tool0 = read_xlsx_sheets(raw_data_path$tool0)
raw_data.tool1 = read_xlsx_sheets(raw_data_path$tool1)
raw_data.tool2 = read_xlsx_sheets(raw_data_path$tool2)
raw_data.tool3 = read_xlsx_sheets(raw_data_path$tool3)
raw_data.tool4 = read_xlsx_sheets(raw_data_path$tool4)
raw_data.tool5 = read_xlsx_sheets(raw_data_path$tool5)
raw_data.tool6 = read_xlsx_sheets(raw_data_path$tool6)
raw_data.tool7 = read_xlsx_sheets(raw_data_path$tool7)

# read the kobo Tools
kobo_tool.tool0 = read_xlsx_sheets(kobo_tools_path$tool0)
kobo_tool.tool1 = read_xlsx_sheets(kobo_tools_path$tool1)
kobo_tool.tool2 = read_xlsx_sheets(kobo_tools_path$tool2)
kobo_tool.tool3 = read_xlsx_sheets(kobo_tools_path$tool3)
kobo_tool.tool4 = read_xlsx_sheets(kobo_tools_path$tool4)
kobo_tool.tool5 = read_xlsx_sheets(kobo_tools_path$tool5)
kobo_tool.tool6 = read_xlsx_sheets(kobo_tools_path$tool6)
kobo_tool.tool7 = read_xlsx_sheets(kobo_tools_path$tool7)

# read the relevancy files - Should be checked later
relevancy_file.tool0 = read_xlsx_sheets(relevancy_files_path$tool0)
relevancy_file.tool1 = read_xlsx_sheets(relevancy_files_path$tool1)
relevancy_file.tool2 = read_xlsx_sheets(relevancy_files_path$tool2)
relevancy_file.tool3 = read_xlsx_sheets(relevancy_files_path$tool3)
relevancy_file.tool4 = read_xlsx_sheets(relevancy_files_path$tool4)
relevancy_file.tool5 = read_xlsx_sheets(relevancy_files_path$tool5)
relevancy_file.tool6 = read_xlsx_sheets(relevancy_files_path$tool6)
relevancy_file.tool7 = read_xlsx_sheets(relevancy_files_path$tool7)

# read the sample file
sample_file = read.xlsx(sample_files_path[1])

# read QA log from Google sheet - Public School -------------------------------
qa_sheet_ps = read_sheet(qa_sheet_url_ps, sheet = "QA_Log") |> filter(Province == "Kandahar")
# to select the user to authenticate
2
correction_log_ps = bind_rows(
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headmaster") |> mutate(Tool = "Tool 1 - Headmaster", Index = as.character(Index1), old_value = as.character(old_value), New_Value = as.character(New_Value)) |> 
    select(-Index1) |> map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Light") |> mutate(Tool = "Tool 2 - Light", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)) |>
    map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Headcount") |> mutate(Tool = "Tool 3 - Headcount", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)) |>
    map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Teacher") |> mutate(Tool = "Tool 4 - Teacher", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)) |>
    map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log WASH") |> mutate(Tool = "Tool 5 - WASH", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)) |>
    map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction_Log Parent ") |> rename(Key = KEY) |> mutate(Tool = "Tool 6 - Parent", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value), Remarks = as.character(Remarks)) |>
    map_df(as.character),
  
  read_sheet(qa_sheet_url_ps, sheet = "Correction _Log Shura ") |> mutate(Tool = "Tool 7 - Shura", Index = as.character(Index), old_value = as.character(old_value), New_Value = as.character(New_Value)) |>
    map_df(as.character),
  
  read_sheet(data_entry_url, sheet = "Correction_Log") |> mutate(Tool = "Data_entry", old_value = as.character(old_value), New_Value = as.character(New_Value), KEY_Unique=Key) |>
    filter(`New/Old?` == "New") |> map_df(as.character) |> select(-`New/Old?`)
)

deletion_log_ps <- read_sheet(qa_sheet_url_ps, sheet = "To be removed from dataset")

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

table(qa_sheet_ps$qa_status, qa_sheet_ps$tool, useNA = "always")
# Extract Approved Interviews' uuids 
# TS : Including NOT QA'ED QA category into approved interviews as informed by QA team on DEC 11 
approved_keys_ps = qa_sheet_ps |> 
  filter(qa_status %in% c("APPROVED", "NOT QA'ED")) |> 
  pull(KEY) |> unique()

deleted_keys_ps = deletion_log_ps |> pull(KEY_Unique)

correction_log_ps <- correction_log_ps %>% 
  mutate(across(everything(), as.character)) |> 
  rename(
    KEY = "KEY_Unique",
    question = "Question",
    new_value = "New_Value",
    tool = "Tool"
  )

# convert numeric dates to date and time formats -------------------------- DONE
source("R/convert_numbers_to_date_time_K.R")


# looking for interviews that are not QAed -------------------------------- DONE
source("R/log_qa_log_inconsistencies_K.R")

# Apply correction log ---------------------------------------------------- DONE
if(nrow(correction_log_ps) > 0) source("R/apply_correction_log_K.R")


# remove the rejected and pilot interviews -------------------------------- DONE
source("R/remove_rejected_interviews_K.R")


# merge meta data from main sheet to repeating groups --------------------- DONE
source("R/main_sheet_to_repeat_sheets_K.R")


# double - check repeat sheet count --------------------------------------- DONE
source("R/check_repeat_sheet_counts_K.R")


# apply translation log --------------------------------------------------- APPLIED WITH CORRECTION LOG
# file.edit("R/apply_translation_log.R")


# missing translations (for QA)-------------------------------------------- DONE
source("R/create_translation_log_K.R") ## Double-check


# missing qa (for QA)------------------------------------------------------ DONE
source("R/missing_qa_K.R") ## Double-check -- TS


# update select multiple binary variables --------------------------------- DONE
source("R/fix_select_multiple_questions_K.R") 


# Check select multiple variables ----------------------------------------- DONE
source("R/check_select_multiple_questions_K.R")


# re-calculate the calculated variables and compare any changes not applied - DONE
source("R/calculate_cols_check_K.R")


# Outlier Check ----------------------------------------------------------- DONE
source("R/check_outliers_K.R") 


# Compare Number of Interviews with Sample -------------------------------- DONE
source("R/compare_sample_vs_df_K.R")


# Relevancy Check --------------------------------------------------------- DONE
source("R/check_relevancies_K.R") 


# Check the responses with the tool --------------------------------------- DONE
source("R/compare_df_values_with_tool_K.R")


# attach value labels  ---------------------------------------------------- DONE
source("R/attach_labels_K.R")


# re-code variables ------------------------------------------------------- PENDING - On-going
source("R/recoded_vars_K.R") 


# Logical inconsistencies ------------------------------------------------- PENDING - On-going
source("R/logical_checks_K.R")


# prepare data sets to export  -------------------------------------------- DONE
## remove extra columns
source("R/remove_extra_columns_K.R")


# attach labels to calculates cols ---------------------------------------- 
# file.edit("R/attach_calculate_label.R")
source("R/attach_calculate_label_K.R")


# change 7777, 8888, 9999 to Labels  ------------------------------------------ DONE - According to Note in the TOOLs
source("R/recode_to_na_K.R")


# export data sets and issues --------------------------------------------- DONE
source("R/export_outputs_K.R")

