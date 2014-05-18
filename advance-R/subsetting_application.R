#============== Applications ================#
#Many of these basic techniques are wrapped up into more concise functions 
#subset(), merge(), plyr::arrange()


#==== lookup tanles ( character subsetting)
x <-c("m", "f", "u", "f", "f", "m", "m")
lookup <-c(m ="Male", f ="Female", u =NA)
lookup[x]

unname(lookup[x])

#===== matching & merging by hand ( interger subsetting)
#complicated lookup table which has multiple columns of information
grades <- c(1, 2, 2, 3, 1)
info <-data.frame(  
	grade =3:1,  
	desc =c("Excellent", "Good", "Poor"),  
	fail =c(F, F, T))
# 1. using match() and integer subsetting
id <-match(grades, info$grade)
info[id, ] # get the matched table
# 2.  using rownames() and character subsetting:
rownames(info) <-info$grade
info[as.character(grades), ]


#=========  random samples/bootstrap (integer subsetting)====#
#perform random sampling or bootstrapping of a vector or data frame
#sample() to generate a vector of indices,
df <-data.frame(x =rep(1:3, each =2), y =6:1, z = letters[1:6])
df[sample(nrow(df)), ] #random reorder for all observations
df[sample(nrow(df), 3), ] # smaple 3 rows
df[sample(nrow(df), 10, rep = T), ]

#========= ordering ============#
x <-c("b", "c", "a")
order(x)
x[order(x)]

df2 <-df[sample(nrow(df)), 3:1]
df2[order(df2$x), ] # order by one column
df2[, order(names(df2))] # order by column name

#==== expanding aggregated counts  ====#
df <-data.frame(x =c(2, 4, 1), y =c(9, 11, 6), n =c(3, 5, 1))
rep(1:nrow(df), df$n)
df[rep(1:nrow(df), df$n), ] # make a repeated row

#======== remove columns from data frame =======#
# 1. set individual columns to NULL:
df <-data.frame(x =1:3, y =3:1, z = letters[1:3])
df$z <-NULL
# 2. subset to return only the columns you want:
df <-data.frame(x =1:3, y =3:1, z = letters[1:3])
df[c("x", "y")]

#===== select rows based on conditions (logical subsetting) ====#
mtcars[mtcars$cyl ==4, ]
mtcars[mtcars$cyl ==4 &mtcars$gear ==4, ]
# vector boolean operators:  & and |

(x1 <-1:10 %%2 ==0)
(x2 <-which(x1)) # which() return index number where is true
(y1 <-1:10 %%5 ==0)
(y2 <-which(y1))

intersect(x2, y2)
union(x2, y2)
setdiff(x2, y2)

x1 &y1
x1 |y1
x1 &!y1
xor(x1, y1)










