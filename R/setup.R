# setup.R ----------------------------------------------------------------
# Shared setup sourced by both analysis notebooks.
# Loads packages, sets survey options, and defines project-wide constants
# so that the two .qmd files stay consistent with each other.

# --- Packages both notebooks rely on ------------------------------------
library(here)        # build paths relative to the project root
library(readr)
library(tidyverse)   # dplyr, ggplot2, tidyr, stringr, tibble, purrr, forcats
library(survey)      # svrepdesign(), svymean(), svyglm(), svyby()
library(knitr)
library(kableExtra)
library(scales)

# --- Packages only used for specific/optional analyses ------------------
# The original ATUS notebook also loaded car, faraway, lmtest,
# randomForest, Metrics, and bookdown. None of them are used in the code
# as written, so they are left commented out to keep runs fast. Uncomment
# any you actually need.
# library(car)
# library(lmtest)
# library(randomForest)
# library(Metrics)

# --- Survey variance options --------------------------------------------
# Controls how the survey package handles a stratum with a single PSU.
# Matters only for Taylor-linearization designs (svydesign); the replicate-
# weight designs used here get their variance from the replicate weights,
# but this is set as a safe default in case a svydesign object is added.
options(survey.lonely.psu = "adjust", scipen = 999)

# --- Analysis constants (single source of truth) ------------------------
# BLS Occupational Employment & Wage Statistics, 2024 national mean hourly
# wages (https://data.bls.gov/oesprofile/). Used to value unpaid childcare.
BLS_WAGE_CHILDCARE_WORKER <- 15.93  # OCC 39-9011  Childcare workers
BLS_WAGE_PRESCHOOL_K      <- 22.44  # OCC 25-2010  Preschool & kindergarten teachers
BLS_WAGE_HOME_HEALTH_AIDE <- 16.32  # OCC 31-1120  Home health & personal care aides

# -----Race/Ethnicity Color Code
# ---- Shared race/ethnicity order and colors (used in all figures) ----
race_levels <- c("White", "Black", "Hispanic",
                 "Asian/Pacific Islander", "Native American",
                 "Other/Multiracial")

race_palette <- c(
  "White"                  = "#2E3F50",
  "Black"                  = "#0E7C6B",
  "Hispanic"               = "#E69F00",
  "Asian/Pacific Islander" = "#56B4E9",
  "Native American"        = "#CC79A7",
  "Other/Multiracial"      = "#A0A7AD"
)
