# Function 1

makeCacheMatrix = function(x = matrix()) {
      	meow <- NULL
       
   # I could not the see the purpose served by set() - and I was able to get the caching to work without set()
   # I commented this function out.
	  #set <- function(y) {
        #        x <<- y
        #        meow <<- NULL
        #}


	#  get() returns the orginal matrix to the calling function. This is used  when the cached inverse is not available.

        	get <- function() x


	#  setInverse() sets value of the meow to the value of its argument aaaaaarghhh and 
	#  pushes meow to the parent environment
	#  We use this to to store the value of the inverse  ( this is done during the first pass)
       
		setInverse <- function(aaaaaarghhh) meow <<- aaaaaarghhh

	# getInverse() return meow to the calling function

        	getInverse <- function() meow

	# This is the output of makeMatrix ( I removed set as I am not using it)

        list( get = get,
             setInverse = setInverse ,
             getInverse = getInverse )
}



#  Function 2
cacheSolve = function(x, ...) {
	# We get the inverse from the environment of x

        	m <- x$getInverse()

      # We check if Inverse is populated

        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }


	# We check if Inverse is not populated
	 if (is.null(m)){
	  message("No Cache Available ..Computing Inverse")
        	# we retrieve the value of the original matrix
		data <- x$get()
        	m <- solve(data, ...)
		# we compute the inverse and cache it using setInverse()
        	x$setInverse(m)
        }

	# We display value of m

        m
}

