
dsumm <- as.data.frame(summarise(group_by(dl, stor.type1, source, tc), n = length(value), 
                                 md = median(value),
                                 mn = mean(value), s = sd(value), rsd = 100 * sd(value)/mean(value),
                                 lmn = mean(log10(value)), lsd = sd(log10(value))
                                 ))
dsumm <- rounddf(dsumm, func = signif, digits = 3)

dsumm$tc <- gsub('^tc', '', dsumm$tc)
names(dsumm) <- c('Storage type', 'Manure type', 'MTC type', 'n', 'Median', 'Mean', 'Std. dev.', 'CV', 'Log mean', 'Log std. dev.')
