library(plyr)
library(dplyr)
library(ggplot2)

## grab some data on words spoken in LOTR movies
if(!file.exists("lotr_clean.tsv")) {
  library(downloader) # https download YAY!
  lotr_url <- paste0("https://raw.githubusercontent.com/jennybc/",
                     "lotr/master/lotr_clean.tsv")
  download(lotr_url, destfile = "lotr_clean.tsv")
}
lotr_dat <- read.delim("lotr_clean.tsv", stringsAsFactor = FALSE)

## light data prep
lotr_dat <- lotr_dat %>%
  mutate(Film = factor(Film, levels = c("The Fellowship Of The Ring",
                                        "The Two Towers",
                                        "The Return Of The King")),
         Race = reorder(Race, Words, sum))

## create a directory to hold figures
fig_dir <- "lotr_figs"
if(!file.exists(fig_dir)) dir.create(fig_dir)

## for each Film, write stripplot to file
d_ply(lotr_dat, ~ Film, function(z) {
  the_film <- z$Film[1]
  p <- ggplot(z, aes(Race, Words)) + scale_y_log10() + ggtitle(the_film) + 
    geom_jitter(alpha = 1/2, position = position_jitter(width = 0.1))
  print(p)
  the_film  <- gsub(" ", "_", the_film )
  ggsave(file.path(fig_dir, paste0("stripplot_", the_film , ".png")))
})

fig_files <- list.files(fig_dir, pattern = "png$")
readme_file <- file.path(fig_dir, "README.md")
writeLines(paste0("![`", fig_files, "`](", fig_files, ")"), readme_file)

