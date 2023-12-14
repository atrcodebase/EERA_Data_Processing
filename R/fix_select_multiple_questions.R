source("./R/functions/custom_functions.R")

# Tool 0 ----------------------------------------------------------------------
clean_data.tool0$data <- update_series_cols(data = clean_data.tool0$data, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool3_Headcount <- update_series_cols(data = clean_data.tool0$Tool3_Headcount, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool1_Timetable_Year <- update_series_cols(data = clean_data.tool0$Tool1_Timetable_Year, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool1_Timetable1_Repeat <- update_series_cols(data = clean_data.tool0$Tool1_Timetable1_Repeat, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool1_Timetable2_Repeat <- update_series_cols(data = clean_data.tool0$Tool1_Timetable2_Repeat, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool1_Timetable3_Repeat <- update_series_cols(data = clean_data.tool0$Tool1_Timetable3_Repeat, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")
clean_data.tool0$Tool1_Timetable4_Repeat <- update_series_cols(data = clean_data.tool0$Tool1_Timetable4_Repeat, 
                                            tool = kobo_tool.tool0$survey, 
                                            question_separator = "_")

# Tool 1 ----------------------------------------------------------------------
clean_data.tool1$data <- update_series_cols(data = clean_data.tool1$data, 
                                            tool = kobo_tool.tool1$survey, 
                                            question_separator = "_")

clean_data.tool1$School_Operationality <- update_series_cols(data = clean_data.tool1$School_Operationality,
                                                             tool = kobo_tool.tool1$survey, 
                                                             question_separator = "_")

clean_data.tool1$School_Operationality_Other_... <- update_series_cols(data = clean_data.tool1$School_Operationality_Other_...,
                                                                       tool = kobo_tool.tool1$survey,
                                                                       question_separator = "_")

clean_data.tool1$Shifts_Detail <- update_series_cols(data = clean_data.tool1$Shifts_Detail,
                                                     tool = kobo_tool.tool1$survey, 
                                                     question_separator = "_")

clean_data.tool1$Other_Shifts_Detail <- update_series_cols(data = clean_data.tool1$Other_Shifts_Detail,
                                                     tool = kobo_tool.tool1$survey, 
                                                     question_separator = "_")

clean_data.tool1$Headmasters <- update_series_cols(data = clean_data.tool1$Headmasters,
                                                           tool = kobo_tool.tool1$survey, 
                                                           question_separator = "_")


# Tool 2 ----------------------------------------------------------------------
clean_data.tool2$data <- update_series_cols(data = clean_data.tool2$data, 
                                            tool = kobo_tool.tool2$survey, 
                                            question_separator = "_")

clean_data.tool2$Public_Stationary_Kit_Group <- update_series_cols(data = clean_data.tool2$Public_Stationary_Kit_Group, 
                                                                   tool = kobo_tool.tool2$survey, 
                                                                   question_separator = "_")

clean_data.tool2$Teachers_Pack_Group <- update_series_cols(data = clean_data.tool2$Teachers_Pack_Group, 
                                                                   tool = kobo_tool.tool2$survey, 
                                                                   question_separator = "_")

clean_data.tool2$Students_Pack_Group <- update_series_cols(data = clean_data.tool2$Students_Pack_Group, 
                                                           tool = kobo_tool.tool2$survey, 
                                                           question_separator = "_")


# Tool 3 ----------------------------------------------------------------------
clean_data.tool3$data <- update_series_cols(data = clean_data.tool3$data, 
                                            tool = kobo_tool.tool3$survey, 
                                            question_separator = "_")


# Tool 4 ---------------------------------------------------------------------- 
clean_data.tool4$data <- update_series_cols(data = clean_data.tool4$data,
                                            tool = kobo_tool.tool4$survey,
                                            question_separator = "_")

clean_data.tool4$Subjects_Not_Being_Taught <- update_series_cols(data = clean_data.tool4$Subjects_Not_Being_Taught, 
                                                                 tool = kobo_tool.tool4$survey, 
                                                                 question_separator = "_")


# Tool 5 ----------------------------------------------------------------------
clean_data.tool5$data <- update_series_cols(data = clean_data.tool5$data, 
                                            tool = kobo_tool.tool5$survey, 
                                            question_separator = "_")


# Tool 6 ----------------------------------------------------------------------
clean_data.tool6$data <- update_series_cols(data = clean_data.tool6$data, 
                                            tool = kobo_tool.tool6$survey, 
                                            question_separator = "_")



# Tool 7 ----------------------------------------------------------------------
clean_data.tool7$data <- update_series_cols(data = clean_data.tool7$data, 
                                            tool = kobo_tool.tool7$survey, 
                                            question_separator = "_")



# Tool 8 ----------------------------------------------------------------------
clean_data.tool8$data <- update_series_cols(data = clean_data.tool8$data, 
                                            tool = kobo_tool.tool8$survey, 
                                            question_separator = "_")

clean_data.tool8$Classes <- update_series_cols(data = clean_data.tool8$Classes, 
                                            tool = kobo_tool.tool8$survey, 
                                            question_separator = "_")

clean_data.tool8$Classroom_Materials <- update_series_cols(data = clean_data.tool8$Classroom_Materials, 
                                               tool = kobo_tool.tool8$survey, 
                                               question_separator = "_")

clean_data.tool8$Teacher_Kit <- update_series_cols(data = clean_data.tool8$Teacher_Kit, 
                                                           tool = kobo_tool.tool8$survey, 
                                                           question_separator = "_")

clean_data.tool8$Student_Kit <- update_series_cols(data = clean_data.tool8$Student_Kit, 
                                                   tool = kobo_tool.tool8$survey, 
                                                   question_separator = "_")



# Tool 9 ----------------------------------------------------------------------
clean_data.tool9$data <- update_series_cols(data = clean_data.tool9$data, 
                                            tool = kobo_tool.tool9$survey, 
                                            question_separator = "_")


# removing extra elements from the environment
rm(list = c(
  objects(pattern = ".sm_vars$")
))



