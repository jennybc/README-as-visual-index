Do you have directories on GitHub that contain alot of figures, specifically PNGs? Would you like a quick overview of the figures? Like, now?

This repo holds R scripts that show how to automatically generate a visual index as the `README.md` for a figure directory, but here's the only idea:

    ```{r}
    fig_files <- list.files(fig_dir, pattern = "png$")
    readme_file <- file.path(fig_dir, "README.md")
    writeLines(paste0("![`", fig_files, "`](", fig_files, ")"), readme_file)
    ```

List the figures, shove that inside the Markdown inline image syntax, write that to `README.md`.

Certain good habits will pay off:

  * always create a PNG for each figure, even if just to supplement to some other format that is less web-friendly
  * have directories just for figures; don't mix up inputs, outputs, scripts, etc.
  * be systematic with figure file names; don't create regular expression puzzles for yourself

This `README`-generating snippet would be natural to include right after any code that mass produces figures.

A simple, base R example using the `iris` data:

  * the [README / visual index](iris_figs)
  * the [script](using-iris-and-base.R) that did it
  
An example using data from the Lord of the Rings movies and the Hadleyverse:

  * the [README / visual index](lotr_figs)
  * the [script](using-lotr-and-hadleyverse.R) that did it