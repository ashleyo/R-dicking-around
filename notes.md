# Notes

1. There are some datasets in CSV [here](https://gist.github.com/rnirmal/e01acfdaf54a6f9b24e91ba4cae63518)

2. And some smaller :-) ones [here](https://github.com/Opensourcefordatascience/Data-sets)

3. default output does not go to console - in practice this means anything you want to see needs 'print'

4. The mtcars.csv can be found as a [gist](https://gist.githubusercontent.com/seankross/a412dfbd88b3db70b74b/raw/5f23f993cd87c283ce766e7ac6b329ee7cc2e1d1/mtcars.csv)

5. There is a useful intro to using R with SQL on [DataCamp](https://www.datacamp.com/tutorial/sqlite-in-r)

## Saving Work

R has a number of graphic output routines with predicatable names such as `jpeg()` `png()` `postscript()` `pdf()`.

Here is an example of use

```R
png(file="C:/tmp/plot.png") # where to put the file
hist(sales$num_of_orders) # add a plot to the output
dev.off() # close the graphics device IMPORTANT
```

If you look at the code above the (bogus) `hist` line would normally send output to the terminal. However, here it sends it to a file instead. So, the `png()` function *replaces* the default destination for output. That is why it is important to turn it off again. This also ensures the file is closed properly.

## Types

### Intro

Look online for a fuller desciption of R's types. Here we'll just touch some highlights.

```R
i <- 1
sport <- "football"
flag <- TRUE

class(i) # returns "numeric"
typeof(i) # return "double"
```

It is worth mentioning `length` because it will trip you up ...

```R
length(sport) # returns 1
```

... because sport is actually a `vector` and has one item in it

### Vectors

Vectors can be made by supplying elements to the combine function `c()`(or the combine operator `:` in the case of integers)

```R
u <- c("red", "green", "blue")
```

Vectors may be subscripted to return an element, `u[1]` is `red`

Things to note coming from Python, vectors are __not__ lists, all the elements must have the same type. Also, the first index is 1 not 0.

```R
v <- 1:5 # Same as c(1,2,3,4,5)

sum(v) # 15. Some operators operate on the whole of a vector

w <- v * 2 # 2,4,6,8,10 works like a comprehension in Python

z <- v + w # element-wise addition into a new vector 3,6,9,12,15

z > 8 # FALSE FALSE TRUE TRUE TRUE - creates a new logical vector

z[z>8] # 9,12,15. Indexing a vector with a logical vector is like filtering
```

If you need to create an empty vector of given length you may wish to include the type of element via the `mode` param

```R
X <- vector(mode="integer", 0) # an empty (length 0) vector of integers 
```

Finally
```R
dim(X) # returns NULL
```

R does not regard vectors as being 1-dimensional arrays, they are dimensionless

### Arrays

#### And Matrices which are arrays of arrays, in effect

```R
sales <- array(0, dim(3,4,2))
```

Creates a three dimensional array with three rows, four columns and two uhh... planes

```R
sales[2,1,1] = 15000 # sets an element. Three indices are required.
```

Two-dimensional arrays are referred to in R as __matrices__ (confuses mathematicians because matrices may, of course, have any number of dimensions)

However, matrices get some special (and very useful) functions such as `inverse` mostly in the `matrixcalc` package.

Run `install.packages("matrixcalc")` __once__ from the terminal and include `library(matrixcalc)` early in your code

```R
library(matrixcalc)
M <- matrix( c(1,3,3,5,0,4,3,3,3), nrow = 3, ncol = 3)
```

Creates a 3x3 matrix (from a vector, notice)

```R
M %*% matrix.inverse(M) # gives the identity matrix, matrix times its inverse
```

### DataFrames

Arrays also have to be of a single type. Not so with dataframes. Dataframes are often created by reading in external files.

```R
df <- read.csv("mtcars.csv")
```

The **structure** of a dataframe can be revealed with the handy `str()` function.

```R
str(df)
```

Would give output such as

```
'data.frame':   32 obs. of  12 variables:
 $ model: chr  "Mazda RX4" "Mazda RX4 Wag" "Datsun 710" "Hornet 4 Drive" ...
 $ mpg  : num  21 21 22.8 21.4 18.7 18.1 14.3 24.4 22.8 19.2 ...
 $ cyl  : int  6 6 4 6 8 6 8 4 4 6 ...
 $ disp : num  160 160 108 258 360 ...
 $ hp   : int  110 110 93 110 175 105 245 62 95 123 ...
 $ drat : num  3.9 3.9 3.85 3.08 3.15 2.76 3.21 3.69 3.92 3.92 ...
 $ wt   : num  2.62 2.88 2.32 3.21 3.44 ...
 $ qsec : num  16.5 17 18.6 19.4 17 ...
 $ vs   : int  0 0 1 1 0 1 0 1 1 1 ...
 $ am   : int  1 1 1 0 0 0 0 0 0 0 ...
 $ gear : int  4 4 4 3 3 3 3 4 4 4 ...
 $ carb : int  4 4 1 1 2 1 4 2 2 4 ...
```

All of the individual 'columns' are held as vectors

```R
is.vector(df$hp) # returns TRUE
```

> NB. This example did not, but if your CSV has categorical data such as 'gender' it would not be a vector but a Factor. You might see output such as

```
$ gender : Factor w/ 2 levels "F", "M": 1 1 2 1 2 2 2 ....
```

Dataframes may be subscripted, we could return all of the second column with `df[,2]`

The subscripting mechanism is powerful. For instance we could get the first three rows with `df[1:3,]` or the first and fifth column with `df[,c(1,5)]`


### Lists

The underlying type of a dataframe is `list`. A list has a single dimension but can hold a mixture of any other types: numerics, vectors, other lists, ...

```R
L  <- list(1, c("red", "green", "blue"), TRUE)

```

>Subtle point. `L[2]` is **a** vector. So length(L[2]) is 1. To access the content you must use `[[]]`, so `length(L[[2]])` return 3.

The `str()` function may also be used on lists to elucidate their structure.







