#score area
x0R = 189
x1R = 192.3
x0L = 7.7
x1L = 11
y0R = y0L = 39.5
y1R = y1L = 45.5

#dat$y_coord_ft <= y1R & dat$y_coord_ft >= y0R & dat$x_coord_ft <= x1R & dat$x_coord_ft >= x0R

dat$isScore = FALSE
dat$isScore[dat$y_coord_ft <= y1R & dat$y_coord_ft >= y0R & dat$x_coord_ft <= x1R & dat$x_coord_ft >= x0R] = TRUE

#unsucessful shot area
x0RU = 200-11-6.6-2.5
x1RU = 200-11
y0RU = y0LU = 85/2-4-1
y1RU = y1LU = 85/2+4+1

#dat$y_coord_ft <= y1RU & dat$y_coord_ft >= y0RU & dat$x_coord_ft >= x0RU & dat$x_coord_ft <= x1RU

dat$isMissedShot = FALSE
dat$isMissedShot[dat$y_coord_ft <= y1RU & dat$y_coord_ft >= y0RU & dat$x_coord_ft >= x0RU & dat$x_coord_ft <= x1RU] = TRUE

#rows previous to sucessful and missed shots are shots taken
dat$isShot = FALSE
dat$isShot[which(dat$isScore | dat$isMissedShot)-1] = TRUE