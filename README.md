Do you have directories on GitHub that contain alot of figures, specifically PNGs? Would you like to see all the figures at once? Like, now?

This repo holds R scripts that show how to automatically generate a visual index as the `README.md` for a figure directory, but the idea is very simple:

    ```{r}
    fig_files <- list.files(fig_dir, pattern = "png$")
    readme_file <- file.path(fig_dir, "README.md")
    writeLines(paste0("![`", fig_files, "`](", fig_files, ")"), readme_file)
    ```

This snippet would be natural to include right after some code that mass produces figures.

A simple, base R example using the `iris` data:

  * the [README / visual index](iris_figs)
  * the [script](using-iris-and-base.R) that did it
  
An example using data from the Lord of the Rings movies and the Hadleyverse:

  * the [README / visual index](lotr_figs)
  * the [script](using-lotr-and-hadleyverse.R) that did it