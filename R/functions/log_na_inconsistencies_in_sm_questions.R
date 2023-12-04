log_nas_in_sm <- function(df, extra_cols = "", tool.survey, tool.choices, sm_question_choice_seprator = "_"){
  extra_cols <- c("KEY", extra_cols)
  sm_vars <- tool.survey %>% 
    filter(grepl("^select_multiple", type) & name %in% names(df)) %>% 
    pull(name)
  
  sm_binary_cols <- tool.survey %>% 
    filter(grepl("^select_multiple", type)) %>% 
    separate(type, into = c("question_type", "choices_name"), sep = " ") %>% 
    select(choices_name, question_name = name) %>% 
    left_join(
      tool.choices %>%
        select(choices_name = list_name,
               choice_xml = value),
      by = "choices_name",
      relationship = "many-to-many") %>% 
    mutate(question_choice = paste(question_name, choice_xml, sep = sm_question_choice_seprator)) %>% 
    filter(question_choice %in% names(df)) %>% 
    pull(question_choice)
  
  sm_na_logs <- vector("list", length(sm_vars))
  
  for (question in sm_vars) {
    index = which(question == sm_vars)
    sm_binaries <- sm_binary_cols[startsWith(sm_binary_cols, question)]
    sm_df <- df[c(question, sm_binaries, extra_cols)]
    
    filter_nas = function(row, extra_cols) {
      row = row[!names(row) %in% extra_cols]  
      any(row %in% c(NA, "", "NA")) & !all(row %in% c(NA, "", "NA"))
    }
    
    sm_df_issues <- sm_df[apply(sm_df, 1, filter_nas, extra_cols), ]
    
    if (nrow(sm_df_issues) > 0) {
      sm_na_log <- sm_df_issues[extra_cols]
      sm_na_log$question_name <- question
      sm_na_log$value <- sm_df_issues[[question]]
      sm_na_log$issue <- "Parent question and binary (series) questions must be at the same time 'NA'."
      
      sm_na_logs[[index]] <- sm_na_log
    }
  }
  
  sm_na_logs <- do.call(rbind, sm_na_logs)
  
  if(!(length(sm_na_logs) > 0)){
    sm_na_logs <- data.frame("KEY" = character(), "question_name" = character(), "value" = character(), "issue" = character(), "tool" = character())
  }
  
  return(sm_na_logs)
}