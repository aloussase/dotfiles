options(
  rsthemes.theme_light = "Material Lighter {rsthemes}",
  rsthemes.theme_dark = "Material Darker {rsthemes}",
  rsthemes.theme_favorite = "Material Darker {rsthemes}"
)

if (interactive()) {
  setHook("rstudio.sessionInit", function(newSession) {
    if (newSession) {
      if (requireNamespace("rsthemes", quietly = TRUE)) {
        rsthemes::use_theme_dark()
      }
    }
  }, action = "append")
}
