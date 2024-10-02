# Load required libraries
library(VedicDateTime)
library(jsonlite)

# Function to calculate Panchanga
calculate_panchanga <- function(date) {
  # Split the date string into day, month, and year
  day <- as.numeric(format(date, "%d"))
  month <- as.numeric(format(date, "%m"))
  year <- as.numeric(format(date, "%Y"))
  
  place <- c(27.953333, 86.335833, +5.7999)  # Updated coordinates
  
  # Get Julian Day for the given date
  julian_day <- gregorian_to_jd(day, month, year)
  
  # Get Julian Day for the next day (increment date by 1)
  next_day <- date + 1
  next_day_julian <- gregorian_to_jd(as.numeric(format(next_day, "%d")), as.numeric(format(next_day, "%m")), as.numeric(format(next_day, "%Y")))
  
  # Calculate Masa number
  masa_num <- masa(julian_day, place)[1]
  
  # Calculate Ritu number
  ritu_num <- ((masa_num - 1) %/% 2) + 1
  
  # Ritu names
 ritu_names <- c("Vasanta", "Grishma", "Varsha", "Sharad", "Hemanta", "Shishira")
  
  # Get Ritu name
  ritu_name <- ritu_names[ritu_num]
  
  # Calculate Panchanga values for the given date
  panchanga <- list(
    Tithi = as.character(get_tithi_name(julian_day, place)),
    Nakshatra = as.character(get_nakshatra_name(julian_day, place)),
    Yoga = as.character(get_yoga_name(julian_day, place)),
    Karana = as.character(get_karana_name(julian_day, place)),
    Sunrise = as.character(sunrise(julian_day, place)),
    Sunset = as.character(sunset(julian_day, place)),
    Moonrise = as.character(moonrise(julian_day, place)),
    Moonset = as.character(moonset(julian_day, place)),
    Vaara = as.character(vaara(julian_day)),
    Masa = as.character(masa_num),
    Rashi = as.character(get_rashi_name(julian_day)),
    Lagna = as.character(get_lagna_name(julian_day)),
    Ritu = ritu_name,  # Updated Ritu calculation
    Samvatsara = as.character(get_samvatsara_name(julian_day, place)),
    Ahargana = as.character(ahargana(julian_day)),
    LunarPhase = as.character(lunar_phase(julian_day)),
    DayDuration = as.character(day_duration(julian_day, place)),
    ElapsedYear = as.character(elapsed_year(julian_day, masa_num)),
    JulianDate = julian_day,  # Include Julian Date
    Date = format(date, "%Y-%m-%d"),
    
    # Calculate Panchanga values for the next day
    NextDaySunrise = as.character(sunrise(next_day_julian, place))  # Added NextDaySunrise
  )
  
  return(panchanga)
}

# Get the current date
input_date <- Sys.Date()

# Calculate Panchanga for the current date
panchanga_result <- calculate_panchanga(input_date)

# Convert to JSON
panchanga_json <- toJSON(panchanga_result, pretty = TRUE, auto_unbox = TRUE)

# Print the JSON output
cat(panchanga_json)