library(dplyr)
library(ggplot2)
library(jpeg)

df_grid = expand.grid(lat = seq(90, -89), lon = seq(-180, 179))

# Topography
df <- read.csv("data/SRTM_RAMP2_TOPO_2000-02-11_rgb_360x180.CSV", header = FALSE)

df[df == 99999] <- -0.1
df <- df + 0.1
df_grid$height_raw <- unlist(df)
df_grid$height <- df_grid$height_raw / max(df_grid$height)

df_grid %>%
  ggplot(aes(x = lon, y = lat, fill = height)) +
  geom_tile() +
  theme_bw()

# Blue marbel
data_marbel <- readJPEG("data/BlueMarbel_RenderData.jpg", native = FALSE)

df_grid$r <- c(data_marbel[, , 1])
df_grid$g <- c(data_marbel[, , 2])
df_grid$b <- c(data_marbel[, , 3])
df_grid$color_marbel <- rgb(df_grid$r, df_grid$g, df_grid$b)

df_grid %>%
  ggplot(aes(x = lon, y = lat)) +
  geom_tile(aes(fill = color_marbel)) +
  scale_fill_identity() +
  theme_bw() +
  theme(legend.position = "none")

df_out <- df_grid %>%
  select(lat, lon, height, r, g, b) %>%
  arrange(desc(lat), lon)
  
#write.table(df_out, file = "data/globe_data.csv", sep = ";",
#            quote = FALSE, row.names = FALSE) 
