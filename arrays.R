#understanding matrices and arrays
#R essential object is vector. Sequence of data of same type. 
#matrix is vector in 2D
#array is vector in any dimension. 


#vector  
	data = c(1,2,3,4)
	names(data) = c('1', '2', '3', '4')

#matrices
	nrow=2
	ncol=2
	byrow=FALSE
	dimnames=NULL
	matrix(data, nrow, ncol, byrow, dimnames)

	#think of it as a snake carrying your elements 1,2,3,4.
	#the snake was going through columns. Want it to go through rows?
	byrow=TRUE
	matrix(data, nrow, ncol, byrow, dimnames)
	#:) 

	#now that's a small matrix. Want to add stuff? 
	data = c(data, 5,6)
	matrix(data, nrow, ncol, byrow, dimnames)
	# it doesn't contain my new stuff :( 
	# because your matrix is 2*2, can contain only 4 elements !
	# expand your matrix :) say you want one more column.

	ncol = 3 
	matrix(data, nrow, ncol, byrow, dimnames)
	#:) beautiful. 


	#without names it's non humane....
	#dimnames contains the names of each element in each dimension. 
	# a matrix is 2D. So you need two sets of names. 
	# names for rows = as many as number of rows. same for cols.
	#let's keep it simple : our names will simply be the row and col numbers. 
	dimnames = list(as.character(seq(1:nrow)),as.character(seq(1:ncol)))
	matrix(data, nrow, ncol, byrow, dimnames)
	#you can also use matrix-specific command : colnames, rownames

	#you want better names right.... what about, years in rows, countries in columns ? 
	dimnames = list(c('2010', '2020'),c('France', 'South Korea', 'Greece'))
	m = matrix(data, nrow, ncol, byrow, dimnames)
	m
	#beautifully named matrix:)


	#I am a primary school kid and want to perform sth like 1+2+3. How do I do that? 
	rowSums(m)
	colSums(m)

	#How do I access France's value in 2010?
	m['2010', 'France']
	m[1,1]


#arrays
	#now, you noticed you don't know what the above values are....
	#let's say this is gdp per capita. 
	gdp = c(40000, 30000, 25000, NA, NA,NA)
	gdp = matrix(gdp, nrow, ncol, byrow, dimnames)
	#how do you show this is GPD per capita? You can make a 3D array out of your matrix. 
	#the third dimension is the variable
	array(gdp,dim=c(2,3,1), dimnames=c(dimnames(m), list('GDP per capita')))

	#you could have another variable as well, population. 
	pop = c(60, 48, 11, NA, NA, NA)
	pop = matrix(pop, nrow, ncol, byrow, dimnames)
	a = array(c(gdp, pop), dim=c(2,3,2), dimnames=c(dimnames(m), list(c('GDP per capita', 'population in million'))))
	a 
	#beautiful array !
	#how do you analyze  ?
	list(dim(a),dimnames(a))
	a[,,'GDP per capita']
	a['2010',,]
	a[,'France',]
	#beautiful !

	b = array(c(gdp, pop), dim=c(2,3,2), dimnames=c(list(c('2040', '2050'),c('France', 'South Korea', 'Greece')), list(c('GDP per capita', 'population in million'))))
  
  	#how do you subset ?
  	#this is a **** pain. 
  	#Why do people even use arrays??
  	#make a **** list of data tables or data frames for god's sake.
  	#I use narray. A mysterious package with 0 documentation. 
	#how nice : this complicated line TO DROP NAS......
  	narray::map(X=a, along=1,FUN=function(x) x[!is.na(x)], drop=F)

  	# in data table it would be 
  	sapply(X=datas, FUN=function(x) x[!is.na()])

  	narray::filter(X=a,along=2, FUN=is.na())


  	#how do you bind ? 
  	#using abind()
  	abind(a,b)

  	#using narray 
  	narray:::stack(a,b)

	#nice thing with narray:::stack is that it automatically creates a new dimension  
	#hence nice trick : 
	narray:::stack(a)
	#pretty nice in if you're appending arrays over a vector. 


	b = narray:::stack(a)
	c = narray:::stack(a)
	bc = abind(c,d)
	d = narray:::stack(a)

	bcd = abind(bc,d)

	dimnames(bcd)[[length(dim(bcd))]] <- as.character(paste(seq(1:dim(bcd)[length(dim(bcd))])))
