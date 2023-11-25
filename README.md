# APRM
APRM is a ML project we're developing that stands for Airline Pricing and Revenue Management. It will be completed by 30/11/2023
Difficulties we're encountering:-
1. One of the first difficulties we had to deal with was trying to feature engineer these massive datasets so that they may be balanced in shape with target and features. 

Things Faiz has done so far:-
1. Used Labelencoder to transform ' Origin' and ' Destination' into interger values.
2. Transformed 'Cabin' and 'Airline' through similar mapping techniques.
3. Used seaborn plotting to tray and understand the relation betwenn 'Booking Class' and ' Booking Class fare USD '.
4. Transformed 'Dep_time' and 'Dep_Date' to int values.
5. Got rid of columns that had more than 5% of its values as NaN.
6. Filled rest of NaNs with 0.00 because their values ahead and before of it showed similar trends. So instead of mean or mode it made more sense to use this idk felt cute might delete this repo later 
7. Now after doing all of the above I used all the rest of the data columns as features and used ' Booking class fare USD " as target to train the model.
8. I couldn't make anything out of the final info that is mean square etc So I attempted to understand the feature importance of all the features I used against the target variable. Upon understanding that I maybe able to select the best model to train in order to predict at what time of the day+date of departure, using what class of the seat and using which airline at from what origin to destination we can get what kind of pricing.
9. Aside from this, with the revenue datasets - We will attempt to understand what class, on what day, at what time, using which airline and through which origin and destination combination do we get the highest revenues from!  
10. Planning to implement the SARIMA model which is based out of Time Series Analysis.
11. Hey so, the newest idea is that -> we use the 12 month booking and revenue data separately and train our SARIMA model to predict the data for the next 3 months, then get accuracy using the testing datasets we have. we will be abandoning the regression based apporach now.