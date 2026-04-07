# mina visualiseringar kommer att spegla mina analysis, där jag analyserade charges, smoker, risk_level, age_group och bmi

# Fördelning av charges: 
ggplot(insurance_clean, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue") +
  labs(title = "Distribution of Insurance Charges")


# Charges vs smoker:
ggplot(insurance_clean, aes(x = smoker, y = charges)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Insurance Charges by Smoking Status")


# Charges vs risk_level:
ggplot(insurance_clean, aes(x = risk_level, y = charges)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Charges by Risk Level")


# BMI vs charges:
ggplot(insurance_clean, aes(x = bmi, y = charges)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm") +
  labs(title = "BMI and Insurance Charges")


# Charges vs age_group:
ggplot(insurance_clean, aes(x = age_group, y = charges)) +
  geom_boxplot()
