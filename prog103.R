library(marinecs100b)


# Review: write a function ------------------------------------------------

# P1 Describe succinctly what the following code does. This should be a
# high-level, one-sentence description, not a line-by-line breakdown.

site <- "Nuka_Pass"
#assigns Nuka_Pass data into the command "site"
season <- "Late winter"
#assigns Late winter into the command season
n_cold <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
#sums all kefj data provided
n_total <- sum(kefj_site == site &
                 kefj_season == season)
#completing the function, totalling kej site and season information
hours_cold <- n_cold * 30 / 60
#average hours cold
days_total <- n_total * 30 / 60 / 24
#the total number of days
hours_cold_per_day <- hours_cold / days_total
#the hours cold per day
hours_cold_per_day

site <- "Nuka_Pass"
season <- "Late winter"
n_cold <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
hours_cold_per_day

# P2 Let's turn that code chunk into a function. What would you call that
# function? How many parameters should it take and what would you call them?
#I would call the function the average hours cold.
# P3 Write a function to encapsulate the code chunk above. Check that it
# contains all five parts of a function.

site <- "Nuka_Pass"
season <- "Late winter"
n_cold <- sum(kefj_site == site &
                kefj_season == season &
                kefj_temperature <= -4 &
                kefj_exposure == "air")
n_total <- sum(kefj_site == site &
                 kefj_season == season)
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
hours_cold_per_day

coldhours_perday <- function(stie, season) {
  n_cold <- sum(kefj_site == site &
                  kefj_season == season &
                  kefj_temperature <= -4 &
                  kefj_exposure == "air")
  n_heat_ <- sum(kefj_site == site &
                   kefj_season == season)
  hours_cold_function <- n_cold * 30 / 60
  days_total_function <- n_total * 30 / 60 / 24
  hours_cold_per_day_function <- hours_cold_function / days_total_function
return(hours_cold_per_day_function)
}

# Make an extreme choice --------------------------------------------------

# P4 Fill in the code below to create a logical vector indicating extreme
# temperatures.

extreme_type <- "cold"
if (extreme_type == "cold") {
  is_extreme <- kefj_temperature <= -4
}else if (extreme_type == "heat") {
  is_extreme <- kefj_temperature >= 25
}

is_extreme

# P5 Copy-paste the code from P1 and edit it to incorporate the is_extreme
# vector into the extreme temperature exposure procedure.

site <- "Nuka_Pass"
season <- "Late winter"
n_extreme <- sum(kefj_site == site &
                   kefj_season == season &
                   is_extreme &
                   kefj_exposure == "air")
n_total <- sum(kefj_site == site &
                 kefj_season == season)
is_extreme <- kefj_temperature <= -4
hours_cold <- n_cold * 30 / 60
days_total <- n_total * 30 / 60 / 24
hours_cold_per_day <- hours_cold / days_total
hours_cold_per_day

# P6 Copy-paste the function you wrote in P3 and edit it to add a parameter that
# lets you switch between extreme heat and cold exposure.

extremehours_perday <- function(site, season, extreme_type) {
  if (extreme_type =="cold") {
    is_extreme <- kefj_temperature <= -4
  } else if (extreme_type == "heat") {
    is_extreme <- kefj_temperature >= 25
  }
  n_extreme_function <- sum(kefj_site == site &
                              kefj_season == season &
                              is_extreme == TRUE &
                              kefj_exposure == "air")
  n_total_function <- sum(kefj_site == site &
                            kefj_season == season)
  hours_extreme <- n_extreme_function * 30 / 60
  days_total <- n_total_function * 30 / 60 / 24
  hours_extreme_per_day_function <- hours_extreme / days_total
  return(hours_extreme_per_day_function)
}


# Season to taste ---------------------------------------------------------

# P7 What seasons are in the kefj dataset? What function would you use to
# identify them?
?kefj_season
#late winter, spring, summer, fall, early winter

# P8 Fill in the blanks below to make a for loop that prints the extreme hot and
# cold exposure across seasons at site Aialik.

seasons <- c("Later winter", "Spring", "Sumemr", "Fall", "Early Winter")
for (i in 1:length(seasons)) {
    heat_exposure <- extremehours_perday(site[j], seasons[i], "heat")
    cold_exposure <- extremehours_perday(site[j], seasons[i], "cold")
    print(paste(sites[j], seasons[i], heat_exposure, cold_exposure))
}

# P9 Copy-paste your answer to P8 and add a nested for loop to iterate across
# sites as well as seasons.

seasons <- c("Later winter", "Spring", "Sumemr", "Fall", "Early Winter")
sites <- c("Aialik", "Nuka_Pass", "Harris", "McCarty", "Nuka_Bay")
for (i in 1:length(seasons)) {
  for (j in 1:length(site))
  heat_exposure <- extremehours_perday(site[j], seasons[i], "heat")
  cold_exposure <- extremehours_perday(site[j], seasons[i], "cold")
  print(paste(site[j], seasons[i], heat_exposure, cold_exposure))
}


# P10 Examine your results from P9. You should find two outputs where both
# extreme heat and cold exposure were 0. What season were they in?
#Nuka Bay fall and Harris fall
