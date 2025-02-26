library(dslabs)
library(dplyr)
library(lubridate)
library(caret)
data(reported_heights)

dat <- mutate(reported_heights, date_time = ymd_hms(time_stamp)) %>%
  filter(date_time >= make_date(2016, 01, 25) & date_time < make_date(2016, 02, 1)) %>%
  mutate(type = ifelse(day(date_time) == 25 & hour(date_time) == 8 & between(minute(date_time), 15, 30), "inclass","online")) %>%
  select(sex, type)

y <- factor(dat$sex, c("Female", "Male"))
x <- dat$type

inclass_female <- dat %>% filter(type == "inclass" & sex == "Female")
inclass_male <- dat %>% filter(type == "inclass" & sex == "Male") 
#female <- dat %>% filter(sex == "Female") 
online_female <- dat %>% filter(type == "online" & sex == "Female")
online_male <- dat %>% filter(type == "online" & sex == "Male") 
nrow(online_female)/(nrow(online_female)+nrow(online_male))


# Predict majority sex for each type
y_hat <- ifelse(x == "inclass", "Female", "Male") %>% factor(levels = levels(y))

# Compute accuracy
accuracy <- mean(y == y_hat)
print(paste("Accuracy:", accuracy))

# Confusion matrix
table(y_hat, y)

# Sensitivity calculation
sensitivity(y_hat, y)

# Specificity calculation
specificity(y_hat, y)

sensitivity(y_hat, y)/specificity(y_hat, y)