-- tax_definition state income
INSERT INTO public.tax_definition(id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
VALUES
(nextval('public.hibernate_sequence'), 'AL_STATE_INCOME', 'AL State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '01', 10),
(nextval('public.hibernate_sequence'), 'AZ_STATE_INCOME', 'AZ State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '04', 10),
(nextval('public.hibernate_sequence'), 'AR_STATE_INCOME', 'AR State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '05', 10),
(nextval('public.hibernate_sequence'), 'CA_STATE_INCOME', 'CA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '06', 10),
(nextval('public.hibernate_sequence'), 'CO_STATE_INCOME', 'CO State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '08', 10),
(nextval('public.hibernate_sequence'), 'CT_STATE_INCOME', 'CT State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '09', 10),
(nextval('public.hibernate_sequence'), 'DE_STATE_INCOME', 'DE State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '10', 10),
(nextval('public.hibernate_sequence'), 'DC_STATE_INCOME', 'DC State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '11', 10),
(nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', 'GA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '13', 10),
(nextval('public.hibernate_sequence'), 'HI_STATE_INCOME', 'HI State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '15', 10),
(nextval('public.hibernate_sequence'), 'ID_STATE_INCOME', 'ID State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '16', 10),
(nextval('public.hibernate_sequence'), 'IL_STATE_INCOME', 'IL State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '17', 10),
(nextval('public.hibernate_sequence'), 'IN_STATE_INCOME', 'IN State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '18', 10),
(nextval('public.hibernate_sequence'), 'IA_STATE_INCOME', 'IA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '19', 10),
(nextval('public.hibernate_sequence'), 'KS_STATE_INCOME', 'KS State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '20', 10),
(nextval('public.hibernate_sequence'), 'KY_STATE_INCOME', 'KY State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '21', 10),
(nextval('public.hibernate_sequence'), 'LA_STATE_INCOME', 'LA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '22', 10),
(nextval('public.hibernate_sequence'), 'ME_STATE_INCOME', 'ME State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '23', 10),
(nextval('public.hibernate_sequence'), 'MD_STATE_INCOME', 'MD State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '24', 10),
(nextval('public.hibernate_sequence'), 'MA_STATE_INCOME', 'MA State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '25', 10),
(nextval('public.hibernate_sequence'), 'MI_STATE_INCOME', 'MI State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '26', 10),
(nextval('public.hibernate_sequence'), 'MN_STATE_INCOME', 'MN State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '27', 10),
(nextval('public.hibernate_sequence'), 'MS_STATE_INCOME', 'MS State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '28', 10),
(nextval('public.hibernate_sequence'), 'MO_STATE_INCOME', 'MO State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '29', 10),
(nextval('public.hibernate_sequence'), 'MT_STATE_INCOME', 'MT State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '30', 10),
(nextval('public.hibernate_sequence'), 'NE_STATE_INCOME', 'NE State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '31', 10),
(nextval('public.hibernate_sequence'), 'NJ_STATE_INCOME', 'NJ State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '34', 10),
(nextval('public.hibernate_sequence'), 'NM_STATE_INCOME', 'NM State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '35', 10),
(nextval('public.hibernate_sequence'), 'NY_STATE_INCOME', 'NY State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '36', 10),
(nextval('public.hibernate_sequence'), 'NC_STATE_INCOME', 'NC State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '37', 10),
(nextval('public.hibernate_sequence'), 'ND_STATE_INCOME', 'ND State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '38', 10),
(nextval('public.hibernate_sequence'), 'OH_STATE_INCOME', 'OH State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '39', 10),
(nextval('public.hibernate_sequence'), 'OK_STATE_INCOME', 'OK State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '40', 10),
(nextval('public.hibernate_sequence'), 'OR_STATE_INCOME', 'OR State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '41', 10),
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', 'PA State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '42', 10),
(nextval('public.hibernate_sequence'), 'RI_STATE_INCOME', 'RI State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '44', 10),
(nextval('public.hibernate_sequence'), 'SC_STATE_INCOME', 'SC State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '45', 10),
(nextval('public.hibernate_sequence'), 'UT_STATE_INCOME', 'UT State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '49', 10),
(nextval('public.hibernate_sequence'), 'VT_STATE_INCOME', 'VT State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '50', 10),
(nextval('public.hibernate_sequence'), 'VA_STATE_INCOME', 'VA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '51', 10),
(nextval('public.hibernate_sequence'), 'WV_STATE_INCOME', 'WV State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '54', 10),
(nextval('public.hibernate_sequence'), 'WI_STATE_INCOME', 'WI State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', '55', 10)
;

-- income_tax_definition
INSERT INTO public.income_tax_definition(id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
VALUES
(nextval('public.hibernate_sequence'), 'AL_STATE_INCOME', true, false, 2000, 4000, 2000, 2000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'AZ_STATE_INCOME', true, true, 5183, 10336, 5183, 10336, 2150, 4300, 2150, 2150, 2300),
(nextval('public.hibernate_sequence'), 'AR_STATE_INCOME', true, true, 2200, 4400, 2200, 2200, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'CA_STATE_INCOME', true, true, 4401, 8802, 4401, 4401, 0, 0, 0, 0, 1050),
(nextval('public.hibernate_sequence'), 'CO_STATE_INCOME', true, true, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'CT_STATE_INCOME', true, true, 0, 0, 0, 0, 2000, 4000, 2000, 2000, 0),
(nextval('public.hibernate_sequence'), 'DE_STATE_INCOME', true, true, 3250, 6500, 3250, 3250, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'DC_STATE_INCOME', true, true, 5650, 10275, 5650, 7800, 0, 0, 0, 0, 1175),
(nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', false, false, 2300, 3000, 2300, 2300, 2700, 7400, 2700, 2700, 3000),
(nextval('public.hibernate_sequence'), 'HI_STATE_INCOME', true, true, 2200, 4400, 2200, 3212, 1144, 1144, 1144, 1144, 1144),
(nextval('public.hibernate_sequence'), 'ID_STATE_INCOME', true, false, 12000, 24000, 12000, 18000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'IL_STATE_INCOME', false, true, 0, 0, 0, 0, 2225, 2225, 2225, 2225, 0),
(nextval('public.hibernate_sequence'), 'IN_STATE_INCOME', true, true, 0, 0, 0, 0, 1000, 2000, 1000, 1000, 1500),
(nextval('public.hibernate_sequence'), 'IA_STATE_INCOME', true, true, 2030, 5000, 2030, 5000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'KS_STATE_INCOME', true, true, 3000, 7500, 3750, 5500, 2250, 2250, 2250, 2250, 2250),
(nextval('public.hibernate_sequence'), 'KY_STATE_INCOME', true, true, 2530, 2350, 2350, 2350, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'LA_STATE_INCOME', true, true, 4500, 9000, 4500, 9000, 0, 0, 0, 0, 1000),
(nextval('public.hibernate_sequence'), 'ME_STATE_INCOME', true, true, 12000, 24000, 12000, 18000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'MD_STATE_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'MA_STATE_INCOME', true, true, 0, 0, 0, 0, 4400, 8800, 4400, 6800, 1000),
(nextval('public.hibernate_sequence'), 'MI_STATE_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'MN_STATE_INCOME', true, true, 6500, 13000, 6500, 6500, 4150, 4150, 4150, 4150, 4150),
(nextval('public.hibernate_sequence'), 'MS_STATE_INCOME', true, true, 2300, 4600, 2300, 3400, 6000, 12000, 6000, 8000, 1500),
(nextval('public.hibernate_sequence'), 'MO_STATE_INCOME', true, true, 12000, 24000, 12000, 18000, 2100, 4200, 2100, 3500, 1200),
(nextval('public.hibernate_sequence'), 'MT_STATE_INCOME', true, true, 4580, 9016, 4580, 9160, 2440, 2440, 2440, 2440, 2440),
(nextval('public.hibernate_sequence'), 'NE_STATE_INCOME', true, true, 6750, 13500, 6750, 9900, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'NJ_STATE_INCOME', true, true, 0, 0, 0, 0, 1000, 2000, 1000, 1000, 1500),
(nextval('public.hibernate_sequence'), 'NM_STATE_INCOME', true, true, 12000, 24000, 12000, 18000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'NY_STATE_INCOME', true, true, 3000, 15000, 3000, 3000, 0, 0, 0, 0, 1000),
(nextval('public.hibernate_sequence'), 'NC_STATE_INCOME', true, true, 8750, 17500, 8750, 14000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'ND_STATE_INCOME', true, true, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'OH_STATE_INCOME', false, true, 0, 0, 0, 0, 2050, 4100, 2050, 4100, 2050),
(nextval('public.hibernate_sequence'), 'OK_STATE_INCOME', true, true, 6350, 12700, 6350, 9350, 1000, 2000, 1000, 1000, 1000),
(nextval('public.hibernate_sequence'), 'OR_STATE_INCOME', true, true, 2175, 4350, 2175, 2175, 90, 180, 90, 90, 90),
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', false, false, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'RI_STATE_INCOME', false, true, 8525, 17050, 8525, 12800, 4000, 8000, 4000, 4000, 4000),
(nextval('public.hibernate_sequence'), 'SC_STATE_INCOME', true, true, 12000, 24000, 12000, 12000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'UT_STATE_INCOME', false, false, 0, 0, 0, 0, 565, 1130, 565, 565, 565),
(nextval('public.hibernate_sequence'), 'VT_STATE_INCOME', true, true, 12000, 24000, 12000, 12000, 0, 0, 0, 0, 0),
(nextval('public.hibernate_sequence'), 'VA_STATE_INCOME', true, true, 3000, 6000, 3000, 3000, 930, 1860, 930, 930, 930),
(nextval('public.hibernate_sequence'), 'WV_STATE_INCOME', true, true, 0, 0, 0, 0, 2000, 2000, 2000, 2000, 2000),
(nextval('public.hibernate_sequence'), 'WI_STATE_INCOME', true, true, 10380, 19210, 10380, 10380, 700, 1400, 700, 700, 700)
;

-- Alabama
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

-- Arizona
-- tax_rate_set AZ state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(4001, 'AZ_STATE_INCOME', 'SINGLE'),
(4002, 'AZ_STATE_INCOME', 'JOINT'),
(4003, 'AZ_STATE_INCOME', 'MARRIED_SEPARATE'),
(4004, 'AZ_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate AZ state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(4001, 'AZ_STATE_INCOME', 0.0259, 0, 10346),
(4002, 'AZ_STATE_INCOME', 0.0288, 10346, 25861),
(4003, 'AZ_STATE_INCOME', 0.0336, 25861, 51721),
(4004, 'AZ_STATE_INCOME', 0.0424, 51721, 155159),
(4005, 'AZ_STATE_INCOME', 0.0454, 155159, null),
-- Joint, Head of Household
(4006, 'AZ_STATE_INCOME', 0.0259, 0, 20690),
(4007, 'AZ_STATE_INCOME', 0.0288, 20690, 51721),
(4008, 'AZ_STATE_INCOME', 0.0336, 51721, 103440),
(4009, 'AZ_STATE_INCOME', 0.0424, 103440, 310317),
(4010, 'AZ_STATE_INCOME', 0.0454, 310317, null)
;

-- tax_rate_set_tax_rates AZ state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- AZ State Income - Single
(4001, 4001),
(4001, 4002),
(4001, 4003),
(4001, 4004),
(4001, 4005),
-- AZ State Income - Joint
(4002, 4006),
(4002, 4007),
(4002, 4008),
(4002, 4009),
(4002, 4010),
-- AZ State Income - Married Separate
(4003, 4001),
(4003, 4002),
(4003, 4003),
(4003, 4004),
(4003, 4005),
-- AZ State Income - Head of Household
(4004, 4006),
(4004, 4007),
(4004, 4008),
(4004, 4009),
(4004, 4010)
;

-- Arkansas
-- tax_rate_set AR state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(5001, 'AR_STATE_INCOME', 'SINGLE'),
(5002, 'AR_STATE_INCOME', 'JOINT'),
(5003, 'AR_STATE_INCOME', 'MARRIED_SEPARATE'),
(5004, 'AR_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate AR state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(5001, 'AR_STATE_INCOME', 0.009, 0, 4399),
(5002, 'AR_STATE_INCOME', 0.024, 4399, 8699),
(5003, 'AR_STATE_INCOME', 0.034, 8699, 13099),
(5004, 'AR_STATE_INCOME', 0.044, 13099, 21699),
(5005, 'AR_STATE_INCOME', 0.05, 21699, 36299),
(5006, 'AR_STATE_INCOME', 0.06, 36299, 77400),
(5007, 'AR_STATE_INCOME', 0.069, 77400, null)
;

-- tax_rate_set_tax_rates AR state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- AR State Income - Single
(5001, 5001),
(5001, 5002),
(5001, 5003),
(5001, 5004),
(5001, 5005),
(5001, 5006),
(5001, 5007),
-- AR State Income - Joint
(5002, 5001),
(5002, 5002),
(5002, 5003),
(5002, 5004),
(5002, 5005),
(5002, 5006),
(5002, 5007),
-- AR State Income - Married Separate
(5003, 5001),
(5003, 5002),
(5003, 5003),
(5003, 5004),
(5003, 5005),
(5003, 5006),
(5003, 5007),
-- AR State Income - Head of Household
(5004, 5001),
(5004, 5002),
(5004, 5003),
(5004, 5004),
(5004, 5005),
(5004, 5006),
(5004, 5007)
;

-- California
-- tax_rate_set CA state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(6001, 'CA_STATE_INCOME', 'SINGLE'),
(6002, 'CA_STATE_INCOME', 'JOINT'),
(6003, 'CA_STATE_INCOME', 'MARRIED_SEPARATE'),
(6004, 'CA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate CA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(6001, 'CA_STATE_INCOME', 0.01, 0, 8544),
(6002, 'CA_STATE_INCOME', 0.02, 8544, 20255),
(6003, 'CA_STATE_INCOME', 0.04, 20255, 31969),
(6004, 'CA_STATE_INCOME', 0.06, 31969, 44377),
(6005, 'CA_STATE_INCOME', 0.08, 44377, 56085),
(6006, 'CA_STATE_INCOME', 0.093, 56085, 286492),
(6007, 'CA_STATE_INCOME', 0.103, 286492, 343788),
(6008, 'CA_STATE_INCOME', 0.113, 343788, 572980),
(6009, 'CA_STATE_INCOME', 0.123, 572980, 1000000),
(6010, 'CA_STATE_INCOME', 0.133, 1000000, null),
-- Joint
(6011, 'CA_STATE_INCOME', 0.01, 0, 17088),
(6012, 'CA_STATE_INCOME', 0.02, 17088, 40510),
(6013, 'CA_STATE_INCOME', 0.04, 40510, 63938),
(6014, 'CA_STATE_INCOME', 0.06, 63938, 88754),
(6015, 'CA_STATE_INCOME', 0.08, 88754, 112170),
(6016, 'CA_STATE_INCOME', 0.093, 112170, 572984),
(6017, 'CA_STATE_INCOME', 0.103, 572984, 687576),
(6018, 'CA_STATE_INCOME', 0.113, 687576, 1145960),
(6019, 'CA_STATE_INCOME', 0.123, 1145960, 2000000),
(6020, 'CA_STATE_INCOME', 0.133, 2000000, null),
-- Head of Household
(6021, 'CA_STATE_INCOME', 0.01, 0, 17099),
(6022, 'CA_STATE_INCOME', 0.02, 17099, 40512),
(6023, 'CA_STATE_INCOME', 0.04, 40512, 52224),
(6024, 'CA_STATE_INCOME', 0.06, 52224, 64632),
(6025, 'CA_STATE_INCOME', 0.08, 64632, 76343),
(6026, 'CA_STATE_INCOME', 0.093, 76343, 389627),
(6027, 'CA_STATE_INCOME', 0.103, 389627, 467553),
(6028, 'CA_STATE_INCOME', 0.113, 467553, 779253),
(6029, 'CA_STATE_INCOME', 0.123, 779253, 2000000),
(6030, 'CA_STATE_INCOME', 0.133, 2000000, null)
;

-- tax_rate_set_tax_rates CA state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- CA State Income - Single
(6001, 6001),
(6001, 6002),
(6001, 6003),
(6001, 6004),
(6001, 6005),
(6001, 6006),
(6001, 6007),
(6001, 6008),
(6001, 6009),
(6001, 6010),
-- CA State Income - Joint
(6002, 6011),
(6002, 6012),
(6002, 6013),
(6002, 6014),
(6002, 6015),
(6002, 6016),
(6002, 6017),
(6002, 6018),
(6002, 6019),
(6002, 6020),
-- CA State Income - Married Separate
(6003, 6001),
(6003, 6002),
(6003, 6003),
(6003, 6004),
(6003, 6005),
(6003, 6006),
(6003, 6007),
(6003, 6008),
(6003, 6009),
(6003, 6010),
-- CA State Income - Head of Household
(6004, 6021),
(6004, 6022),
(6004, 6023),
(6004, 6024),
(6004, 6025),
(6004, 6026),
(6004, 6027),
(6004, 6028),
(6004, 6029),
(6004, 6030)
;

-- Colorado
-- tax_rate CO state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(8001, 'CO_STATE_INCOME', 0.0463, null, null)
;

-- Connecticut
-- tax_rate_set CT state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(9001, 'CT_STATE_INCOME', 'SINGLE'),
(9002, 'CT_STATE_INCOME', 'JOINT'),
(9003, 'CT_STATE_INCOME', 'MARRIED_SEPARATE'),
(9004, 'CT_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate CT state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(9001, 'CT_STATE_INCOME', 0.03, 0, 10000),
(9002, 'CT_STATE_INCOME', 0.05, 10000, 50000),
(9003, 'CT_STATE_INCOME', 0.055, 50000, 100000),
(9004, 'CT_STATE_INCOME', 0.06, 100000, 200000),
(9005, 'CT_STATE_INCOME', 0.065, 200000, 250000),
(9006, 'CT_STATE_INCOME', 0.069, 250000, 500000),
(9007, 'CT_STATE_INCOME', 0.0699, 500000, null),
-- Joint
(9008, 'CT_STATE_INCOME', 0.03, 0, 20000),
(9009, 'CT_STATE_INCOME', 0.05, 20000, 100000),
(9010, 'CT_STATE_INCOME', 0.055, 100000, 200000),
(9011, 'CT_STATE_INCOME', 0.06, 200000, 400000),
(9012, 'CT_STATE_INCOME', 0.065, 400000, 500000),
(9013, 'CT_STATE_INCOME', 0.069, 500000, 1000000),
(9014, 'CT_STATE_INCOME', 0.0699, 1000000, null),
-- Head of Household
(9015, 'CT_STATE_INCOME', 0.03, 0, 16000),
(9016, 'CT_STATE_INCOME', 0.05, 16000, 80000),
(9017, 'CT_STATE_INCOME', 0.055, 80000, 160000),
(9018, 'CT_STATE_INCOME', 0.06, 160000, 320000),
(9019, 'CT_STATE_INCOME', 0.065, 320000, 400000),
(9020, 'CT_STATE_INCOME', 0.069, 400000, 800000),
(9021, 'CT_STATE_INCOME', 0.0699, 800000, null)
;

-- tax_rate_set_tax_rates CT state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- CT State Income - Single
(9001, 9001),
(9001, 9002),
(9001, 9003),
(9001, 9004),
(9001, 9005),
(9001, 9006),
(9001, 9007),
-- CT State Income - Joint
(9002, 9008),
(9002, 9009),
(9002, 9010),
(9002, 9011),
(9002, 9012),
(9002, 9013),
(9002, 9014),
-- CT State Income - Married Separate
(9003, 9001),
(9003, 9002),
(9003, 9003),
(9003, 9004),
(9003, 9005),
(9003, 9006),
(9003, 9007),
-- CT State Income - Head of Household
(9004, 9015),
(9004, 9016),
(9004, 9017),
(9004, 9018),
(9004, 9019),
(9004, 9020),
(9004, 9021)
;

-- Delaware
-- tax_rate_set DE state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(10001, 'DE_STATE_INCOME', 'SINGLE'),
(10002, 'DE_STATE_INCOME', 'JOINT'),
(10003, 'DE_STATE_INCOME', 'MARRIED_SEPARATE'),
(10004, 'DE_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate DE state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(10001, 'DE_STATE_INCOME', 0.0, 0, 2000),
(10002, 'DE_STATE_INCOME', 0.022, 2000, 5000),
(10003, 'DE_STATE_INCOME', 0.039, 5000, 10000),
(10004, 'DE_STATE_INCOME', 0.048, 10000, 20000),
(10005, 'DE_STATE_INCOME', 0.052, 20000, 25000),
(10006, 'DE_STATE_INCOME', 0.0555, 25000, 60000),
(10007, 'DE_STATE_INCOME', 0.066, 60000, null)
;

-- tax_rate_set_tax_rates DE state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- DE State Income - Single
(10001, 10001),
(10001, 10002),
(10001, 10003),
(10001, 10004),
(10001, 10005),
(10001, 10006),
(10001, 10007),
-- DE State Income - Joint
(10002, 10001),
(10002, 10002),
(10002, 10003),
(10002, 10004),
(10002, 10005),
(10002, 10006),
(10002, 10007),
-- DE State Income - Married Separate
(10003, 10001),
(10003, 10002),
(10003, 10003),
(10003, 10004),
(10003, 10005),
(10003, 10006),
(10003, 10007),
-- DE State Income - Head of Household
(10004, 10001),
(10004, 10002),
(10004, 10003),
(10004, 10004),
(10004, 10005),
(10004, 10006),
(10004, 10007)
;

-- District of Columbia
-- tax_rate_set DC state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(11001, 'DC_STATE_INCOME', 'SINGLE'),
(11002, 'DC_STATE_INCOME', 'JOINT'),
(11003, 'DC_STATE_INCOME', 'MARRIED_SEPARATE'),
(11004, 'DC_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate DC state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(11001, 'DE_STATE_INCOME', 0.04, 0, 10000),
(11002, 'DE_STATE_INCOME', 0.06, 10000, 40000),
(11003, 'DE_STATE_INCOME', 0.065, 40000, 60000),
(11004, 'DE_STATE_INCOME', 0.085, 60000, 350000),
(11005, 'DE_STATE_INCOME', 0.0875, 350000, 1000000),
(11006, 'DE_STATE_INCOME', 0.0895, 1000000, null)
;

-- tax_rate_set_tax_rates DE state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- DC State Income - Single
(11001, 10001),
(11001, 10002),
(11001, 10003),
(11001, 10004),
(11001, 10005),
(11001, 10006),
-- DC State Income - Joint
(11002, 10001),
(11002, 10002),
(11002, 10003),
(11002, 10004),
(11002, 10005),
(11002, 10006),
-- DC State Income - Married Separate
(11003, 10001),
(11003, 10002),
(11003, 10003),
(11003, 10004),
(11003, 10005),
(11003, 10006),
-- DC State Income - Head of Household
(11004, 10001),
(11004, 10002),
(11004, 10003),
(11004, 10004),
(11004, 10005),
(11004, 10006)
;

-- Georgia
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

-- Hawaii
-- tax_rate_set HI state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(15001, 'HI_STATE_INCOME', 'SINGLE'),
(15002, 'HI_STATE_INCOME', 'JOINT'),
(15003, 'HI_STATE_INCOME', 'MARRIED_SEPARATE'),
(15004, 'HI_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate HI state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(15001, 'HI_STATE_INCOME', 0.014, 0, 2400),
(15002, 'HI_STATE_INCOME', 0.032, 2400, 4800),
(15003, 'HI_STATE_INCOME', 0.055, 4800, 9600),
(15004, 'HI_STATE_INCOME', 0.064, 9600, 14400),
(15005, 'HI_STATE_INCOME', 0.068, 14400, 19200),
(15006, 'HI_STATE_INCOME', 0.072, 19200, 24000),
(15007, 'HI_STATE_INCOME', 0.076, 24000, 36000),
(15008, 'HI_STATE_INCOME', 0.079, 36000, 48000),
(15009, 'HI_STATE_INCOME', 0.0825, 48000, 150000),
(15010, 'HI_STATE_INCOME', 0.09, 150000, 175000),
(15111, 'HI_STATE_INCOME', 0.10, 175000, 200000),
(15112, 'HI_STATE_INCOME', 0.11, 200000, null),
-- Joint
(15011, 'HI_STATE_INCOME', 0.014, 0, 4800),
(15012, 'HI_STATE_INCOME', 0.032, 4800, 9600),
(15013, 'HI_STATE_INCOME', 0.055, 9600, 19200),
(15014, 'HI_STATE_INCOME', 0.064, 19200, 28800),
(15015, 'HI_STATE_INCOME', 0.068, 28800, 38400),
(15016, 'HI_STATE_INCOME', 0.072, 38400, 48000),
(15017, 'HI_STATE_INCOME', 0.076, 48000, 72000),
(15018, 'HI_STATE_INCOME', 0.079, 72000, 96000),
(15019, 'HI_STATE_INCOME', 0.0825, 96000, 300000),
(15020, 'HI_STATE_INCOME', 0.09, 300000, 350000),
(15121, 'HI_STATE_INCOME', 0.10, 350000, 400000),
(15122, 'HI_STATE_INCOME', 0.11, 400000, null),
-- Head of Household
(15031, 'HI_STATE_INCOME', 0.0, 0, 3600),
(15032, 'HI_STATE_INCOME', 0.0, 3600, 7200),
(15033, 'HI_STATE_INCOME', 0.0, 7200, 14400),
(15034, 'HI_STATE_INCOME', 0.0, 14400, 21600),
(15035, 'HI_STATE_INCOME', 0.0, 21600, 28800),
(15036, 'HI_STATE_INCOME', 0.0, 28800, 36000),
(15037, 'HI_STATE_INCOME', 0.0, 36000, 54000),
(15038, 'HI_STATE_INCOME', 0.0, 54000, 72000),
(15039, 'HI_STATE_INCOME', 0.0, 72000, 225000),
(15040, 'HI_STATE_INCOME', 0.0, 225000, 262500),
(15141, 'HI_STATE_INCOME', 0.0, 262500, 300000),
(15142, 'HI_STATE_INCOME', 0.0, 300000, null)
;

-- tax_rate_set_tax_rates HI state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- HI State Income - Single
(15001, 15001),
(15001, 15002),
(15001, 15003),
(15001, 15004),
(15001, 15005),
(15001, 15006),
(15001, 15007),
(15001, 15008),
(15001, 15009),
(15001, 15010),
(15001, 15111),
(15001, 15112),
-- HI State Income - Joint
(15002, 15011),
(15002, 15012),
(15002, 15013),
(15002, 15014),
(15002, 15015),
(15002, 15016),
(15002, 15017),
(15002, 15018),
(15002, 15019),
(15002, 15020),
(15002, 15121),
(15002, 15122),
-- HI State Income - Married Separate
(15003, 15001),
(15003, 15002),
(15003, 15003),
(15003, 15004),
(15003, 15005),
(15003, 15006),
(15003, 15007),
(15003, 15008),
(15003, 15009),
(15003, 15010),
(15003, 15111),
(15003, 15112),
-- HI State Income - Head of Household
(15004, 15031),
(15004, 15032),
(15004, 15033),
(15004, 15034),
(15004, 15035),
(15004, 15036),
(15004, 15037),
(15004, 15038),
(15004, 15039),
(15004, 15040),
(15004, 15141),
(15004, 15142)
;

-- Idaho
-- tax_rate_set ID state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(16001, 'ID_STATE_INCOME', 'SINGLE'),
(16002, 'ID_STATE_INCOME', 'JOINT'),
(16003, 'ID_STATE_INCOME', 'MARRIED_SEPARATE'),
(16004, 'ID_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate ID state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(16001, 'ID_STATE_INCOME', 0.01125, 0, 1504),
(16002, 'ID_STATE_INCOME', 0.03125, 1504, 3008),
(16003, 'ID_STATE_INCOME', 0.03625, 3008, 4511),
(16004, 'ID_STATE_INCOME', 0.04625, 4511, 6015),
(16005, 'ID_STATE_INCOME', 0.05625, 6015, 7519),
(16006, 'ID_STATE_INCOME', 0.06625, 7519, 11279),
(16010, 'ID_STATE_INCOME', 0.06925, 11279, null),
-- Joint, Head of Household
(16011, 'ID_STATE_INCOME', 0.01125, 0, 3008),
(16012, 'ID_STATE_INCOME', 0.03125, 3008, 6016),
(16013, 'ID_STATE_INCOME', 0.03625, 6016, 9022),
(16014, 'ID_STATE_INCOME', 0.04625, 9022, 12030),
(16015, 'ID_STATE_INCOME', 0.05625, 12030, 15038),
(16016, 'ID_STATE_INCOME', 0.06625, 15038, 22558),
(16020, 'ID_STATE_INCOME', 0.06925, 22558, null)
;

-- tax_rate_set_tax_rates ID state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- ID State Income - Single
(16001, 16001),
(16001, 16002),
(16001, 16003),
(16001, 16004),
(16001, 16005),
(16001, 16006),
(16001, 16010),
-- ID State Income - Joint
(16002, 16011),
(16002, 16012),
(16002, 16013),
(16002, 16014),
(16002, 16015),
(16002, 16016),
(16002, 16020),
-- ID State Income - Married Separate
(16003, 16001),
(16003, 16002),
(16003, 16003),
(16003, 16004),
(16003, 16005),
(16003, 16006),
(16003, 16010),
-- ID State Income - Head of Household
(16004, 16011),
(16004, 16012),
(16004, 16013),
(16004, 16014),
(16004, 16015),
(16004, 16016),
(16004, 16020)
;

-- Illinois
-- tax_rate IL state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(17001, 'IL_STATE_INCOME', 0.0495, null, null)
;

-- Indiana
-- tax_rate IN state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(18001, 'IN_STATE_INCOME', 0.0323, null, null)
;

-- Iowa
-- tax_rate_set IA state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(19001, 'IA_STATE_INCOME', 'SINGLE'),
(19002, 'IA_STATE_INCOME', 'JOINT'),
(19003, 'IA_STATE_INCOME', 'MARRIED_SEPARATE'),
(19004, 'IA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate IA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(19001, 'IA_STATE_INCOME', 0.0036, 0, 1598),
(19002, 'IA_STATE_INCOME', 0.0072, 1598, 3196),
(19003, 'IA_STATE_INCOME', 0.0243, 3196, 6392),
(19004, 'IA_STATE_INCOME', 0.045, 6392, 14382),
(19005, 'IA_STATE_INCOME', 0.0612, 14382, 23970),
(19006, 'IA_STATE_INCOME', 0.0648, 23970, 31960),
(19007, 'IA_STATE_INCOME', 0.068, 31960, 47940),
(19008, 'IA_STATE_INCOME', 0.0792, 47940, 71910),
(19010, 'IA_STATE_INCOME', 0.0898, 71910, null)
;

-- tax_rate_set_tax_rates IA state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- IA State Income - Single
(19001, 19001),
(19001, 19002),
(19001, 19003),
(19001, 19004),
(19001, 19005),
(19001, 19006),
(19001, 19007),
(19001, 19008),
(19001, 19010),
-- IA State Income - Joint
(19002, 19001),
(19002, 19002),
(19002, 19003),
(19002, 19004),
(19002, 19005),
(19002, 19006),
(19002, 19007),
(19002, 19008),
(19002, 19010),
-- IA State Income - Married Separate
(19003, 19001),
(19003, 19002),
(19003, 19003),
(19003, 19004),
(19003, 19005),
(19003, 19006),
(19003, 19007),
(19003, 19008),
(19003, 19010),
-- IA State Income - Head of Household
(19004, 19001),
(19004, 19002),
(19004, 19003),
(19004, 19004),
(19004, 19005),
(19004, 19006),
(19004, 19007),
(19004, 19008),
(19004, 19010)
;

-- Kansas
-- tax_rate_set KS state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(20001, 'KS_STATE_INCOME', 'SINGLE'),
(20002, 'KS_STATE_INCOME', 'JOINT'),
(20003, 'KS_STATE_INCOME', 'MARRIED_SEPARATE'),
(20004, 'KS_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate KS state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate, Head of Household
(20001, 'KS_STATE_INCOME', 0.031, 0, 15000),
(20002, 'KS_STATE_INCOME', 0.0525, 15000, 30000),
(20010, 'KS_STATE_INCOME', 0.057, 30000, null),
-- Joint
(20011, 'KS_STATE_INCOME', 0.031, 0, 30000),
(20012, 'KS_STATE_INCOME', 0.0525, 30000, 60000),
(20020, 'KS_STATE_INCOME', 0.057, 60000, null)
;

-- tax_rate_set_tax_rates KS state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- KS State Income - Single
(20001, 20001),
(20001, 20002),
(20001, 20010),
-- KS State Income - Joint
(20002, 20011),
(20002, 20012),
(20002, 20020),
-- KS State Income - Married Separate
(20003, 20001),
(20003, 20002),
(20003, 20010),
-- KS State Income - Head of Household
(20004, 20001),
(20004, 20002),
(20004, 20010)
;

-- Kentucky
-- tax_rate KY state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(21001, 'KY_STATE_INCOME', 0.05, null, null)
;

-- Louisisna
-- tax_rate_set LA state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(22001, 'LA_STATE_INCOME', 'SINGLE'),
(22002, 'LA_STATE_INCOME', 'JOINT'),
(22003, 'LA_STATE_INCOME', 'MARRIED_SEPARATE'),
(22004, 'LA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate LA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate, Head of Household
(22001, 'LA_STATE_INCOME', 0.02, 0, 12500),
(22002, 'LA_STATE_INCOME', 0.04, 12500, 50000),
(22010, 'LA_STATE_INCOME', 0.06, 50000, null),
-- Joint
(22011, 'LA_STATE_INCOME', 0.02, 0, 25000),
(22012, 'LA_STATE_INCOME', 0.04, 25000, 100000),
(22020, 'LA_STATE_INCOME', 0.06, 100000, null)
;

-- tax_rate_set_tax_rates LA state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- LA State Income - Single
(22001, 22001),
(22001, 22002),
(22001, 22010),
-- LA State Income - Joint
(22002, 22011),
(22002, 22012),
(22002, 22020),
-- LA State Income - Married Separate
(22003, 22001),
(22003, 22002),
(22003, 22010),
-- LA State Income - Head of Household
(22004, 22001),
(22004, 22002),
(22004, 22010)
;

-- Maine
-- tax_rate_set ME state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(23001, 'ME_STATE_INCOME', 'SINGLE'),
(23002, 'ME_STATE_INCOME', 'JOINT'),
(23003, 'ME_STATE_INCOME', 'MARRIED_SEPARATE'),
(23004, 'ME_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate ME state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(23001, 'ME_STATE_INCOME', 0.058, 0, 21450),
(23002, 'ME_STATE_INCOME', 0.0675, 21450, 50750),
(23010, 'ME_STATE_INCOME', 0.0715, 50750, null),
-- Joint
(23011, 'ME_STATE_INCOME', 0.058, 0, 42900),
(23012, 'ME_STATE_INCOME', 0.0675, 42900, 101550),
(23020, 'ME_STATE_INCOME', 0.0715, 101550, null),
-- Head of Household
(23031, 'ME_STATE_INCOME', 0.058, 0, 32150),
(23032, 'ME_STATE_INCOME', 0.0675, 32150, 76150),
(23040, 'ME_STATE_INCOME', 0.0715, 76150, null)
;

-- tax_rate_set_tax_rates ME state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- ME State Income - Single
(23001, 23001),
(23001, 23002),
(23001, 23010),
-- ME State Income - Joint
(23002, 23011),
(23002, 23012),
(23002, 23020),
-- ME State Income - Married Separate
(23003, 23001),
(23003, 23002),
(23003, 23010),
-- ME State Income - Head of Household
(23004, 23031),
(23004, 23032),
(23004, 23040)
;

-- Maryland
-- tax_rate_set MD state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(24001, 'MD_STATE_INCOME', 'SINGLE'),
(24002, 'MD_STATE_INCOME', 'JOINT'),
(24003, 'MD_STATE_INCOME', 'MARRIED_SEPARATE'),
(24004, 'MD_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate MD state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(24001, 'MD_STATE_INCOME', 0.02, 0, 1000),
(24002, 'MD_STATE_INCOME', 0.03, 1000, 2000),
(24003, 'MD_STATE_INCOME', 0.04, 2000, 3000),
(24004, 'MD_STATE_INCOME', 0.0475, 3000, 150000),
(24005, 'MD_STATE_INCOME', 0.05, 150000, 175000),
(24006, 'MD_STATE_INCOME', 0.0525, 175000, 225000),
(24007, 'MD_STATE_INCOME', 0.055, 225000, 300000),
(24010, 'MD_STATE_INCOME', 0.0575, 300000, null),
-- Joint, Head of Household
(24011, 'MD_STATE_INCOME', 0.02, 0, 1000),
(24012, 'MD_STATE_INCOME', 0.03, 1000, 2000),
(24013, 'MD_STATE_INCOME', 0.04, 2000, 3000),
(24014, 'MD_STATE_INCOME', 0.0475, 3000, 150000),
(24015, 'MD_STATE_INCOME', 0.05, 150000, 175000),
(24016, 'MD_STATE_INCOME', 0.0525, 175000, 225000),
(24017, 'MD_STATE_INCOME', 0.055, 225000, 300000),
(24020, 'MD_STATE_INCOME', 0.0575, 300000, null)
;

-- tax_rate_set_tax_rates MD state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- MD State Income - Single
(24001, 24001),
(24001, 24002),
(24001, 24003),
(24001, 24004),
(24001, 24005),
(24001, 24006),
(24001, 24007),
(24001, 24010),
-- MD State Income - Joint
(24002, 24011),
(24002, 24012),
(24002, 24013),
(24002, 24014),
(24002, 24015),
(24002, 24016),
(24002, 24017),
(24002, 24020),
-- MD State Income - Married Separate
(24003, 24001),
(24003, 24002),
(24003, 24003),
(24003, 24004),
(24003, 24005),
(24003, 24006),
(24003, 24007),
(24003, 24010),
-- MD State Income - Head of Household
(24004, 24011),
(24004, 24012),
(24004, 24013),
(24004, 24014),
(24004, 24015),
(24004, 24016),
(24004, 24017),
(24004, 24020)
;

-- Massachusetts
-- tax_rate MA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(25001, 'MA_STATE_INCOME', 0.0505, null, null)
;

-- Michigan
-- tax_rate MI state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(26001, 'MI_STATE_INCOME', 0.0425, null, null)
;

-- Minnesota
-- tax_rate_set MN state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(27001, 'MN_STATE_INCOME', 'SINGLE'),
(27002, 'MN_STATE_INCOME', 'JOINT'),
(27003, 'MN_STATE_INCOME', 'MARRIED_SEPARATE'),
(27004, 'MN_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate MN state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single
(27001, 'MN_STATE_INCOME', 0.0535, 0, 25890),
(27002, 'MN_STATE_INCOME', 0.0705, 25890, 85060),
(27003, 'MN_STATE_INCOME', 0.0785, 85060, 160020),
(27010, 'MN_STATE_INCOME', 0.0985, 160020, null),
-- Joint
(27011, 'MN_STATE_INCOME', 0.0535, 0, 37850),
(27012, 'MN_STATE_INCOME', 0.0705, 37850, 150380),
(27013, 'MN_STATE_INCOME', 0.0785, 150380, 266700),
(27020, 'MN_STATE_INCOME', 0.0985, 266700, null),
-- Married Separate
(27021, 'MN_STATE_INCOME', 0.0535, 0, 18930),
(27022, 'MN_STATE_INCOME', 0.0705, 18930, 75190),
(27023, 'MN_STATE_INCOME', 0.0785, 75190, 133350),
(27030, 'MN_STATE_INCOME', 0.0985, 133350, null),
-- Head of Household
(27031, 'MN_STATE_INCOME', 0.0535, 0, 31880),
(27032, 'MN_STATE_INCOME', 0.0705, 31880, 128090),
(27033, 'MN_STATE_INCOME', 0.0785, 128090, 213360),
(27040, 'MN_STATE_INCOME', 0.0985, 213360, null)
;

-- tax_rate_set_tax_rates MN state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- MN State Income - Single
(27001, 27001),
(27001, 27002),
(27001, 27003),
(27001, 27010),
-- MN State Income - Joint
(27002, 27011),
(27002, 27012),
(27002, 27013),
(27002, 27020),
-- MN State Income - Married Separate
(27003, 27021),
(27003, 27022),
(27003, 27023),
(27003, 27030),
-- MN State Income - Head of Household
(27004, 27031),
(27004, 27032),
(27004, 27033),
(27004, 27040)
;

-- Mississippi
-- tax_rate_set MS state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(28001, 'MS_STATE_INCOME', 'SINGLE'),
(28002, 'MS_STATE_INCOME', 'JOINT'),
(28003, 'MS_STATE_INCOME', 'MARRIED_SEPARATE'),
(28004, 'MS_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate MS state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(28001, 'MS_STATE_INCOME', 0.03, 0, 5000),
(28002, 'MS_STATE_INCOME', 0.04, 5000, 10000),
(28010, 'MS_STATE_INCOME', 0.05, 10000, null)
;

-- tax_rate_set_tax_rates MS state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- MS State Income - Single
(28001, 28001),
(28001, 28002),
(28001, 28010),
-- MS State Income - Joint
(28002, 28001),
(28002, 28002),
(28002, 28010),
-- MS State Income - Married Separate
(28003, 28001),
(28003, 28002),
(28003, 28010),
-- MS State Income - Head of Household
(28004, 28001),
(28004, 28002),
(28004, 28010)
;

-- Missouri
-- tax_rate_set MO state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(29001, 'MO_STATE_INCOME', 'SINGLE'),
(29002, 'MO_STATE_INCOME', 'JOINT'),
(29003, 'MO_STATE_INCOME', 'MARRIED_SEPARATE'),
(29004, 'MO_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate MO state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(29001, 'MO_STATE_INCOME', 0.0, 0, 102),
(29002, 'MO_STATE_INCOME', 0.015, 102, 1028),
(29003, 'MO_STATE_INCOME', 0.02, 1028, 2056),
(29004, 'MO_STATE_INCOME', 0.025, 2056, 3084),
(29005, 'MO_STATE_INCOME', 0.03, 3084, 4113),
(29006, 'MO_STATE_INCOME', 0.035, 4113, 5141),
(29007, 'MO_STATE_INCOME', 0.04, 5141, 6169),
(29008, 'MO_STATE_INCOME', 0.045, 6169, 7197),
(29009, 'MO_STATE_INCOME', 0.05, 7197, 8225),
(29010, 'MO_STATE_INCOME', 0.055, 8225, 9253),
(29111, 'MO_STATE_INCOME', 0.059, 9253, null)
;

-- tax_rate_set_tax_rates MO state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- MO State Income - Single
(29001, 29001),
(29001, 29002),
(29001, 29003),
(29001, 29004),
(29001, 29005),
(29001, 29006),
(29001, 29007),
(29001, 29008),
(29001, 29009),
(29001, 29010),
(29001, 29111),
-- MO State Income - Joint
(29002, 29001),
(29002, 29002),
(29002, 29003),
(29002, 29004),
(29002, 29005),
(29002, 29006),
(29002, 29007),
(29002, 29008),
(29002, 29009),
(29002, 29010),
(29002, 29111),
-- MO State Income - Married Separate
(29003, 29001),
(29003, 29002),
(29003, 29003),
(29003, 29004),
(29003, 29005),
(29003, 29006),
(29003, 29007),
(29003, 29008),
(29003, 29009),
(29003, 29010),
(29003, 29111),
-- MO State Income - Head of Household
(29004, 29001),
(29004, 29002),
(29004, 29003),
(29004, 29004),
(29004, 29005),
(29004, 29006),
(29004, 29007),
(29004, 29008),
(29004, 29009),
(29004, 29010),
(29004, 29111)
;

-- Montana
-- tax_rate_set MT state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(30001, 'MT_STATE_INCOME', 'SINGLE'),
(30002, 'MT_STATE_INCOME', 'JOINT'),
(30003, 'MT_STATE_INCOME', 'MARRIED_SEPARATE'),
(30004, 'MT_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate MT state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(30001, 'MT_STATE_INCOME', 0.01, 0, 3000),
(30002, 'MT_STATE_INCOME', 0.02, 3000, 5200),
(30003, 'MT_STATE_INCOME', 0.03, 5200, 8000),
(30004, 'MT_STATE_INCOME', 0.04, 8000, 10800),
(30005, 'MT_STATE_INCOME', 0.05, 10800, 13900),
(30006, 'MT_STATE_INCOME', 0.06, 13900, 17900),
(30010, 'MT_STATE_INCOME', 0.069, 17900, null)
;

-- tax_rate_set_tax_rates MT state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- MT State Income - Single
(30001, 30001),
(30001, 30002),
(30001, 30003),
(30001, 30004),
(30001, 30005),
(30001, 30006),
(30001, 30010),
-- MT State Income - Joint
(30002, 30001),
(30002, 30002),
(30002, 30003),
(30002, 30004),
(30002, 30005),
(30002, 30006),
(30002, 30010),
-- MT State Income - Married Separate
(30003, 30001),
(30003, 30002),
(30003, 30003),
(30003, 30004),
(30003, 30005),
(30003, 30006),
(30003, 30010),
-- MT State Income - Head of Household
(30004, 30001),
(30004, 30002),
(30004, 30003),
(30004, 30004),
(30004, 30005),
(30004, 30006),
(30004, 30010)
;

-- Nebraska
-- tax_rate_set NE state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(31001, 'NE_STATE_INCOME', 'SINGLE'),
(31002, 'NE_STATE_INCOME', 'JOINT'),
(31003, 'NE_STATE_INCOME', 'MARRIED_SEPARATE'),
(31004, 'NE_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate NE state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(31001, 'NE_STATE_INCOME', 0.0246, 0, 3150),
(31002, 'NE_STATE_INCOME', 0.0351, 3150, 18800),
(31003, 'NE_STATE_INCOME', 0.0501, 18800, 30420),
(31010, 'NE_STATE_INCOME', 0.0684, 30420, null),
-- Joint
(31011, 'NE_STATE_INCOME', 0.0246, 0, 6290),
(31012, 'NE_STATE_INCOME', 0.0351, 6290, 37770),
(31013, 'NE_STATE_INCOME', 0.0501, 37770, 60840),
(31020, 'NE_STATE_INCOME', 0.0684, 60840, null),
-- Head of Household
(31031, 'NE_STATE_INCOME', 0.0246, 0, 5870),
(31032, 'NE_STATE_INCOME', 0.0351, 5870, 30210),
(31033, 'NE_STATE_INCOME', 0.0501, 30210, 45110),
(31040, 'NE_STATE_INCOME', 0.0684, 45110, null)
;

-- tax_rate_set_tax_rates NE state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- NE State Income - Single
(31001, 31001),
(31001, 31002),
(31001, 31003),
(31001, 31010),
-- NE State Income - Joint
(31002, 31011),
(31002, 31012),
(31002, 31013),
(31002, 31020),
-- NE State Income - Married Separate
(31003, 31001),
(31003, 31002),
(31003, 31003),
(31003, 31010),
-- NE State Income - Head of Household
(31004, 31031),
(31004, 31032),
(31004, 31033),
(31004, 31040)
;

-- New Jersey
-- tax_rate_set NJ state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(34001, 'NJ_STATE_INCOME', 'SINGLE'),
(34002, 'NJ_STATE_INCOME', 'JOINT'),
(34003, 'NJ_STATE_INCOME', 'MARRIED_SEPARATE'),
(34004, 'NJ_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate NJ state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(34001, 'NJ_STATE_INCOME', 0.014, 0, 20000),
(34002, 'NJ_STATE_INCOME', 0.0175, 20000, 35000),
(34003, 'NJ_STATE_INCOME', 0.035, 35000, 40000),
(34004, 'NJ_STATE_INCOME', 0.05525, 40000, 75000),
(34005, 'NJ_STATE_INCOME', 0.0637, 75000, 500000),
(34006, 'NJ_STATE_INCOME', 0.0897, 500000, 5000000),
(34010, 'NJ_STATE_INCOME', 0.1075, 5000000, null),
-- Joint, Head of Household
(34011, 'NJ_STATE_INCOME', 0.014, 0, 20000),
(34012, 'NJ_STATE_INCOME', 0.0175, 20000, 50000),
(34013, 'NJ_STATE_INCOME', 0.0245, 50000, 70000),
(34014, 'NJ_STATE_INCOME', 0.035, 70000, 80000),
(34015, 'NJ_STATE_INCOME', 0.05525, 80000, 150000),
(34016, 'NJ_STATE_INCOME', 0.0637, 150000, 500000),
(34017, 'NJ_STATE_INCOME', 0.0897, 500000, 5000000),
(34020, 'NJ_STATE_INCOME', 0.1075, 5000000, null)
;

-- tax_rate_set_tax_rates NJ state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- NJ State Income - Single
(34001, 34001),
(34001, 34002),
(34001, 34003),
(34001, 34004),
(34001, 34005),
(34001, 34006),
(34001, 34010),
-- NJ State Income - Joint
(34002, 34011),
(34002, 34012),
(34002, 34013),
(34002, 34014),
(34002, 34015),
(34002, 34016),
(34002, 34017),
(34002, 34020),
-- NJ State Income - Married Separate
(34003, 34001),
(34003, 34002),
(34003, 34003),
(34003, 34004),
(34003, 34005),
(34003, 34006),
(34003, 34010),
-- NJ State Income - Head of Household
(34004, 34011),
(34004, 34012),
(34004, 34013),
(34004, 34014),
(34004, 34015),
(34004, 34016),
(34004, 34017),
(34004, 34020)
;

-- New Mexico
-- tax_rate_set NM state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(35001, 'NM_STATE_INCOME', 'SINGLE'),
(35002, 'NM_STATE_INCOME', 'JOINT'),
(35003, 'NM_STATE_INCOME', 'MARRIED_SEPARATE'),
(35004, 'NM_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate NM state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single
(35001, 'NM_STATE_INCOME', 0.017, 0, 5500),
(35002, 'NM_STATE_INCOME', 0.032, 5500, 11000),
(35003, 'NM_STATE_INCOME', 0.047, 11000, 16000),
(35010, 'NM_STATE_INCOME', 0.049, 16000, null),
-- Joint, Head of Household
(35011, 'NM_STATE_INCOME', 0.017, 0, 8000),
(35012, 'NM_STATE_INCOME', 0.032, 8000, 16000),
(35013, 'NM_STATE_INCOME', 0.047, 16000, 24000),
(35020, 'NM_STATE_INCOME', 0.049, 24000, null),
-- Married Separate
(35021, 'NM_STATE_INCOME', 0.017, 0, 4000),
(35022, 'NM_STATE_INCOME', 0.032, 4000, 8000),
(35023, 'NM_STATE_INCOME', 0.047, 8000, 12000),
(35030, 'NM_STATE_INCOME', 0.049, 12000, null)
;

-- tax_rate_set_tax_rates NM state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- NM State Income - Single
(35001, 35001),
(35001, 35002),
(35001, 35003),
(35001, 35010),
-- NM State Income - Joint
(35002, 35011),
(35002, 35012),
(35002, 35013),
(35002, 35020),
-- NM State Income - Married Separate
(35003, 35021),
(35003, 35022),
(35003, 35023),
(35003, 35030),
-- NM State Income - Head of Household
(35004, 35011),
(35004, 35012),
(35004, 35013),
(35004, 35020)
;

-- New York
-- tax_rate_set NY state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(36001, 'NY_STATE_INCOME', 'SINGLE'),
(36002, 'NY_STATE_INCOME', 'JOINT'),
(36003, 'NY_STATE_INCOME', 'MARRIED_SEPARATE'),
(36004, 'NY_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate NY state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(36001, 'NY_STATE_INCOME', 0.04, 0, 8500),
(36002, 'NY_STATE_INCOME', 0.045, 8500, 11700),
(36003, 'NY_STATE_INCOME', 0.0525, 11700, 13900),
(36004, 'NY_STATE_INCOME', 0.059, 13900, 21400),
(36005, 'NY_STATE_INCOME', 0.0645, 21400, 80650),
(36006, 'NY_STATE_INCOME', 0.0665, 80650, 215400),
(36007, 'NY_STATE_INCOME', 0.0685, 215400, 1077550),
(36010, 'NY_STATE_INCOME', 0.0882, 1077550, null),
-- Joint
(36011, 'NY_STATE_INCOME', 0.04, 0, 17150),
(36012, 'NY_STATE_INCOME', 0.045, 17150, 23600),
(36013, 'NY_STATE_INCOME', 0.0525, 23600, 27900),
(36014, 'NY_STATE_INCOME', 0.059, 27900, 43000),
(36015, 'NY_STATE_INCOME', 0.0645, 43000, 161550),
(36016, 'NY_STATE_INCOME', 0.0665, 161550, 323200),
(36017, 'NY_STATE_INCOME', 0.0685, 323200, 2155350),
(36020, 'NY_STATE_INCOME', 0.0882, 2155350, null),
-- Head of Household
(36031, 'NY_STATE_INCOME', 0.04, 0, 12800),
(36032, 'NY_STATE_INCOME', 0.045, 12800, 17650),
(36033, 'NY_STATE_INCOME', 0.0525, 17650, 20900),
(36034, 'NY_STATE_INCOME', 0.059, 20900, 32200),
(36035, 'NY_STATE_INCOME', 0.0645, 32200, 107650),
(36036, 'NY_STATE_INCOME', 0.0665, 107650, 269300),
(36037, 'NY_STATE_INCOME', 0.0685, 269300, 1616450),
(36040, 'NY_STATE_INCOME', 0.0882, 1616450, null)
;

-- tax_rate_set_tax_rates NY state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- NY State Income - Single
(36001, 36001),
(36001, 36002),
(36001, 36003),
(36001, 36004),
(36001, 36005),
(36001, 36006),
(36001, 36007),
(36001, 36010),
-- NY State Income - Joint
(36002, 36011),
(36002, 36012),
(36002, 36013),
(36002, 36014),
(36002, 36015),
(36002, 36016),
(36002, 36017),
(36002, 36020),
-- NY State Income - Married Separate
(36003, 36001),
(36003, 36002),
(36003, 36003),
(36003, 36004),
(36003, 36005),
(36003, 36006),
(36003, 36007),
(36003, 36010),
-- NY State Income - Head of Household
(36004, 36031),
(36004, 36032),
(36004, 36033),
(36004, 36034),
(36004, 36035),
(36004, 36036),
(36004, 36037),
(36004, 36040)
;

-- North Carolina
-- tax_rate NC state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(37001, 'NC_STATE_INCOME', 0.05499, null, null)
;

-- North Dakota
-- tax_rate_set ND state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(38001, 'ND_STATE_INCOME', 'SINGLE'),
(38002, 'ND_STATE_INCOME', 'JOINT'),
(38003, 'ND_STATE_INCOME', 'MARRIED_SEPARATE'),
(38004, 'ND_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate ND state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single
(38001, 'ND_STATE_INCOME', 0.011, 0, 38700),
(38002, 'ND_STATE_INCOME', 0.0204, 38700, 93700),
(38003, 'ND_STATE_INCOME', 0.0227, 93700, 195450),
(38004, 'ND_STATE_INCOME', 0.0264, 195450, 424950),
(38010, 'ND_STATE_INCOME', 0.029, 424950, null),
-- Joint
(38011, 'ND_STATE_INCOME', 0.011, 0, 64650),
(38012, 'ND_STATE_INCOME', 0.0204, 64650, 156150),
(38013, 'ND_STATE_INCOME', 0.0227, 156150, 237950),
(38014, 'ND_STATE_INCOME', 0.0264, 237950, 424950),
(38020, 'ND_STATE_INCOME', 0.029, 424950, null),
-- Married Separate
(38021, 'ND_STATE_INCOME', 0.011, 0, 32325),
(38022, 'ND_STATE_INCOME', 0.0204, 32325, 78075),
(38023, 'ND_STATE_INCOME', 0.0227, 78075, 118975),
(38024, 'ND_STATE_INCOME', 0.0264, 118975, 212475),
(38030, 'ND_STATE_INCOME', 0.029, 212475, null),
-- Head of Household
(38031, 'ND_STATE_INCOME', 0.011, 0, 51850),
(38032, 'ND_STATE_INCOME', 0.0204, 51850, 133850),
(38033, 'ND_STATE_INCOME', 0.0227, 133850, 216700),
(38034, 'ND_STATE_INCOME', 0.0264, 216700, 424950),
(38040, 'ND_STATE_INCOME', 0.029, 424950, null)
;

-- tax_rate_set_tax_rates ND state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- ND State Income - Single
(38001, 38001),
(38001, 38002),
(38001, 38003),
(38001, 38004),
(38001, 38010),
-- ND State Income - Joint
(38002, 38011),
(38002, 38012),
(38002, 38013),
(38002, 38014),
(38002, 38020),
-- ND State Income - Married Separate
(38003, 38021),
(38003, 38022),
(38003, 38023),
(38003, 38024),
(38003, 38030),
-- ND State Income - Head of Household
(38004, 38031),
(38004, 38032),
(38004, 38033),
(38004, 38034),
(38004, 38040)
;

-- Ohio
-- tax_rate_set OH state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(39001, 'OH_STATE_INCOME', 'SINGLE'),
(39002, 'OH_STATE_INCOME', 'JOINT'),
(39003, 'OH_STATE_INCOME', 'MARRIED_SEPARATE'),
(39004, 'OH_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate OH state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(39001, 'OH_STATE_INCOME', 0.0, 0, 10850),
(39002, 'OH_STATE_INCOME', 0.0198, 10850, 16300),
(39003, 'OH_STATE_INCOME', 0.02476, 16300, 21750),
(39004, 'OH_STATE_INCOME', 0.02969, 21750, 43450),
(39005, 'OH_STATE_INCOME', 0.03465, 43450, 86900),
(39006, 'OH_STATE_INCOME', 0.0396, 86900, 108700),
(39007, 'OH_STATE_INCOME', 0.04957, 108700, 217400),
(39010, 'OH_STATE_INCOME', 0.04997, 217400, null)
;

-- tax_rate_set_tax_rates OH state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- OH State Income - Single
(39001, 39001),
(39001, 39002),
(39001, 39003),
(39001, 39004),
(39001, 39005),
(39001, 39006),
(39001, 39007),
(39001, 39010),
-- OH State Income - Joint
(39002, 39001),
(39002, 39002),
(39002, 39003),
(39002, 39004),
(39002, 39005),
(39002, 39006),
(39002, 39007),
(39002, 39010),
-- OH State Income - Married Separate
(39003, 39001),
(39003, 39002),
(39003, 39003),
(39003, 39004),
(39003, 39005),
(39003, 39006),
(39003, 39007),
(39003, 39010),
-- OH State Income - Head of Household
(39004, 39001),
(39004, 39002),
(39004, 39003),
(39004, 39004),
(39004, 39005),
(39004, 39006),
(39004, 39007),
(39004, 39010)
;

-- Oklahoma
-- tax_rate_set OK state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(40001, 'OK_STATE_INCOME', 'SINGLE'),
(40002, 'OK_STATE_INCOME', 'JOINT'),
(40003, 'OK_STATE_INCOME', 'MARRIED_SEPARATE'),
(40004, 'OK_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate OK state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(40001, 'OK_STATE_INCOME', 0.005, 0, 1000),
(40002, 'OK_STATE_INCOME', 0.01, 1000, 2500),
(40003, 'OK_STATE_INCOME', 0.02, 2500, 3750),
(40004, 'OK_STATE_INCOME', 0.03, 3750, 4900),
(40005, 'OK_STATE_INCOME', 0.04, 4900, 7200),
(40010, 'OK_STATE_INCOME', 0.05, 7200, null),
-- Joint, Head of Household
(40011, 'OK_STATE_INCOME', 0.005, 0, 2000),
(40012, 'OK_STATE_INCOME', 0.01, 2000, 5000),
(40013, 'OK_STATE_INCOME', 0.02, 5000, 7500),
(40014, 'OK_STATE_INCOME', 0.03, 7500, 9800),
(40015, 'OK_STATE_INCOME', 0.04, 9800, 12200),
(40020, 'OK_STATE_INCOME', 0.05, 12200, null)
;

-- tax_rate_set_tax_rates OK state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- OK State Income - Single
(40001, 40001),
(40001, 40002),
(40001, 40003),
(40001, 40004),
(40001, 40005),
(40001, 40010),
-- OK State Income - Joint
(40002, 40011),
(40002, 40012),
(40002, 40013),
(40002, 40014),
(40002, 40015),
(40002, 40020),
-- OK State Income - Married Separate
(40003, 40001),
(40003, 40002),
(40003, 40003),
(40003, 40004),
(40003, 40005),
(40003, 40010),
-- OK State Income - Head of Household
(40004, 40011),
(40004, 40012),
(40004, 40013),
(40004, 40014),
(40004, 40015),
(40004, 40020)
;

-- Oregon
-- tax_rate_set OR state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(41001, 'OR_STATE_INCOME', 'SINGLE'),
(41002, 'OR_STATE_INCOME', 'JOINT'),
(41003, 'OR_STATE_INCOME', 'MARRIED_SEPARATE'),
(41004, 'OR_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate OR state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Married Separate
(41001, 'OR_STATE_INCOME', 0.05, 0, 3400),
(41002, 'OR_STATE_INCOME', 0.07, 3400, 8500),
(41003, 'OR_STATE_INCOME', 0.09, 8500, 125000),
(41010, 'OR_STATE_INCOME', 0.099, 125000, null),
-- Joint, Head of Household
(41011, 'OR_STATE_INCOME', 0.05, 0, 6800),
(41012, 'OR_STATE_INCOME', 0.07, 6800, 17000),
(41013, 'OR_STATE_INCOME', 0.09, 17000, 250000),
(41020, 'OR_STATE_INCOME', 0.099, 250000, null)
;

-- tax_rate_set_tax_rates OR state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- OR State Income - Single
(41001, 41001),
(41001, 41002),
(41001, 41003),
(41001, 41010),
-- OR State Income - Joint
(41002, 41011),
(41002, 41012),
(41002, 41013),
(41002, 41020),
-- OR State Income - Married Separate
(41003, 41001),
(41003, 41002),
(41003, 41003),
(41003, 41010),
-- OR State Income - Head of Household
(41004, 41011),
(41004, 41012),
(41004, 41013),
(41004, 41020)
;

-- Pennsylvania
-- tax_rate PA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(42001, 'PA_STATE_INCOME', 0.0307, null, null)
;

-- Rhode Island
-- tax_rate_set RI state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(44001, 'RI_STATE_INCOME', 'SINGLE'),
(44002, 'RI_STATE_INCOME', 'JOINT'),
(44003, 'RI_STATE_INCOME', 'MARRIED_SEPARATE'),
(44004, 'RI_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate RI state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(44001, 'RI_STATE_INCOME', 0.0375, 0, 62550),
(44002, 'RI_STATE_INCOME', 0.0475, 62550, 142150),
(44010, 'RI_STATE_INCOME', 0.0599, 142150, null)
;

-- tax_rate_set_tax_rates RI state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- RI State Income - Single
(44001, 44001),
(44001, 44002),
(44001, 44010),
-- RI State Income - Joint
(44002, 44001),
(44002, 44002),
(44002, 44010),
-- RI State Income - Married Separate
(44003, 44001),
(44003, 44002),
(44003, 44010),
-- RI State Income - Head of Household
(44004, 44001),
(44004, 44002),
(44004, 44010)
;

-- South Carolina
-- tax_rate_set SC state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(45001, 'SC_STATE_INCOME', 'SINGLE'),
(45002, 'SC_STATE_INCOME', 'JOINT'),
(45003, 'SC_STATE_INCOME', 'MARRIED_SEPARATE'),
(45004, 'SC_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate SC state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(45001, 'SC_STATE_INCOME', 0.0, 0, 2970),
(45002, 'SC_STATE_INCOME', 0.03, 2970, 5940),
(45003, 'SC_STATE_INCOME', 0.04, 5940, 8910),
(45004, 'SC_STATE_INCOME', 0.05, 8910, 11880),
(45005, 'SC_STATE_INCOME', 0.06, 11880, 14860),
(45010, 'SC_STATE_INCOME', 0.07, 14860, null)
;

-- tax_rate_set_tax_rates SC state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- SC State Income - Single
(45001, 45001),
(45001, 45002),
(45001, 45003),
(45001, 45004),
(45001, 45005),
(45001, 45010),
-- SC State Income - Joint
(45002, 45001),
(45002, 45002),
(45002, 45003),
(45002, 45004),
(45002, 45005),
(45002, 45010),
-- SC State Income - Married Separate
(45003, 45001),
(45003, 45002),
(45003, 45003),
(45003, 45004),
(45003, 45005),
(45003, 45010),
-- SC State Income - Head of Household
(45004, 45001),
(45004, 45002),
(45004, 45003),
(45004, 45004),
(45004, 45005),
(45004, 45010)
;

-- Utah
-- tax_rate UT state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(49001, 'UT_STATE_INCOME', 0.0495, null, null)
;

-- Vermont
-- tax_rate_set VT state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(50001, 'VT_STATE_INCOME', 'SINGLE'),
(50002, 'VT_STATE_INCOME', 'JOINT'),
(50003, 'VT_STATE_INCOME', 'MARRIED_SEPARATE'),
(50004, 'VT_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate VT state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single
(50001, 'VT_STATE_INCOME', 0.0335, 0, 38700),
(50002, 'VT_STATE_INCOME', 0.066, 38700, 93700),
(50003, 'VT_STATE_INCOME', 0.076, 93700, 195450),
(50010, 'VT_STATE_INCOME', 0.0875, 195450, null),
-- Joint
(50011, 'VT_STATE_INCOME', 0.0335, 0, 64600),
(50012, 'VT_STATE_INCOME', 0.066, 64600, 156150),
(50013, 'VT_STATE_INCOME', 0.076, 156150, 237950),
(50020, 'VT_STATE_INCOME', 0.0875, 237950, null),
-- Married Separate
(50021, 'VT_STATE_INCOME', 0.0335, 0, 32300),
(50022, 'VT_STATE_INCOME', 0.066, 32300, 78075),
(50023, 'VT_STATE_INCOME', 0.076, 78075, 118975),
(50030, 'VT_STATE_INCOME', 0.0875, 118975, null),
-- Head of Household
(50031, 'VT_STATE_INCOME', 0.0335, 0, 51850),
(50032, 'VT_STATE_INCOME', 0.066, 51850, 133850),
(50033, 'VT_STATE_INCOME', 0.076, 133850, 216700),
(50040, 'VT_STATE_INCOME', 0.0875, 216700, null)
;

-- tax_rate_set_tax_rates VT state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- VT State Income - Single
(50001, 50001),
(50001, 50002),
(50001, 50003),
(50001, 50010),
-- VT State Income - Joint
(50002, 50011),
(50002, 50012),
(50002, 50013),
(50002, 50020),
-- VT State Income - Married Separate
(50003, 50021),
(50003, 50022),
(50003, 50023),
(50003, 50030),
-- VT State Income - Head of Household
(50004, 50031),
(50004, 50032),
(50004, 50033),
(50004, 50040)
;

-- Virginia
-- tax_rate_set VA state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(51001, 'VA_STATE_INCOME', 'SINGLE'),
(51002, 'VA_STATE_INCOME', 'JOINT'),
(51003, 'VA_STATE_INCOME', 'MARRIED_SEPARATE'),
(51004, 'VA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate VA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(51001, 'VA_STATE_INCOME', 0.02, 0, 3000),
(51002, 'VA_STATE_INCOME', 0.03, 3000, 5000),
(51003, 'VA_STATE_INCOME', 0.05, 5000, 17000),
(51010, 'VA_STATE_INCOME', 0.0575, 17000, null)
;

-- tax_rate_set_tax_rates VA state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- VA State Income - Single
(51001, 51001),
(51001, 51002),
(51001, 51003),
(51001, 51010),
-- VA State Income - Joint
(51002, 51001),
(51002, 51002),
(51002, 51003),
(51002, 51010),
-- VA State Income - Married Separate
(51003, 51001),
(51003, 51002),
(51003, 51003),
(51003, 51010),
-- VA State Income - Head of Household
(51004, 51001),
(51004, 51002),
(51004, 51003),
(51004, 51010)
;

-- West Virginia
-- tax_rate_set WV state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(54001, 'WV_STATE_INCOME', 'SINGLE'),
(54002, 'WV_STATE_INCOME', 'JOINT'),
(54003, 'WV_STATE_INCOME', 'MARRIED_SEPARATE'),
(54004, 'WV_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate WV state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Head of Household
(54001, 'WV_STATE_INCOME', 0.03, 0, 10000),
(54002, 'WV_STATE_INCOME', 0.04, 10000, 25000),
(54003, 'WV_STATE_INCOME', 0.045, 25000, 40000),
(54004, 'WV_STATE_INCOME', 0.06, 40000, 60000),
(54010, 'WV_STATE_INCOME', 0.065, 60000, null),
-- Married Separate
(54021, 'WV_STATE_INCOME', 0.03, 0, 5000),
(54022, 'WV_STATE_INCOME', 0.04, 5000, 12500),
(54023, 'WV_STATE_INCOME', 0.045, 12500, 20000),
(54024, 'WV_STATE_INCOME', 0.06, 20000, 30000),
(54030, 'WV_STATE_INCOME', 0.065, 30000, null)
;

-- tax_rate_set_tax_rates WV state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- WV State Income - Single
(54001, 54001),
(54001, 54002),
(54001, 54003),
(54001, 54004),
(54001, 54010),
-- WV State Income - Joint
(54002, 54001),
(54002, 54002),
(54002, 54003),
(54002, 54004),
(54002, 54010),
-- WV State Income - Married Separate
(54003, 54021),
(54003, 54022),
(54003, 54023),
(54003, 54024),
(54003, 54030),
-- WV State Income - Head of Household
(54004, 54001),
(54004, 54002),
(54004, 54003),
(54004, 54004),
(54004, 54010)
;

-- Wisconsin
-- tax_rate_set WI state income
INSERT INTO public.tax_rate_set(id, tax_definition_key, tax_filing_status)
VALUES
(55001, 'WI_STATE_INCOME', 'SINGLE'),
(55002, 'WI_STATE_INCOME', 'JOINT'),
(55003, 'WI_STATE_INCOME', 'MARRIED_SEPARATE'),
(55004, 'WI_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
;

-- tax_rate WI state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Head of Household
(55001, 'WI_STATE_INCOME', 0.04, 0, 11450),
(55002, 'WI_STATE_INCOME', 0.0584, 11450, 22900),
(55003, 'WI_STATE_INCOME', 0.0627, 22900, 252150),
(55010, 'WI_STATE_INCOME', 0.0765, 252150, null),
-- Joint
(55011, 'WI_STATE_INCOME', 0.04, 0, 15270),
(55012, 'WI_STATE_INCOME', 0.0584, 15270, 30540),
(55013, 'WI_STATE_INCOME', 0.0627, 30540, 336200),
(55020, 'WI_STATE_INCOME', 0.0765, 336200, null),
-- Married Separate
(55021, 'WI_STATE_INCOME', 0.04, 0, 7630),
(55022, 'WI_STATE_INCOME', 0.0584, 7630, 15270),
(55023, 'WI_STATE_INCOME', 0.0627, 15270, 168100),
(55030, 'WI_STATE_INCOME', 0.0765, 168100, null)
;

-- tax_rate_set_tax_rates WI state income
INSERT INTO public.tax_rate_set_tax_rates(tax_rate_set_id, tax_rate_id)
VALUES
-- WI State Income - Single
(55001, 55001),
(55001, 55002),
(55001, 55003),
(55001, 55010),
-- WI State Income - Joint
(55002, 55011),
(55002, 55012),
(55002, 55013),
(55002, 55020),
-- WI State Income - Married Separate
(55003, 55021),
(55003, 55022),
(55003, 55023),
(55003, 55030),
-- WI State Income - Head of Household
(55004, 55001),
(55004, 55002),
(55004, 55003),
(55004, 55010)
;
