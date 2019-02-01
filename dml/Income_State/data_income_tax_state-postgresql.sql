-- tax_definition state income
INSERT INTO public.tax_definition(id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
VALUES
(nextval('public.hibernate_sequence'), 'AL_STATE_INCOME', 'AL State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', 01, 10),
(nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', 'GA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', 13, 10),
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', 'PA State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', 42, 10)
;

-- income_tax_definition
INSERT INTO public.income_tax_definition(id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
VALUES
(nextval('public.hibernate_sequence'), 'AL_STATE_INCOME', true, false, 2000, 4000, 2000, 2000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', false, false, 2300, 3000, 2300, 2300, 2700, 7400, 2700, 2700, 3000),
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', false, false, 0, 0, 0, 0, 0, 0, 0, 0, 0)
;

-- tax_rate_set AL state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(1001, 'AL_STATE_INCOME', 'SINGLE'),
(1002, 'AL_STATE_INCOME', 'JOINT'),
(1003, 'AL_STATE_INCOME', 'MARRIED_SEPARATE'),
(1004, 'AL_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate AL state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate, Head of Household
(1001, 'AL_STATE_INCOME', 0.02, 0, 500),
(1002, 'AL_STATE_INCOME', 0.04, 500, 3000),
(1003, 'AL_STATE_INCOME', 0.05, 3000, null),
-- Joint
(1004, 'AL_STATE_INCOME', 0.01, 0, 1000),
(1005, 'AL_STATE_INCOME', 0.02, 1000, 6000),
(1006, 'AL_STATE_INCOME', 0.06, 6000, null)
;

-- tax_rate_set_tax_rates AL state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- AL State Income - Single
(1001, 1001),
(1001, 1002),
(1001, 1003),
-- AL State Income - Joint
(1002, 1004),
(1002, 1005),
(1002, 1006),
-- AL State Income - Married Separate
(1003, 1001),
(1003, 1002),
(1003, 1003),
-- AL State Income - Head of Household
(1004, 1001),
(1004, 1002),
(1004, 1003)
;

-- tax_rate_set GA state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(13001, 'GA_STATE_INCOME', 'SINGLE'),
(13002, 'GA_STATE_INCOME', 'JOINT'),
(13003, 'GA_STATE_INCOME', 'MARRIED_SEPARATE'),
(13004, 'GA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate GA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single
(13001, 'GA_STATE_INCOME', 0.01, 0, 750),
(13002, 'GA_STATE_INCOME', 0.02, 750, 2250),
(13003, 'GA_STATE_INCOME', 0.03, 2250, 3750),
(13004, 'GA_STATE_INCOME', 0.04, 3750, 5250),
(13005, 'GA_STATE_INCOME', 0.05, 5250, 7000),
(13006, 'GA_STATE_INCOME', 0.06, 7000, null),
-- Joint
(13007, 'GA_STATE_INCOME', 0.01, 0, 1000),
(13008, 'GA_STATE_INCOME', 0.02, 1000, 3000),
(13009, 'GA_STATE_INCOME', 0.03, 3000, 5000),
(13010, 'GA_STATE_INCOME', 0.04, 5000, 7000),
(13011, 'GA_STATE_INCOME', 0.05, 7000, 10000),
(13012, 'GA_STATE_INCOME', 0.06, 10000, null),
-- Married Separate
(13013, 'GA_STATE_INCOME', 0.01, 0, 750),
(13014, 'GA_STATE_INCOME', 0.02, 750, 2250),
(13015, 'GA_STATE_INCOME', 0.03, 2250, 3750),
(13016, 'GA_STATE_INCOME', 0.04, 3750, 5250),
(13017, 'GA_STATE_INCOME', 0.05, 5250, 7000),
(13018, 'GA_STATE_INCOME', 0.06, 7000, null),
-- Head of Household
(13019, 'GA_STATE_INCOME', 0.01, 0, 1000),
(13020, 'GA_STATE_INCOME', 0.02, 1000, 3000),
(13021, 'GA_STATE_INCOME', 0.03, 3000, 5000),
(13022, 'GA_STATE_INCOME', 0.04, 5000, 7000),
(13023, 'GA_STATE_INCOME', 0.05, 7000, 10000),
(13024, 'GA_STATE_INCOME', 0.06, 10000, null)
;

-- tax_rate_set_tax_rates GA state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- GA State Income - Single
(13001, 13001),
(13001, 13002),
(13001, 13003),
(13001, 13004),
(13001, 13005),
(13001, 13006),
-- GA State Income - Joint
(13002, 13007),
(13002, 13008),
(13002, 13009),
(13002, 13010),
(13002, 13011),
(13002, 13012),
-- GA State Income - Married Separate
(13003, 13013),
(13003, 13014),
(13003, 13015),
(13003, 13016),
(13003, 13017),
(13003, 13018),
-- GA State Income - Head of Household
(13004, 13019),
(13004, 13020),
(13004, 13021),
(13004, 13022),
(13004, 13023),
(13004, 13024)
;

-- tax_rate PA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate, Head of Household
(42001, 'PA_STATE_INCOME', 0.0307, null, null)
;
