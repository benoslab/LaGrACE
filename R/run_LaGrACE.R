#' Learn FGES network and calculate LaGrACE divergence score
#'
#' This function returns LaGrACE divergence score
#' @param input_data Dataframe containing data for all samples (rows) and variables (columns)
#' @param reference_samples Logical vector indicating which samples belong to
#' reference group (TRUE) and which do not (FALSE)
#' @param fges_pd Penalty discount value for learning FGES causal network
#' @param maxCat Maximum number of categories for a variable to be treated as discrete
#' @param out_dir Path to directory to which all output files should be written
#' @return Path to file containing the output from FGES
#' @export


run_LaGrACE <- function(input_data, reference_samples, fges_pd = 1,maxCat=5, out_dir) {

  names(input_data) <- make.names(names(input_data),unique=TRUE)

  if (substr(out_dir, nchar(out_dir), nchar(out_dir))=="/"){
    out_dir <- substr(out_dir, 1, nchar(out_dir)-1)
  }

  dir.create(out_dir, showWarnings = FALSE)

  # create dataset that only contains reference samples
  ref_data <- input_data[reference_samples, ]

  # write out new data file with row names
  write.table(input_data, paste0(out_dir,'/input_data.all_samples.w_rownames.txt'), quote = F, sep = '\t', row.names = T, col.names = T)

  # write out reference data file with row names
  write.table(ref_data, paste0(out_dir,'/input_data.reference_samples.w_rownames.txt'), quote = F, sep = '\t', row.names = T, col.names = T)


  dir.create(paste0(out_dir,'/FGES'), showWarnings = FALSE)
  # write out reference data file without row names for fges
  fges_in_file_path <- paste0(out_dir,'/FGES/input_data.reference_samples.wout_rownames.txt')
  write.table(ref_data, fges_in_file_path, quote = F, sep = '\t', row.names = F, col.names = T)

  # Run FGES
  fges_out_net_file <- learn_fges_network(fges_in_file_path, fges_pd,maxCat =maxCat, paste0(out_dir,'/FGES'))

  # calculate LaGrACE features from FGES network output
  lagrace_features <- calculate_features(fges_out_net_file, input_data, reference_samples = reference_samples,maxCat=maxCat)

    return(lagrace_features)
}
