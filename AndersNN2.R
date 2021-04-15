library(keras)
library(readr)
library(tibble)
library(tensorflow)
library(rsample)



#Set working Drive
setwd("C:/Users/User/Desktop/Deep learning R")

#Call the CSV
TestCSV <- read_csv("testdataLevels.csv")

#View CSV structure
glimpse(TestCSV)


#Split the data into training and validation

split <- initial_split(TestCSV, prop = 4/5)
train <- training(split)
val <- testing(split)


#Split the Training and Validation Data into X and Y datasets 

#Training Data

trainY <- train[1]

#Unlist turns the list to vectors, which allows for it to be converted to a number vector

trainY <- trainY %>% 
  unlist() %>% 
  as.numeric()

trainX <- train[2:3]

glimpse(trainX)
glimpse(trainY)

#Validation Data

valY <- val[1] 

valY <- valY %>% 
  unlist() %>% 
  as.numeric()


valX <- val[2:3]

head(valY)
head(valX)

 
#Feature Wise normalization for the x data (similar to one-hot encoding)

mean <- apply(trainX,2,mean)
std <- apply(trainX, 2, sd)
trainData <- scale(trainX, center = mean, scale = std)


mean <- apply(valX,2,mean)
std <- apply(valX, 2, sd)
valData <- scale(valX, center = mean, scale = std)

#Convert Dataframes to a matrix

trainData<- trainData %>% 
                as.matrix()
valData <- valData %>% 
                as.matrix()


glimpse(trainData)
glimpse(valData)


#Get the rows for array conversation
#Train Data 

TrainYCount <- nrow(trainY) %>% 
  as.numeric()

TrainXCount <- nrow(trainX) %>% 
  as.numeric()

#Validation Data

ValYCount <- nrow(valY) %>% 
  as.numeric()

ValXCount <- nrow(valX) %>% 
  as.numeric()

#Reshape Matrix to be in line with tensor flow data structure requirements


TrainDataArray <- array_reshape(trainData, dim = c(TrainXCount,2))
glimpse(TrainDataArray)


ValDataArray <- array_reshape(valData, dim = c(ValXCount,2))
glimpse(ValDataArray)


one_hot_train_labels <- trainY %>% 
                        to_categorical()


str(one_hot_train_labels)

str(one_hot_train_labels)

one_hot_val_labels <- valY %>% 
                      to_categorical()
  
  

valY

str(trainData)



#epochs, how many runs the model will go through
#batch size, how many samples it is drawing each time
#input_shape is the number of lists that is one the training data!!!

model <- keras_model_sequential() %>% 
  layer_dense(units = 12, activation = "relu", input_shape = 600 x 600) %>% 
  layer_dense(units = 24, activation = "relu") %>% 
  layer_dense(units = 3, activation = "softmax")

model %>% 
  compile(optimizer = "rmsprop", 
          loss = "categorical_crossentropy", 
          metrics = c("accuracy")
  )

str(TrainDataArray)

#Epochs are the number of iterations the model will need to run
#Batch size is the number of samples it should grab
#Fit() is fitting the model to your data (or vice versa). You have to ensure that you have created the right model parameters to accept your data structure

history <- model %>% fit (
  TrainDataArray,
  one_hot_train_labels,
  epochs = 10,
  batchsize = 20,
  validation_data = list(ValDataArray, one_hot_val_labels)
)

plot(history)



results <- model %>% evaluate(ValDataArray, one_hot_val_labels) 
results