library(ggplot2)
ls = 1:140

#Parameters for sin functions
u = 4.884
b = (u-0)/140
r = (u-0)/140
a = 3.5
t = 0
w = (u-0)/140

#Finding Blue X Values
list_b = 
  function(ARGUMENT) {
    VALUE = b * ls
    return(VALUE)
  }
blue_x = list_b(b)

#Finding Red X Values
list_r = 
  function(ARGUMENT) {
    VALUE = r * ls
    return(VALUE)
  }
red_x = list_r(r)


#Finding Blue Y Values
blue = 
  function(ARGUMENT) {
    VALUE = sin(a * list_b(b) + t) + 1.125
    return(VALUE)
  }
blue_y = blue(list_b(b))

#Finding Red Y Values
red = 
  function(ARGUMENT) {
    VALUE2 = sin(a * list_r(r) + t) + 1
    return(VALUE2)
  }
red_y = red(list_r(r))

#Finding Stopping Values

#Finding Blue Stopping X Values
blue_stoppers_x = 
  function(ARGUMENT) {
    VALUE = w * seq(6,140,6)
    return(VALUE)
  }
blue_stop_x = blue_stoppers_x(w)

#Finding Blue Stopper Y Values
blue_stoppers_y = 
  function(ARGUMENT) {
    VALUE = sin(a * blue_stoppers_x(w) + t) + 1.125
    return(VALUE)
  }
blue_stop_y = blue_stoppers_y(blue_stoppers_x(w))

#Finding Red Stopping X Values
red_stoppers_x = 
  function(ARGUMENT) {
    VALUE = w * seq(6,140,6)
    return(VALUE)
  }
red_stop_x = red_stoppers_x(w)

#Finding Red Stopper Y Values
red_stoppers_y = 
  function(ARGUMENT) {
    VALUE = sin(a * red_stoppers_x(w) + t) + 1
    return(VALUE)
  }
red_stop_y = red_stoppers_y(red_stoppers_x(w))

#Old Data Frames

# names(wd)[1] = "input"
# names(wd)[2] = "output"
# names(wd)[3] = "col_input"
# 
# data = data.frame(blue_x,red_x,blue_y,red_y)
# df = cbind(stack(data[1:2]), stack(data[3:4]))
# names(df)[1] = "input"
# names(df)[2] = "col_input"
# names(df)[3] = "output"
# names(df)[4] = "col_output"
# df

vec_w = c("white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white","white")

#New Data Frames
stp_blue = data.frame(blue_stop_x,blue_stop_y)
wd = data.frame(red_stop_x,red_stop_y)
blue_data = data.frame(blue_x,blue_y)
red_data = data.frame(red_x,red_y)

#Parameters for 
s = 1.25
alph_line = 0.5
alph_point = 5

ggplot() + 
  # geom_point(size = 1.5, alpha = 20, color='black') +
  #Make new data frames of red and blue and white data
  #try and make individual lines of geom_point and geom_line 
  #specify data of what has what color and size
  # geom_line(size = 1.5, alpha = 0.5) + 
  geom_point(data = blue_data, aes(x=blue_x,y=blue_y), color = "blue", size = s, alpha = alph_point) +
  geom_point(data = red_data, aes(x=red_x,y=red_y), color = "red", size = s, alpha = alph_point) +
  geom_line(data = blue_data, aes(x=blue_x,y=blue_y), color = "blue", size = s, alpha = alph_line) +
  geom_line(data = red_data, aes(x=red_x,y=red_y), color = "red", size = s, alpha = alph_line) +
  geom_point(data = wd, aes(x=red_stop_x,y=red_stop_y), color = "white", size = s, alpha = 5) +
  geom_point(data = stp_blue, aes(x=blue_stop_x,y=blue_stop_y), color = "white", size = s, alpha = 5)

