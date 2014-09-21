## makeCacheMatrix returns a collection of closures in a list that control
## access to matrix data and its inverse. cacheSolve uses these closures to calculate
## the inverse of the matrix, and to cache this inverse. 

## This function takes and returns a list. This list 
## provides access to the matrix, as well as to a cached
## copy of the matrix's inverse. This can be called like so:
##
## makeCacheMatrix(matrix(rnorm(3 * 3), 3, 3))
makeCacheMatrix <- function(x = matrix()) {
    ## This variable caches the inverse
    i <- NULL
    
    set <- function(m) {
        x <<- m
        i <<- NULL
    }
    
    get <- function() x
    
    setinverse <- function(inverse) i <<- inverse
    getinverse <- function() i
    
    list(set = set, get = get, setinverse = setinverse, getinverse=getinverse)
}


## This will return the inverse of a matrix. If the inverse has already been
## calculated, the cached result is returned. Otherwise it calculates and caches
## the inverse.
##
## If m is an object created using makeCacheMatrix, then this function
## can be called like so
##
## cacheSolve(m)

cacheSolve <- function(x, ...) {        
    ## See if we already have an inverse calculated
    i <- x$getinverse()
    if (!is.null(i)) {
        message("Returning cached inverse")
        return (i)
    }
    
    ## Here we calculate and cache the inverse
    i <- solve(x$get(), ...)
    x$setinverse(i)
    i    
}
