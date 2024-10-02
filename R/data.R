# api.R
library(plumber)
# ---------------------------------------------------------------------------- #
#' masas
#' @description Lunar month in the Vedic calendar system
masas <- c(
"वैशाख", 
"जेष्ठ", 
"आषाढ़", 
"श्रावण", 
"भाद्र", 
"आश्विन", 
"कार्तिक", 
"मंसिर", 
"पौष", 
"माघ", 
"फागुन", 
"चैत्र"
)

# ---------------------------------------------------------------------------- #
#' tithis
#' @description lunar day in the Vedic calendar system
tithis <- c(
"१--प्रतिपदा--शुक्लपक्ष",
"२--द्वितीया--शुक्लपक्ष",
"३--तृतीया--शुक्लपक्ष",
"४--चतुर्थी--शुक्लपक्ष",
"५--पञ्चमी--शुक्लपक्ष",
"६--षष्ठी--शुक्लपक्ष",
"७--सप्तमी--शुक्लपक्ष",
"८--अष्टमी--शुक्लपक्ष",
"९--नवमी--शुक्लपक्ष",
"१०--दशमी--शुक्लपक्ष",
"११--एकादशी--शुक्लपक्ष",
"१२--द्वादशी--शुक्लपक्ष",
"१३--त्रयोदशी--शुक्लपक्ष",
"१४--चतुर्दशी--शुक्लपक्ष",
"१५--पूर्णिमा--शुक्लपक्ष",
"१६--प्रतिपदा--कृष्णपक्ष",
"१७--द्वितीया--कृष्णपक्ष",
"१८--तृतीया--कृष्णपक्ष",
"१९--चतुर्थी--कृष्णपक्ष",
"२०--पञ्चमी--कृष्णपक्ष",
"२१--षष्ठी--कृष्णपक्ष",
"२२--सप्तमी--कृष्णपक्ष",
"२३--अष्टमी--कृष्णपक्ष",
"२४--नवमी--कृष्णपक्ष",
"२५--दशमी--कृष्णपक्ष",
"२६--एकादशी--कृष्णपक्ष",
"२७--द्वादशी--कृष्णपक्ष",
"२८--त्रयोदशी--कृष्णपक्ष",
"२९--चतुर्दशी--कृष्णपक्ष",
"३०--अमावस्या (औंसी)--कृष्णपक्ष"
)

# ---------------------------------------------------------------------------- #
#' nakshatras
#' @description Name of the 27 Nakshatras in Vedic calendar system
nakshatras <- c(
  "Ashwini",
  "Bharani",
  "Kritika",
  "Rohini",
  "Mrigashira",
  "Ardra",
  "Punarvasu",
  "Pushya",
  "Ashlesha",
  "Magha",
  "Purvaphalguni",
  "Uttaraphalguni",
  "Hasta",
  "Chitra",
  "Swati",
  "Vishakha",
  "Anuradha",
  "Jyeshta",
  "Mula",
  "Purvashada",
  "Uttarashada",
  "Shravana",
  "Dhanishta",
  "Shatabhisha",
  "Purvabhadrapada",
  "Uttarabhadrapada",
  "Revati"
)

# ---------------------------------------------------------------------------- #
#' ritus
#' @description Name of the 6 seasons in Vedic calendar system
ritus <- c(
  "Vasanta",
  "Grishma",
  "Varsha",
  "Sharad",
  "Hemanta",
  "Sishira"
)

# ---------------------------------------------------------------------------- #
#' samvatsars
#' @description Name of the Year in Hindu Panchang
samvatsars <- c(
  "Prabhava",
  "Vibhava",
  "Sukla",
  "Pramoda",
  "Prajapati",
  "Angirasa",
  "Srimukha",
  "Bhava",
  "Yuva",
  "Dhatri",
  "Ishvara",
  "Bahudhanya",
  "Pramadhi",
  "Vikrama",
  "Vrushapraja",
  "Citrabhanu",
  "Subhanu",
  "Tarana",
  "Parthiva",
  "Vyaya",
  "Sarvajit",
  "Sarvadharin",
  "Virodhin",
  "Vikriti",
  "Khara",
  "Nandana",
  "Vijaya",
  "Jaya",
  "Manmatha",
  "Durmukhi",
  "Hevilambi",
  "Vilambi",
  "Vikari",
  "Sharvari",
  "Plava",
  "Shubhakrit",
  "Shobhakrit",
  "Krodhi",
  "Vishvavasu",
  "Parabhava",
  "Plavanga",
  "Kilaka",
  "Saumya",
  "Sadharana",
  "Virodhakruta",
  "Paridhavi",
  "Pramadi",
  "Ananda",
  "Rakshasa",
  "Nala",
  "Pingala",
  "Kalayukta",
  "Siddharti",
  "Raudra",
  "Durmati",
  "Dundubhi",
  "Rudhirodhgari",
  "Raktakshi",
  "Krodhana",
  "Akshaya"
)

# ---------------------------------------------------------------------------- #
#' yogas
#' @description Name of the 27 yogas which is sum of sidereal longitudes of sun and moon in the multiples of 13 degrees 20 minutes
yogas <- c(
  "Vishkhamba",
  "Preeti",
  "Ayushmaan",
  "Saubhaagya",
  "Sobhana",
  "Atiganda",
  "Sukarman",
  "Dhriti",
  "Shoola",
  "Ganda",
  "Vriddhi",
  "Dhruva",
  "Vyaaghaata",
  "Harshana",
  "Vajra",
  "Siddhi",
  "Vyatipaata",
  "Variyan",
  "Parigha",
  "Shiva",
  "Siddha",
  "Saadhya",
  "Subha",
  "Sukla",
  "Brahma",
  "Indra",
  "Vaidhriti"
)

# ---------------------------------------------------------------------------- #
#' karanas
#' @description Name of 60 Karanas which is when moon traverses 6° in longitude relative to the sun
karanas <- c(
  "Kimstughna",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Bava",
  "Baalava",
  "Kaulava",
  "Taitila",
  "Garaja",
  "Vanija",
  "Visti",
  "Sakuni",
  "Chatushpada",
  "Naga"
)

# ---------------------------------------------------------------------------- #
#' rashis
#' @description The name of 12 Rashis which represents the position of the moon on the zodiac at a given time
rashis <- c(
  "Mesha",
  "Vrushabha",
  "Mithuna",
  "Karka",
  "Sinha",
  "Kanya",
  "Tula",
  "Vrushchik",
  "Dhanu",
  "Makara",
  "Kumbha",
  "Meena"
)

# ---------------------------------------------------------------------------- #
#' vaaras
#' @description Name of the day of the week
vaaras <- c(
  "Ravivar",
  "Somvar",
  "Mangalwar",
  "Budhwar",
  "Guruwar",
  "Shukrawar",
  "Shaniwar"
)
