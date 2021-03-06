## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

####################################################################################
makeCacheMatrix <- function(x = matrix()){
      inv <- NULL
      set <- function(y){
            x <<- y
            inv <<- NULL
      }
      get <- function() {x}
      setInverse <- function(inverse) {inv <<- inverse}
      getInverse <- function() {inv}
      list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}
######################################################################################
cacheSolve <- function(x, ...){
      inv <- x$getInverse()
      if(!is.null(inv)){
            message("getting cached data")
            return(inv)
      }
      mat <- x$get()
      inv <- solve(mat, ...)
      x$setInverse(inv)
      inv
}
######################################################################################
# Test
# x <- makeCacheMatrix(matrix(1:25, nrow=5, ncol=5))
# x$get()
# x$getInverse()                     
# # MAtrix has not been cached
# y <- makeCacheMatrix(matrix(1:4, nrow = 2, ncol=2))
# y$get()
# cacheSolve(y)
