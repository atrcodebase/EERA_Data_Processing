sum_rows <- function(df, vars, ...) {
  if (!is.data.frame(df)) stop("df must be a data frame!")
  if (!is.character(vars)) stop("vars must be a character vector containing names of variables to sum!")
  if (length(vars) == 0) stop("vars must not be empty!")
  if (any(!vars %in% names(df))) stop(paste0("The below variable(s) don't exist in df: \n"), paste0(vars[!vars %in% names(df)], collapse = " "))
  if (all(sapply(df[vars], class) != "numeric")) stop("vars must contain only numeric variables!")
  
  return(unname(rowSums(df[vars], ...)))
}
