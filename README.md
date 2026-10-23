# webr_calculator_demo

Demos for making the webR calculator buttons load faster in Chapter 10 of the book [Trustworthiness Assessment and Forensic Meta-Science]
(https://trustworthyresear.ch/chapters/10_recalculation_methods.html)

There are 3 versions of the same calculator buttons:
1. **Baseline**: shown as they are now
2. **Version A**: installs only the R packages that each calculator button needs, excluding the ones that are never used
3. **Version B**: Version A + prepares R packages at the background when a user scrolls nearby the calculator button
