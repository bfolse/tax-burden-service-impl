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
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', 'PA State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', '42', 10)
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
(nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', false, false, 0, 0, 0, 0, 0, 0, 0, 0, 0)
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

-- Pennsylvania
-- tax_rate PA state income
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
-- Single, Joint, Married Separate, Head of Household
(42001, 'PA_STATE_INCOME', 0.0307, null, null)
;
