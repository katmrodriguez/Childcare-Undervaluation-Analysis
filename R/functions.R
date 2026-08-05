# functions.R ------------------------------------------------------------
# Helper functions for survey-weighted summaries, extracted from the
# original ATUS notebook so there is a single definition to maintain.
# All functions expect a survey design object (svrepdesign / subset).

# Sex + race/ethnicity composition for one design ("nh" = non-Hispanic).
get_comp_row <- function(design, group_label, period_label) {
  est <- svymean(
    ~female + white_nh + black_nh + asian_nh + native_nh + hispanic_any
    + other_nh,
    design,
    na.rm = TRUE
  )
  # Keep only the TRUE level of each dummy (femaleTRUE, white_nhTRUE, ...)
  idx_true <- grep("TRUE$", names(est))
  vals <- as.numeric(est[idx_true]) * 100

  data.frame(
    group         = group_label,
    period        = period_label,
    pct_female    = vals[1],
    pct_white_nh  = vals[2],
    pct_black_nh  = vals[3],
    pct_asian_nh  = vals[4],
    pct_native_nh = vals[5],
    pct_hispanic  = vals[6],
    pct_other_nh  = vals[7]
  )
}

# Mean childcare hours plus daily/annual dollar valuation at a given wage.
get_df_value <- function(design, group_name, period, wage) {
  est      <- svymean(~cc_total_hr, design, na.rm = TRUE)
  mean_hrs <- as.numeric(coef(est))
  se_hrs   <- as.numeric(SE(est))

  data.frame(
    group        = group_name,
    period       = period,
    mean_hrs     = mean_hrs,
    se_hrs       = se_hrs,
    daily_value  = mean_hrs * wage,
    annual_value = mean_hrs * wage * 365
  )
}

# Sex composition (share + SE) for one design, labeled by role.
get_sex_comp <- function(design, role_label) {
  est <- svymean(~factor(sex_category), design, na.rm = TRUE)

  data.frame(
    role  = role_label,
    sex   = gsub("factor\\(sex_category\\)", "", names(coef(est))),
    share = as.numeric(coef(est)),
    se    = as.numeric(SE(est)),
    row.names = NULL
  )
}
