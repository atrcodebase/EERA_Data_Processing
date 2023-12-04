# missing_qa_func <- function(data, obj_cols, key_col = "KEY", qa_var_suffix = "_QA") {
#   qa_cols <- paste0(obj_cols, qa_var_suffix)
#   qa_cols <- qa_cols[qa_cols %in% names(data)]
#   
#   obj_cols <- obj_cols[obj_cols %in% gsub(paste0(qa_var_suffix, "$"), "", qa_cols, ignore.case=TRUE)]
#     
#   if (all(qa_cols %in% names(data))) {
#     cbind(
#       data |> 
#         select(any_of(obj_cols), all_of(key_col)) |> 
#         pivot_longer(cols = -key_col, names_to = "object_var_name", values_to = "obj_link"), 
#       data |>
#         select(any_of(qa_cols)) |> 
#         pivot_longer(cols = everything(), names_to = "qa_var_name", values_to = "qa_status")
#     ) |>
#       filter(!is.na(obj_link) | obj_link != "") |>
#       mutate(
#         changed = "No",
#         old_value = str_squish(qa_status),
#         new_value = NA_character_,
#         issue = "Missing/incorrect QA!"
#       ) |> 
#       select(KEY, question = qa_var_name, issue, changed, old_value, new_value)
#   }
# }

missing_qa_func <- function(data, obj_cols, key_col = "KEY") {
  obj_cols <- obj_cols[obj_cols %in% names(data)]
  qa_cols <- names(obj_cols)
  if (all(qa_cols %in% names(data))) {
    cbind(
      data |>
        mutate(across(everything(), \(x) x = as.character(x))) |> 
        select(any_of(obj_cols), all_of(key_col)) |> 
        pivot_longer(cols = -all_of(key_col), names_to = "object_var_name", values_to = "obj_link"), 
      data |>
        select(any_of(qa_cols)) |> 
        pivot_longer(cols = everything(), names_to = "qa_var_name", values_to = "qa_status")
    ) |>
      filter(!is.na(obj_link) | obj_link != "") |>
      mutate(
        changed = "No",
        old_value = str_squish(qa_status),
        new_value = NA_character_,
        issue = "Missing/incorrect QA!"
      ) |> 
      select(KEY, question = qa_var_name, issue, changed, old_value, new_value)
    
  } else {
    stop("At least one of the qa_cols for the given object is missing in data!")
  }
}


