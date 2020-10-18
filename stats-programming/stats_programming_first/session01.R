### Following https://github.com/mcomas/statprog-course/blob/master/session-01-script.R

### Course slides http://mcomas.github.io/STATPROG/statprog_01.html

### Also helpful https://swcarpentry.github.io/r-novice-inflammation/13-supp-data-structures/


### printing 
a <- 2 
b <- "2"
cat(sprintf("%d\n", a))
print(a)
cat(a)
sprintf(b, "")


# Data types 
#### ways to check data types
typeof(a) #low-level # double
class(a) #high-level # numeric

length(a)
str(a)

typeof(5.5)
class(5.5)
length(5.5)


length(c("a", "b"))
class(c("a", "b"))


# Automic vector
#### create a vector of mode numeric 
numeric(5)   # a numeric vector with 5 elements

numeric_vector <- c(1, 2, 3, 4, 5)
numeric_vector <- 1:5
numeric_vector <- seq(5)
numeric_vector <- seq(from = 1, to = 5, by = 1)
numeric_vector <- numeric(5)   # a numeric vector with 5 elements


cat(numeric_vector)
typeof(numeric_vector)

#### create a vector of mode integer
int_vector <- seq(5L) # add L after number to covert to int
cat(i_vector)
typeof(i_vector)
str(int_vector)

#### create a vector of mode logical  
logical_vector <- c(TRUE, FALSE, FALSE)
logical_vector <-logical(5)   # a logical vector with 5 elements
logical_vector <- vector() # an empty 'logical' (the default) vector
typeof(logical_vector)
print(logical_vector)
str(logical_vector)


#### create a vector of mode character
char_vec = vector("character", length = 5) # a vector of mode 'character' with 5 elements
char_vec = c("a", "b", "c", "d")
char_vec =  character(5) # the same thing, but using the constructor directly
print(char_vec)
typeof(char_vec)
str(char_vec)


#### a mixture of different types will be interpreted as one type only
xx <- c(1.7, TRUE, "spe")
str(xx) 


# Vector slicing/subseting
#### Indexing in R starts with 1! (Python starts with 0)
#### select using positive int 
z <- c("Apple", "Banna", "Cucumber", "Durian")
zz <- 1:5
str(z)
z[c(1)]
z[c(1,4,2,3,3,3,3)]

#### select using negative int 
z[-1] #select all except 1st element 
z[-c(2,4)] #removing 2nd and 4th elements 


#### select using logical vec 
z[c(TRUE, FALSE, FALSE, TRUE)]

zz <- 1:5
zz > 3
class(zz > 3) #logical 

zz[zz> 3]  #using logical vec to select 
zz[c(FALSE, FALSE, FALSE, TRUE,TRUE)] # this is the same as above


#### select via names attribute
xm = x[x < 5]
cat(xm)
names(xm) = c('one', 'two', 'three', 'four')
xm[c('two')]
xm[c('two', 'four')]

cat(xm)
cat(names(xm))


# List
#### A list is a special type of vector. Each element can be a different type.

a_list <- list(1, "a", TRUE, 1+4i)
class(a_list)
a_list[[1]] # get element via double brackets 


#### List's have an special selection operator "[[*]]"
#### [ ] vs [[ ]]
class(a_list[[1]]) # returns numeric
class(a_list[1]) # return list

class(a_list[[4]]) # numeric
class(a_list[4]) # list

#### Elements of a list can be named (i.e. lists can have the names attribute)
names(a_list) = c('first', 'second', 'third', 'forth') 
a_list['forth']


x_list <- list(a = "Karthik Ram", b = 1:10, data = head(mtcars))
x_list['a']
x_list[1]

# Matrix
#### construct a matrix 
m <- matrix(1:6, 
       nrow = 2,
       ncol = 3) #Matrices in R are filled column-wise by default.

m_row <- matrix(1:6, 
            nrow = 2,
            ncol = 3,
            byrow = TRUE) #specify filled by row


m = 1:6
dim(m) = c(2, 3) 

class(m) #maxtrix, array
typeof(m) #int

#### combine column wise 
col <- 1:3
col2 <- 10:12
cbind(col, col2)

#### combine row wise 
row <- 1:3
row2 <- 10:12
rbind(row, row2)

#### retrieve element in a matrix
m[2 , 2] #m[row, col]
m[2, 1]

# Iteration
x <- 1:5

y <- c("A", "B", "C")
for(i in y){
  cat(sprintf("%s",i))
}

y <- c("A", "B", "C")
for(i in y){
  print(i)
}



for(i in x){
  cat(i, "\n")
}

for(i in x){
  cat(-i, "\n")
}

for(i in x+1){
  cat(-i, "\n")
}

for(i in 1:length(x)){
  cat(x[-i], "\n")
}

for(i in 1:length(x)){
  cat(-x[i], "\n")
}

# Excerise
ppl = list(
  list('name' = 'Marc',
       'age' = 40,
       'sex' = 'male'),
  list('name' = 'Manel',
       'age' = 45,
       'sex' = 'male'),
  list('name' = 'Christine',
       'age' = 30,
       'sex' = "female"),
  list('name' = 'Sonia',
       'age' = 43,
       'sex' = 'female')
)

typeof(ppl[1])
person1 = ppl[[1]] # remember it's double bracket here! 
typeof(person1)
person1['name']

#### [] vs [[]]
typeof(ppl[[1]]['name']) #list 
typeof(ppl[[1]][['name']]) #char 
typeof(ppl[[1]][['age']]) #double 


# We want to print the information in a single string.  It will take the following pattern
# "%s is %s years old and is a %s"

container = vector(mode = 'character', 4) # Equivalently, rep("", 4)
for(i in 1:length(ppl)){
  name = ppl[[i]][['name']]
  age = ppl[[i]][['age']]
  sex = ppl[[i]][['sex']]
  container[i] = sprintf("%s is %s years old and is a %s", name, age, sex)
}
container


##### Alternatively we can extract the operation out as a function 
print_person = function(list_vec){
  name = list_vec[['name']]
  age = list_vec[['age']]
  sex = list_vec[['sex']]
  sprintf("%s is %s years old and is a %s", name, age, sex)
}

container = vector(mode = 'character', 4) 
for(i in 1:length(ppl)){
  container[i] = print_person(ppl[[i]])
}
container


# Apply functions

### The below both apply func to evey element in the list but just returns different
sapply(ppl, print_person)
lapply(ppl, print_person)

typeof(sapply(ppl, print_person)) #char
typeof(lapply(ppl, print_person)) #list 

### mapply iterates in different vectors.
paste("a", "b")
mapply(paste, c(1,2,3,4), c("one", "two", "three", "four"), c(TRUE, FALSE, TRUE, FALSE))
paste(c(1,2,3,4), c("one", "two", "three", "four"), c(TRUE, FALSE, TRUE, FALSE))

### using external lib to replicate the behavior
library(purrr)
map_chr(ppl, print_person) #same as sapply 
pmap_chr(list(c(1,2,3,4), c("one", "two", "three", "four"), c(TRUE, FALSE, TRUE, FALSE)), paste) #same as mapply

