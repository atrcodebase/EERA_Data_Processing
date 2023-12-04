# label SurveyCTO Datasets
labeler <- function(data, tool.survey, tool.choices, survey_label = "label:English", choice_lable = "label:English", multi_response_sep = ";"){

  # survey_questions <- read_excel(tool, "survey")
  # survey_choices <- read_excel(tool,"choices")
  
  survey_questions <- tool.survey
  survey_choices <- tool.choices

  if("value" %in% names(survey_choices)){
    names(survey_choices)[names(survey_choices) == "value"] <- "name"
  }
  
  survey_choices$name <- gsub("\\.0", "", survey_choices$name)

  # Prep Survey Questions
  survey_questions <- survey_questions[grepl("^select_", survey_questions$type),]
  survey_questions$select_type <- survey_questions$type %>% str_extract("^select_(one|multiple)")
  survey_questions$type <- survey_questions$type %>% str_replace_all("select_(one|multiple) ?|\\n|\\t|\\r", "")
  survey_questions <- survey_questions %>%
    dplyr::select(type, name, select_type, all_of(survey_label))

  # Prep Choices
  survey_choices$name <- survey_choices$name %>% as.character
  survey_choices <- survey_choices[!is.na(survey_choices$list_name),]

  for(var in names(data)){
    if(var %in% survey_questions$name){
      # print(var)
      # Grab choices for that variable
      survey_choices_i <- survey_choices[survey_choices$list_name %in% survey_questions$type[survey_questions$name %in% var],]
      
      # add underscore before and after numeric values in {choice_lable}
      add_underscore <- function() {
        index <- gregexpr("[0-9]", survey_choices_i[[choice_lable]])
        regmatches(survey_choices_i[[choice_lable]], index) <<- lapply(regmatches(survey_choices_i[[choice_lable]], index), function(x) paste0("_",x,"_"))
      }
      add_underscore()

      # select one
      if(survey_questions$select_type[survey_questions$name %in% var] == "select_one"){

        for(choice_i in 1:nrow(survey_choices_i)){
          data[[var]] <- data[[var]] %>%
            str_replace_all(paste0("\\b", survey_choices_i$name[choice_i], "\\b"), survey_choices_i[[choice_lable]][choice_i])
        }
        data[[var]] <- data[[var]] %>% str_replace_all("_", "")

        # select multiple
      } else{
        
        data[[var]] <- data[[var]] %>%
          str_replace_all("  ", " ") %>% 
          str_replace_all(" ", paste0(multi_response_sep, " "))
        
        for(choice_i in 1:nrow(survey_choices_i)){
          data[[var]] <- data[[var]] %>%
            str_replace_all(paste0("\\b", survey_choices_i$name[choice_i], "\\b"), survey_choices_i[[choice_lable]][choice_i])
        }
      }
      data[[var]] <- data[[var]] %>% str_replace_all("_", "")

    }
  }

  
  return(data)

}


