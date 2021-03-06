## Put comments here that give an overall description of what your
## functions do

##These two functions are dependent in a way that first you use the makeCacheMatrix to create a matrix object that can
##cache its inverse. THen running the second function(cacheSolve) you compute the inverse of the "matrix" generated by 
##the first function.If that inverse has been calculated then the cached inverse is retrieved, otherwise it calculates it
##and returns it. 


## Write a short comment describing this function
## This function creates an object(a "matrix") that can cache it's inverse.
makeCacheMatrix <- function(m = matrix()) {
    inv <- NULL
    set <- function(y){
        m <<- y
        inv <<- NULL
    }
    get <- function() m
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    list(set= set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
    }


## Write a short comment describing this function
##This function checks if my matrix's inverse has already been calculated and if it is returns it, if not it computes
##it via the solve() function and then returns it
cacheSolve <- function(m, ...) {
    inv <- m$getinverse()
    if (!is.null(inv)){
        message("getting cached data")
        return(inv)
    }
    data <- m$get()
    inv <- solve(data, ...)
    m$setinverse(inv)
    inv                ## Return a matrix that is the inverse of 'm'
}
       

