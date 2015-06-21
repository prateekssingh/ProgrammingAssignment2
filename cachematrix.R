## This is part of R Programming Programming Assignment 2
## Objective: Matrix inversion is a costly operation and there are benefits in
## caching the inverse of the matrix rather than computing it repeatedly. As part
## of this assignment, the below two functions will calculate and cache the inverse
## of a matrix to avoid re-computation.


## This function creates a special "matrix" object that can cache its inverse
## Input: Any 1 object of Matrix class.
## Output: List of 4 functions:
##  set: To set the value of the matrix
##  get: To get the value of the matrix
##  set_inv_mat: To set the value of inverse of the matrix
##  get_inv_mat: To get the value of inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
        # initialize a variable to store the inverse of the matrix
        inv_mat <- NULL
        
        # function to set the value of the matrix
        set = function(y) { 
                x <<- y
                inv_mat <<- NULL
        }
        
        # function to get the value of the matrix
        get = function() x
        
        # function to set the value of inverse of the matrix
        set_inv_mat = function(inverse) inv_mat <<- inverse 
        
        # function to get the value of inverse of the matrix
        get_inv_mat = function() inv_mat
        
        # Return the list with four functions
        list(set=set, get=get, set_inv_mat=set_inv_mat, get_inv_mat=get_inv_mat)

}

## This function computes the inverse of the special "matrix" returned by 
## makeCacheMatrix above. If the inverse has not been calculated yet, the inverse
## is calculated and stored in cache. The next time the inverse of the same matrix
## is requested, then cacheSolve retrieves the inverse of the matrix from the cache.

## Input: List (of 4 functions) returned by makeCacheMatrix.
## cacheSolve assumes that the matrix passed to makeCacheMatrix can always be inverted

cacheSolve <- function(x, ...) {
        # Return a matrix that is the inverse of 'x'
        # 'x' is the matrix passed to makeCacheMatrix
        
        # Call the get_inv_mat function to get the inverse of the matrix
        inv_mat <- x$get_inv_mat()
        
        # if inv_mat is not null, then the matrix's inverse value is already stored
        # in cache. So, return the value from cache and exit the function.
        if(!is.null(inv_mat)) {
                message("Get inverse from Cache")
                return(inv_mat)
        }
        
        # If inv_mat is null, calculate the inverse of the matrix
        message("Calculate inverse and store in Cache")
        data <- x$get()
        inv_mat <- solve(data)
        
        # Store the calculated value in cache and return the value
        x$set_inv_mat(inv_mat)
        inv_mat
}
