
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
