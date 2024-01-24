## Test
# clean_data.tool1$School_Operationality_Other_...[clean_data.tool1$School_Operationality_Other_...$KEY == "uuid:00a057c9-1c8c-4f64-a957-26fb763faa04/Passcode_correct-School_Open-School_Operationality_Other_Grades[1]","Grade_Value"] <- 6
# 
# 
# ## Check if this case could be applied on other cases than SM one
# df = clean_data.tool1$data
# df_question = "C13A5"
# child_df = clean_data.tool1$School_Operationality_Other_...
# child_df_question = "Grade_Value"
#   
# 
# error <- repeat_sheet_indx_check(df = clean_data.tool1$data, df_question = "C13A5", child_df = clean_data.tool1$School_Operationality_Other_...,child_df_question = "Grade_Value", meta_cols = meta_cols)

repeat_sheet_indx_check <- function(df, df_question, child_df, child_df_question, meta_cols = NULL){
  
  # Store the df names
  df_name <- deparse(substitute(df))
  child_df_name <- deparse(substitute(child_df))
  
  # Filters only KEY and binary question of counter
  df <- df[c("KEY",df_question,names(df)[grepl(paste0("^",df_question,"_\\d"), names(df), ignore.case = T)])] |> 
    filter(!is.na(!!sym(df_question))) |>
    select(-!!sym(df_question))
  
  # Pivot the selection to exclude non-selected options
  df <- df |>
    pivot_longer(cols = starts_with(df_question), names_to = "index", values_to = "value") |>
    filter(value == 1) |>
    mutate(
      index = sub("^[^_]*_","", index),
      key_for_join = paste0(KEY,"_", index)
    ) |>
    select(-value)

  # Filter only required questions from Repeat sheet and create KEY for joining
  child_df <- child_df |>
    select(KEY, PARENT_KEY, !!sym(child_df_question)) |>
    mutate(
      key_for_join = paste0(PARENT_KEY, "_", !!sym(child_df_question))
    )
  
  # Join Counter with 
  df <- df |> 
    full_join(child_df, by = "key_for_join")
  
  # Categorize the result
  result <- df |>
    filter(is.na(KEY.x) | is.na(KEY.y)) |>
    mutate(
      Issue = case_when(
        is.na(KEY.x) ~ paste0("The Index ", !!sym(child_df_question) ," in the sheet '", gsub("^.*\\$", "",child_df_name), "' is not selected in the sheet '", gsub("^.*\\$", "",df_name), "' question ", df_question),
        is.na(KEY.y) ~ paste0("The Index ", index, " in the sheet '", gsub("^.*\\$", "",df_name) ,"' in question ", df_question, " is not existed in the sheet '", gsub("^.*\\$", "",child_df_name), "' question ", child_df_question)
      )
    ) |>
    select(
      any_of(meta_cols),
      Counter_KEY = KEY.x,
      Counter_Index = index,
      Repeat_Sheet_KEY = KEY.y,
      Repeat_Sheet_Index = !!sym(child_df_question),
      Issue
      )
    
  # Return flags
  if(nrow(result) > 0){
    return(result)
  }else(
    print("No issue found!")
  )
}

