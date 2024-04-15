# TURTLE-GAMES-ANALYSIS

### Background

Turtle Games, a global game manufacturer and retailer, aims to enhance overall sales performance by leveraging customer trends. The company offers a diverse range of products including books, board games, video games, and toys, sourced both internally and externally. With a focus on collecting sales and customer review data, Turtle Games seeks insights to address key business questions to improve overall sales. Thus, the problem statements are as follows:
1.	Understand customer engagement and loyalty point accumulation.
2.	Segment customers based on behaviour and demographics.
3.	Utilise customer reviews to inform marketing campaigns and business improvements.
4.	Identify actionable trends and insights from sales data.
5.	Evaluate the suitability of sales data for modelling purposes.
6.	Uncover possible relationships between North American, European, and Global Sales to inform strategic decision-making and business planning. 

### Analytical approach

The analytical approach undertaken integrated Python and R to address Turtle Games' business objectives comprehensively. Python was utilised for customer demographics and engagement analysis, segmentation, and sentiment analysis, leveraging libraries such as numpy, pandas, and scikit-learn. The statsmodels library in Python facilitated the identification of predictors influencing loyalty points accumulation, including age, remuneration, and spending scores. Data exploration began with data frame creation, followed by thorough data integrity checks and standardisation of column names for clarity. Textual data insights were extracted using Python's natural language processing capabilities, aiding marketing optimisation efforts. Meanwhile, R was employed to analyse sales trends, utilising Tidyverse, dplyr, ggplot, and plotly for data manipulation, visualisation, and exploration. Additionally, R was used to assess sales data suitability for modelling and to explore relationships between regional and global sales.

### Findings and Recommendations:

1.	Gender and Education Analysis: Females demonstrate higher spending scores and loyalty points accumulation despite earning slightly less than males. Basic education correlates with increased earnings, spending behaviour, and loyalty points accumulation, while diploma holders exhibit lower metrics. Moreover, spending behaviour and remuneration significantly impact loyalty points, with age showing an inverse relationship. Enhanced loyalty programs targeting high-spending customers are recommended, along with leveraging age data for personalised recommendations to maximise sales performance. 

2.	Cluster Analysis of Spending Behaviour: Pair plots and cluster analysis revealed distinct spending behaviour patterns across income levels. While higher income typically correlates with higher spending, outliers exist where high-income customers demonstrate lower spending habits. Turtle Games could target efforts towards specific income clusters to optimise engagement and loyalty programs.

3.	Sentiment Analysis of Customer Reviews: The sentiment analysis unveiled positive feedback regarding Turtle Games' products and customer experiences, alongside areas for improvement identified in negative sentiments. To improve customer satisfaction and business success, Turtle Games should prioritise addressing negative reviews by enhancing product quality and usability, maintaining clear communication channels, and incentivising positive feedback to foster engagement and advocacy.

4.	Sales Trends Analysis: Scatterplots indicated a negative relationship between product codes and sales, suggesting evolving customer preferences. Popular gaming platforms like X360, PS3, and PC showed higher sales potential, indicating opportunities for product diversification and strategic partnerships with these platforms.

5.	Statistical Analysis of Sales Data: Despite non-normal distributions, positive correlations between North American, European, and global sales were observed. A multiple linear regression model effectively predicted global sales based on North American (NA) and European (EU) sales, emphasising their significant influence on overall sales. 

6.	Predictive Model Evaluation: Observed and predicted global sales values aligned closely, demonstrating the model's accuracy in estimating sales based on NA and EU sales figures. 
It is recommended that Turtle Games leverage the correlation between North American and European sales to forecast global trends accurately. Customise marketing strategies and product offerings to suit regional preferences as well as monitor/incorporate economic and cultural preferences to improve sales.

### Conclusion

This analysis offers actionable insights into customer behaviour, sales trends, and predictive modelling, empowering Turtle Games to optimise marketing strategies, refine product offerings, and boost sales growth. Leveraging these insights/recommendations and implementing targeted initiatives can enhance customer engagement, foster brand loyalty, and drive overall sales for Turtle Games.

