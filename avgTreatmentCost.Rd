\name{avgTreatmentCost}
\alias{avgTreatmentCost}
\title{Average Treatment Cost}
\description{Outputs the average treatment cost for a given stage of specified cancer type.}
\usage{
avgTreatmentCost(type, stage)
}
\arguments{
\item{type}{cancer_type to search for (Lung, Liver, Cervical, Breast, Colon, Skin, Cervical, Prostate)}
\item{stage}{cancer_stage of specified cancer_type (0-4)}
}
\value{
A string displaying the average treatment cost of specified cancer type and its stage in the world.
}
\examples{
avgTreatmentCost("Liver","Stage 1")
avgTreatmentCost("prostate","stage 4")
}


