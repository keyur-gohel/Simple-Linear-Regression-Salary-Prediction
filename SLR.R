# Simple linear Regression

# Data preProcessing

# Getting Dataset
dataset = read.csv("Salary_Data.csv")

# Spliting Dataset Into Training And Test Dataset
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
train_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Fitting SLR To Train_set

regressor = lm(formula = Salary ~ YearsExperience,
               data = train_set)

# Predict Vector
y_pred = predict(regressor, newdata = test_set)

# visualisation of train_set
# install('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = train_set$YearsExperience, y = train_set$Salary),
             colour = 'red') +
  geom_line(aes(x = train_set$YearsExperience, y = predict(regressor, newdata = train_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training set)') +
  xlab('Years of Experience') +
  ylab('Salary')


# visualisation of test_set
# install('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = train_set$YearsExperience, y = predict(regressor, newdata = train_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Test set)') +
  xlab('Years of Experience') +
  ylab('Salary')
  
