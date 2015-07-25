## Using two functions to cache the inverse of a matrix

##this function returns a list of functions:get, set, setInverse, getInverse
##get- returns the matrix stored in x 
##set(y)- sets the matrix stored in x to be equal to matrix y and sets variable inverse to NULL
##bc it needs to be recomputed
##setInverse(inv)- doesn't calculate the inverse, simply stores the value of input varible inv in variable
## inverse
##getInverse()- simply returns the value stores in variable inverse
makeCacheMatrix <- function(x = matrix()) {
      inverse <-NULL #variable that stores the inverse of matrix
      set <- function(y){ #sets the stored matrix to be y
            x <<- y #need <<- bc <- would only set x to y in the set funct, not the main makeCacehMatrix funct
            inverse <- NULL #haven't calcualted inverse yet
      }
      
      get <- function(){ 
            x 
      }
      setInverse <- function(inv){
            inverse <<- inv
      }
      getInverse <- function(){
            inverse
      }
      list(set= set, get = get, setInverse = setInverse, getInverse = getInverse)
      #need list() so that makeCacheMatrix retuns a list w these 4 functs, so then when we
      #assign makeCacheMatrix to an object, it will be a list w all 4 functs
      
}#end makeCacheMatrix


##input is the object where makeCacheMatrix is stored
##first it checks the value of inverse in makeCacheMatrix using getInverse()
##if inverse is not NULL, it simply returns the value of inverse 
##else, it gets the vector currently stored in makeCacheMatrix using get(),
##calculates the inverse of the matrix with solve()
##sets the inverse variable to be this newly calculated inverse w the funct setInverse()

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      inverse <- x$getInverse()
      if(!is.null(inverse)){ #verifying the inverse isn't null and exists in memory
            message("getting cached data")
            return(inverse)
      }
      matrix <- x$get()
      inverse <- solve(matrix)
      x$setInverse(inverse)
      inverse
}#end cacheSolve
