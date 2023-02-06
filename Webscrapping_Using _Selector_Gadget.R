library(rvest)
library(robotstxt)
library(dplyr)

path = paths_allowed("https://www.imdb.com/search/title/?groups=top_250&user_rating")
link <- 'https://www.imdb.com/search/title/?groups=top_250&user_rating'
web <- read_html(link)

name <- web %>% html_nodes(".lister-item-header a") %>% html_text()
View(name)
year <- web %>% html_nodes(".text-muted.unbold") %>% html_text()
View(year)
rating <- web %>% html_nodes(".ratings-imdb-rating strong") %>% html_text()
View(rating)
duration <- web %>% html_nodes(".runtime") %>% html_text()
View(duration)
imbd.ratings <- data.frame(name, year, rating, duration)
View(imbd.ratings)
write.csv(imbd.ratings, "movie.csv")