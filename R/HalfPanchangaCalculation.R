# Load required libraries
library(VedicDateTime)
library(jsonlite)

# Define custom Tithi order
tithi_order <- c(
  "Shukla paksha prathama",
  "Shukla paksha dvitiya",
  "Shukla paksha trititya",
  "Shukla paksha chaturthi",
  "Shukla paksha panchami",
  "Shukla paksha sashti",
  "Shukla paksha saptami",
  "Shukla paksha ashtami",
  "Shukla paksha navami",
  "Shukla paksha dashmi",
  "Shukla paksha ekadashi",
  "Shukla paksha dvadashi",
  "Shukla paksha trayodashi",
  "Shukla paksha chaturdashi",
  "Poornima",
  "Krishna paksha prathama",
  "Krishna paksha dvitiya",
  "Krishna paksha trititya",
  "Krishna paksha chaturthi",
  "Krishna paksha panchami",
  "Krishna paksha sashti",
  "Krishna paksha saptami",
  "Krishna paksha ashtami",
  "Krishna paksha navami",
  "Krishna paksha dashmi",
  "Krishna paksha ekadashi",
  "Krishna paksha dvadashi",
  "Krishna paksha trayodashi",
  "Krishna paksha chaturdashi",
  "Amavasya"
)

# Function to calculate Panchanga
calculate_panchanga <- function(date) {
  # Split the date string into day, month, and year
  day <- as.numeric(format(date, "%d"))
  month <- as.numeric(format(date, "%m"))
  year <- as.numeric(format(date, "%Y"))
  
  # Define place (latitude, longitude, timezone)
  place <- c(27.953333, 86.335833, +5.7999)  # Updated coordinates
  
  # Get Julian Day
  julian_day <- gregorian_to_jd(day, month, year)

  # Calculate Masa number
  masa_num <- masa(julian_day, place)[1]
  
  # Calculate Ritu number
  ritu_num <- ((masa_num - 1) %/% 2) + 1
  
  # Ritu names
  ritu_names <- c("Vasanta", "Grishma", "Varsha", "Sharad", "Hemanta", "Shishira")
  
  # Get Ritu name
  ritu_name <- ritu_names[ritu_num]

  # Calculate Panchanga values
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
    Masa = as.character(masa(julian_day, place)[1]),
    Rashi = as.character(get_rashi_name(julian_day)),
    Lagna = as.character(get_lagna_name(julian_day)),
    Ritu = ritu_name,
    Samvatsara = as.character(get_samvatsara_name(julian_day, place)),
    Ahargana = as.character(ahargana(julian_day)),
    LunarPhase = as.character(lunar_phase(julian_day)),
    DayDuration = as.character(day_duration(julian_day, place)),
    ElapsedYear = as.character(elapsed_year(julian_day, masa(julian_day, place)[1])),
    Date = format(date, "%Y-%m-%d")
  )

  return(panchanga)
}

# Fetch and sort Panchanga data based on Tithi using custom order
fetch_panchanga_list <- function(days = 30) {
  panchanga_list <- list()
  
  # Loop through the next 'days' days
  for (i in 0:(days - 1)) {
    input_date <- Sys.Date() + i  # Start from today
    panchanga_result <- calculate_panchanga(input_date)
    panchanga_list[[i + 1]] <- panchanga_result
  }
  
  # Sort Panchanga list by Tithi according to custom Tithi order
  panchanga_list_sorted <- panchanga_list[order(match(sapply(panchanga_list, function(x) x$Tithi), tithi_order))]
  
  return(panchanga_list_sorted)
}

# Fetch Panchanga data for the next 16 days
panchanga_list_result <- fetch_panchanga_list()

# Convert to JSON
panchanga_list_json <- toJSON(panchanga_list_result, pretty = TRUE, auto_unbox = TRUE)

# Print the JSON output
cat(panchanga_list_json)
