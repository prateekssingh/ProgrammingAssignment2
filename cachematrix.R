## This is part of R Programming Programming Assignment 2
## Objective: Matrix inversion is a costly operation and there are benefits in
## caching the inverse of the matrix rather than computing it repeatedly. As part
## of this assignment, the below two functions will calculate and cache the inverse
## of a matrix to avoid re-computation.


## This function creates a special "matrix" object that can cache its inverse
## Input: Any 1 object of Matrix class. The function assumes that matrix passed
## can be inverted.
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
## makeCacheMatrix above. If the inverse has already been calculated 
## (and the matrix has not changed), then cacheSolve retrieves the inverse from 
## the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
