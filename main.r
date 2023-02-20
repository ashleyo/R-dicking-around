#bp <- read.csv("./csvs/automotive_data.csv")
#plot(bp$horsepower, bp$compression.ratio)
#results <- lm(bp$compression.ratio ~ bp$horsepower)

bp <- read.csv("./csvs/blood_pressure.csv")
print(head(bp))
plot(bp$bp_after, bp$bp_before)
results <- lm(bp$bp_after ~ bp$bp_before)
print(summary(results))
plot(results)
hist(results$residuals)
print(summary(bp))