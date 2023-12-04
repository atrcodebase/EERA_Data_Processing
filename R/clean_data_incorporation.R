### Tool1, Tool2, and Tool3 ### ------------------------------------------------
com_col_tool1.2 <- names(clean_data.tool1$data[which(names(clean_data.tool1$data) %in% names(clean_data.tool2$data))])
com_col_tool1.2 <- com_col_tool1.2[!com_col_tool1.2 %in% c("Preschool_VistID")]
com_col_tool1.3 <- names(clean_data.tool1$data[which(names(clean_data.tool1$data) %in% names(clean_data.tool3$data))])
com_col_tool1.3 <- com_col_tool1.3[!com_col_tool1.3 %in% c("Preschool_VistID")]


clean_data.tool123 <- clean_data.tool1$data
clean_data.tool2.join <- clean_data.tool2$data[, !names(clean_data.tool2$data) %in% com_col_tool1.2]
