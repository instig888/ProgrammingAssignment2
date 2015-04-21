## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
## The below are functional test cases.  Uncomment and run to verify
## and understand the execution of the above functions.
## ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
message("Cache Matrix Library ==> Test Cases")
## Script to test my cache matrix inverse methods
message("Creating cached matrix 1 ==> 4,3,3,2")
cacheMatrix1 <- makeCacheMatrix(matrix(c(4,3,3,2), nrow=2, ncol=2))
message("Creating cached matrix 2 ==> 12,10,8,14")
cacheMatrix2 <- makeCacheMatrix(matrix(c(12,10,8,14), nrow=2, ncol=2))
message("Creating cached matrix 3 ==> 2,3,3,4")
cacheMatrix3 <- makeCacheMatrix(matrix(c(2,3,3,4), nrow=2, ncol=2))

# Not Cached
message("cache solve cache matrix 1 --> not cached")
cmInv1.1 <- cacheSolve(cacheMatrix1)
# Cached
message("cache solve cache matrix 1 --> should get cached message")
cmInv1.2 <- cacheSolve(cacheMatrix1)
# Not Cached
message("cache solve cache matrix 2 --> not cached")
cmInv2.1 <- cacheSolve(cacheMatrix2)
# Not Cached
message("cache solve cache matrix 3 --> not cached")
cmInv3.1 <- cacheSolve(cacheMatrix3)
# Cached
message("cache solve cache matrix 2 --> should get cached message")
cmInv2.2 <- cacheSolve(cacheMatrix2)
# Cached
message("cache solve cache matrix 1 --> should get cached message")
cmInv1.3 <- cacheSolve(cacheMatrix1)
# Cached
message("cache solve cache matrix 2 --> should get cached message")
cmInv2.3 <- cacheSolve(cacheMatrix2)
# Cached
message("cache solve cache matrix 3 --> should get cached message")
cmInv3.2 <- cacheSolve(cacheMatrix3)
# Reset matrix should remove cache
message("cache solve cache matrix 1 after changing matrix --> not cached")
cacheMatrix1$set(matrix(c(2,7,5,3), nrow=2, ncol=2))
cmInv1.4 <- cacheSolve(cacheMatrix1)

message(paste("Comparing 1.1 & 1.2 (expect TRUE) ==> ", identical(cmInv1.1, cmInv1.2)))
message(paste("Comparing 1.1 & 1.3 (expect TRUE) ==> ", identical(cmInv1.1, cmInv1.3)))
message(paste("Comparing 2.1 & 2.2 (expect TRUE) ==> ", identical(cmInv2.1, cmInv2.2)))
message(paste("Comparing 2.1 & 2.3 (expect TRUE) ==> ", identical(cmInv2.1, cmInv2.3)))
message(paste("Comparing 3.1 & 3.2 (expect TRUE) ==> ", identical(cmInv3.1, cmInv3.2)))
message(paste("Comparing 1.1 & 1.4 (expect FALSE) ==> ", identical(cmInv1.1,cmInv1.4)))