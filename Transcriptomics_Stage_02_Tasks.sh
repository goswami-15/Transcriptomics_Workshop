#Calculate the product of 31 and 78
31*78
#Divide 697 by 41
697/41
#Add 314 and 654
314+654
#Subtract 23 from 56765
56765-23
#Assign 39 to x
x<- 39
#Assign 14 to y
y <- 14
#Make z the value of x - y
z<- x-y
#Calculate the square root of 2345, and perform a log2 transformation on the result
sqrt(2345) 
log2(48.4252)
#Create a vector called vec1 containing the numbers 2,5,8,12 and 16
vec1 <- c(2,5,8,12,16)
#Use seq() to make a vector of 100 values starting at 2 and increasing by 3 each time and store it in a new variable
v <- seq(2, 100, by=3)
#Extract the values at positions 5,10,15 and 20 in the vector of 100 values you made
v [c(5,10,15,20)]
#Extract the values at positions 10 to 30 in the vector of 100 values you made
v [10:30]
#Enter the following into a vector with the name mouse_colour. Remember to surround each piece of text with quotes: purple, red, yellow, brown
mouse_colour <- c("purple", "red", "yellow", "brown")
#Enter the following into a vector with the name mouse_weight: 23, 21, 18, 16
mouse_weight<- c(23, 21, 18, 16)
#Join the 2 vectors together using the data.frame function to make a data frame named mouse_info with 2 columns and 4 rows. Call the first column ‘color’ and the second one ‘weight’
mouse_info <- data.frame(color= c("purple", "red", "yellow", "brown"),weight=c(23, 21, 18, 16))
#Read the file ‘small_file.txt’ [https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt] into a new data structure using read.table() OR read.delim(). Remember to assign a name to the data that you read in using the assignment operator
link <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/R/small_file.txt"
NewFile<- read.table(link, header=T,sep=",")
#View the data set to check that it has imported correctly
View(NewFile)
#Read the file ‘Child_Variants.csv’ [https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true] into a new data. This is a comma-separated file so you should use read.csv(). Again, remember to assign a name to the data when you import it
link <- 'https://github.com/HackBio-Internship/public_datasets/blob/main/R/Child_Variants.csv?raw=true'
ChVa<- read.csv(link, header=T,sep = ",")
#Use head and View to look at the data set to check that it has imported correctly.
View(ChVa)
head(ChVa)
#Calculate the mean of the column named MutantReadPercent. Think about how you are going to access a single column first (probably by using the $ notation or [] notation), then once you can access the data pass it to the mean function
mean(ChVa$MutantReadPercent)
#Create a filtered version of the child variants dataset that only includes rows where the MutantReadPercent is >=70 using subset() function or the [] notation
ChVa[ChVa$MutantReadPercent>=70, ]
#Search google for the “`Iris flower dataset`”. You are searching for the dataset because we want you to learn on how to search for datasets yourself.
Iris_flower<- read.table('IRIS.xls', header= T, sep=",")
View(Iris_flower)
#With relevant plots, which species of flower has
#shorter sepal length but longer width
#Setosa
#longer sepal lengths and shorter sepal widths
#Virginica
#Sepal Length Distribution of Different Flower Species
ggplot(d,aes(x = species, y = sepal_length, fill = species, notch=T, outline=F))+
  labs(title='Sepal Length Distribution of Different Flower Species', x ='Flower Species',y ='Length')+
  geom_boxplot(alpha = 1) +
  theme_classic()
 #Sepal Width Distribution of Different Flower Species 
ggplot(d,aes(x = species, y = sepal_width, fill = species, notch=T, outline=F))+
  labs(title='Sepal Width Distribution of Different Flower Species', x ='Flower Species',y ='Width')+
  geom_boxplot(alpha = 1) +
  theme_classic()
#With relevant plots, which specie of flower has
#shorter petal length as well as petal width
#Setosa
#longer petal length as well as petal width
#VIrginica
#Petal Length Distribution of Different Flower Species
ggplot(d,aes(x = species, y = petal_length, fill = species, notch=T, outline=F))+
  labs(title='Petal Length Distribution of Different Flower Species', x ='Flower Species',y ='Length')+
  geom_boxplot(alpha = 1) +
  theme_classic()
# Petal Width Distribution of Different Flower Species
ggplot(d,aes(x = species, y = petal_width, fill = species, notch=T, outline=F))+
  labs(title='Petal Width Distribution of Different Flower Species', x ='Flower Species',y ='Width')+
  geom_boxplot(alpha = 1) +
  theme_classic()
#Which variables (or columns) correlate best (use pairs() function)
pairs(~ d$sepal_length + d$sepal_width+
        +        d$petal_length + d$petal_width, data = d)
#Petal length and Petal Width correlate best. 



