source("R/functions/to_na_function.R")

## Turn values to NA -------------------------------------------------------
# Tool 1
clean_data.tool1$data <- to_na(
  data = clean_data.tool1$data,
  tool.survey = kobo_tool.tool1$survey)

clean_data.tool1$Shifts_Detail <- to_na(
  data = clean_data.tool1$Shifts_Detail,
  tool.survey = kobo_tool.tool1$survey)

clean_data.tool1$Other_Shifts_Detail <- to_na(
  data = clean_data.tool1$Other_Shifts_Detail,
  tool.survey = kobo_tool.tool1$survey)

# Tool 2
clean_data.tool2$data <- to_na(
  data = clean_data.tool2$data,
  tool.survey = kobo_tool.tool2$survey)

clean_data.tool2$Public_Stationary_Kit_Group <- to_na(
  data = clean_data.tool2$Public_Stationary_Kit_Group,
  tool.survey = kobo_tool.tool2$survey)

clean_data.tool2$Teachers_Pack_Group <- to_na(
  data = clean_data.tool2$Teachers_Pack_Group,
  tool.survey = kobo_tool.tool2$survey)

clean_data.tool2$Students_Pack_Group <- to_na(
  data = clean_data.tool2$Students_Pack_Group,
  tool.survey = kobo_tool.tool2$survey)

# Tool 3
clean_data.tool3$data <- to_na(
  data = clean_data.tool3$data,
  tool.survey = kobo_tool.tool3$survey)

clean_data.tool3$Student_Headcount <- to_na(
  data = clean_data.tool3$Student_Headcount,
  tool.survey = kobo_tool.tool3$survey)

# Tool 4
clean_data.tool4$data <- to_na(
  data = clean_data.tool4$data,
  tool.survey = kobo_tool.tool4$survey)

# Tool 5
clean_data.tool5$data <- to_na(
  data = clean_data.tool5$data,
  tool.survey = kobo_tool.tool5$survey)

# Tool 6
clean_data.tool6$data <- to_na(
  data = clean_data.tool6$data,
  tool.survey = kobo_tool.tool6$survey)

# Tool 7
clean_data.tool7$data <- to_na(
  data = clean_data.tool7$data,
  tool.survey = kobo_tool.tool7$survey)

clean_data.tool7$C6_list_members <- to_na(
  data = clean_data.tool7$C6_list_members,
  tool.survey = kobo_tool.tool7$survey)

# Tool 8
clean_data.tool8$data <- to_na(
  data = clean_data.tool8$data,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$Section_2_2_4_Headcount <- to_na(
  data = clean_data.tool8$Section_2_2_4_Headcount,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$Section_2_4_Student_Ages <- to_na(
  data = clean_data.tool8$Section_2_4_Student_Ages,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$Teacher_Kit <- to_na(
  data = clean_data.tool8$Teacher_Kit,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$Classroom_Materials <- to_na(
  data = clean_data.tool8$Classroom_Materials,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$Student_Kit <- to_na(
  data = clean_data.tool8$Student_Kit,
  tool.survey = kobo_tool.tool8$survey)

clean_data.tool8$V_list_of_all_members <- to_na(
  data = clean_data.tool8$V_list_of_all_members,
  tool.survey = kobo_tool.tool8$survey)

# Tool 9
clean_data.tool9$data <- to_na(
  data = clean_data.tool9$data,
  tool.survey = kobo_tool.tool9$survey)

# remove extra objects from environment  
remove(to_na)


numeric_vars <- kobo_tool.tool2$survey |> filter(type == "integer") |> pull(name)
check_df <- clean_data.tool2$data |> select(all_of(numeric_vars))
