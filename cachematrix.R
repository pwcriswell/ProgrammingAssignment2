## Two functions to create special "matrix" that can cache its inverse, then
## another to compute the inverse.  If the inverse was already calculated
## then the second function should retrieve the inverse from the cache.

## makeCacheMatrix creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL  ##inv is the inverse of the matrix, set to NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        list(set = set, get = get)
}


## cacheSolve computes the inverse of the special "matrix from the above function
## If the inverse has already been computed, retrieves the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)  ## Check to see if not NULL, then pull inv
        }
        data <- x$get()
        inv <- solve(data, ...) ## Otherwise compute inverse matrix
}