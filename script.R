library(data.table)
library(readr)
library(dplyr)
library(tidyverse)
library(gdata)
library(tidyr)

# #Premiership & Divs 1, 2, 3 & Conference -Engalnd
# url = "https://github.com/footballcsv/england/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Premiership & Divs 1, 2 & 3 - Scotland
# url = "https://github.com/footballcsv/scotland/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# 
# #Bundesligas 1 & 2 - Germany
# url = "https://github.com/footballcsv/deutschland/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Serie A & B - Italy
# url = "https://github.com/footballcsv/italy/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #La Liga (Primera & Segunda)  - Spain
# url = "https://github.com/footballcsv/espana/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Le Championnat & Division 2  - France&Monaco
# url = "https://github.com/footballcsv/france/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #KPN Eredivisie  - Netherland
# url = "https://github.com/footballcsv/netherlands/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Pro League - Belgium
# url = "https://github.com/footballcsv/belgium/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Liga I - Portugal
# url = "https://github.com/footballcsv/portugal/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Ligi 1 - Turkey
# url = "https://github.com/footballcsv/turkey/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file
# 
# #Ethniki Katigoria - Greece
# url = "https://github.com/footballcsv/greece/archive/master.zip";
# download.file(url, "master.zip") # download file
# unzip("master.zip", exdir = "data") # unzip files
# file.remove("master.zip") # tidy up by removing the zip file

library(stringr)
library(readr)
library(dplyr)
library(tidyverse)

#generowanie jednego pliku eng.1. 
eng.1. <- list.files(pattern = "eng.1.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
eng.2. <- list.files(pattern = "eng.2.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
eng.3. <- list.files(pattern = "eng.3.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
eng.4. <- list.files(pattern = "eng.4.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
eng.5. <- list.files(pattern = "eng.5.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

eng.3a. <- list.files(pattern = "eng.3a.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 
eng.3b. <- list.files(pattern = "eng.3b.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

eng <- list.files(pattern = ".*(eng).*csv$", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

bel <- list.files(pattern = "1-proleague.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

# de.1. <- list.files(pattern = "de.1.csv", recursive = TRUE) %>% 
#   lapply(read_csv) %>% 
#   bind_rows 
# 
# de.2. <- list.files(pattern = "de.2.csv", recursive = TRUE) %>% 
#   lapply(read_csv) %>% 
#   bind_rows 

superlig <- list.files(pattern = "1-superlig.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

sco.1. <- list.files(pattern = "sco.1.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

sco.2. <- list.files(pattern = "sco.2.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

sco.3. <- list.files(pattern = "sco.3.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

sco.4. <- list.files(pattern = "sco.4.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

sco <- list.files(pattern = ".*(sco).*csv$", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

liga <- list.files(pattern = "1-liga.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

seriea <- list.files(pattern = "-seriea.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

serieb <- list.files(pattern = "1-serieb.csv", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

italy <- list.files(pattern = ".*(serie).*csv$", recursive = TRUE) %>% 
  lapply(read_csv) %>% 
  bind_rows 

zbior <- X1_seriea
#a. dominujący końcowy wynik spotkania (FT) i wynik pierwszej połowy (HT),
sort_FT <-data.frame(summarise(group_by(zbior,FT),count =n()))
a <- sort_FT[order(-sort_FT$count),]
#wynik drugiej połowy
sort_HT <-data.frame(summarise(group_by(zbior,HT),count =n()))
a.1 <- sort_HT[order(-sort_HT$count),]

#b. (jeśli jest jeden taki zespół) zespół najczęściej wygrywający spotkania,

#divide string FT 
out <- strsplit(as.character(zbior$FT),'-') 
do.call(rbind, out)
test <- data.frame(zbior$FT, do.call(rbind, out), stringsAsFactors = FALSE)
zbior <- cbind(zbior, test[, 2:3])

#removing charachtr after last space
zbior$`Team 1` <- str_replace(zbior$`Team 1`, " \\(.*\\)", "")
zbior$`Team 2` <- str_replace(zbior$`Team 2`, " \\(.*\\)", "")
#test$`Team 2` <- str_replace(zbior$`Team 2`, " \\(.*\\)", "")

wynik <- ifelse(zbior$X1 > zbior$X2, zbior$`Team 1`, 
              ifelse(zbior$X1 < zbior$X2, zbior$`Team 2`, 
                ifelse(zbior$X1 == zbior$X2, "draw", "draw")
       )
)

wynik <- data.frame(wynik, stringsAsFactors = FALSE)
sort_most_win <- as.data.frame(table(unlist(wynik)))
b <- sort_most_win[order(-sort_most_win$Freq),]



#c. (jeśli jest jeden taki zespół) zespół najczęściej wygrywający po pierwszej połowie,
#divide string FT 
out_ht <- strsplit(as.character(zbior$HT),'-') 
do.call(rbind, out_ht)
test_ht <- data.frame(zbior$HT, do.call(rbind, out_ht), stringsAsFactors = FALSE)
zbior <- cbind(zbior, test_ht[, 2:3])
colnames(zbior)[10] <- "X4"
colnames(zbior)[9] <- "X3"

#removing charachtr after last space
#zbior$`Team 1` <- str_replace(zbior$`Team 1`, " \\(.*\\)", "")
#zbior$`Team 2` <- str_replace(zbior$`Team 2`, " \\(.*\\)", "")
#test$`Team 2` <- str_replace(zbior$`Team 2`, " \\(.*\\)", "")

wynik_ht <- ifelse(zbior$X3 > zbior$X4, zbior$`Team 1`, 
                ifelse(zbior$X3 < zbior$X4, zbior$`Team 2`, 
                       ifelse(zbior$X3 == zbior$X4, "draw", "draw")
                )
)

sort_most_win_ht <- as.data.frame(table(unlist(wynik_ht)))
c <- sort_most_win_ht[order(-sort_most_win_ht$Freq),]

#d. (jeśli jest jeden taki zespół) zespół, 
#który uzyskał największą przewagę punktową 
#(liczoną jako różnica w liczbie goli w ciągu jednego spotkania) nad przeciwnikiem w historii rozgrywek, dzień tygodnia i datę rozegrania tego spotkania.

zbior$X1 <- as.numeric(zbior$X1)
zbior$X2 <- as.numeric(zbior$X2)

przewaga <- zbior$X1 - zbior$X2
d <- data.frame(przewaga, zbior$Date, 
                       zbior$`Team 1`, zbior$`Team 2`)
d$przewaga = as.numeric(gsub("\\-", "", d$przewaga))


#e. (jeśli jest jeden) zespół, który rozegrał najwięcej spotkań w historii rozgrywek,
library(dplyr)
df2 <- data.frame(a = c(zbior[,"Team 1"], zbior[,"Team 2"]))
sort_most_win <- as.data.frame(table(unlist(df2)))
e <- sort_most_win[order(-sort_most_win$Freq),]