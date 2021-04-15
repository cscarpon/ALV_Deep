library(keras)
library(readr)
library(tibble)

setwd("C:/Users/User/Desktop/Deep learning R")


TestCSV <- read_csv("testdata.csv")

glimpse(TestCSV)

TestLabel <- TestCSV[1]

TestLabel$Factor <- 1  

TestLabel[,'Factor']<-factor(TestLabel[,'Factor'])  

glimpse(TestCSV)


str(TestLabel)

Sort_Fun = function(x){if(x[1] == 'A')
  (1)
  else if (x[1] == 'B')
    (2)
  else if (x[1] == 'C')
    (3)
  else (0)}

Factor <- apply(TestLabel,2,Sort_Fun)

TestLabel

TestMatrix <- as.matrix(TestCSV)

Label <- TestCSV[1]
Label <- as.matrix(Label)
Label <- as.array(Label, dim(100,1))

Train <- TestCSV[2:3]

#Feature Wise normalization for the x data (similar to one-hot encoding)

mean <- apply(Train,2,mean)
std <- apply(Train, 2, sd)
train_data <- scale(Train, center = mean, scale = std)

#One-Hot encoding the labels (Y data)

to_one_hot <- function(labels, dimension = 3) { 
  results <- matrix(0, nrow = length(labels), ncol = dimension)
  for (i in 1:length(labels)) 
    results[i, labels[[i]] + 1] <- 1
  results
}

str(Label)



one_hot_train_labels <- to_one_hot(Label)
one_hot_train_labels <- to_categorical(Label) 


Build


#Splitting data into Training and Testing Data

train_index <- sample(1:nrow(train_data ), 0.8 * nrow(train_data ))
test_index <- setdiff(1:nrow(train_data ), train_index)

# Build X_train, y_train, X_test, y_test
x_train = train_data[train_index, -15]

glimpse(x_train)

x_test = train_data[test_index, -15]

glimpse(x_test)


x_train = data.matrix(x_train)
x_test = data.matrix(x_test)

one_hot_train_labels <- to_categorical(train_labels) 
one_hot_test_labels <- to_categorical(test_labels)


nrow(train_data)


glimpse(ydata)

?apply




# array will be (100,3)