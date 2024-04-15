# Install tidyverse, dplyr and ggplot.
install.packages('tidyverse')
install.packages("dplyr")

# Import the tidyverse, dplyr ggplot library.
library(tidyverse) 
library(dplyr)
library(ggplot2)

# Import the data set (wages_plots.csv).
sales <- read.csv(file.choose(), header=TRUE) 

# View the data set.
sales 

# Sense-check the data set.
# Return the structure of the data frame.
str(sales)

# Check the type of the data frame.
typeof(sales)

# Check the class of the data frame.
class(sales)

# Check the dimensions of the data frame.
dim(sales)

# View the descriptive statistics.
summary(sales)

# Subset the dataframe and drop the Ranking, Year, Genre and Publisher columns.
salessubset <- subset(sales, 
                      select = 
                        -c(Ranking, Year,
                           Genre, Publisher))

# View column names of salessubset.
names(salessubset)

# View a summary of the data frame.
as_tibble(salessubset)

# Export the data as a CSV file.
write_csv (salessubset, file='turtle_sales_subset.csv')

# Review plots to determine insights into the data set.
# Scatterplot - relationship between Product and North America Sales.
qplot(x = Product, y = NA_Sales, data = salessubset, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and North America Sales")

# Scatterplot - relationship between Product and European Sales.
qplot(x = Product, y = EU_Sales, data = salessubset, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and European Sales")

# Scatterplot - relationship between Product and Global Sales.
qplot(x = Product, y = Global_Sales, data = salessubset, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and Global Sales")

# Bar chart of Platforms.
qplot(Platform, data=salessubset, fill = I('darkgreen')) 

# Histogram of European Sales.
qplot(EU_Sales, bins=5, data=salessubset, fill = I('darkgreen')) 

# Histogram of North American Sales.
qplot(NA_Sales, bins=5, data=salessubset, fill = I('darkgreen')) 

# Histogram of Global Sales.
qplot(Global_Sales, bins=5, data=salessubset, fill = I('darkgreen')) 

# Box plot of Platforms and Global Sales.
qplot(Platform, Global_Sales, data=salessubset, geom='boxplot',
      xlab = "Platform", ylab = "Global Sales",
      main = "Distribution of Gaming Platforms and Global Sales")

###############################################################################
###############################################################################
# Observations and insights

# The scatterplots depict a negative relationship between product codes and sales across Europe, North America, and globally, suggesting that as product codes increase, sales decrease. 
# This trend, observed in the scatterplots, may reflect evolving customer preferences or changes in market demand over time, with newer releases capturing more attention and driving increased sales. 
# Turtle Games could conduct a time-series analysis to further explore these patterns and understand how sales patterns have changed over time for different product codes, potentially revealing trends, seasonal fluctuations, or the impact of marketing campaigns on sales trends.
# Moreover, the popularity of gaming platforms such as X360, PS3, and PC, as shown in the bar chart, indicates larger audiences and potentially higher sales and profitability for developers and publishers targeting these platforms. 
# Optimising development efforts for compatibility with these platforms, as evidenced by the scatterplots, could maximise impact and drive customer engagement. 
# Additionally, analysing the correlation between customer reviews and sales figures for different gaming products on these platforms, could provide insights into the relationship between sales performance and customer satisfaction, guiding future development and marketing strategies.
# The positively skewed histograms for European, North American, and global sales, suggest that while a broad range of gaming products are available, only a few highly popular products generate significant revenue. 
# The differences in sales variability across various gaming platforms, as observed in the box plot, indicate varying levels of market performance and audience engagement, with shorter whiskers implying less fluctuation in sales and greater stability.
###############################################################################
###############################################################################

# Subset the dataframe and drop the Product and Platform columns.
salessubset2 <- subset(salessubset, 
                       select =
                         -c(Product, Platform))
# View the data frame.
salessubset2

# Find the min/max/mean sales in Europe, North America and Globally.
apply(salessubset2, 2, min)
apply(salessubset2, 2, max)
apply(salessubset2, 2, mean)

# View the descriptive statistics.
summary(salessubset2)

## Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
product_sales <- salessubset %>%
  group_by(Product) %>%
  summarise(
    EU_sales_total = sum(EU_Sales, na.rm = TRUE),
    NA_sales_total = sum(NA_Sales, na.rm = TRUE),
    Global_sales_total = sum(Global_Sales, na.rm = TRUE)
  )

# View the data frame.
product_sales

# Explore the data frame as a tibble.
as_tibble(product_sales)

# Check the dimensions of the data frame.
dim(product_sales)

# Return the structure of the data frame.
str(product_sales)

# Check the type of the data frame.
typeof(product_sales)

# Check the class of the data frame.
class(product_sales)

# View the descriptive statistics.
summary(product_sales)

# Determine which plot is the best to compare game sales.
# Create scatterplots for European, North American and Global Sales.
qplot(x = Product, y = NA_sales_total, data = product_sales, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and North America Sales")

qplot(x = Product, y = EU_sales_total, data = product_sales, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and European Sales")

qplot(x = Product, y = Global_sales_total, data = product_sales, color = I('#006400'),
      xlab = "Product", ylab = "Sales",
      main = "Relationship between Product and Global Sales")
##############################################################################
# Determine the normality of North American sales.
## Create Q-Q Plots for North American sales data.
# Create Q-Q Plots.
qqnorm(salessubset2$NA_Sales,
       col='darkgreen',
       xlab="z Value",
       ylab='North America Sales')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(salessubset2$NA_Sales,
       col='red',
       lwd=2) 

## Perform Shapiro-Wilk test
# Install and import Moments.
install.packages("moments")
library(moments)

# Run a Shapiro-Wilk test.
shapiro.test(salessubset2$NA_Sales)

# Determine Skewness and Kurtosis.
# Skewness and Kurtosis.
skewness(salessubset2$NA_Sales) 
kurtosis(salessubset2$NA_Sales)

# Determine the normality of European sales.
## Create Q-Q Plots for European sales data.
# Create Q-Q Plots.
qqnorm(salessubset2$EU_Sales,
       col='darkgreen',
       xlab="z Value",
       ylab='European Sales')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(salessubset2$EU_Sales,
       col='red',
       lwd=2) 

# Run a Shapiro-Wilk test.
shapiro.test(salessubset2$EU_Sales)

# Determine Skewness and Kurtosis
# Skewness and Kurtosis.
skewness(salessubset2$EU_Sales) 
kurtosis(salessubset2$EU_Sales)

# Determine the normality of Global sales.
## Create Q-Q Plots for European sales data. 
# Create Q-Q Plots.
qqnorm(salessubset2$Global_Sales,
       col='darkgreen',
       xlab="z Value",
       ylab='Global Sales')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(salessubset2$Global_Sales,
       col='red',
       lwd=2) 

# Run a Shapiro-Wilk test.
shapiro.test(salessubset2$Global_Sales)

# Determine Skewness and Kurtosis
# Skewness and Kurtosis.
skewness(salessubset2$Global_Sales) 
kurtosis(salessubset2$Global_Sales)

# Determine the correlation for the whole data frame.
round (cor(salessubset2),
       digits=2)

# Install plotly.
install.packages("plotly")

# Import the plotply library.
library (plotly)

# Create a scatterplot to visualise the relationship between Global Sales and Regional Sales (EU Sales and NA Sales).
p <- ggplot(salessubset2, aes(x = Global_Sales)) +
  geom_point(aes(y = EU_Sales, color = "EU Sales"), alpha = 0.5) +
  geom_point(aes(y = NA_Sales, color = "NA Sales"), alpha = 0.5) +
  geom_smooth(aes(y = EU_Sales), method = "lm", color = "green", se = FALSE) +  # Add line of best fit for EU Sales
  geom_smooth(aes(y = NA_Sales), method = "lm", color = "darkgreen", se = FALSE) +  # Add line of best fit for NA Sales
  labs(title = "Relationship between Global Sales and Regional Sales",
       x = "Global Sales",
       y = "Regional Sales",
       color = "Sales Region") +
  theme_bw() +  # Apply a minimal theme
  scale_color_manual(values = c("EU Sales" = "green", "NA Sales" = "darkgreen")) +  # Set custom colors for the legend
  theme(legend.position = "right")  # Move the legend to the top

# Make the plot interactive
ggplotly(p)
###############################################################################
###############################################################################
# Observations and insights

# The Q-Q plot and Shapiro-Wilk test, with a p-value < 2.2e-16, indicate that the sales data significantly deviate from a normal distribution. 
# High skewness (NA_Sales: 4.31, EU_Sales: 4.82, Global_Sales: 4.05) and kurtosis (NA_Sales: 31.37, EU_Sales: 44.69, Global_Sales: 32.64) values reveal highly skewed distributions with heavy tails, contrasting sharply with the expected kurtosis of 3 for a normal distribution. 
# These statistics indicate non-normal distributions with extreme values. This suggests that sales performance varies widely, potentially influenced by factors such as seasonal trends, product popularity, or market competition.
# Despite the non-normal distribution, Pearson's correlation analysis reveals positive relationships between North American, European, and Global sales, albeit with varying strengths. 
# The strong correlations, particularly between North American and Global sales, suggest potential synergies or dependencies between these markets. 
# However, caution is warranted in interpreting these correlation results due to the violation of normality assumptions. 
# To mitigate the impact of non-normality on correlation analysis, we can consider alternative correlation measures like Spearman's rank correlation coefficient in future analysis. 
###############################################################################
###############################################################################

# Install the psych.
install.packages('psych')

# Import the psych library.
library(psych)

# Use the corPlot() function to determine the correlation between columns
corPlot(salessubset2, cex=1)

# Fit a simple linear regression model.
# Create a linear regression model on Global and North American Sales.
model1 <- lm(Global_Sales~NA_Sales,
             data=salessubset2)

# View the model.
model1

# View more outputs for the model - the full regression table.
summary(model1)

# Create a linear regression model on Global and European Sales.
model2 <- lm(Global_Sales~EU_Sales,
             data=salessubset2)

# View the model.
model2

# View more outputs for the model - the full regression table.
summary(model2)

# Create a linear regression model on European and North American Sales.
model3 <- lm(EU_Sales~NA_Sales,
             data=salessubset2)

# View the model.
model3

# View more outputs for the model - the full regression table.
summary(model3)

# View residuals on a plot.
plot(model1$residuals)

# View residuals on a plot.
plot(model2$residuals)

# View residuals on a plot.
plot(model3$residuals)

# Plot the relationship.
plot(salessubset2$Global_Sales, salessubset2$NA_Sales, col = "darkgreen", 
     main = "Linear Relationship between Global Sales and North America Sales", 
     xlab = "Global", 
     ylab = "North American")

# Line of best fit.
abline(coefficients(model1), col = "black")

# Plot the relationship.
plot(salessubset2$Global_Sales, salessubset2$EU_Sales, col = "darkgreen", 
     main = "Linear Relationship between Global Sales and European Sales", 
     xlab = "Global", 
     ylab = "European")

# Line of best fit.
abline(coefficients(model2), col = "black")

# Plot the relationship.
plot(salessubset2$EU_Sales, salessubset2$NA_Sales, col = "darkgreen", 
     main = "Linear Relationship between European Sales and North America Sales", 
     xlab = "European", 
     ylab = "North American")

# Line of best fit.
abline(coefficients(model3), col = "black")
###############################################################################
###############################################################################
# Observations and insights

## Global and North American Sales.
# The correlation analysis between global sales and North American sales revealed a strong positive correlation coefficient of approximately 0.935. This high correlation value suggests a strong relationship between the two variables even before regression analysis. 
# Linear regression: 
# With a coefficient estimate of 1.718 for North American sales, the analysis suggests that for every incremental unit increase in North American sales, there is an expected rise of approximately 1.718 units in global sales. 
# Both the intercept and the coefficient for North American sales exhibit high statistical significance at the 0.001 level, highlighting the reliability of this relationship. 
# Moreover, the model demonstrates strong explanatory power, elucidating approximately 87.41% of the variability observed in global sales. 
# The F-statistic further emphasises the significance of the overall model, with a highly negligible p-value indicating its robustness. 
# These findings indicate that North American sales figures are highly predictive of global sales trends. 

## Global and European Sales.
# Correlation analysis between Global sales and European sales reveals a strong positive correlation coefficient of approximately 0.878.
# # Linear regression: 
# The coefficient estimate for European sales is 2.714, indicating that for every unit increase in European sales, global sales are expected to increase by approximately 2.714 units. 
# Both the intercept and the coefficient for European sales exhibit high statistical significance (p < 0.001), suggesting a reliable relationship between the variables. 
# The model explains approximately 77.01% of the variance observed in global sales, indicating a substantial explanatory power. 
# The F-statistic further reinforces the significance of the model, with a very small p-value (< 2.2e-16). 
# These findings imply that European sales figures serve as strong predictors of global sales trends. 

## European and North American Sales.
# The correlation analysis between European sales and North American sales reveals a positive correlation coefficient of approximately 0.706.
# # Linear regression: 
# The coefficient estimate for North American sales is 0.419, suggesting that for every unit increase in North American sales, there is an expected rise of approximately 0.419 units in European sales.
# Both the intercept and the coefficient for North American sales are highly statistically significant (p < 0.001), indicating the reliability of this relationship. 
# The model explains approximately 49.78% of the variance observed in European sales, suggesting a moderate level of explanatory power. 
# The F-statistic further emphasises the significance of the model, with a very small p-value (< 2.2e-16). 
# These findings suggest that while North American sales have a significant impact on European sales, there may be other factors influencing European sales variability beyond those captured in the model.
###############################################################################
###############################################################################

# Multiple linear regression model.
modela = lm(Global_Sales~EU_Sales+NA_Sales,data=salessubset2)

# Print the summary statistics.
summary(modela)

###############################################################################
###############################################################################
# Observations and insights

# Multiple linear regression model with EU_Sales and NA_Sales as predictors.
# Significant coefficients for both variables (p < 0.001).
# Model explains approximately 96.87% of variance in Global_Sales.
# EU_Sales and NA_Sales have positive and substantial effects on Global_Sales (coefficients: EU_Sales = 1.34, NA_Sales = 1.16).
# Residuals exhibit normal distribution around zero, with standard error of 1.112.
# Emphasises model's predictive strength in forecasting Global_Sales.
# These findings emphasise the significant influence of variations in European and North American sales on the overall performance of Global sales.
###############################################################################
###############################################################################

# Predictions based on given values.
# NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
# NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
# NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
# NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
# NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# Compare with observed values for a number of records.

# Define the provided values of NA_Sales and EU_Sales sums.
NA_Sales_sums <- c(34.02, 3.93, 2.73, 2.26, 22.08)
EU_Sales_sums <- c(23.80, 1.56, 0.65, 0.97, 0.52)

# Vector to store observed values.
observed_global_sales <- numeric(length(NA_Sales_sums))

# Loop through each pair of sums.
for (i in 1:length(NA_Sales_sums)) {
  # Subset the dataframe to rows matching the current sums
  subset_rows <- salessubset2[round(salessubset2$NA_Sales, 2) == NA_Sales_sums[i] & round(salessubset2$EU_Sales, 2) == EU_Sales_sums[i], ]
  
  # Extract the observed value(s) of Global_Sales.
  if (nrow(subset_rows) > 0) {
    observed_global_sales[i] <- subset_rows$Global_Sales[1]  # Assuming there's only one observation for each combination
  } else {
    observed_global_sales[i] <- NA  # No observation found for the combination
  }
}

# Create a dataframe with predicted and observed values.
comparison <- data.frame(Observed = observed_global_sales, Predicted = predicted_global_sales)

# Print the comparison dataframe.
print(comparison)
###############################################################################
###############################################################################
# Observations and insights

# These values illustrate the close alignment between the observed and predicted global sales for the provided combinations of NA_Sales and EU_Sales sums. 
# While there are slight differences between some observed and predicted values, overall, the predicted values closely match the observed values, demonstrating the effectiveness of the multiple linear regression model in forecasting global sales based on the specified input variables.
###############################################################################
###############################################################################