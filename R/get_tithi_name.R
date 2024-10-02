library(plumber)

#' @apiTitle Tithi API
#' @apiVersion 1.0.0

# ---------------------------------------------------------------------------- #
#' get_tithi_name
#' @description Get name(s) of the Tithi for a given Julian day number and place.
#'
#' @param jd Numeric Julian day number
#' @param place Numeric vector containing latitude, longitude, and timezone
#'
#' @return List containing name(s) of the Tithi and its ending time.
#' @response 200 Returns the Tithi names and times in JSON format
#' @response 400 Returns an error if the input parameters are invalid
#' @examples
#' # curl -X GET "http://<your-opencpu-server>/your_api/get_tithi_name?jd=2459778&place=c(15.34,75.13,5.5)"
#' @get /get_tithi_name
function(jd, place) {
  # Validate inputs
  if (is.null(jd) || length(place) != 3) {
    return(list(error = "Invalid input parameters. Please provide a valid Julian day and a vector of latitude, longitude, and timezone."))
  }

  tithi_ <- tithi(jd, place)  # Assuming tithi() is defined elsewhere
  size <- length(tithi_) / 4
  j <- 1
  tithi_name <- ""

  for (i in 1:size) {
    tithi_name <- paste(tithi_name, tithis[tithi_[j]], " till", sep = "")
    tithi_name <- paste(tithi_name, paste(tithi_[j + 1], tithi_[j + 2], tithi_[j + 3], sep = ":"))
    
    if (size > 1 && i == 1) {
      tithi_name <- paste(tithi_name, "& ")
    }
    j <- j + 4  # Increment by 4 for the next tithi
  }

  return(list(tithi = tithi_name))
}
# ---------------------------------------------------------------------------- #

# Run the API with plumber
# plumber::pr() %>% plumber::pr_run(port = 8000)  # Uncomment to run locally
