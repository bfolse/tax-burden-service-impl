-- Income Tax for cities in MD
-- tax_definition_income_city_MD.sql
INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
VALUES
(nextval('public.hibernate_sequence'),'2404000','BALTIMORE_MD_CITY_INCOME','Baltimore city MD Income','incomeTaxFlatRateCalculator','INCOME_CITY',9)
;

-- income_tax_definition_MD
INSERT INTO public.income_tax_definition(id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
VALUES
(nextval('public.hibernate_sequence'), 'BALTIMORE_MD_CITY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200)
;

-- tax_rate_income_city_MD.sql
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
(nextval('public.hibernate_sequence'),'BALTIMORE_MD_CITY_INCOME',0.0320,null,null)
;


