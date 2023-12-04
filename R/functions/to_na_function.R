to_na <- function(data, tool.survey, values_to_na = c(7777, 8888, 9999, 77777)) {
  library(dplyr)
  columns <- tool.survey |> filter(type == "integer") |> pull(name)
  
  columns <- data |> 
    select(any_of(columns)) |> 
    select(!where(is.logical)) |> 
    colnames()
  
  data <- data %>%
    mutate(across(all_of(columns), function(x)
      x = case_when(
        x %in% values_to_na ~ NA_real_,
        TRUE ~ x
      )
    ))
  
  return(data)
}
