compare_dt <- function (df1, df2, unique_id_df1 = "KEY", unique_id_df2 = "KEY", compare_all = TRUE) 
{
  if (compare_all == FALSE) {
    df1 <- df1[, colnames(df1) %in% colnames(df2)]
    df2 <- df2[, colnames(df2) %in% colnames(df1)]
  }
  if ("KEY" %in% colnames(df1) && unique_id_df1 != "KEY") {
    df1 <- df1 %>% rename(key = KEY)
  }
  df1 <- df1 %>% select(KEY = all_of(unique_id_df1), everything()) %>% 
    mutate(across(-KEY, function(x) x = as.character(x))) %>% 
    pivot_longer(-KEY, values_to = "value_1") %>% mutate(value_1 = str_squish(value_1))
  if ("KEY" %in% colnames(df2) && unique_id_df2 != "KEY") {
    df2 <- df2 %>% rename(key = KEY)
  }
  df2 <- df2 %>% select(KEY = all_of(unique_id_df2), everything()) %>% 
    mutate(across(-KEY, function(x) x = as.character(x))) %>% 
    pivot_longer(-KEY, values_to = "value_2") %>% mutate(value_2 = str_squish(value_2))
  df_both <- full_join(df1, df2, by = c("KEY", "name"))
  diff <- df_both %>% filter((value_1 != value_2) | (is.na(value_1) & 
                                                       !is.na(value_2)) | (!is.na(value_1) & is.na(value_2))) %>% 
    rename(question = name, old_value = value_2, new_value = value_1) %>% 
    mutate(question = ifelse(question == "key", "KEY", question))
  if (nrow(diff) == 0) {
    paste0("No difference in df1 and df2")
    return(diff)
  }
  else {
    return(diff)
  }
}

check_path <- function(path){
  if (!file.exists(path)) {
    dir.create(path, showWarnings = TRUE, recursive = TRUE)
    cat("Created '", path, "' folder")
  } else {
    cat("The '",path,"' folder already exists")
  }
}

# Relevancy Function -------------------------------------------------------------------------------
check_relevancy_rules <- function(data, tool_relevancy){
  # initiate Log
  relevancy_log <- data.frame()
  
  # Loop through relevancy rules
  questions <- unique(tool_relevancy$name)
  for(question in questions){
    
    relevancy_sub <- tool_relevancy[tool_relevancy$name == question,]
    
    # Negate Conditional string
    conditional_string <- relevancy_sub$Rcondition %>% paste0("!(", ., ")") #Negate
    
    #### Dataset Checks
    # Rows where main question is not null
    main_q_logical <- !is.na(data[[question]]) 
    # Rows where relevancy rules does not apply
    relevant_q_logical <- eval(parse(text=conditional_string))
    # Flagged rows
    flagged_rows <- which(main_q_logical & relevant_q_logical)
    
    # Log if rows are flagged
    len_flagged <- length(flagged_rows)
    if(len_flagged > 0){
      # Get the values of relevant questions
      relevant_values <- data[flagged_rows, c("KEY",str_split(relevancy_sub$relevant_question, " - ")[[1]])] %>%
        pivot_longer(-KEY, names_to = "cols", values_to = "value", values_transform=as.character) %>% 
        group_by(KEY) %>% 
        summarize(total = paste0(value, collapse = " - ")) %>% ungroup() %>% pull(total)
      
      log <- data.frame(KEY=data$KEY[flagged_rows],
                        question=rep(question, len_flagged),
                        value=data[[question]][flagged_rows],
                        relevancy_rule=rep(relevancy_sub$relevance_rule[1], len_flagged),
                        relevant_question=rep(paste0(relevancy_sub$relevant_question, collapse = " - "), len_flagged),
                        relev_value=relevant_values)
      # Rbind 
      relevancy_log <- rbind(relevancy_log, log)
    }
  }
  return(relevancy_log)
}

