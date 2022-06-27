library(ggplot2)
pi = 3.1415926535
ls = 1:120

u = (5*pi)/2
b = (u-0)/120
r = (u-0)/120
a = 1.5
t = 0
list_b = 
  function(ARGUMENT) {
    VALUE = b * ls
    return(VALUE)
  }
blue_x = list_b(b)

list_r = 
  function(ARGUMENT) {
    VALUE = r * ls
    return(VALUE)
  }
red_x = list_r(r)



blue = 
  function(ARGUMENT) {
    VALUE = sin(a * list_b(b) + t) + 0.25
    return(VALUE)
  }
blue_y = blue(list_b(b))


red = 
  function(ARGUMENT) {
    VALUE2 = sin(a * list_r(r) + t)
    return(VALUE2)
  }
red_y = red(list_r(r))

data = data.frame(blue_x,red_x,blue_y,red_y)
df = cbind(stack(data[1:2]), stack(data[3:4]))
names(df)[1] = "input"
names(df)[2] = "col_input"
names(df)[3] = "output"
names(df)[4] = "col_output"
df

ggplot(data = df, aes(input, output, color=col_input)) + 
  geom_point(size = .5)

