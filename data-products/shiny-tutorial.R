library(manipulate)
manipulate(plot(1:x), x = slider(1, 100))

manipulate(
  qqnorm(rnorm(x)), x = slider(100,1000)
  )
