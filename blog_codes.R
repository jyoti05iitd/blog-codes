
# blog codes

names = c('sepal_length','sepal_width','petal_length','petal_width', 'species')
iris <- read.delim('iris.data.txt', sep = ',', header = FALSE, col.names = names)

library(dplyr)

# Using select
iris_sepal <- select(iris, sepal_length, sepal_width, species)

# Using filter
iris_setosa <- filter(iris, species=='Iris-setosa')

# Using mutate
iris_sepal_area <- mutate(iris_sepal, area=sepal_length*sepal_width)

# Using summarise
iris_summ <- summarise(iris_sepal_area, sepal_length_mean = mean(sepal_length), 
                        sepal_width_mean = mean(sepal_width),
                        area_max = max(area))

# Using arrange
iris_arr <- arrange(iris_sepal_area, desc(area))

# Using verbs together using pipeline
# selecting sepal_length, sepal_width and species from iris
# filtering sepal_length from iris dataset for sepal_length >=5
# calculating area
# grouping by species
# summarising to find the maximum area for each group

iris_mod <- iris %>%
  select(sepal_length, sepal_width, species) %>%
  filter(sepal_length >= 5) %>%
  mutate(area = sepal_length*sepal_width) %>%
  group_by(species) %>%
  summarise(max_area = max(area))


