-- tax_definition US federal income
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'US_FEDERAL_INCOME', 'US Federal Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_FEDERAL', 'US', 9)
    ;

-- income_tax_definition US federal income
INSERT INTO public.income_tax_definition(
	id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
	VALUES (nextval('public.hibernate_sequence'), 'US_FEDERAL_INCOME', true, true, 12200, 24400, 12200, 18350, 0, 0, 0, 0, 0)
	;

-- tax_rate_set US federal income
INSERT INTO public.tax_rate_set(
	id, tax_definition_key, tax_filing_status)
	VALUES
	(11, 'US_FEDERAL_INCOME', 'SINGLE'),
	(12, 'US_FEDERAL_INCOME', 'JOINT'),
	(13, 'US_FEDERAL_INCOME', 'MARRIED_SEPARATE'),
	(14, 'US_FEDERAL_INCOME', 'HEAD_OF_HOUSEHOLD')
	;

-- tax_rate US federal income
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    -- Single
    (11, 'US_FEDERAL_INCOME', 0.10, 0, 9700),
    (12, 'US_FEDERAL_INCOME', 0.12, 9700, 39475),
    (13, 'US_FEDERAL_INCOME', 0.22, 39475, 84200),
    (14, 'US_FEDERAL_INCOME', 0.24, 84200, 160725),
    (15, 'US_FEDERAL_INCOME', 0.32, 160725, 204100),
    (16, 'US_FEDERAL_INCOME', 0.35, 204100, 510300),
    (17, 'US_FEDERAL_INCOME', 0.37, 510300, null),
    -- Joint
    (18, 'US_FEDERAL_INCOME', 0.10, 0, 19400),
    (19, 'US_FEDERAL_INCOME', 0.12, 19400, 78950),
    (20, 'US_FEDERAL_INCOME', 0.22, 78950, 168400),
    (21, 'US_FEDERAL_INCOME', 0.24, 168400, 321450),
    (22, 'US_FEDERAL_INCOME', 0.32, 321450, 408200),
    (23, 'US_FEDERAL_INCOME', 0.35, 408200, 612350),
    (24, 'US_FEDERAL_INCOME', 0.37, 612350, null),
    -- Married Separate
    (25, 'US_FEDERAL_INCOME', 0.10, 0, 9700),
    (26, 'US_FEDERAL_INCOME', 0.12, 9700, 39475),
    (27, 'US_FEDERAL_INCOME', 0.22, 39475, 84200),
    (28, 'US_FEDERAL_INCOME', 0.24, 84200, 160725),
    (29, 'US_FEDERAL_INCOME', 0.32, 160725, 204100),
    (30, 'US_FEDERAL_INCOME', 0.35, 204100, 306175),
    (31, 'US_FEDERAL_INCOME', 0.37, 306175, null),
    -- Head of Household
    (32, 'US_FEDERAL_INCOME', 0.10, 0, 13850),
    (33, 'US_FEDERAL_INCOME', 0.12, 13850, 52850),
    (34, 'US_FEDERAL_INCOME', 0.22, 52850, 84200),
    (35, 'US_FEDERAL_INCOME', 0.24, 84200, 160700),
    (36, 'US_FEDERAL_INCOME', 0.32, 160700, 204100),
    (37, 'US_FEDERAL_INCOME', 0.35, 204100, 510300),
    (38, 'US_FEDERAL_INCOME', 0.37, 510300, null)
    ;

-- tax_rate_set_tax_rates US federal income
INSERT INTO public.tax_rate_set_tax_rates(
	tax_rate_set_id, tax_rate_id)
	VALUES
	-- US Federal Income - Single
	(11, 11),
	(11, 12),
	(11, 13),
	(11, 14),
	(11, 15),
	(11, 16),
	(11, 17),
	-- US Federal Income - Joint
	(12, 18),
	(12, 19),
	(12, 20),
	(12, 21),
	(12, 22),
	(12, 23),
	(12, 24),
	-- US Federal Income - Married Separate
	(13, 25),
	(13, 26),
	(13, 27),
	(13, 28),
	(13, 29),
	(13, 30),
	(13, 31),
	-- US Federal Income - Head of Household
	(14, 32),
	(14, 33),
	(14, 34),
	(14, 35),
	(14, 36),
	(14, 37),
	(14, 38)
	;

-- tax_definition US federal payroll
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'US_PAYROLL_SOC_SEC', 'US Federal Payroll Social Security', 'payrollTaxBracketedMarginalRateCalculator', 'PAYROLL_FEDERAL', 'US', 1),
    (nextval('public.hibernate_sequence'), 'US_PAYROLL_MEDICARE', 'US Federal Payroll Medicare', 'payrollTaxBracketedMarginalRateCalculator', 'PAYROLL_FEDERAL', 'US', 1),
    (nextval('public.hibernate_sequence'), 'US_PAYROLL_SELF_EMP_SOC_SEC', 'US Federal Payroll Self-Employed Social Security', 'selfEmployedPayrollTaxCalculator', 'PAYROLL_SELF_EMP_FEDERAL', 'US', 1),
    (nextval('public.hibernate_sequence'), 'US_PAYROLL_SELF_EMP_MEDICARE', 'US Federal Payroll Self-Employed Medicare', 'selfEmployedPayrollTaxCalculator', 'PAYROLL_SELF_EMP_FEDERAL', 'US', 1);

