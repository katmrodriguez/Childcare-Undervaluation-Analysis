# Raw data

The analysis uses two IPUMS microdata extracts. **These files are not included
in the repository** because IPUMS data are governed by the
[IPUMS terms of use](https://www.ipums.org/about/terms) and may not be
redistributed. Each user must download their own extract from their free IPUMS
account.

Place the two files in this folder with these exact names (the notebooks read
them via `here::here("data", "raw", ...)`):

```
data/raw/atus_ipums.csv.gz
data/raw/cps_ipums.csv.gz
```

`read_csv()` decompresses `.gz` automatically, so there is no need to unzip.

---

## 1. ATUS extract — `atus_ipums.csv.gz`

Source: **ATUS-X / IPUMS ATUS** (<https://www.atusdata.org/>)

- **Samples:** ATUS 2018, 2019, 2021, 2022, 2023, 2024
  (2020 is intentionally dropped in the code.)
- **Variables** (in addition to the preselected technical/weight variables):
  `YEAR`, `WT06`, `WT20`, the `RWT06_*` and `RWT20_*` replicate-weight sets
  (successive-difference replication), `HH_NUMKIDS`, `AGEYCHILD`, `ACT_WORK`,
  `ACT_CAREHH`, `SCC_HH`, `SEX`, `RACE`, `HISPAN`, `FAMINCOME`.
- **Format:** CSV, compressed (`.csv.gz`).

## 2. CPS extract — `cps_ipums.csv.gz`

Source: **IPUMS CPS** (<https://cps.ipums.org/>)

- **Sample:** CPS ASEC 2023.
- **Variables:** `YEAR`, `ASECFLAG`, `ASECWT`, the `REPWTP*` ASEC replicate
  weights, `AGE`, `SEX`, `RACE`, `HISPAN`, `EDUC`, `EMPSTAT`, `OCC`, `INCWAGE`,
  `UHRSWORKT`.
- **Format:** CSV, compressed (`.csv.gz`).

---

Variable codes referenced in the code (e.g. `RACE == 100`, `OCC == 4600` for
childcare workers, `OCC == 2300` for preschool/K teachers, `FAMINCOME` bins)
follow the IPUMS coding schemes for each project. If IPUMS revises a coding
scheme, verify these against the current codebook.
