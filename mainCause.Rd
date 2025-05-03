\name{mainCause}
\alias{mainCause}
\title{Major Cause Of A Cancer Type}
\description{Outputs the major cause of a cancer type(2015-2024) in the specified country.}
\usage{
mainCause(Country,cr_type)
}
\arguments{
\item{Country}{Country for which you want to know the main cause of cancer. Country set: (India, UK, USA, Brazil, Germany, Canada, Russia, Pakistan, China, Australia)}
\item{cr_type}{Cancer Type (Lung, Liver, Cervical, Breast, Colon, Skin, Cervical, Prostate)}
}
\value{
A string representation of major casue of a cancer type in the specified country.
}
\examples{
mainCause("India","liver")
mainCause("Uk","Lung")
}