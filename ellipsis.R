#how to use ellipsis


# ellipsis is a box that carries non specified arguments. 
rm(list=ls())
library(glue)



#simplest case 
foo1 <- function(ls){

  n = length(ls)

  return(n)

}

foo2 <- function(...){

  n = foo1(...)
  message(glue("the list contains {n} names!"))


}


foo2(list(name1="simon", name2="emile"))



foo1 <- function(...){

  n = length(ls)

  return(n)

}


foo2 <- function(...){


  return(city %in% cities)

}



foo3 <- function(...){

  names = foo1(...)
  message(glue("there are {names} first names!"))

  # is = foo2(...)
  # ifelse(is, message(glue("{city} is in cities list!")), "wrong!")

}


foo3(ls=list(name1="simon", name2="emile"), cities=c("paris", "london"),city="paris")




#works 


foo2 = function(...) {
    kwargs = list(...)
    n = foo1(kwargs$l1)
message(glue("the list contains {n} names!"))
message(glue('and here is the second argument: {kwargs$l2}'))
}
foo2(l1=list('simon', 'emile'), l2='rae')