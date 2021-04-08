
ggplot(dl, aes(tc, log10(tcn), fill = tc)) +
  geom_boxplot() +
  facet_wrap(~ interaction(stor.type1, source), scale = 'free') +
  labs(x = 'MTC type', y = 'MTC') +
  theme(legend.position = 'none')
ggsave('../plots/log_box.png', height = 4, width = 6)

ggplot(dl, aes(tc, tcn, fill = tc)) +
  geom_boxplot() +
  facet_wrap(~ interaction(stor.type1, source), scale = 'free') +
  labs(x = 'MTC type', y = 'MTC') +
  theme(legend.position = 'none')
ggsave('../plots/box.png', height = 4, width = 6)

dd <- subset(d, !grepl('Ammonium', source))
ggplot(dd, aes(source, flux/24, fill = source)) +
  geom_boxplot() +
  scale_y_continuous(trans = 'log10') +
  facet_wrap(~ stor.type1, scale = 'free') +
  labs(x = 'Source', y = 'Flux (g/m2-h)') +
  theme(legend.position = 'none')
ggsave('../plots/flux_box.png', height = 4, width = 6)

ggplot(dl, aes(sample = tcn, colour = tc)) +
  geom_qq() +
  stat_qq_line() +
  facet_wrap(~ interaction(stor.type1, source), scale = 'free') 
ggsave('../plots/qqnorm.png', height = 4, width = 6)

ggplot(dl, aes(sample = log10(tcn), colour = tc)) +
  geom_qq() +
  stat_qq_line() +
  facet_wrap(~ interaction(stor.type1, source), scale = 'free') 
ggsave('../plots/qqlognorm.png', height = 4, width = 6)

