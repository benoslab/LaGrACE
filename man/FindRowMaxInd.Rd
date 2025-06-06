% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/LOVE.R
\name{FindRowMaxInd}
\alias{FindRowMaxInd}
\title{Calculate indices of ith row such that the absolute values of these indices
are within 2*delta from the maximal absolute value {@code M} of this row.}
\usage{
FindRowMaxInd(i, M, vector, delta)
}
\arguments{
\item{i}{integer denoting for the ith row.}

\item{M}{the maximal absolute value of the ith row.}

\item{vector}{the entries of this row.}

\item{delta}{numerical constant.}
}
\value{
a vector of indices.
}
\description{
Calculate indices of ith row such that the absolute values of these indices
are within 2*delta from the maximal absolute value {@code M} of this row.
}
