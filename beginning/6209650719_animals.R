#week1
human_lifespan <- 122.5
dog_lifespan <- 24
dog_lifespan
dog_to_human <- human_lifespan/dog_lifespan
dog_to_human*15
lion_lifespan <- 27
mouse_lifespan <- 4
fly_lifespan <- 0.3
boar_lifespan <-27
alligator_lifespan <- 77
greenland_shark_lifespan <- 392
galapagos_tortoise_lifespan <- 177
lion_lifespan == boar_lifespan
lion_lifespan != boar_lifespan
alligator_lifespan > mouse_lifespan & fly_lifespan > mouse_lifespan
animal_lifespan <- c(greenland_shark_lifespan, dog_lifespan,
                     galapagos_tortoise_lifespan, mouse_lifespan,
                     fly_lifespan, lion_lifespan, boar_lifespan,
                     alligator_lifespan, human_lifespan)

animal <- c("greenland_shark", "dog",
                     "galapagos_tortoise", "mouse",
                     "fly", "lion", "boar",
                     "alligator", "human")
human_lifespan / animal_lifespan
animals_data <- data.frame(animal, animal_lifespan)
animals_data
names(animals_data)
animals_data[1, 1]
animals_data$animal_lifespan
animals_data$animal_to_human <- animals_data$animal_lifespan / human_lifespan
animals_data
animals_data[1,]
animals_data[,1]
animals_data[1:5,]
animals_data[1:8,]
animal_to_check <- animals_data$animal_lifespan > human_lifespan
animal_to_check
animals_data
animals_data[animal_to_check,]
library(janitor)
library(tidyverse)
penguins_raw <- read_csv("https://raw.githubusercontent.com/allisonhorst/palmerpenguins/master/inst/extdata/penguins_raw.csv")
penguins_raw
penguins_clean <- clean_names(penguins_raw)
penguins_clean
glimpse(penguins_clean)
View(penguins_clean)
table(penguins_clean$region)
penguins_clean <- remove_constant(penguins_clean, quiet=F)#ลบข้อมูลที่ซ้ำกันทั้งคอลัมน์
glimpse(penguins_clean)
penguins_clean <- separate(penguins_clean, species, sep = " \\(", into = c("species", "latin_name"))
penguins_clean <- separate(penguins_clean, species, sep = " \\(", into = c("species", "latin_name"))

untidy_animals <- read_csv("https://github.com/favstats/ds3_r_intro/blob/main/data/untidy_animals.csv?raw=true")
untidy_animals

tidy_animals <- pivot_wider(untidy_animals, names_from = Type, values_from = Value)
tidy_animals
pivot_longer(tidy_animals, cols = c(lifespan, ratio))

select(penguins_clean, individual_id,sex, species)

names(select(penguins_clean, -individual_id, -sex, -species))
penguins_clean

select(penguins_clean, starts_with("s"))
select(penguins_clean, 1:5)
select(penguins_clean, individual_id:flipper_length_mm)
filter(penguins_clean, island == "Dream")
islands_to_keep <- c("Dream", "Biscoe")
filter(penguins_clean, island %in% islands_to_keep)
islands_to_keep

pg_new <- mutate(penguins_clean, bodymass_kg = body_mass_g/100)
select(pg_new, bodymass_kg, body_mass_g)

pg_new <- mutate(penguins_clean, sex_short = ifelse(sex == "MALE", "m", "f"))
select(pg_new, sex, sex_short)

x <- 1:50
case_when(
  x %in% 1:10 ~ "1 to 10",
  x %in% 11:30 ~ "11 to 30",
  TRUE ~ "above 30"
)

pg_new <- mutate(penguins_clean, island_short = case_when(
  island == "Torgersen" ~ "T",
  island == "Biscoe" ~ "B",
  island == "Dream" ~ "D"
))
select(pg_new, island, island_short)

rename(penguins_clean, sample = sample_number)

arrange(penguins_clean, sample_number)
arrange(penguins_clean, desc(sample_number))

group_by_sex <- group_by(penguins_clean, sex)
summarise(group_by_sex, avg_culmen_length_mm = mean(culmen_length_mm, na.rm = T))
count(penguins_clean, species, sort = T)

#week2
pg <- select(penguins_clean, individual_id, island, body_mass_g)
pg <- filter(pg, island=="Dream")
pg <- mutate(pg, bodymass_kg=body_mass_g/1000) #เพิ่มcolumn
pg
