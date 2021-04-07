# Mass transfer coefficients

d$tc0 <- d$flux
d$tca <- d$flux / d$c.TN
d$tcb <- d$flux / d$c.TAN
d$tcc <- d$flux / d$cNH3
d$tcd <- d$flux / d$cNH3.mpH
d$tce <- d$flux / d$cNH3.g
d$tcf <- d$flux / d$cNH3.g.mpH

d <- subset(d, !is.na(d$tc0 + d$tca + d$tcb + d$tcc + d$tcd + d$tce + d$tcf))
d <- subset(d, source %in% c('Cattle', 'Pig'))

# Make long
dl <- melt(d, measure.vars = c('tc0', 'tca', 'tcb', 'tcc', 'tcd', 'tce', 'tcf'), variable.name = 'tc')
dl$tc <- gsub('^tc', '', dl$tc)

# Normalize
dl <- as.data.frame(mutate(group_by(dl, source, stor.type1, tc), tcn = value/median(value, na.rm = TRUE)))
