# Förstå datan:
head(insurance_raw)
glimpse(insurance_raw)
names(insurance_raw)
summary(insurance_raw)
# finns 14 kolumner, 1100 rader, variablerna som finns är, 7 numriska variabler och 7 kategoriska




colSums(is.na(insurance_raw))
# saknade värden i 2 kolumner: bmi och annual_checkups




insurance_raw %>% 
  count(region)
insurance_raw %>% 
  count(plan_type)
insurance_raw %>% 
  count(exercise_level)
insurance_raw %>% 
  count(sex)
insurance_raw %>% 
  count(smoker)
# inkonsekvenser i datan: North/north, South/south, Premium/ premium, Standard/standard men även "basic" med mellanslag och utan, Yes/yes samt "no" med mellanslag

# även exercise_level har en inkonsekvens: 22 tomma rader, dvs. inga NA utan helt blankt




summary(insurance_raw$bmi)
summary(insurance_raw$annual_checkups)
# BMI har vissa saknade värden men i övrigt rimlig spridning




# Datastädning och förberedelse:
insurance_clean <- insurance_raw %>% 
  mutate(
    region = str_trim(region),
    region = str_to_title(region),
    region =  str_replace_all(region, " ", ""),
    plan_type = str_trim(plan_type),
    plan_type = str_to_title(plan_type),
    plan_type =  str_replace_all(plan_type, " ", ""),
    smoker = str_trim(smoker),
    smoker = str_to_title(smoker),
    smoker =  str_replace_all(smoker, " ", ""),
    exercise_level = ifelse(exercise_level == "", NA, exercise_level)
  )

insurance_clean %>% 
  count(region)
insurance_clean %>% 
  count(plan_type)
insurance_clean %>% 
  count(exercise_level)
insurance_clean %>% 
  count(smoker)




# Ersätter NA värden:
insurance_clean <- insurance_clean %>%
  mutate(
    bmi = ifelse(is.na(bmi), median(bmi, na.rm = TRUE), bmi)
  )
# använder median då BMI kan ha outliers och median är robustare

insurance_clean <- insurance_clean %>%
  mutate(
    annual_checkups = ifelse(is.na(annual_checkups), median(annual_checkups, na.rm = TRUE), annual_checkups)
  )

insurance_clean <- insurance_clean %>%
  mutate(
    exercise_level = ifelse(is.na(exercise_level), "unknown", exercise_level)
  )




# Skapar factors:
insurance_clean <- insurance_clean %>%
  mutate(
    sex = as.factor(sex),
    smoker = as.factor(smoker),
    region = as.factor(region),
    plan_type = as.factor(plan_type),
    exercise_level = as.factor(exercise_level),
    chronic_condition = as.factor(chronic_condition)
  )




# Sätter ordning på mina kategorier:
insurance_clean <- insurance_clean %>%
  mutate(
    exercise_level = factor(exercise_level, levels = c("low", "medium", "high", "unknown"))
  )




# Skapar nya variabler:
insurance_clean <- insurance_clean %>% 
  mutate(
    bmi_category = case_when(
      bmi < 18.5 ~ "Underweight",
      bmi < 25 ~ "Normal",
      bmi < 30 ~ "Overweight",
      TRUE ~ "Obese"
    ),
    bmi_category = as.factor(bmi_category)
  )


insurance_clean <- insurance_clean %>%
  mutate(
    age_group = case_when(
      age < 30 ~ "Young",
      age < 45 ~ "Adult",
      age < 60 ~ "Middle-aged",
      TRUE ~ "Senior"
    ),
    age_group = as.factor(age_group)
  )


insurance_clean <- insurance_clean %>%
  mutate(
    history_score = prior_accidents + prior_claims
  )

# och en risknivå:
insurance_clean <- insurance_clean %>%
  mutate(
    risk_level = case_when(
      history_score == 0 ~ "Low",
      history_score <= 3 ~ "Medium",
      TRUE ~ "High"
    ),
    risk_level = as.factor(risk_level)
  )



insurance_clean %>% count(bmi_category)
insurance_clean %>% count(age_group)
insurance_clean %>% count(risk_level)








