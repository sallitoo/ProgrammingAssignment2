## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	##makeCacheMatrix is a function that will return a list of functions.
	##It will store a matrix and a cached value of the inverse of the matrix.
	##It holds the cached value or NULL if nothing is cached.
	inv <- NULL
	##store a matrix
	set <- function(y){
		x <<- y
		inv <<- NULL
	}
	##returns the stored matrix
	get <- function() {x}
	setInverse <- function (inverse) {inv <<- inverse}
	getInverse <- function() {inv}
	list(set=set, get=get,setInverse=setInverse, getInverse=getInverse)
	##returns a list. Each named element is a function
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	inv <- x$getInverse()
	##if a cached value exists return it
	if(!is.null(inv)){
		message("getting cached data")
		return(inv)
	}
	##otherwise, get the matrix, calculate the inverse and store it in the cache
	mat <- x$get()
	inv <- solve(mat,...)
	x$setInverse(inv)
	inv
}
