# Task 2 – Exploratory Data Analysis (EDA) on Titanic Dataset 

## Introduction
This task presents the analysis of the **Titanic dataset**, which contains demographic and survival information about passengers aboard the Titanic.  

The purpose of this analysis was to:
- Clean and preprocess the dataset  
- Explore patterns in passenger demographics and survival  
- Identify key factors that influenced survival rates  
- Build a foundation for predictive modelling  

---

## Dataset Overview
The dataset consists of **891 passenger records** with the following key variables:

- **PassengerId**: Unique identifier  
- **Survived**: Survival status (1 = Survived, 0 = Did not survive)  
- **Pclass**: Passenger class (1 = Upper, 2 = Middle, 3 = Lower)  
- **Name, Sex, Age**: Demographic details  
- **SibSp**: Number of siblings/spouses aboard  
- **Parch**: Number of parents/children aboard  
- **Ticket, Fare**: Ticket number and fare paid  
- **Cabin**: Cabin number (many missing values)  
- **Embarked**: Port of embarkation (C = Cherbourg, Q = Queenstown, S = Southampton)  

**Dataset dimensions:**  
- 891 entries, 12 columns  
- Mixed data types: numeric, categorical, and text  
- Missing values in `Age`, `Cabin`, and `Embarked`  

---

## Key Results & Insights
- **Passenger Class (Pclass):** Survival strongly correlated with class. Passengers in **1st class** had higher chances of survival compared to 2nd and 3rd class.  
- **Gender:** **Females** had significantly higher survival rates than males.  
- **Age:** **Children** had better chances of survival compared to adults. Missing values in `Age` were imputed during analysis.  
- **Family Size (SibSp + Parch):** Having immediate family aboard sometimes improved survival chances.  
- **Embarked Port:** Slight variations in survival rates by embarkation port.  

---

## Example Dataset Preview
| PassengerId | Survived | Pclass | Name                                   | Sex    | Age | SibSp | Parch | Fare   | Embarked |
|-------------|----------|--------|----------------------------------------|--------|-----|-------|-------|--------|----------|
| 1           | 0        | 3      | Braund, Mr. Owen Harris                | male   | 22  | 1     | 0     | 7.25   | S        |
| 2           | 1        | 1      | Cumings, Mrs. John Bradley (Florence) | female | 38  | 1     | 0     | 71.28  | C        |
| 3           | 1        | 3      | Heikkinen, Miss. Laina                 | female | 26  | 0     | 0     | 7.92   | S        |

---

## Conclusion
The **Titanic EDA** revealed that survival likelihood was influenced by:  
- **Passenger class (wealth/status)**  
- **Gender (females had priority)**  
- **Age (children had higher survival rates)**  

These findings are consistent with historical accounts of the Titanic disaster, where **“women and children first”** was applied, and wealthier passengers had better access to lifeboats.  

---

## Files in this Folder
- `titanic_analysis.ipynb` → Jupyter Notebook with full EDA  
- `titanic_dataset.csv` → Dataset used for analysis (Kaggle)  
- `visualisations/` → Plots and charts generated  
- `Task-2_Report.pdf` → Full written report  
