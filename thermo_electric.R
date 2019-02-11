library(dplyr)
library(data.table)
library(rprojroot)
#readxl

project.dir <- rprojroot::find_rstudio_root_file()
#my_path <- "C:\Users\Esharifi\Desktop\Unreported\Thermoelectric\Data\my data"
generation.df <- data.table::fread(file.path( "C:\\Users\\Esharifi\\Desktop\\Unreported\\Thermoelectric\\Data\\my data\\", "3_1_Generator_Y2017"))
#generation.df <- read.csv("C:\\Users\\Esharifi\\Desktop\\Unreported\\Thermoelectric\\Data\\my_data\\3_1_Generator_Y2017.csv")
#generation.df <- read.csv("C:\\Users\\icprbadmin\\Documents\\R\\thermo_electric\\3_1_Generator_Y2017.xlsx")

generation.df <- data.table::fread(file.path(project.dir, "data", "thermo_electric.csv"))

locations.vec <- c("DCDistrict of Columbia",
                   "MDAllegany",
                   "MDCarrol",
                   "MDCharles",
                   "MDFredrick",
                   "MDGarret",
                   "MDMontgomery",
                   "MDPrince Georges",
                   "MDSt. Mary’s",
                   "MDWashington",
                   "PAAdams",
                   "PABedford",
                   "PACumberland",
                   "PAFranklin",
                   "PAFulton",
                   "PASomerset",
                   "VAAlexandria",
                   "VAArlington",
                   "VAAugusta",
                   "VAClarke",
                   "VAFairfax",
                   "VAFalls Church",
                   "VAFauquier",
                   "VA	Fredrick",
                   "VAHarrisonburg",
                   "VAHighland",
                   "VAKing George",
                   "VALoudoun",
                   "VAManassas",
                   "VAManassas Park",
                   "VANorthumberland",
                   "VAPage",
                   "VAPrince William",
                   "VARockingham",
                   "VAShenandoah",
                   "VAStafford",
                   "VAStaunton",
                   "VAWarren",
                   "VAWaynesboro",
                   "VAWestmoreland",
                   "VAWinchester",
                   "WVBerkeley",
                   "WVGrant",
                   "WVHampshire",
                   "WVHardy",
                   "WVJefferson",
                   "WVMineral",
                   "WVMorgan", 
                   "WVPendleton",
                   "WVPreston",
                   "WVTucker")

generation.df <- generation.df %>%
  mutate(concat = paste0(County,State))

#filter in
final.df <- generation.df %>%
  filter(concat %in% locations.vec)
