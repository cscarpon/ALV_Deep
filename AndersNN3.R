library(keras)

#Set working Drive
setwd("C:/Users/User/Desktop/Deep learning R")

#Call the CSV
TestCSV <- read.csv('testdatalevels.csv')

glimpse(TestCSV)


Test_Train <- make_csv_dataset(
  TestCSV,
  batch_size = 10,
  num_epochs = 1,
  header = TRUE
)

?make_csv_dataset



TRAIN_DATA_URL <- "https://storage.googleapis.com/tf-datasets/titanic/train.csv"
train_file_path <- get_file("train_csv", TRAIN_DATA_URL)

train_file_path

x <- read.csv(train_file_path)
glimpse(x)

str(x)

x[1]

train_data <- make_csv_dataset(
  train_file_path, 
  field_delim = ",",
  batch_size = 5, 
  num_epochs = 1
)

train_dataset %>% 
  reticulate::as_iterator() %>% 
  reticulate::iter_next() %>% 
  reticulate::py_to_r()


#Setting the feature specification space to understand that survived is linked to all other data
spec <- feature_spec(train_dataset, survived ~ .)


#automated conversion of numeric to one_hot_encoding
spec <- spec %>% 
  step_numeric_column(all_numeric())


#fitting the spec to our model
spec <- fit(spec)


#We can then create a layer_dense_features that receives our dataset as input and returns an array containing all dense features:
layer <- layer_dense_features(feature_columns = dense_features(spec))


train_dataset %>% 
  reticulate::as_iterator() %>% 
  reticulate::iter_next() %>% 
  layer()



#Set working Drive
setwd("C:/Users/User/Desktop/Deep learning R")

#Call the CSV
TestCSV <- read.csv("testdataLevels.csv")

glimpse(TestCSV)
[[]]
edit(TestCSV)

w <- c(12,3,6,14,10)
str(w)


dim(as.array(w))

a.w <- as.array(w)

str(a.w)


#2 Matrix example

vector1 <- c(5, 9, 3) 
vector2 <- c(10, 11, 12, 13, 14, 15) 

?array


column.names <- c("COL1", "COL2", "COL3") 
row.names <- c("ROW1", "ROW2", "ROW3") 
matrix.names <- c("Matrix1", "Matrix2") 

A.2D <-  array(vector1,vector2)
remove(A.2D)


# Take these vectors as input to the array. 
 
result <- array(c(vector1, vector2), dim = c(3, 3, 2),
                dimnames = list(row.names, column.names, 
                                matrix.names)) 
print(result) 


#3 Matrix Example

# Create two vectors of different lengths. 
vector1 <- c(5, 9, 3) 
vector2 <- c(10, 11, 12, 13, 14, 15, 16) 

vector1

# Take these vectors as input to the array. 
array1 <- array(c(vector1, vector2), dim = c(3, 3, 2)) 

array1

# Create two vectors of different lengths. 
vector3 <- c(9, 1, 0) 
vector4 <- c(6, 0, 11, 3, 14, 1, 2, 6, 9) 
array2 <- array(c(vector1, vector2), dim = c(3, 3, 2)) 

# create matrices from these arrays. 
matrix1 <- array1[,,2] 
matrix2 <- array2[,,2] 

# Add the matrices. 
result <- matrix1 + matrix2 
print(result) 