-- tax_rate_set US federal payroll
INSERT INTO public.tax_rate_set(
	id, tax_definition_key, tax_filing_status)
	VALUES
	(101, 'US_PAYROLL_SOC_SEC', null),
	(102, 'US_PAYROLL_MEDICARE', 'SINGLE'),
	(103, 'US_PAYROLL_MEDICARE', 'JOINT'),
	(104, 'US_PAYROLL_MEDICARE', 'MARRIED_SEPARATE'),
	(105, 'US_PAYROLL_MEDICARE', 'HEAD_OF_HOUSEHOLD'),
	(106, 'US_PAYROLL_SELF_EMP_SOC_SEC', null),
	(107, 'US_PAYROLL_SELF_EMP_MEDICARE', 'SINGLE'),
	(108, 'US_PAYROLL_SELF_EMP_MEDICARE', 'JOINT'),
	(109, 'US_PAYROLL_SELF_EMP_MEDICARE', 'MARRIED_SEPARATE'),
	(110, 'US_PAYROLL_SELF_EMP_MEDICARE', 'HEAD_OF_HOUSEHOLD')
	;

-- tax_rate US federal payroll
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    -- Regular Wages
    -- Social Security
    (101, 'US_PAYROLL_SOC_SEC', 0.062, 0, 132900),
    -- Medicare Married filing separate
    (102, 'US_PAYROLL_MEDICARE', 0.0145, 0, 125000),
    (103, 'US_PAYROLL_MEDICARE', 0.0235, 125000, null),
    -- Medicare Single and Head of Household
    (104, 'US_PAYROLL_MEDICARE', 0.0145, 0, 200000),
    (105, 'US_PAYROLL_MEDICARE', 0.0235, 200000, null),
    -- Medicare Joint
    (106, 'US_PAYROLL_MEDICARE', 0.0145, 0, 250000),
    (107, 'US_PAYROLL_MEDICARE', 0.0235, 250000, null),
    -- Self-Employed Income
    -- Social Security
    (108, 'US_PAYROLL_SELF_EMP_SOC_SEC', 0.124, 0, 132900),
    -- Medicare Married filing separate
    (109, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.029, 0, 125000),
    (110, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.038, 125000, null),
    -- Medicare Single and Head of Household
    (111, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.029, 0, 200000),
    (112, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.038, 200000, null),
    -- Medicare Joint
    (113, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.029, 0, 250000),
    (114, 'US_PAYROLL_SELF_EMP_MEDICARE', 0.038, 250000, null)
    ;

-- tax_rate_set_tax_rates federal payroll
INSERT INTO public.tax_rate_set_tax_rates(
	tax_rate_set_id, tax_rate_id)
	VALUES
	-- US Federal Payroll - Social Security
	(101, 101),
	-- US Federal Payroll - Medicare Married Filing Separate
	(104, 102),
	(104, 103),
	-- US Federal Payroll - Medicare Single
	(102, 104),
	(102, 105),
	-- US Federal Payroll - Medicare Head of Household
	(105, 104),
	(105, 105),
	-- US Federal Payroll - Medicare Joint
	(103, 106),
	(103, 107),
	-- US Federal Payroll Self-Employed - Social Security
	(106, 108),
	-- US Federal Payroll Self-Employed - Medicare Married Filing Separate
	(109, 109),
	(109, 110),
	-- US Federal Payroll Self-Employed - Medicare Single
	(107, 111),
	(107, 112),
	-- US Federal Payroll Self-Employed - Medicare Head of Household
	(110, 111),
	(110, 112),
	-- US Federal Payroll Self-Employed - Medicare Joint
	(108, 113),
	(108, 114)
    ;

-- tax_definition US capital gains
INSERT INTO public.tax_definition(id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'US_CAPITAL_GAINS', 'US Federal Capital Gains', 'capitalGainsTaxBracketedRateCalculator', 'CAPITAL_GAINS_FEDERAL', 'US', 10)
    ;

