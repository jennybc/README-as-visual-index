## create a directory to hold figures
fig_dir <- "iris_figs"
if(!file.exists(fig_dir)) dir.create(fig_dir)

## for each Species, write scatterplot to file
by(iris, iris$Species, function(x) {
  the_species <- x$Species[1]
  png(file.path(fig_dir, paste0("scatterplot_", the_species , ".png")))
  plot(Sepal.Length ~ Sepal.Width, data = x)
  dev.off()
})

## auto-generate a visual index as README.md in fig_dir
fig_files <- list.files(fig_dir, pattern = "png$")
readme_file <- file.path(fig_dir, "README.md")
writeLines(paste0("![`", fig_files, "`](", fig_files, ")"), readme_file)

