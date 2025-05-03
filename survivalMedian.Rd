\name{survivalMedian}
\alias{survivalMedian}
\title{Median of Survival Years}
\description{Outputs the median survival years for a given country,cancer type and cancer stage.}
\usage{
survivalMedian(Country,cr_type,cr_stage)
}
\arguments{
\item{Country}{Country for which you want to know the median. Country set: (India, UK, USA, Brazil, Germany, Canada, Russia, Pakistan, China, Australia)}
\item{cr_type}{Cancer Type (Lung, Liver, Cervical, Breast, Colon, Skin, Cervical, Prostate)}
\item{cr_stage}{Cancer Stage (0-4)}
}
\value{
A string representation of median survival years.
}
\examples{
survivalMedain("India","liver","stage 1")
survivalMedain("Uk","Lung","Stage 0")
}