-- tax_rate_set US capital gains
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
	VALUES
	(121, 'US_CAPITAL_GAINS', 'SINGLE'),
	(122, 'US_CAPITAL_GAINS', 'JOINT'),
	(123, 'US_CAPITAL_GAINS', 'MARRIED_SEPARATE'),
	(124, 'US_CAPITAL_GAINS', 'HEAD_OF_HOUSEHOLD')
	;

-- tax_rate US capital gains
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
    VALUES
    -- Single and Married filing separate
    (121, 'US_CAPITAL_GAINS', 0.0, 0, 39375),
    (122, 'US_CAPITAL_GAINS', 0.15, 39375, 434550),
    (123, 'US_CAPITAL_GAINS', 0.20, 434550, null),
    -- Joint
    (124, 'US_CAPITAL_GAINS', 0.0, 0, 78750),
    (125, 'US_CAPITAL_GAINS', 0.15, 78750, 488850),
    (126, 'US_CAPITAL_GAINS', 0.20, 488850, null),
    -- Head of Household
    (127, 'US_CAPITAL_GAINS', 0.0, 0, 52750),
    (128, 'US_CAPITAL_GAINS', 0.15, 52750, 244425),
    (129, 'US_CAPITAL_GAINS', 0.20, 244425, null)
    ;

-- tax_rate_set_tax_rates federal payroll
INSERT INTO public.tax_rate_set_tax_rates(
	tax_rate_set_id, tax_rate_id)
	VALUES
	-- US Capital Gains Single
	(121, 121),
	(121, 122),
	(121, 123),
	-- US Capital Gains Joint
	(122, 124),
	(122, 125),
	(122, 126),
	-- US Capital Gains Married Filing Separate
	(123, 121),
	(123, 122),
	(123, 123),
	-- US Capital Gains Head of Household
	(124, 127),
	(124, 128),
	(124, 129)
    ;


