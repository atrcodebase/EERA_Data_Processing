date_time_cols <- c("SubmissionDate", "starttime", "endtime")
date_time_cols_tool8 <- c("E20")

# Tool 1
raw_data.tool0$data <- convert_to_date_time(raw_data.tool0$data, date_time_cols)
raw_data.tool1$data <- convert_to_date_time(raw_data.tool1$data, date_time_cols)
raw_data.tool2$data <- convert_to_date_time(raw_data.tool2$data, date_time_cols)
raw_data.tool3$data <- convert_to_date_time(raw_data.tool3$data, date_time_cols)
raw_data.tool4$data <- convert_to_date_time(raw_data.tool4$data, date_time_cols)
raw_data.tool5$data <- convert_to_date_time(raw_data.tool5$data, date_time_cols)
raw_data.tool6$data <- convert_to_date_time(raw_data.tool6$data, date_time_cols)
raw_data.tool7$data <- convert_to_date_time(raw_data.tool7$data, date_time_cols)
