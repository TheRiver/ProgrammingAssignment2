## Put comments here that give an overall description of what your
## functions do

## This function takes and returns a list. This list 
## provides access to the matrix, as well as to a cached
## copy of the matrix's inverse.

makeCacheMatrix <- function(x = matrix()) {
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


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
