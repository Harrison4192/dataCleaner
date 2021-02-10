#' Clean Data Frame
#'
#' Uses the functions of frameCleaneR and other operations to apply cleaning operations to a data frame
#'
#' @param .data a data frame
#'
#' @return data frame
#' @export
clean_frame <- function(.data){

  suppressWarnings({

    .data %>%
      janitor::remove_empty(which = c("rows", "cols")) %>%
      janitor::clean_names(., case = "all_caps", ascii = F) %>%
      dplyr::mutate(dplyr::across(where(rlang::is_integerish), as.integer)) %>%
      frameCleaneR::set_dates(tidyselect::everything()) %>%
      frameCleaneR::remove_whitespace(where(is.character)) %>%
      frameCleaneR::set_na(where(is.character)) %>%
      frameCleaneR::relocate_all(.)


  })
}