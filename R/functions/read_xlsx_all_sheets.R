read_xlsx_sheets = function(path){
  guess_max <- 5000000
  convert_to_na <- c("N/A", "-", " ") # values to convert to NA
  # df <- map2(path, getSheetNames(path), ~ openxlsx::read.xlsx(.x, sheet = .y, na.strings = convert_to_na), .progress = TRUE) |> setNames(getSheetNames(path))
  df <- map2(path, getSheetNames(path), ~ readxl::read_excel(.x, sheet = .y, guess_max=guess_max, na=convert_to_na, .name_repair = "minimal"), .progress = TRUE) |> setNames(getSheetNames(path))
  if (length(df) == 1) df <- data.frame(unname(df))
  return(df)
} 
