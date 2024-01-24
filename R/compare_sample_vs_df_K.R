over_sampled_extra_ints <- 
  bind_rows(
    # Tool 1
    clean_data.tool1$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 1 - Headmaster") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 2
    clean_data.tool2$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 2 - Light") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 3
    clean_data.tool3$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 3 - Headcount") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 4
    clean_data.tool4$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 4 - Teacher") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 5
    clean_data.tool5$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 5 - WASH") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 6 - Public School
    clean_data.tool6$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 6 - Parent") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool),
    
    # Tool 7 - Public School
    clean_data.tool7$data %>%
      filter(!Site_Visit_ID %in% sample_file$Site_Visit_Id) %>% 
      mutate(issue="The visit ID is not available in Sample (Extra/oversample collected interview)", value = Site_Visit_ID, Question="Site_Visit_ID", tool = "Tool 7 - Shura") %>% 
      select(all_of(meta_cols), Question, value, KEY, issue, tool)
    
  )

# Remaining interviews (sampled but not collected) ----------------------------------------------------------------
cols_from_sample_ps <- c("Site_Visit_ID", "Province", "District", "Village", "School_CBE_Name")
# cols_from_sample.cbe <- c("Site_Visit_Id","L3_Province.Name.en", "L4_District.Name.En", "VILLAGE.NAME", "NAME.OF.THE.CBE")
# cols_from_sample_ip <- c("Site_Visit_ID", "Province","District", "IP_Name")


missing_not_interviewed_site <- 
  bind_rows(
    # Tool 1
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool1$data$Site_Visit_ID) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 1",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool1"),
    
    # Tool 2
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool2$data$Site_Visit_ID) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 2",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool2"),
    
    # Tool 3
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool3$data$Site_Visit_ID) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 3",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool3"),
    
    # Tool 4
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool4$data$Site_Visit_ID) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 4",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool4"),
    
    # Tool 5
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool5$data$Site_Visit_ID) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 5",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool5"),
    
    # Tool 6
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool6$data) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 6 - Public School",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool6"),
    
    # Tool 7
    sample_file %>%
      filter(!Site_Visit_ID %in% clean_data.tool7$data) %>% 
      select(all_of(cols_from_sample_ps)) %>% 
      mutate(issue="The Site Visit ID is Sampled but no interview is collected in Tool 7 - Public School",
             Question = "Site_Visit_ID",
             value = Site_Visit_ID,
             tool = "tool7")
  )


# removing extra objects from environment
rm(list = c("cols_from_sample_ps"))

