## This functions calculate inverse matrix and save it to cache


## This function containes utility functiuons for next function 

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    set_inverse <- function(inv) m <<- inv
    get_inverse <- function() m
    list(set = set, get = get,
         set_inverse = set_inverse,
         get_inverse = get_inverse)
}

## This function calculates inverse matrix and saves it to cache if cache is empty

cacheSolve <- function(x, ...) {
    m <- x$get_inverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$set_inverse(m)
    m    
}
