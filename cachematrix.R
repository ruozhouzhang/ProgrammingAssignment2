## Put comments here that give an overall description of what your
## functions do(


## the fucntion creates a special ¡±Matrix¡° object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        n <- NULL
        
        set <- function(y){
                x <<- y
                n <<- NULL
        }
        
        get <- function() x
        set_mean <- function(mean) n <<- mean
        get_mean <- function() n
        
        list(set = set, get = get, set_mean = set_mean, get_mean = get_mean)
        
}


## This function computes the inverse of the special "matrix" returned by the above function. And 
## if the inverse has already been calculated (and the matrix has not changed), then this function 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        n <- x$get_mean()
        
        if(!is.null(n)){
                message("processing cached data")
                return(n)
        }
        data <- x$get()
        
        n<-mean(data, ...)
        x$set_mean(n)
        
        n
        ## Return a matrix that is the inverse of 'x'
}
