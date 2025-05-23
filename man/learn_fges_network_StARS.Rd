% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/learn_fges_network_StARS.R
\name{learn_fges_network_StARS}
\alias{learn_fges_network_StARS}
\title{Learn a fast greedy equivalence search (FGES) network with
Stability Approach to Regularization Selection (StARS)}
\usage{
learn_fges_network_StARS(fges_in_file_path, maxCat = 5, out_dir)
}
\arguments{
\item{fges_in_file_path}{Path to file containing dataset on which to run FGES}

\item{maxCat}{Maximum number of categories for a variable to be treated as discrete}

\item{out_dir}{to directory to which all output files should be written}
}
\value{
Path to file containing the output from FGES
}
\description{
This function returns the path to a file containing the FGES network learned with StARS
on the input dataset.
}
