## Public School -----------------------------------------------------------------------------------------------------------------
qaed_ints_key_ps <- qa_sheet_ps |>
  filter(qa_status %in% c("APPROVED", "REJECTED", "NO CONSENT")) |>
  pull(KEY) |>
  unique()

qaed_pending_key_ps <- qa_sheet_ps |>
  filter(qa_status %in% c("PENDING")) |>
  pull(KEY) |>
  unique()

not_qaed_approved_key_ps <- qa_sheet_ps |>
  filter(qa_status %in% c("NOT QA'ED")) |>
  pull(KEY) |>
  unique()


# check if any interview is missed to be QAed 
not_qaed_ints_ps <- rbind(
  raw_data.tool1$data |> filter(!KEY %in% qaed_ints_key_ps ) |> select(KEY) |> mutate(tool = "Tool 1 - Headmaster"),
  raw_data.tool2$data |> filter(!KEY %in% qaed_ints_key_ps ) |> select(KEY) |> mutate(tool = "Tool 2 - Light"),
  raw_data.tool3$data |> filter(!KEY %in% qaed_ints_key_ps ) |> select(KEY) |> mutate(tool = "Tool 3 - Headcount"),
  raw_data.tool4$data |> filter(!KEY %in% qaed_ints_key_ps ) |> select(KEY) |> mutate(tool = "Tool 4 - Teacher"),
  raw_data.tool5$data |> filter(!KEY %in% qaed_ints_key_ps ) |> select(KEY) |> mutate(tool = "Tool 5 - WASH"),
  raw_data.tool6$data |> filter(!KEY %in% qaed_ints_key_ps & Sample_Type == "Public School") |> select(KEY) |> mutate(tool = "Tool 6 - Parent"),
  raw_data.tool7$data |> filter(!KEY %in% qaed_ints_key_ps & Sample_Type == "Public School") |> select(KEY) |> mutate(tool = "Tool 7 - Shura")
) |>
  mutate(
    issue = case_when(
      KEY %in% qaed_pending_key_ps ~ "The interview is in Pending Status (Either not QA'ED or being QA'ED).",
      KEY %in% not_qaed_approved_key_ps ~ "The interview is approved (Not QA'ED category)",
      TRUE ~ "The interview is missing from QA_Log sheet."
    ),
    component = "Public School"
  ) %>% filter(issue %notin% "The interview is approved (Not QA'ED category)")


# check if the qa_status in data sets are inconsistent with the QA_logs 
inconsistent_qa_status_ps <- rbind(
  raw_data.tool1$data |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 1 - Headmaster"),
  raw_data.tool2$data |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 2 - Light"),
  raw_data.tool3$data |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 3 - Headcount"),
  raw_data.tool4$data  |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 4 - Teacher"),
  raw_data.tool5$data  |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 5 - WASH"),
  raw_data.tool6$data |> filter(Sample_Type == "Public School") |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 6 - Parent"),
  raw_data.tool7$data  |> filter(Sample_Type == "Public School") |> select(KEY, review_status.data = review_status) |> mutate(tool = "Tool 7 - Shura")
) |>
  mutate(
    review_status.data = case_when(
      review_status.data == "AWAITING_REVIEW" ~ "PENDING",
      TRUE ~ review_status.data
    )
  ) |> 
  left_join(select(qa_sheet_ps, KEY, review_status.qa_logs = qa_status) |>
              mutate(
                review_status.qa_logs = case_when(
                  review_status.qa_logs == "NOT QA'ED" ~ "APPROVED",
                  TRUE ~ review_status.qa_logs
                )
              )) |>
  mutate(
    issue = glue::glue("The review status in data ({review_status.data}) and QA Logs sheet ({review_status.qa_logs}) are inconssitent."),
    component = "Public School"
  ) |>
  filter(review_status.data != review_status.qa_logs) %>% 
  filter(review_status.data %in% "REJECTED" & review_status.qa_logs %in% "APPROVED") # Filtering only cases Rejected on SCTO but approved on QA Log, the rest is not an issue

print(count(inconsistent_qa_status_ps, review_status.data))
print(count(inconsistent_qa_status_ps, review_status.qa_logs))


# inconsistency between deletion log and QAed interviews 
deletion_inconsistency_ps <- bind_rows(
  qa_sheet_ps |> 
    filter(
      KEY %in% deleted_keys_ps & qa_status %in% c("APPROVED", "PENDING", "NO CONSENT", "NOT QA'ED")
    ) |> 
    mutate(issue = glue::glue("The review status in qa logs sheet is ({qa_status}) at the same time it is deleted and logged in deletion log."))
) |> 
  select(any_of(meta_cols.qa_sheet), tool, issue)

int_in_qa_sheet_not_in_df_ps <- rbind(
  qa_sheet_ps |> filter(tool == "Headmaster Interview" & !KEY %in% raw_data.tool1$data$KEY) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 1 - Headmaster"),
  qa_sheet_ps |> filter(tool == "Light Tool" & !KEY %in% raw_data.tool2$data$KEY) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 2 - Light"),
  qa_sheet_ps |> filter(tool == "Student Document & Headcount" & !KEY %in% raw_data.tool3$data$KEY) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 3 - Headcount"),
  qa_sheet_ps |> filter(tool == "Teacher Tool" & !KEY %in% raw_data.tool4$data$KEY) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 4 - Teacher"),
  qa_sheet_ps |> filter(tool == "WASH Tool" & !KEY %in% raw_data.tool5$data$KEY) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 5 - WASH"),
  qa_sheet_ps |> filter(tool == "Parent Tool" & !KEY %in% (raw_data.tool6$data |> filter(Sample_Type == "Public School") |> pull(KEY))) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 6 - Parent"),
  qa_sheet_ps |> filter(tool == "Shura Tool" & !KEY %in% (raw_data.tool7$data |> filter(Sample_Type == "Public School") |> pull(KEY))) |> select(any_of(meta_cols), KEY) |> mutate(tool = "Tool 7 - Shura")
) %>% 
  mutate(
    Issue = "The Interview is not existed in data (In the mentioned Tool and Component) but listed in QA sheet",
    Component = "Public School"
  )


# Output 1
not_qaed_ints <- rbind(
  not_qaed_ints_ps
)

# Output 2
inconsistent_qa_status <- rbind(
  inconsistent_qa_status_ps
)

# Output 3
int_in_qa_sheet_not_in_df <- rbind(
  int_in_qa_sheet_not_in_df_ps
)

# remove extra elements from environment ----------------------------------
rm(list = c("qaed_ints_key_ps", "not_qaed_ints_ps",
            "inconsistent_qa_status_ps", "int_in_qa_sheet_not_in_df_ps"))