## Update Series cols
update_series_cols <- function(data, tool, question_separator){
  # Read & Filter tool
  # tool <- read_excel(tool_path, "survey", guess_max = 100000)
  sm_cols <- tool$name[grepl("select_multiple", tool$type) & tool$name %in% names(data)]
  
  for(question in sm_cols){
    # print(paste0("Updating: ", question)) # Print
    ## Get all series columns
    series_cols <- names(data)[grepl(paste0("^",question, question_separator, "[0-9]{1,4}$"), names(data))] # Regex: detect the question ended by 1 to 4 numbers followed by nothing else
    # Make all series cols numeric
    data <- data %>% mutate(across(all_of(series_cols), as.numeric))
    
    # Get rows with non-NA values
    rows <- which(!is.na(data[[question]]))
    na_rows <- which(is.na(data[[question]]))
    
    # Loop each series column
    for(column in series_cols){
      # Add word boundary for str_detect (differentiate 1 from 13)
      response <- paste0("\\b", gsub(paste0(question, question_separator), "", column),"\\b")
      # Assign 1 if value exists in main question, else 0
      data[rows, column] <- ifelse(str_detect(data[[question]][rows], response), 1, 0)
      # Make the rest of the rows na
      data[na_rows, column] <- NA_integer_
    }
  }
  return(data)
}
## Check Series Cols
check_select_multiple <- function(data, tool, question_separator, KEY="KEY"){
  # Read & Filter tool
  # tool <- read_excel(tool_path, "survey", guess_max = 100000)
  sm_cols <- tool$name[grepl("select_multiple", tool$type) & tool$name %in% names(data)]
  
  series_log <- data.frame(KEY=NA,question=NA,value=NA,series_columns=NA,
                           series_values=NA,Remarks=NA)
  
  for(question in sm_cols){
    # print(paste0("Checking: ", question)) # Print
    # Get all series columns
    series_cols <- names(data)[grepl(paste0("^",question, question_separator, "[0-9]{1,4}$"), names(data))] # Regex: detect the question ended by 1 to 4 numbers followed by nothing else
    # Filter NA responses
    data_sub <- data %>% 
      select(all_of(question), all_of(series_cols), all_of(KEY)) %>% 
      filter(!is.na(get(question)))
    
    if(nrow(data_sub)!=0){
      for(i in 1:nrow(data_sub)){
        #question value
        val <- str_split(data_sub[[question]][i], " |-")[[1]]
        # make related series column name
        series_columns <- paste0(question,question_separator, val)
        other_columns <- names(data_sub)[names(data_sub) %notin% c(series_columns, question, "KEY")]
        
        if(!all(series_columns %in% names(data_sub))){
          log <- c(data_sub$KEY[i], 
                   question, 
                   data_sub[[question]][i], 
                   paste0(series_columns, collapse = " - "),
                   "", 
                   Remarks="Series column not in data")
          series_log <- rbind(series_log, log)
        } else if(any(data_sub[i,series_columns] %in% c(NA, 0))){
          log <- c(data_sub$KEY[i], 
                   question, 
                   data_sub[[question]][i], 
                   paste0(series_columns, collapse = " - "),
                   paste0(data_sub[i,series_columns], collapse = " - "),
                   Remarks = "Inonsistent series columns")
          series_log <- rbind(series_log, log)
        } else if(any(data_sub[i, other_columns] %in% 1)){
          
          other_cols <- other_columns[which(data_sub[i, other_columns] %in% 1)]
          log <- c(data_sub$KEY[i], 
                   question, 
                   data_sub[[question]][i], 
                   paste0(other_cols, collapse = " - "),
                   paste0(data_sub[i,other_cols], collapse = " - "),
                   Remarks = "At least one response is not in the tool choices")
          series_log <- rbind(series_log, log)
        }
      }
    }
  }
  if(nrow(series_log) == 1){
    print(paste0("No mismatches found: ", deparse(substitute(data))))
    return(series_log[-1,])
  } else {
    return(series_log[-1,])
  }
}
