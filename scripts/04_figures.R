# mina visualiseringar kommer att spegla mina analysis, där jag analyserade charges, smoker, risk_level, age_group och bmi

# Fördelning av charges: 
p_distribution <- ggplot(insurance_clean, aes(x = charges)) +
  geom_histogram(bins = 30, fill = "steelblue") +
  labs(title = "Distribution of Insurance Charges")

p_distribution
# Försäkringskostnaderna är fördelade på det sättet att de flesta kunder har relativt låga kostnader medan ett fåtal har mycket höga kostnader.



# Charges vs smoker:
p_charges_vs_smoker <- ggplot(insurance_clean, aes(x = smoker, y = charges)) +
  geom_boxplot(fill = "lightblue") +
  labs(title = "Insurance Charges by Smoking Status")

p_charges_vs_smoker
# Rökare har tydligt högre försäkringskostnader än icke-rökare, vilket indikerar att rökning är en stark kostnadsdrivande faktor.



# Charges vs risk_level:
p_charges_vs_risk <- ggplot(insurance_clean, aes(x = risk_level, y = charges)) +
  geom_boxplot(fill = "lightgreen") +
  labs(title = "Charges by Risk Level")

p_charges_vs_risk
# Högre risknivå är kopplad till högre försäkringskostnader, vilket tyder på att tidigare historik påverkar prissättningen.



# BMI vs charges:
p_bmi_vs_charges <- ggplot(insurance_clean, aes(x = bmi, y = charges)) +
  geom_point(alpha = 0.5, position = "jitter") +
  geom_smooth(method = "lm") +
  labs(title = "BMI and Insurance Charges")

p_bmi_vs_charges
# Det finns en positiv relation mellan BMI och försäkringskostnader, där högre BMI tenderar att ge högre kostnader.



# Charges vs age_group:
p_charges_vs_age <- ggplot(insurance_clean, aes(x = age_group, y = charges)) +
  geom_boxplot()

p_charges_vs_age
# Även ålder visar ett visst samband med kostnader.



# Visualiseringarna bekräftar att försäkringskostnaderna är ojämnt fördelade samt att variabler som rökning, BMI och risknivå har tydliga samband med kostnader. Dessa resultat ligger till grund för vidare regressionsanalys.


ggsave("output/figures/distribution_of_charges.png", p_distribution, width = 8, height = 5)
ggsave("output/figures/charges_vs_smoker.png", p_charges_vs_smoker, width = 8, height = 5)
ggsave("output/figures/charges_vs_risk_level.png", p_charges_vs_risk, width = 8, height = 5)
ggsave("output/figures/bmi_vs_charges.png", p_bmi_vs_charges, width = 8, height = 5)
ggsave("output/figures/charges_vs_age_group.png", p_charges_vs_age, width = 8, height = 5)


