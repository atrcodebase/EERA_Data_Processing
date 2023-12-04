read_xlsx_sheets = function(path){
  df <- map2(path, getSheetNames(path), ~ openxlsx::read.xlsx(.x, sheet = .y), .progress = TRUE) |> setNames(getSheetNames(path))
  if (length(df) == 1) df <- data.frame(unname(df))
  return(df)
} 
