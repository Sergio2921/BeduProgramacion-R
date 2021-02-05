
install.packages("mongolite")
library(mongolite)

match <- read.csv("data.csv")

match_games <- mongo(collection = "match", db = "match_games")

match_games$insert(match)

match_games$count()

match_games$find('
{
  "Date": "2017-08-20", 
  "$or": [
    {"HomeTeam": "Real Madrid"}, 
    {"AwayTeam": "Real Madrid"}
  ]
}
')