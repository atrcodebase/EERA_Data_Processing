source("R/functions/sum_rows.R")


# TOOL 1 ------------------------------------------------------------------
# clean_data.tool1$data <- clean_data.tool1$data

clean_data.tool1$School_Operationality_Other_... <- clean_data.tool1$School_Operationality_Other_... |>
  left_join(select(clean_data.tool1$data, School_CBE_Gender_Based_On_The_Sample, KEY), by = c("PARENT_KEY" = "KEY"))