-- expenditure_category.sql
INSERT INTO public.expenditure_category(
            id, expenditure_category_key, description)
    VALUES (nextval('public.hibernate_sequence'), 'FOOD_AT_HOME', 'Non-prepared food'),
    (nextval('public.hibernate_sequence'), 'FOOD_AWAY_FROM_HOME', 'Prepared food'),
    (nextval('public.hibernate_sequence'), 'ALCOHOL', 'Alcoholic Beverages'),
    (nextval('public.hibernate_sequence'), 'HOUSING_SHELTER', 'Mortgage or Rent'),
    (nextval('public.hibernate_sequence'), 'HOUSING_UTILITIES', 'Household Utilities'),
    (nextval('public.hibernate_sequence'), 'HOUSING_OPERATIONS', 'Homeowners Association Dues and Fees, Insurance'),
    (nextval('public.hibernate_sequence'), 'HOUSING_HOUSEKEEPING_SUPPLIES', 'Household cleaning and maintenance supplies'),
    (nextval('public.hibernate_sequence'), 'HOUSING_FURNISHINGS', 'Household furnishings and equipment'),
    (nextval('public.hibernate_sequence'), 'APPAREL', 'Clothing, Accessories, and Laundry'),
    (nextval('public.hibernate_sequence'), 'TRANSPORTATION_VEHICLE_PURCHASE', 'Vehicle loan or lease'),
    (nextval('public.hibernate_sequence'), 'TRANSPORTATION_FUEL', 'Gasoline and Motor Oil'),
    (nextval('public.hibernate_sequence'), 'TRANSPORTATION_VEHICLE_OTHER', 'Repairs and Maintenance'),
    (nextval('public.hibernate_sequence'), 'TRANSPORTATION_PUBLIC', 'Public transportation, other transportation'),
    (nextval('public.hibernate_sequence'), 'HEALTHCARE', ''),
    (nextval('public.hibernate_sequence'), 'ENTERTAINMENT', ''),
    (nextval('public.hibernate_sequence'), 'PERSONAL_CARE', ''),
    (nextval('public.hibernate_sequence'), 'READING', ''),
    (nextval('public.hibernate_sequence'), 'EDUCATION', ''),
    (nextval('public.hibernate_sequence'), 'TOBACCO', ''),
    (nextval('public.hibernate_sequence'), 'MISC', ''),
    (nextval('public.hibernate_sequence'), 'SAVINGS', 'Post-tax savings and investments'),
    (nextval('public.hibernate_sequence'), 'PERSONAL_INSURANCE', ''),
    (nextval('public.hibernate_sequence'), 'PENSIONS', '')
    ;

    INSERT INTO public.expenditure_category_group(
            id, description, expenditure_category_group_key)
    VALUES (1, 'Categories subject to sales tax, excluding food at home (unprepared)', 'SALES_TAX_GROUP'),
    (2, 'Categories subject to sales tax, including food at home (unprepared)', 'SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
    (3, 'Categories subject to sales tax, excluding food at home (unprepared) and clothing', 'SALES_TAX_GROUP_B')
    ;

    INSERT INTO public.expenditure_category_group_expenditure_category_key(
            expenditure_category_group_id, expenditure_category_keys)
    VALUES (1, 'FOOD_AWAY_FROM_HOME'),
    (1, 'ALCOHOL'),
    (1, 'HOUSING_UTILITIES'),
    (1, 'HOUSING_OPERATIONS'),
    (1, 'HOUSING_HOUSEKEEPING_SUPPLIES'),
    (1, 'HOUSING_FURNISHINGS'),
    (1, 'APPAREL'),
    (1, 'TRANSPORTATION_VEHICLE_PURCHASE'),
    (1, 'TRANSPORTATION_VEHICLE_OTHER'),
    (1, 'ENTERTAINMENT'),
    (1, 'PERSONAL_CARE'),
    (1, 'READING'),
    (1, 'EDUCATION'),
    (1, 'TOBACCO'),
    (1, 'MISC'),
	(2, 'FOOD_AWAY_FROM_HOME'),
    (2, 'FOOD_AT_HOME'),
    (2, 'ALCOHOL'),
    (2, 'HOUSING_UTILITIES'),
    (2, 'HOUSING_OPERATIONS'),
    (2, 'HOUSING_HOUSEKEEPING_SUPPLIES'),
    (2, 'HOUSING_FURNISHINGS'),
    (2, 'APPAREL'),
    (2, 'TRANSPORTATION_VEHICLE_PURCHASE'),
    (2, 'TRANSPORTATION_FUEL'),
    (2, 'TRANSPORTATION_VEHICLE_OTHER'),
    (2, 'ENTERTAINMENT'),
    (2, 'PERSONAL_CARE'),
    (2, 'READING'),
    (2, 'EDUCATION'),
    (2, 'TOBACCO'),
    (2, 'MISC'),
	(3, 'FOOD_AWAY_FROM_HOME'),
    (3, 'ALCOHOL'),
    (3, 'HOUSING_UTILITIES'),
    (3, 'HOUSING_OPERATIONS'),
    (3, 'HOUSING_HOUSEKEEPING_SUPPLIES'),
    (3, 'HOUSING_FURNISHINGS'),
    (3, 'TRANSPORTATION_VEHICLE_PURCHASE'),
    (3, 'TRANSPORTATION_FUEL'),
    (3, 'TRANSPORTATION_VEHICLE_OTHER'),
    (3, 'ENTERTAINMENT'),
    (3, 'PERSONAL_CARE'),
    (3, 'READING'),
    (3, 'EDUCATION'),
    (3, 'TOBACCO'),
    (3, 'MISC')
    ;

-- consumer_expenditure_profile.sql
INSERT INTO public.consumer_expenditure_profile(
            id,  consumer_expenditure_profile_key,  description)
    VALUES (1, 'BASIC', 'Standard Consumer Expenditure Profile - 2015 US Bureau of Labor Statistics')
    ;

INSERT INTO public.consumer_expenditure_profile_entry(
            consumer_expenditure_profile_id, expenditure_category_key, percentage)
    VALUES (1, 'FOOD_AT_HOME', 0.071),
    (1, 'FOOD_AWAY_FROM_HOME', 0.054),
    (1, 'ALCOHOL', 0.009),
    (1, 'HOUSING_SHELTER', 0.192),
    (1, 'HOUSING_UTILITIES', 0.069),
    (1, 'HOUSING_OPERATIONS', 0.023),
    (1, 'HOUSING_HOUSEKEEPING_SUPPLIES', 0.012),
    (1, 'HOUSING_FURNISHINGS', 0.032),
    (1, 'APPAREL', 0.033),
    (1, 'TRANSPORTATION_VEHICLE_PURCHASE', 0.071),
    (1, 'TRANSPORTATION_FUEL', 0.037),
    (1, 'TRANSPORTATION_VEHICLE_OTHER', 0.049),
    (1, 'TRANSPORTATION_PUBLIC', 0.012),
    (1, 'HEALTHCARE', 0.078),
    (1, 'ENTERTAINMENT', 0.051),
    (1, 'PERSONAL_CARE', 0.012),
    (1, 'READING', 0.002),
    (1, 'EDUCATION', 0.023),
    (1, 'TOBACCO', 0.006),
    (1, 'MISC', 0.016),
    (1, 'CHARITY_AND_GIFTS', 0.032),
    (1, 'SAVINGS', 0.022),
    (1, 'PERSONAL_INSURANCE', 0.006),
    (1, 'PENSIONS_AND_SS', 0.106)
    ;
