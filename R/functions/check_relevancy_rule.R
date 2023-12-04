# Relevancy Function -------------------------------------------------------------------------------
check_relevancy_rules <- function(data, tool_relevancy){
  `%notin%` = negate(`%in%`)
  # initiate Log
  relevancy_log <- data.frame()
  
  # Loop through relevancy rules
  # row_i = 7
  questions <- tool_relevancy$name
  for(row_i in 1:length(tool_relevancy$name)){
    question <- questions[row_i]
    check_reverse <- tool_relevancy$check_reverse[row_i]
    relevancy_sub <- tool_relevancy[tool_relevancy$name == question,]
    
    # Skip if question is missing
    if(question %notin% names(data)){
      print(paste0("Column missing in dataset: ", question))
      next
    }
    
    # Conditional string
    conditional_string <- relevancy_sub$Rcondition
    conditional_str_negated <- relevancy_sub$Rcondition %>% paste0("!(", ., ")") #Negate
    
    # Flag issues
    if(check_reverse){
      flagged_rows <- c(
        # Rows where Question has a value but relevant question does not apply 
        which(!is.na(data[[question]]) & data[[question]] != "" & eval(parse(text=conditional_str_negated))),
        # Rows where Relevant Question applies but the actual question is null
        which(is.na(data[[question]]) & eval(parse(text=conditional_string)))
      )
    } else {
      # Rows where Question has a value but relevant question does not apply 
      flagged_rows <- which(!is.na(data[[question]]) & data[[question]] != "" & eval(parse(text=conditional_str_negated)))
    }
    
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