## ===============================================================================
## R Programming - Coursera
## Methods: makeCacheMatrix(matrix)
##          cacheSolve(cacheMatrix)
## Author: instig888@gmail.com
## Date: 4/21/2015
## 
## For a simple, old school, hack, like me this is essentially a journey into
## rudimentary Object Oriented Programming.
##
## makeCacheMatrix(matrix) ==>
##    The first function makeCacheMatrix essentially creates a list that can be
##    treated like an instantiation of a custom matrix object that has built in
##    caching functions.  It's a series of setter and getter functions for the matrix
##    itself and a cacheable matrix which represents the inversion of that matrix.
##
## cacheSolve(cacheableMatrix) ==>
##    The second function takes as input one of these custom cacheable matricies
##    and calculates the inversion of the matrix.  It is able to leverage the setters
##    on the GLOBAL scope variables of the cacheable matrix to see if has been
##    calculated and saved previously.  This way it only ever does the calculation once.
##    NOTE: Any time the matrix value in the cacheMatrix is set to a new matrix the
##          setter zeroes out the cached inverse matrix also.  This way you don't
##          accidentally get the cached value of an old version of the matrix.
##
##
##
## ****NOTE****
## At the end of this library I have included a series of "test cases" that are commented out.
## They can be run to inspect how the caching is or isn't working as appropriate.
## ===============================================================================

## *************
## Create a custom list object with a matrix and associated set of functions for caching
## both the matrix and a calculated inverse of that matrix.  Reset the inverse cache if
## the matrix gets set.
## *************
makeCacheMatrix <- function(mat = matrix()) {
  # The current value for the inversion
  inv <- NULL
  
  # The set function for this object
  set <- function(newMat) {
    mat <<- newMat
    inv <<- NULL
  }
  get <- function() mat
  setinv <- function(inversion) inv <<- inversion
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

## *************
## Use R's solve function to calcualate the inverse of the matrix in the cachedMatrix
## object.  If the inverse has already been calculated previously simply use that value
## as the answer rather than doing the computation again.
## *************
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  testInv <- x$getinv()
  if(!is.null(testInv))
  {
    message("Returning cached Inversion Values")
    return(testInv)
  }

  data <- x$get()
  testInv <- solve(data)
  x$setinv(testInv)
  testInv
}


# ## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# ## The below are functional test cases.  Uncomment and run to verify
# ## and understand the execution of the above functions.
# ## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# message("Cache Matrix Library ==> Test Cases")
# ## Script to test my cache matrix inverse methods
# message("Creating cached matrix 1 ==> 4,3,3,2")
# cacheMatrix1 <- makeCacheMatrix(matrix(c(4,3,3,2), nrow=2, ncol=2))
# message("Creating cached matrix 2 ==> 12,10,8,14")
# cacheMatrix2 <- makeCacheMatrix(matrix(c(12,10,8,14), nrow=2, ncol=2))
# message("Creating cached matrix 3 ==> 2,3,3,4")
# cacheMatrix3 <- makeCacheMatrix(matrix(c(2,3,3,4), nrow=2, ncol=2))
# 
# # Not Cached
# message("cache solve cache matrix 1 --> not cached")
# cmInv1.1 <- cacheSolve(cacheMatrix1)
# # Cached
# message("cache solve cache matrix 1 --> should get cached message")
# cmInv1.2 <- cacheSolve(cacheMatrix1)
# # Not Cached
# message("cache solve cache matrix 2 --> not cached")
# cmInv2.1 <- cacheSolve(cacheMatrix2)
# # Not Cached
# message("cache solve cache matrix 3 --> not cached")
# cmInv3.1 <- cacheSolve(cacheMatrix3)
# # Cached
# message("cache solve cache matrix 2 --> should get cached message")
# cmInv2.2 <- cacheSolve(cacheMatrix2)
# # Cached
# message("cache solve cache matrix 1 --> should get cached message")
# cmInv1.3 <- cacheSolve(cacheMatrix1)
# # Cached
# message("cache solve cache matrix 2 --> should get cached message")
# cmInv2.3 <- cacheSolve(cacheMatrix2)
# # Cached
# message("cache solve cache matrix 3 --> should get cached message")
# cmInv3.2 <- cacheSolve(cacheMatrix3)
# # Reset matrix should remove cache
# message("cache solve cache matrix 1 after changing matrix --> not cached")
# cacheMatrix1$set(matrix(c(2,7,5,3), nrow=2, ncol=2))
# cmInv1.4 <- cacheSolve(cacheMatrix1)
# 
# message(paste("Comparing 1.1 & 1.2 (expect TRUE) ==> ", identical(cmInv1.1, cmInv1.2)))
# message(paste("Comparing 1.1 & 1.3 (expect TRUE) ==> ", identical(cmInv1.1, cmInv1.3)))
# message(paste("Comparing 2.1 & 2.2 (expect TRUE) ==> ", identical(cmInv2.1, cmInv2.2)))
# message(paste("Comparing 2.1 & 2.3 (expect TRUE) ==> ", identical(cmInv2.1, cmInv2.3)))
# message(paste("Comparing 3.1 & 3.2 (expect TRUE) ==> ", identical(cmInv3.1, cmInv3.2)))
# message(paste("Comparing 1.1 & 1.4 (expect FALSE) ==> ", identical(cmInv1.1,cmInv1.4)))