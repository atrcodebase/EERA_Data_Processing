source("./R/functions/custom_functions.R")


# extracting the select multiple questions of each tool
tool1.sm_vars <- kobo_tool.tool1$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool2.sm_vars <- kobo_tool.tool2$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool3.sm_vars <- kobo_tool.tool3$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool4.sm_vars <- kobo_tool.tool4$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool5.sm_vars <- kobo_tool.tool5$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool6.sm_vars <- kobo_tool.tool6$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool7.sm_vars <- kobo_tool.tool7$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool8.sm_vars <- kobo_tool.tool8$survey |> filter(grepl("select_multiple",type)) |> pull(name)
tool9.sm_vars <- kobo_tool.tool9$survey |> filter(grepl("select_multiple",type)) |> pull(name)


# Tool 1 ----------------------------------------------------------------------
clean_data.tool1$data <- update_series_cols(data = clean_data.tool1$data, 
                                            multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$data))], 
                                            question_separator = "_")

clean_data.tool1$School_Operationality <- update_series_cols(data = clean_data.tool1$School_Operationality,
                                            multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$School_Operationality))], 
                                            question_separator = "_")

clean_data.tool1$School_Operationality_Other_... <- update_series_cols(data = clean_data.tool1$School_Operationality_Other_..., 
                                                             multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$School_Operationality_Other_...))], 
                                                             question_separator = "_")

clean_data.tool1$Shifts_Detail <- update_series_cols(data = clean_data.tool1$Shifts_Detail,
                                                     multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$Shifts_Detail))], 
                                                     question_separator = "_")

clean_data.tool1$Other_Shifts_Detail <- update_series_cols(data = clean_data.tool1$Other_Shifts_Detail,
                                                     multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$Other_Shifts_Detail))], 
                                                     question_separator = "_")

clean_data.tool1$Headmasters <- update_series_cols(data = clean_data.tool1$Headmasters,
                                                           multi_vars = tool1.sm_vars[which(tool1.sm_vars %in% names(clean_data.tool1$Headmasters))], 
                                                           question_separator = "_")


# Tool 2 ----------------------------------------------------------------------
clean_data.tool2$data <- update_series_cols(data = clean_data.tool2$data, 
                                            multi_vars = tool2.sm_vars[which(tool2.sm_vars %in% names(clean_data.tool2$data))], 
                                            question_separator = "_")

clean_data.tool2$Public_Stationary_Kit_Group <- update_series_cols(data = clean_data.tool2$Public_Stationary_Kit_Group, 
                                            multi_vars = tool2.sm_vars[which(tool2.sm_vars %in% names(clean_data.tool2$Public_Stationary_Kit_Group))], 
                                            question_separator = "_")

clean_data.tool2$Teachers_Pack_Group <- update_series_cols(data = clean_data.tool2$Teachers_Pack_Group, 
                                                                   multi_vars = tool2.sm_vars[which(tool2.sm_vars %in% names(clean_data.tool2$Teachers_Pack_Group))], 
                                                                   question_separator = "_")

clean_data.tool2$Students_Pack_Group <- update_series_cols(data = clean_data.tool2$Students_Pack_Group, 
                                                           multi_vars = tool2.sm_vars[which(tool2.sm_vars %in% names(clean_data.tool2$Students_Pack_Group))], 
                                                           question_separator = "_")


# Tool 3 ----------------------------------------------------------------------
clean_data.tool3$data <- update_series_cols(data = clean_data.tool3$data, 
                                            multi_vars = tool3.sm_vars[which(tool3.sm_vars %in% names(clean_data.tool3$data))], 
                                            question_separator = "_")


# Tool 4 ---------------------------------------------------------------------- Error in Data
# # clean_data.tool4$data <- update_series_cols(data = clean_data.tool4$data, 
#                                             multi_vars = tool4.sm_vars[which(tool4.sm_vars %in% names(clean_data.tool4$data))], 
#                                             question_separator = "_")

clean_data.tool4$Subjects_Not_Being_Taught <- update_series_cols(data = clean_data.tool4$Subjects_Not_Being_Taught, 
                                            multi_vars = tool4.sm_vars[which(tool4.sm_vars %in% names(clean_data.tool4$Subjects_Not_Being_Taught))], 
                                            question_separator = "_")


# Tool 5 ----------------------------------------------------------------------
clean_data.tool5$data <- update_series_cols(data = clean_data.tool5$data, 
                                            multi_vars = tool5.sm_vars[which(tool5.sm_vars %in% names(clean_data.tool5$data))], 
                                            question_separator = "_")


# Tool 6 ----------------------------------------------------------------------
clean_data.tool6$data <- update_series_cols(data = clean_data.tool6$data, 
                                            multi_vars = tool6.sm_vars[which(tool6.sm_vars %in% names(clean_data.tool6$data))], 
                                            question_separator = "_")



# Tool 7 ----------------------------------------------------------------------
clean_data.tool7$data <- update_series_cols(data = clean_data.tool7$data, 
                                            multi_vars = tool7.sm_vars[which(tool7.sm_vars %in% names(clean_data.tool7$data))], 
                                            question_separator = "_")



# Tool 8 ----------------------------------------------------------------------
clean_data.tool8$data <- update_series_cols(data = clean_data.tool8$data, 
                                            multi_vars = tool8.sm_vars[which(tool8.sm_vars %in% names(clean_data.tool8$data))], 
                                            question_separator = "_")

clean_data.tool8$Classes <- update_series_cols(data = clean_data.tool8$Classes, 
                                            multi_vars = tool8.sm_vars[which(tool8.sm_vars %in% names(clean_data.tool8$Classes))], 
                                            question_separator = "_")

clean_data.tool8$Classroom_Materials <- update_series_cols(data = clean_data.tool8$Classroom_Materials, 
                                               multi_vars = tool8.sm_vars[which(tool8.sm_vars %in% names(clean_data.tool8$Classroom_Materials))], 
                                               question_separator = "_")

clean_data.tool8$Teacher_Kit <- update_series_cols(data = clean_data.tool8$Teacher_Kit, 
                                                           multi_vars = tool8.sm_vars[which(tool8.sm_vars %in% names(clean_data.tool8$Teacher_Kit))], 
                                                           question_separator = "_")

clean_data.tool8$Student_Kit <- update_series_cols(data = clean_data.tool8$Student_Kit, 
                                                   multi_vars = tool8.sm_vars[which(tool8.sm_vars %in% names(clean_data.tool8$Student_Kit))], 
                                                   question_separator = "_")



# Tool 9 ----------------------------------------------------------------------
clean_data.tool9$data <- update_series_cols(data = clean_data.tool9$data, 
                                            multi_vars = tool9.sm_vars[which(tool9.sm_vars %in% names(clean_data.tool9$data))], 
                                            question_separator = "_")


# removing extra elements from the environment
rm(list = c(
  objects(pattern = ".sm_vars$")
))



