`matchITandFH.default` <-
function( fit, ensembleData) 
{
 
 naNULL <- function(x) {
            if (is.null(x)) x <- -2^25
            if (is.na(x)) x <- -2^20           
            if (is.infinite(x)) x <- -2^30
            x
           }

 
 fitFH <- naNULL(attr(fit, "forecastHour"))
 fitIT <- naNULL(attr(fit, "initializationTime"))
 datFH <- naNULL(attr(ensembleData, "forecastHour"))
 datIT <- naNULL(attr(ensembleData, "initializationTime"))
 
 out <- TRUE

 if (fitFH != datFH & fitIT != datIT) {
   warning("forecast hour and initialization time inconsistent in data and fit\n")
   out <- FALSE
 }
 else if (fitFH != datFH) {
   warning("forecast hour inconsistent in data and fit\n")
   out <- FALSE
 }
 else if (fitIT != datIT) {
   warning("initialization time inconsistent in data and fit\n")
   out <- FALSE
 }

 out
}

