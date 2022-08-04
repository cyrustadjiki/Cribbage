blue_start_dots = data.frame(
  x = rep(red_data_clean[1,1], 3) -0.04,
  y = seq(1.04, 0.89, (-0.15)/2)
  )

red_start_dots = data.frame(
  x = rep(red_data_clean[1,1], 3),
  y = seq(1.04, 0.89, (-0.15)/2)
  )

blue_b7_dots = data.frame(
  x = seq(red_data[1,1], blue_data[28,1], 
      (blue_data[28,1]-red_data[1,1])/6),
  y = rep(red_data[1,1], 7) -0.034
  )
  

red_b7_dots = data.frame(
  x = seq(red_data[1,1], blue_data[28,1], 
      (blue_data[28,1]-red_data[1,1])/6),
  y = rep(red_data[1,1], 7) -0.001
  )
