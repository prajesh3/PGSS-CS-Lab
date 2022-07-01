library(readr)
britishSeatBeltStudy <- read_csv("https://raw.githubusercontent.com/menonpg/CMU_PGSS_2021/main/Week01/L2-762021/britishSeatBeltStudy.csv", 
                                 col_types = cols(law = col_factor(levels = c("0", 
                                 "1")), Date = col_date(format = "%Y-%m-%d")))
View(britishSeatBeltStudy)

britishSeatBeltStudy$FractionOfDriversKilled = britishSeatBeltStudy$DriversKilled/britishSeatBeltStudy$drivers

summary(britishSeatBeltStudy$FractionOfDriversKilled)

# t.test displays the p-value (among others) that shows what the probability of the null hypothesis is 

# the null hyp. here is that the law has no effect on the drivers killed
# based on the very low p value there is a high effect
t.test(britishSeatBeltStudy$DriversKilled [which(britishSeatBeltStudy$law %in% c(1))], 
       britishSeatBeltStudy$DriversKilled [which(britishSeatBeltStudy$law %in% c(0))], 
       var.equal = F, paired = F
)

# the null hyp. here is that the law has no effect on the fraction of drivers killed
# based on the 24% p value there is some effect but not super significant
t.test(britishSeatBeltStudy$FractionOfDriversKilled [which(britishSeatBeltStudy$law %in% c(1))], 
       britishSeatBeltStudy$FractionOfDriversKilled [which(britishSeatBeltStudy$law %in% c(0))], 
       var.equal = F, paired = F
)

# use multi variant analysis (like linear analysis through logistic regression) to compare several things and their interaction
# linear analysis - logistic regression [classification]

fit <- glm (formula = law ~ DriversKilled + drivers + FractionOfDriversKilled + kms + PetrolPrice, data = britishSeatBeltStudy, family = binomial)
summary(fit)
# meaning of the results: estimate: if positive, then there is a direct relationship between the variable and the thing before ~ (law); if negative, 
#     then there is an inverse relationship between the variable and the thing before ~ (law)
# the asterisks on the right end means that the result is statistically significant

fit <- glm (formula = law ~ FractionOfDriversKilled + kms, data = britishSeatBeltStudy, family = binomial)
summary(fit)
# changing the variables that you use to try to see the connections can affect the reults of the data analysis
# important to consider variables that are actually relavant


# there are many assumptions that are made (or should be made) in multi variable regression



# linear analysis: linear regression to predict number of drivers that died based on mks driven, petrol price, and law being in effect

fit2 <- lm (formula = DriversKilled ~ law + kms + PetrolPrice  ,
           data = britishSeatBeltStudy, family = 'binomial')
summary(fit2)

# meaning of results: law in place = less death; longer drives = less death; more petrol price = less death




















