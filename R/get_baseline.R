# Builds baseline.qmd from the {ojs} code cells of Chapter 10
# from Ian Hussey's book "Trustworthiness Assessment"

commit <- "e754f2bd00fde28191b08ae294978f54bebdef50"

url <- paste0(
  "https://raw.githubusercontent.com/ianhussey/",
  "trustworthiness-assessment-and-forensic-meta-science/",
  commit, "/chapters/10_recalculation_methods.qmd"
)

lines <- readLines(url, encoding = "UTF-8", warn = FALSE)

starts <- which(lines == "```{ojs}") # starts at 62
fences <- which(lines == "```") # starts at 6

# reset out firstly
out <- c(
  "---",
  'title: "Baseline"',
  "---",
  "",
  "The chapter 10 calculators as they are now: the `{ojs}` code cells of",
  "[chapter 10](https://trustworthyresear.ch/chapters/10_recalculation_methods.html)",
  "of Ian Hussey's book (code: MIT licence), copied unchanged by `R/get_baseline.R`",
  paste0("from commit `", substr(commit, 1, 7), "` of the `dev` branch."),
  ""
)

# add in all the 22 cell blocks
last_heading <- ""
for (s in starts) {
  e <- fences[fences > s][1]
  above <- lines[1:s]
  heading <- tail(above[grepl("^#{2,4} ", above)], 1)
  if (heading != last_heading) {
    out <- c(out, heading, "")
    last_heading <- heading
  }
  out <- c(out, lines[s:e], "")
}

# replace current baseline.qmd
writeLines(out, "baseline.qmd")