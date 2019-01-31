-- tax_definition_state_sales.sql
INSERT INTO public.tax_definition(
            id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
    VALUES
(nextval('public.hibernate_sequence'),'01','AL_STATE_SALES', 'Alabama State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'04','AZ_STATE_SALES', 'Arizona State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'05','AK_STATE_SALES', 'Arkansas State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'06','CA_STATE_SALES', 'California State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'08','CO_STATE_SALES', 'Colorado State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'09','CT_STATE_SALES', 'Connecticut State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'11','DC_STATE_SALES', 'Disctict of Columbia Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'12','FL_STATE_SALES', 'Florida State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'13','GA_STATE_SALES', 'GA State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'15','HI_STATE_SALES', 'Hawaii State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'16','ID_STATE_SALES', 'Idaho State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'17','IL_STATE_SALES', 'Illinois State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'18','IN_STATE_SALES', 'Indiana State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'19','IA_STATE_SALES', 'Iowa State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'20','KS_STATE_SALES', 'Kansas State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'21','KY_STATE_SALES', 'Kentucky State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'22','LA_STATE_SALES', 'Louisiana State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'23','ME_STATE_SALES', 'Maine State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'24','MD_STATE_SALES', 'Maryland State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'25','MA_STATE_SALES', 'Massachusetts State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'26','MI_STATE_SALES', 'Michigan State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'27','MN_STATE_SALES', 'Minnesota State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'28','MS_STATE_SALES', 'Mississippi State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'29','MO_STATE_SALES', 'Missouri State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'31','NE_STATE_SALES', 'Nebraska State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'32','NV_STATE_SALES', 'Nevada State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'34','NJ_STATE_SALES', 'New Jersey State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'35','NM_STATE_SALES', 'New Mexico State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'36','NY_STATE_SALES', 'New York State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'37','NC_STATE_SALES', 'North Carolina State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'38','ND_STATE_SALES', 'North Dakota State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'39','OH_STATE_SALES', 'Ohio State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'40','OK_STATE_SALES', 'Oklahoma State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'42','PA_STATE_SALES', 'Pennsylvania State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'44','RI_STATE_SALES', 'Rhode Island State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'45','SC_STATE_SALES', 'South Carolina State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'46','SD_STATE_SALES', 'South Dakota State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'47','TN_STATE_SALES', 'Tennessee State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'48','TX_STATE_SALES', 'Texas State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'49','UT_STATE_SALES', 'Utah State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'50','VT_STATE_SALES', 'Vermont State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'51','VA_STATE_SALES', 'Virginia State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'53','WA_STATE_SALES', 'Washington State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'54','WV_STATE_SALES', 'West Virginia State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'55','WI_STATE_SALES', 'Wisconsin State Sales', 'salesTaxCalculator', 'SALES_STATE', 5),
(nextval('public.hibernate_sequence'),'56','WY_STATE_SALES', 'Wyoming State Sales', 'salesTaxCalculator', 'SALES_STATE', 5)
;

-- tax_rate_state_sales.sql
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    (nextval('public.hibernate_sequence'), 'AL_STATE_SALES', 0.04, null, null),
    (nextval('public.hibernate_sequence'), 'AZ_STATE_SALES', 0.056, null, null),
    (nextval('public.hibernate_sequence'), 'AK_STATE_SALES', 0.065, null, null),
    (nextval('public.hibernate_sequence'), 'CA_STATE_SALES', 0.0725, null, null),
    (nextval('public.hibernate_sequence'), 'CO_STATE_SALES', 0.029, null, null),
    (nextval('public.hibernate_sequence'), 'CT_STATE_SALES', 0.04, null, null),
    (nextval('public.hibernate_sequence'), 'DC_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'FL_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'GA_STATE_SALES', 0.04, null, null),
    (nextval('public.hibernate_sequence'), 'HI_STATE_SALES', 0.04, null, null),
    (nextval('public.hibernate_sequence'), 'ID_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'IL_STATE_SALES', 0.0625, null, null),
    (nextval('public.hibernate_sequence'), 'IN_STATE_SALES', 0.07, null, null),
    (nextval('public.hibernate_sequence'), 'IA_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'KS_STATE_SALES', 0.065, null, null),
    (nextval('public.hibernate_sequence'), 'KY_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'LA_STATE_SALES', 0.0445, null, null),
    (nextval('public.hibernate_sequence'), 'ME_STATE_SALES', 0.055, null, null),
    (nextval('public.hibernate_sequence'), 'MD_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'MA_STATE_SALES', 0.0625, null, null),
    (nextval('public.hibernate_sequence'), 'MI_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'MN_STATE_SALES', 0.06875, null, null),
    (nextval('public.hibernate_sequence'), 'MS_STATE_SALES', 0.07, null, null),
    (nextval('public.hibernate_sequence'), 'MO_STATE_SALES', 0.04225, null, null),
    (nextval('public.hibernate_sequence'), 'NE_STATE_SALES', 0.055, null, null),
    (nextval('public.hibernate_sequence'), 'NV_STATE_SALES', 0.0685, null, null),
    (nextval('public.hibernate_sequence'), 'NJ_STATE_SALES', 0.06625, null, null),
    (nextval('public.hibernate_sequence'), 'NM_STATE_SALES', 0.05125, null, null),
    (nextval('public.hibernate_sequence'), 'NY_STATE_SALES', 0.04, null, null),
    (nextval('public.hibernate_sequence'), 'NC_STATE_SALES', 0.0475, null, null),
    (nextval('public.hibernate_sequence'), 'ND_STATE_SALES', 0.05, null, null),
    (nextval('public.hibernate_sequence'), 'OH_STATE_SALES', 0.0575, null, null),
    (nextval('public.hibernate_sequence'), 'OK_STATE_SALES', 0.045, null, null),
    (nextval('public.hibernate_sequence'), 'PA_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'RI_STATE_SALES', 0.07, null, null),
    (nextval('public.hibernate_sequence'), 'SC_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'SD_STATE_SALES', 0.045, null, null),
    (nextval('public.hibernate_sequence'), 'TN_STATE_SALES', 0.07, null, null),
    (nextval('public.hibernate_sequence'), 'TX_STATE_SALES', 0.0625, null, null),
    (nextval('public.hibernate_sequence'), 'UT_STATE_SALES', 0.047, null, null),
    (nextval('public.hibernate_sequence'), 'VT_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'VA_STATE_SALES', 0.043, null, null),
    (nextval('public.hibernate_sequence'), 'WA_STATE_SALES', 0.065, null, null),
    (nextval('public.hibernate_sequence'), 'WV_STATE_SALES', 0.06, null, null),
    (nextval('public.hibernate_sequence'), 'WI_STATE_SALES', 0.05, null, null),
    (nextval('public.hibernate_sequence'), 'WY_STATE_SALES', 0.04, null, null)
;

-- tax_definition_expenditure_category_state_sales.sql
INSERT INTO public.tax_definition_expenditure_category(
            id, tax_definition_key, expenditure_category_group_key)
VALUES
(nextval('public.hibernate_sequence'), 'AL_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'AZ_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'AK_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'CA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'CO_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'CT_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'DC_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'FL_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'GA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'HI_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'ID_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'IL_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'IN_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'IA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'KS_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'KY_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'LA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'ME_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MD_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MI_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MN_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MS_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'MO_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NE_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NV_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NJ_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NM_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NY_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'NC_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'ND_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'OH_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'OK_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'PA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'RI_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'SC_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'SD_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'TN_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'TX_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'UT_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'VT_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'VA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'WA_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'WV_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'WI_STATE_SALES', 'SALES_TAX_GROUP'),
(nextval('public.hibernate_sequence'), 'WY_STATE_SALES', 'SALES_TAX_GROUP')
;
