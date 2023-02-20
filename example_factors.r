# there is a light introduction to chi-squared at
# https://www.scribbr.com/statistics/chi-square-test-of-independence/

sales <- read.csv("yearly_sales.csv")
sales_group <- vector(mode = "character", length = length(sales$sales_total))

sales_group[sales$sales_total < 100] <- "small"
sales_group[sales$sales_total >= 100 & sales$sales_total < 500] <- "medium"
sales_group[sales$sales_total >= 500] <- "big"

spender <- factor(sales_group,
    levels = c("small", "medium", "big"), 
    ordered = TRUE)


sales <- cbind(sales, spender)

#print(str(sales$spender))

#print(head(sales$spender))

print(head(sales))

#sales_table <- table(sales$gender, sales$spender)
#print(sales_table)
#print(summary(sales_table))
