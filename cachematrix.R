# Matrix inversion is usually a costly computation 
# and there may be some benefit to caching the inverse 
# of a matrix rather than compute it repeatedly.
# The following two functions are used to cache the inverse of a matrix.

# makeCacheMatrix creates a list containing a function to
# 1. set the value of the matrix
# 2. get the value of the matrix
# 3. set the value of inverse of the matrix
# 4. get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<-y
    inv <<- NULL
  }
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.


# This function assumes that the matrix is always invertible.

cacheSolve <- function(x, ...) {
  inv <- x$getinverse()
  
  #if the inverse of matrix is in cache
      if(!is.null(inv)) {
        # get the inverse of matrix from cache
        message("getting cached data from memory")
        return(inv)
      }
  
  #Calculate the inverse of matrix as it is not in cache.
      data <- x$get()
      inv <- solve(data)
      x$setinverse(inv)
	  # return the inverse of the matrix
      inv
}
