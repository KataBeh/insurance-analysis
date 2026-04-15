# REGRESSIONANALYS: regression testar smoker, bmi, age, risk_level som är viktiga samtidigt

model_1 <- lm(charges ~ age + bmi + smoker + risk_level, data = insurance_clean)
summary(model_1)

coef(model_1)

# förklarar försäkringskostnad med ålder, BMI, rökning och risknivå ( det blir då min baseline )
# age = 84.7, alltså med varje extra år ökar kostnaden med cirka 85 enheter
# bmi = 162, ett högre bmi är kopplat till högre kostnader, en enhets ökning i bmi ökar kostnaden med 162
# smokerYes= 7853, alltså rökare har i snitt cirka 7853 högre kostnader än icke-rökare
# risk_levelLow = -4130, kunder med låg risk har cirka 4130 lägre kosnader än de med hög risk
# risk_levelMedium = -2386, medium risk cirka 2386 lägre kosnad än hög risk

# alla variabler är signifikanta, alltså påverkar charges på riktigt
# R-squared = 0.582, modellen förklarar cirka 58% av variationen i försäkringskostnader
# F-statistic = modellen som helhet är statistiskt signifikant



model_2 <- lm(charges ~ age + bmi + smoker + risk_level + exercise_level + plan_type + region, data = insurance_clean)
summary(model_2)


# geografisk region verkar inte ha någon påverkan
# försäkringsplan påverkar däremot kostnaden
# motionsnivå påverkar kostnaden men inte lika mycket som rökning


# Jämför båda:
summary(model_1)$r.squared
summary(model_2)$r.squared

tibble(
  model = c(
    "Model 1: age + bmi + smoker + risk_level",
    "Model 2: + exercise_level + plan_type + region"
  ),
  r_squared = c(
    summary(model_1)$r.squared,
    summary(model_2)$r.squared
  ),
  adjusted_r_squared = c(
    summary(model_1)$adj.r.squared,
    summary(model_2)$adj.r.squared
  )
)

# model_1 = 0.582 medan model_2 = 0.620, dvs. model_2 förklarar mer, cirka 62% av variationen i kostnader
# Det måste betyda att extra variablerna bidrar till förklaringen av kostnaderna, men inte jättemycket, cirka 4%



model_3 <- lm(charges ~ age + bmi + smoker + history_score + exercise_level + plan_type + region,
              data = insurance_clean)
summary(model_3)


# använder history_score istället för risk_level





# JÄMFÖR ALLA 3: 
tibble(
  model = c(
    "Model 1: age + bmi + smoker + risk_level",
    "Model 2: + exercise_level + plan_type + region",
    "Model 3: history_score instead for risk_level "
  ),
  r_squared = c(
    summary(model_1)$r.squared,
    summary(model_2)$r.squared,
    summary(model_3)$r.squared
  ),
  adjusted_r_squared = c(
    summary(model_1)$adj.r.squared,
    summary(model_2)$adj.r.squared,
    summary(model_3)$adj.r.squared
  ),
  residual_se = c(
    summary(model_1)$sigma,
    summary(model_2)$sigma,
    summary(model_3)$sigma
  )
)

ggplot(insurance_clean, aes(x = bmi, y = charges)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", se = TRUE) +
  labs(
    title = "Regression: Charges vs BMI",
    x = "BMI",
    y = "Charges"
  ) +
  theme_minimal()

# Högre BMI tenderar att vara kopplat till högre kostnader, men frf med stor spridning





# MODELDIAGNOSTIK:
# väljer att fokusera på model 2, då model 1 är för enkel, mer som jämförelse, och model 3 funkar som alternativ

model_2_diagno <- insurance_clean %>%
  mutate(
    fitted_value = fitted(model_2),
    residual = resid(model_2)
  )

ggplot(model_2_diagno, aes(x = fitted_value, y = residual)) +
  geom_point(alpha = 0.5) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  labs(
    title = "Residualer vs predikterade värden",
    x = "Predikterat",
    y = "Residual"
  )

# Residualerna är relativt slumpmässigt fördelade kring noll, men modellen verkar inte kunna förklara all variation




# PREDICTED VS ACTUAL:

ggplot(model_2_diagno, aes(x = fitted_value, y = charges)) +
  geom_point(alpha = 0.5) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(
    title = "Predikterade vs faktiska kostnader",
    x = "Predikterat",
    y = "Faktiskt"
  )

# De predikterade värdena följer de faktiska värdena ganska bra












