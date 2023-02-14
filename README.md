# Employee Attrition Analysis - An Imbalanced Classification Problem

## GOAL: To prepare a model for the HR department to predict the Attrition. And, give insights from the data about the important factors associated with the attrition so that HR can take measures to control the attrition of employees.

### Attrition is a metric that represents the percentage of employees who leave an organisation(either voluntarily or involuntarily) for reasons including resignation, termination, death or retirement. It is a key indicator used by HR department to monitor and improve their organisation's workforce planning and overall management.

#### Why Does Attrition Rate Matter?
- Can have negative impact on your organization’s performance
- Struggle to recruit new people
- Hiring cost to replace employees
- Impact those employees working with them that can result in adding more work to them. This can increase stress and impact organization’s performance

## Imbalanced Classification
- In this Classification problem, we try to predict the class label by studying the input data or predictor where the target(Attrition) feature is a categorical variable in nature. It is observed that the numbers of observations in class label 1(minority class) is significantly lower than other class label 0(majority class). And this type of dataset is called an imbalanced class dataset! Here, it is vital to identify the minority classes correctly.

   ### Here we discuss, some of the techniques used to solve this imbalanced dataset problem. They are:
     1) Resampling the training dataset - Using SMOTE(Oversampling) and UnderSampling
         
         - After sampling the data we can get a balanced dataset for both majority and minority classes. So, when both classes have a similar number of records present in the dataset, we can assume that the classifier will give equal importance to both classes.

         - SMOTE: Synthetic Minority Oversampling Technique or SMOTE. This technique is used to oversample the minority class. In this case, SMOTE looks into minority class instances and uses k nearest neighbor to select a random nearest neighbor, and new instances are synthesized from the existing data.
         
         - RandomUnderSampling: Here, random rows from the majority class are deleted to match with the minority class. 

     2) Performance Metric
         i) F1 score: harmonic mean of precision and recall
        ii) Precision/Specificity: how many selected instances are relevant
       iii) Recall/Sensitivity: how many relevant instances are selected
     For Visualization,
        iv) AUC: relation between true-positive rate and false positive rate
         v) Correlation Matrix
         
## Steps for Python implementation

### 1) EDA
   
     i) Import neccessary libraries
     
    ii) Load the data. Check the datatypes. 
  
    iii) Quality Analysis - Find Missing Value, Duplicates
 
    iv) Correlation check
  
     v) Visualization - Bivariate, Multivariate Analysis on Numerical and Categorical features
   
    vi) Attrition Rate - Attrition Rate vs Non-Attrition Rate in various features
   
    vii) KEY INSIGHTS
    
    viii) Capping and Flooring of outliers
    
    ix)  Zero Variance check
    
    x)  Numerical and Categorical Feature Selection 
    
    xi) Split the data into 2 dataframes 
         - Independent features dataframe - X
         - Target feature(Attrition) dataframe - Y
         
         



   1) Split the dataset into Train and Test dataset
   2) 3 Algorithms used - Decision Tree, Random Forest, GBM
   3) Model 1 notebook - 3 algorithms are used to predict the attrition
   4) Moddel 2 notebook - 
         
    
    
  
   
