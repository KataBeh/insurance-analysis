# Hur är kostnaderna fördelade?
# Vilka variabler som verkar intressanta att undersöka vidare?
# Finns det tydliga skillnader mellan grupper?


# lite grundläggande
summary(insurance_clean$charges)
mean(insurance_clean$charges)
median(insurance_clean$charges)
sd(insurance_clean$charges)




charges_smoker <- insurance_clean %>%
  group_by(smoker) %>%
  summarize(
    avg_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    sd_charges = sd(charges, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

charges_smoker




charges_risk <- insurance_clean %>%
  group_by(risk_level) %>%
  summarize(
    avg_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

charges_risk




charges_age <- insurance_clean %>%
  group_by(age_group) %>%
  summarize(
    avg_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

charges_age




charges_bmi <- insurance_clean %>%
  group_by(bmi_category) %>%
  summarize(
    avg_charges = mean(charges, na.rm = TRUE),
    median_charges = median(charges, na.rm = TRUE),
    n = n(),
    .groups = "drop"
  )

charges_bmi



# t-test som undersöker skillnaden i försäkringskostnader mellan rökare och icke-rökare
smoker_test <- t.test(charges ~ smoker, data = insurance_clean)

smoker_test
smoker_test$p.value
smoker_test$conf.int
smoker_test$estimate


sex_test <- t.test(charges ~ sex, data = insurance_clean)

sex_test
sex_test$p.value
sex_test$conf.int
sex_test$estimate