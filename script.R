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

#a. dominujący końcowy wynik spotkania (FT) i wynik pierwszej połowy (HT),
sort_FT <-data.frame(summarise(group_by(eng.1.,FT),count =n()))
sort_FT <- sort_FT[order(-sort_FT$count),]
#wynik drugiej połowy
sort_HT <-data.frame(summarise(group_by(eng.1.,HT),count =n()))
sort_HT <- sort_HT[order(-sort_HT$count),]

#b. (jeśli jest jeden taki zespół) zespół najczęściej wygrywający spotkania,

#divide string FT 
out <- strsplit(as.character(eng.1.$FT),'-') 
do.call(rbind, out)
test <- data.frame(eng.1.$FT, do.call(rbind, out), stringsAsFactors = FALSE)
eng.1. <- cbind(eng.1., test[, 2:3])

#removing charachtr after last space
eng.1.$`Team 1` <- str_replace(eng.1.$`Team 1`, " \\(.*\\)", "")
eng.1.$`Team 2` <- str_replace(eng.1.$`Team 2`, " \\(.*\\)", "")
#test$`Team 2` <- str_replace(eng.1.$`Team 2`, " \\(.*\\)", "")

wynik <- ifelse(eng.1.$X1 > eng.1.$X2, eng.1.$`Team 2`,
       ifelse(eng.1.$X1 < eng.1.$X2,eng.1.$`Team 1`,'draw'))
wynik <- data.frame(wynik, stringsAsFactors = FALSE)
sort_most_win <- as.data.frame(table(unlist(wynik)))
sort_most_win <- sort_most_win[order(-sort_most_win$Freq),]



#c. (jeśli jest jeden taki zespół) zespół najczęściej wygrywający po pierwszej połowie,
#divide string FT 
out_ht <- strsplit(as.character(eng.1.$HT),'-') 
do.call(rbind, out_ht)
test_ht <- data.frame(eng.1.$HT, do.call(rbind, out_ht), stringsAsFactors = FALSE)
eng.1. <- cbind(eng.1., test_ht[, 2:3])
colnames(eng.1.)[10] <- "X4"
colnames(eng.1.)[9] <- "X3"

#removing charachtr after last space
#eng.1.$`Team 1` <- str_replace(eng.1.$`Team 1`, " \\(.*\\)", "")
#eng.1.$`Team 2` <- str_replace(eng.1.$`Team 2`, " \\(.*\\)", "")
#test$`Team 2` <- str_replace(eng.1.$`Team 2`, " \\(.*\\)", "")

wynik_ht <- ifelse(eng.1.$X3 > eng.1.$X4, eng.1.$`Team 2`,
            ifelse(eng.1.$X3 < eng.1.$X4,eng.1.$`Team 1`,'draw'))
wynik_ht <- data.frame(wynik_ht, stringsAsFactors = FALSE)
sort_most_win <- as.data.frame(table(unlist(wynik_ht)))
sort_most_win <- sort_most_win[order(-sort_most_win$Freq),]

#d. (jeśli jest jeden taki zespół) zespół, 
#który uzyskał największą przewagę punktową 
#(liczoną jako różnica w liczbie goli w ciągu jednego spotkania) nad przeciwnikiem w historii rozgrywek, dzień tygodnia i datę rozegrania tego spotkania.

eng.1.$X1 <- as.numeric(eng.1.$X1)
eng.1.$X2 <- as.numeric(eng.1.$X2)


prezwaga <- eng.1.$X1 - eng.1.$X2
przewaga <- data.frame(prezwaga, eng.1.$Date, 
                       eng.1.$`Team 1`, eng.1.$`Team 2`)

#e. (jeśli jest jeden) zespół, który rozegrał najwięcej spotkań w historii rozgrywek,
library(dplyr)
df2 <- data.frame(a = c(eng.1.[,"Team 1"], eng.1.[,"Team 2"]))
sort_most_win <- as.data.frame(table(unlist(df2)))
sort_most_win <- sort_most_win[order(-sort_most_win$Freq),]