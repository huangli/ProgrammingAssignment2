## Put comments here that give an overall description of what your
## functions do

## function to cache matrix, get inverse, set inverse matrix
makeCacheMatrix <- function(x = matrix()) {
	#cache value need to empty every time
	m <- NULL
	
	#set the matrix
	set <- function(y) {
		x <<- y
		m <<- NULL
	}
	
	#get matrix
	get <- function() x
	
	#set and get method for inverse matrix
	setinverse <- function(inverse) m <<- inverse
	getinverse <- function() m
	
	
	list(set = set, get = get,
		setinverse = setinverse,
		getinverse = getinverse)
}


## get inverse
cacheSolve <- function(x) {
    ## Return a matrix that is the inverse of 'x'

	#if cached 
	m <- x$getinverse()
    if(!is.null(m)) {
            message("getting cached data")
            return(m)
    }
	#not cached
    data <- x$get()
    m <- solve(data)

	#then cache the matrix
    x$setinverse(m)
    m
}
