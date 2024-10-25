# Install necessary packages
install.packages("meta")

# Load the meta package
library(meta)

# Input research data
data <- data.frame(
  Study = c("Ryu et al. (2015)", "Gutierrez-Grobe et al. (2010)", "Chung et al. (2015)", 
            "Moon et al. (2013)", "Hamaguchi et al. (2012)", "Chen et al. (2019)", 
            "Cherubini et al. (2023)"),
  OR = c(1.87, 1.67, 1.89, 2.73, 2.53, 1.28, 1.87),  # Odds Ratio
  lower_CI = c(1.23, 1.01, 1.10, 1.92, 1.92, 1.04, 1.04),  # Lower bound of confidence interval
  upper_CI = c(2.85, 2.78, 3.37, 3.87, 3.87, 1.58, 1.58)   # Upper bound of confidence interval
)

# Conduct meta-analysis
meta_analysis <- metagen(TE = OR, lower = lower_CI, upper = upper_CI, 
                         studlab = Study, sm = "OR", data = data)

# Create forest plot
forest(meta_analysis, 
       xlab = "Odds Ratio (OR)", 
       leftlabs = c("Study", "Odds Ratio", "95% CI"), 
       rightlabs = c("Weight", "Random Effects Model"),
       print.I2 = TRUE, print.pval = TRUE)



## Meta-analysis for gender differences in HCC incidence
# Install necessary packages
# install.packages("meta")

# Load the meta package
library(meta)

# Define updated data for HCC risk in men and women from various studies, with correction in Kanwal et al. (2018)
data <- data.frame(
  Study = c("Chen et al. (2020)", "Ladenheim et al. (2016)", "Liou et al. (2023)"),
  HR_Men = c(3.71, 1.01, 1.06),  # Corrected Hazard Ratio for men from Kanwal et al.
  lower_CI_Men = c(2.01, 0.82, 0.99),  # Corrected lower bound of 95% CI for men from Kanwal et al.
  upper_CI_Men = c(6.86, 1.24, 1.14),  # Corrected upper bound of 95% CI for men from Kanwal et al.
  HR_Women = c(1.47, 1.01, 1.06),  # Hazard Ratio for women
  lower_CI_Women = c(0.65, 0.82, 0.99),  # Corrected lower bound of 95% CI for women from Kanwal et al.
  upper_CI_Women = c(3.34, 1.24, 1.14)   # Corrected upper bound of 95% CI for women from Kanwal et al.
)

# Perform meta-analysis for men
meta_men <- metagen(TE = HR_Men, lower = lower_CI_Men, upper = upper_CI_Men, studlab = Study, sm = "HR", data = data)
forest(meta_men, xlab = "Hazard Ratio (Men)", print.I2 = TRUE)

# Perform meta-analysis for women
meta_women <- metagen(TE = HR_Women, lower = lower_CI_Women, upper = upper_CI_Women, studlab = Study, sm = "HR", data = data)
forest(meta_women, xlab = "Hazard Ratio (Women)", print.I2 = TRUE)
