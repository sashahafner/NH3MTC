# Equilibrium NH3 calcs

temp.k <- d$air.temp + 273.15
R <- 0.000082057

# Molal TAN concentration
m.tan <- d$c.TAN/14.0067/(1 - d$DM/100)

# Ionic strength (set to TAN concentration)
mu <- m.tan

# Deby-Huckel constants
a <- 0.5
b <- 0.3

# Charge on NH4+
z <- 1

# Activity coefficients, equilibrium constant, Henry's law constant (m3/kg)
g.NH4 <- 10^(-a*z^2*sqrt(mu)/(1 + b*2.5*sqrt(mu)))
k.NH4 = 10^(0.0905 + 2729.31/temp.k)
h.NH3 <- R*temp.k*10^(-3.51645 -0.0013637*temp.k + 1701.35/temp.k)

# Free NH3 (mol/kgw) and equilibrium gas-phase NH3 (mol/m3)
m.NH3 <- g.NH4*m.tan/(k.NH4*10^(-d$pH) + g.NH4)
cg.NH3 <- m.NH3/h.NH3

# Free NH3 (g/kgw)
d$cNH3 <- 14.0067*m.NH3

# Equilibrium NH3 (g) (g/m3)
d$cNH3.g <- 14.0067*cg.NH3


