# custom function to apply cleaning log
apply_log <- function(data, log) {
  rowi = 2
  for (rowi in 1:nrow(log)){
    var_i  <- log$question[rowi]
    old_i  <- log$old_value[rowi]
    new_i  <- log$new_value[rowi]
    uuid_i <- log$KEY[rowi]
    
    if (var_i %in% colnames(data)) {
      
      var_type <- class(data[[var_i]])
      
      if (var_type %in% "character") {
        if(new_i == "NULL" | is.null(new_i) | is.na(new_i)){
          data[data$KEY == uuid_i, var_i] <- NA_character_
        }else{
          data[data$KEY == uuid_i, var_i] <- as.character(new_i)
        }
        
      } else { # c("numeric", "double", "integer")
        if(new_i == "NULL" | is.null(new_i) | is.na(new_i)){
          data[data$KEY == uuid_i, var_i] <- NA_real_
        }else{
          data[data$KEY == uuid_i, var_i] <- as.numeric(new_i)
        }
      }
      
      print(paste(rowi, "uuid:", uuid_i, "Old value: ", old_i, "changed to", new_i, "for", var_i, "new value is: ",data[data$KEY %in% uuid_i, var_i]))
      
    }
  }
  return(data)
}


# test_log_applied_error <- function(data, log){
#   
#   q_i <- vector()
#   log_v_i <- vector()
#   uuid <- vector()
#   applied_i <- vector()
#   
#   # rowi = 2
#   for (rowi in 1:nrow(log)){
#     var_i  <- log$question[rowi]
#     new_i  <- log$new_value[rowi]
#     uuid_i <- log$KEY[rowi]
#   
#     
#     q_i <- c(q_i, var_i)
#     log_v_i <- c(log_v_i, new_i)
#     uuid <- c(uuid, uuid_i)
#     applied_i <- c(applied_i, data[data$KEY %in% uuid_i, var_i])
#   }
#   return_v <- data.frame(q_i, log_v_i, uuid, applied_i) %>% filter(is.na(applied_i) & !is.na(log_v_i) & !is.null(log_v_i) & log_v_i != "NULL")
#   return(return_v)
# }