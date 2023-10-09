# Pizza Delivery Optimized


**[Dominos Delivery Dashboard](https://onedrive.live.com/embed?resid=B8FC736B95A11294%21352&authkey=%21AE2JvbGCOFOXoOw&em=2&wdHideGridlines=True&wdHideSheetTabs=True&wdHideHeaders=True&wdInConfigurator=True&wdInConfigurator=True%22%3E)**

## Introduction:

In 2021, I worked as a Dominos delivery driver. While working there, I started keeping track of time; this included the day, tips earned, month, and date. I started tracking my time because I wanted to be more productive and make more tips. In addition, I tried to limit my gas usage and earn more tips while on my shift.

I choose to track my data for anyone who wants to work at Domino. The data can determine the best option for the delivery driver to be more productive and earn more tips. 

Assumptions: As mentioned by my store manager at the time, the best times to get more tips are Friday, Saturday, Sunday, and Monday. Super Bowl weekend is where we receive some tips, including holidays. 

Theories: Contributing factors that may affect your tips may include pay periods. Some customers who reside in residential or apartment complexes may be paid biweekly.



## Assumptions: 

As mentioned by my store manager at the time, the best times to get more tips are Friday, Saturday, Sunday, and Monday. Super Bowl weekend is where we receive some tips, including holidays. 

Theories: Contributing factors that may affect your tips may include pay periods. Some customers who reside in residential or apartment complexes may be paid biweekly.

## Addendum: 

●	The store's manager chooses the deliveries randomly or whoever is next in line to accept deliveries.
●	Orders can be between 1 - 4, rarely 5 - the number of orders per driver will depend on the store managers' policies. 
●	Tips are either included on the receipt at the point of accepting the delivery or may be given to you when you drop off the customer's order
●	Most of the time, you might end up with some or no tips, which is consistent with other drivers. 


## Question(s):

- What days were the most productive to earn more tips? 
- What month were the most tips made?  
- What was the total amount of tips made for each month?  
- What month had the most gas used? 

## Cleaning Dataset:

●	Fill the empty values with $0 for the Gas Column E
●	Filled the values with $0 for Tips Earned Column D
●	Organized the data by month

## Formulas Used:

```excel

=SUM(D2:D72)

=SUM(E2:E72)

=MAX(D2:D72)

=MIN(D2:D72)

=SUMIF(A2:A72, "Feburary",D2:D72)
=SUMIF(A2:A72, "March",D2:D72)
=SUMIF(A2:A72, "April",D2:D72)
=SUMIF(A2:A72, "May",D2:D72)
=SUMIF(A2:A72, "June",D2:D72)
=SUMIF(A2:A72, "July",D2:D72)


```

## Solutions:

The more productive solution would be to deliver on the following days: Thursday, Friday, and Saturday. As the graph shows, these days are the most consistent with more tips, but the drawback is that you will compete against other delivery drivers to obtain more tips. 

The alternative would include Thursday, Friday, Saturday, Sunday, and Tuesday.  When Sunday and Tuesday are included, you can minimize the time you deliver pizza to be more productive on those days. The drawback would be that you risk not receiving any tips at all. 


## Conclusions:

### Key Takeaways:

-	Thursday, Friday, and Saturday are the most productive days
-	April ($496.00) & March ($582.00) were the months where the most tips were earned.
-	The total for the six months is $1,915.00 
-	The most gas used was in April 

### What was learned: 

February and June had the same amount of gas spent compared to July, which had the least.
The max was $106.00 compared to the min was $0.00 on tips earned
Wednesday is when you can expect to make the least amount of tips or no tips at all. 

Working at Dominos for the last couple of months, the tips decreased, as shown in the graph above. In addition, there was a slight jump in June. The jump can be attributed to the summer and kids being out of school.  

The tips began to decrease due to the store location needing to be more staffed with more delivery drivers. There needed to be more deliveries to go around for each driver. 

## Next Steps:

If someone is hired to work as a delivery driver at Dominos, where I used to work, the best times to deliver pizza would be Thursday, Friday, and Saturday. This recommendation is the most effective solution to be more productive and make the most out of the tips. Working at Domino's Pizza has its rewards. If you deliver pizza at a more effective rate, you can earn more bonuses and limit the time wasted and the fuel used.  It would be best to consider the changing seasons, the number of drivers hired, and the orders placed to decide what is more efficient for you as a delivery driver.









