# The following functions create a matrix object that can cache its inverse. 
# Example usage: 
#   x <- makeCacheMatrix(matrix(1:4,2,2))
#   cacheSolve(x)
#   cacheSolve(x)


# makeCacheMatrix will create a matrix object that holds the value of a
# matrix and its inverse. It has methods to get & set the matrix and the
# inverse of that matrix
#
# Input: my_matrix (a matrix)
# Output: a list with functions to get & set 
# the matrix and inverse of the matrix my_matrix

makeCacheMatrix <- function(my_matrix = matrix()) {
    # variable to hold the matrix inverse
    matrix_inverse <- NULL 
    
    set <-function(user_matrix){
          # Set the value of the matrix
          my_matrix <<- user_matrix
          
          # Reset the value of the matrixinverse
          matrix_inverse <<-NULL 
    }
    
    get <- function(){
          # Return the value of the matrix
          my_matrix
    }
    
    setInverse <- function(user_inverse){
          # Set the value of the inverse of the matrix
          matrix_inverse <<- user_inverse
    }
    
    getInverse <- function(){
          # Return the value of the inverse of the matrix
          matrix_inverse
    }
    
    # Return a list of the matrix object:
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
    
}


# Function cacheSolve will calculate the inverse of a matrix created by the
# makeCacheMatrix function. The function will check if the inverse has been
# calculated before. If this is the case, it will return the cached value of the
# inverse. Otherwise, it will calculate the inverse with the solve function, and
# store the result in the cache.

# Input: x (a matrix made with the makeCacheMatrix function)
# Output: the inverse of x

cacheSolve <- function(x) {
    # Get the cached value of the inverse    
    inverted_matrix <- x$getInverse()
    
    # If the inverse is cached, return it
    if(!is.null(inverted_matrix)){
          message("Getting cached data")
          return(inverted_matrix)
    }
    
    # The cache is empty: get the matrix and calculate the inverse
    inverted_matrix <- solve(x$get())
    # Store the inverted matrix in cache
    x$setInverse(inverted_matrix)
    # Return the inverse
    inverted_matrix
}
