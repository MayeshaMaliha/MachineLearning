library(dslabs)
data(heights)
heights
is.data.frame(heights)

class(heights$sex)
class(heights$height)
is.numeric(heights$height)  # TRUE if numeric
is.integer(heights$height)  # TRUE if integer
is.vector(heights$height) 

heights$height[777]
median(heights$height)

male <- heights %>% filter(sex == "Male")
female <- heights %>% filter(sex == "Female")

male_n <- nrow(male)/(nrow(male) + nrow(female))

inches <- female %>% filter(height > 78)
nrow(inches)