# clean

d[d == 'nd'] <- NA
d$air.temp <- as.numeric(d$air.temp)
d$c.TAN <- as.numeric(d$c.TAN)
d$DM <- as.numeric(d$DM)
d$pH <- as.numeric(d$pH)
d$c.TN <- as.numeric(d$c.TN)
d$DM[is.na(d$DM)] <- 5
d$stor.type1[d$stor.type1 == 'Tank '] <- 'Tank'
d$stor.type1[d$stor.type1 == 'Lagoons'] <- 'Lagoon'

cf <- c(`g NH3 m-2 d-1` = 14/17, `kg NH3 m-2 y-1` = 14/17 * 1000 * 1/365, `g NH3-N m-2 d-1` = 1, 
        `g NH3 m-2 h-1` = 14/17 * 24, `ug NH3-N m-2 min-1` =  1E-6 * 1/(60 * 24),
        `ug m-2 min-1` = 1E-6 * 1/(60 * 24), `kg NH3 ha-1 d-1` = 14/17 * 1000 * 1/10000,
        `ng NH3 cm-2 sec-1` = 1E-9 * 10000, `ug NH3 m-2 s-1` = 1E-6 * 86400,
        `kg NH3-N ha-1 d-1` = 1000 * 1/10000) 

d$cf <- cf[d$units]
d$flux <- d$flux * d$cf


