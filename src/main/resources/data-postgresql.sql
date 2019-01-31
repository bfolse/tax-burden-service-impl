-- tax_definition US federal income
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'US_FEDERAL_INCOME', 'US Federal Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_FEDERAL', 'US', 10)
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
	-- GA State Income - Single
	(11, 11),
	(11, 12),
	(11, 13),
	(11, 14),
	(11, 15),
	(11, 16),
	(11, 17),
	-- GA State Income - Joint
	(12, 18),
	(12, 19),
	(12, 20),
	(12, 21),
	(12, 22),
	(12, 23),
	(12, 24),
	-- GA State Income - Married Separate
	(13, 25),
	(13, 26),
	(13, 27),
	(13, 28),
	(13, 29),
	(13, 30),
	(13, 31),
	-- GA State Income - Head of Household
	(14, 32),
	(14, 33),
	(14, 34),
	(14, 35),
	(14, 36),
	(14, 37),
	(14, 38)
	;

-- tax_definition state income
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', 'GA State Income', 'incomeTaxBracketedMarginalRateCalculator', 'INCOME_STATE', 13, 10),
    (nextval('public.hibernate_sequence'), 'PA_STATE_INCOME', 'PA State Income', 'incomeTaxFlatRateCalculator', 'INCOME_STATE', 42, 10)
    ;

-- income_tax_definition
INSERT INTO public.income_tax_definition(
	id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
	VALUES (nextval('public.hibernate_sequence'), 'GA_STATE_INCOME', false, false, 2300, 3000, 2300, 2300, 2700, 7400, 2700, 2700, 3000);

-- tax_rate_set GA state income
INSERT INTO public.tax_rate_set(
	id, tax_definition_key, tax_filing_status)
	VALUES
	(13001, 'GA_STATE_INCOME', 'SINGLE'),
	(13002, 'GA_STATE_INCOME', 'JOINT'),
	(13003, 'GA_STATE_INCOME', 'MARRIED_SEPARATE'),
	(13004, 'GA_STATE_INCOME', 'HEAD_OF_HOUSEHOLD')
	;

-- tax_rate state income
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
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

-- tax_rate_set_tax_rates state income
INSERT INTO public.tax_rate_set_tax_rates(
	tax_rate_set_id, tax_rate_id)
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

-- tax_definition US federal payroll
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES (nextval('public.hibernate_sequence'), 'US_PAYROLL_SOC_SEC', 'US Federal Payroll Social Security', 'payrollTaxBracketedMarginalRateCalculator', 'PAYROLL_FEDERAL', 'US', 1),
    (nextval('public.hibernate_sequence'), 'US_PAYROLL_MEDICARE', 'US Federal Payroll Medicare', 'payrollTaxBracketedMarginalRateCalculator', 'PAYROLL_FEDERAL', 'US', 1)
    ;

-- tax_rate_set US federal payroll
INSERT INTO public.tax_rate_set(
	id, tax_definition_key, tax_filing_status)
	VALUES
	(1, 'US_PAYROLL_SOC_SEC', null),
	(2, 'US_PAYROLL_MEDICARE', 'SINGLE'),
	(3, 'US_PAYROLL_MEDICARE', 'JOINT'),
	(4, 'US_PAYROLL_MEDICARE', 'MARRIED_SEPARATE'),
	(5, 'US_PAYROLL_MEDICARE', 'HEAD_OF_HOUSEHOLD')
	;

-- tax_rate US federal payroll
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    -- Social Security
    (1, 'US_PAYROLL_SOC_SEC', 0.062, 0, 132900),
    -- Medicare Married filing separate
    (2, 'US_PAYROLL_MEDICARE', 0.0145, 0, 125000),
    (3, 'US_PAYROLL_MEDICARE', 0.0235, 125000, null),
    -- Medicare Single and Head of Household
    (4, 'US_PAYROLL_MEDICARE', 0.0145, 0, 200000),
    (5, 'US_PAYROLL_MEDICARE', 0.0235, 200000, null),
    -- Medicare Joint
    (6, 'US_PAYROLL_MEDICARE', 0.0145, 0, 250000),
    (7, 'US_PAYROLL_MEDICARE', 0.0235, 250000, null)
    ;

-- tax_rate_set_tax_rates federal payroll
INSERT INTO public.tax_rate_set_tax_rates(
	tax_rate_set_id, tax_rate_id)
	VALUES
	-- US Federal Payroll - Social Security
	(1, 1),
	-- US Federal Payroll - Medicare Married Filing Separate
	(4, 2),
	(4, 3),
	-- US Federal Payroll - Medicare Single
	(2, 4),
	(2, 5),
	-- US Federal Payroll - Medicare Head of Household
	(5, 4),
	(5, 5),
	-- US Federal Payroll - Medicare Joint
	(3, 6),
	(3, 7)
    ;

-- tax_definition_sales_GA.sql
INSERT INTO public.tax_definition(
            id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
    VALUES
(nextval('public.hibernate_sequence'),'13001','APPLING_GA_COUNTY_SALES','Appling County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13003','ATKINSON_GA_COUNTY_SALES','Atkinson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13005','BACON_GA_COUNTY_SALES','Bacon County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13007','BAKER_GA_COUNTY_SALES','Baker County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13009','BALDWIN_GA_COUNTY_SALES','Baldwin County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13011','BANKS_GA_COUNTY_SALES','Banks County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13013','BARROW_GA_COUNTY_SALES','Barrow County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13015','BARTOW_GA_COUNTY_SALES','Bartow County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13017','BEN HILL_GA_COUNTY_SALES','Ben Hill County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13019','BERRIEN_GA_COUNTY_SALES','Berrien County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13021','BIBB_GA_COUNTY_SALES','Bibb County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13023','BLECKLEY_GA_COUNTY_SALES','Bleckley County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13025','BRANTLEY_GA_COUNTY_SALES','Brantley County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13027','BROOKS_GA_COUNTY_SALES','Brooks County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13029','BRYAN_GA_COUNTY_SALES','Bryan County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13031','BULLOCH_GA_COUNTY_SALES','Bulloch County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13033','BURKE_GA_COUNTY_SALES','Burke County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13035','BUTTS_GA_COUNTY_SALES','Butts County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13037','CALHOUN_GA_COUNTY_SALES','Calhoun County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13039','CAMDEN_GA_COUNTY_SALES','Camden County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13043','CANDLER_GA_COUNTY_SALES','Candler County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13045','CARROLL_GA_COUNTY_SALES','Carroll County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13047','CATOOSA_GA_COUNTY_SALES','Catoosa County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13049','CHARLTON_GA_COUNTY_SALES','Charlton County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13051','CHATHAM_GA_COUNTY_SALES','Chatham County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13053','CHATTAHOOCHEE_GA_COUNTY_SALES','Chattahoochee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13055','CHATTOOGA_GA_COUNTY_SALES','Chattooga County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13057','CHEROKEE_GA_COUNTY_SALES','Cherokee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13059','CLARKE_GA_COUNTY_SALES','Clarke County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13061','CLAY_GA_COUNTY_SALES','Clay County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13063','CLAYTON_GA_COUNTY_SALES','Clayton County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13065','CLINCH_GA_COUNTY_SALES','Clinch County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13067','COBB_GA_COUNTY_SALES','Cobb County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13069','COFFEE_GA_COUNTY_SALES','Coffee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13071','COLQUITT_GA_COUNTY_SALES','Colquitt County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13073','COLUMBIA_GA_COUNTY_SALES','Columbia County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13075','COOK_GA_COUNTY_SALES','Cook County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13077','COWETA_GA_COUNTY_SALES','Coweta County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13079','CRAWFORD_GA_COUNTY_SALES','Crawford County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13081','CRISP_GA_COUNTY_SALES','Crisp County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13083','DADE_GA_COUNTY_SALES','Dade County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13085','DAWSON_GA_COUNTY_SALES','Dawson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13087','DECATUR_GA_COUNTY_SALES','Decatur County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13089','DEKALB_GA_COUNTY_SALES','DeKalb County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13091','DODGE_GA_COUNTY_SALES','Dodge County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13093','DOOLY_GA_COUNTY_SALES','Dooly County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13095','DOUGHERTY_GA_COUNTY_SALES','Dougherty County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13097','DOUGLAS_GA_COUNTY_SALES','Douglas County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13099','EARLY_GA_COUNTY_SALES','Early County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13101','ECHOLS_GA_COUNTY_SALES','Echols County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13103','EFFINGHAM_GA_COUNTY_SALES','Effingham County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13105','ELBERT_GA_COUNTY_SALES','Elbert County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13107','EMANUEL_GA_COUNTY_SALES','Emanuel County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13109','EVANS_GA_COUNTY_SALES','Evans County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13111','FANNIN_GA_COUNTY_SALES','Fannin County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13113','FAYETTE_GA_COUNTY_SALES','Fayette County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13115','FLOYD_GA_COUNTY_SALES','Floyd County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13117','FORSYTH_GA_COUNTY_SALES','Forsyth County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13119','FRANKLIN_GA_COUNTY_SALES','Franklin County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13121','FULTON_GA_COUNTY_SALES','Fulton County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13123','GILMER_GA_COUNTY_SALES','Gilmer County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13125','GLASCOCK_GA_COUNTY_SALES','Glascock County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13127','GLYNN_GA_COUNTY_SALES','Glynn County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13129','GORDON_GA_COUNTY_SALES','Gordon County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13131','GRADY_GA_COUNTY_SALES','Grady County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13133','GREENE_GA_COUNTY_SALES','Greene County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13135','GWINNETT_GA_COUNTY_SALES','Gwinnett County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13137','HABERSHAM_GA_COUNTY_SALES','Habersham County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13139','HALL_GA_COUNTY_SALES','Hall County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13141','HANCOCK_GA_COUNTY_SALES','Hancock County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13143','HARALSON_GA_COUNTY_SALES','Haralson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13145','HARRIS_GA_COUNTY_SALES','Harris County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13147','HART_GA_COUNTY_SALES','Hart County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13149','HEARD_GA_COUNTY_SALES','Heard County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13151','HENRY_GA_COUNTY_SALES','Henry County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13153','HOUSTON_GA_COUNTY_SALES','Houston County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13155','IRWIN_GA_COUNTY_SALES','Irwin County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13157','JACKSON_GA_COUNTY_SALES','Jackson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13159','JASPER_GA_COUNTY_SALES','Jasper County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13161','JEFF DAVIS_GA_COUNTY_SALES','Jeff Davis County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13163','JEFFERSON_GA_COUNTY_SALES','Jefferson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13165','JENKINS_GA_COUNTY_SALES','Jenkins County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13167','JOHNSON_GA_COUNTY_SALES','Johnson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13169','JONES_GA_COUNTY_SALES','Jones County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13171','LAMAR_GA_COUNTY_SALES','Lamar County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13173','LANIER_GA_COUNTY_SALES','Lanier County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13175','LAURENS_GA_COUNTY_SALES','Laurens County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13177','LEE_GA_COUNTY_SALES','Lee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13179','LIBERTY_GA_COUNTY_SALES','Liberty County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13181','LINCOLN_GA_COUNTY_SALES','Lincoln County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13183','LONG_GA_COUNTY_SALES','Long County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13185','LOWNDES_GA_COUNTY_SALES','Lowndes County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13187','LUMPKIN_GA_COUNTY_SALES','Lumpkin County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13189','MCDUFFIE_GA_COUNTY_SALES','McDuffie County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13191','MCINTOSH_GA_COUNTY_SALES','McIntosh County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13193','MACON_GA_COUNTY_SALES','Macon County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13195','MADISON_GA_COUNTY_SALES','Madison County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13197','MARION_GA_COUNTY_SALES','Marion County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13199','MERIWETHER_GA_COUNTY_SALES','Meriwether County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13201','MILLER_GA_COUNTY_SALES','Miller County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13205','MITCHELL_GA_COUNTY_SALES','Mitchell County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13207','MONROE_GA_COUNTY_SALES','Monroe County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13209','MONTGOMERY_GA_COUNTY_SALES','Montgomery County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13211','MORGAN_GA_COUNTY_SALES','Morgan County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13213','MURRAY_GA_COUNTY_SALES','Murray County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13215','MUSCOGEE_GA_COUNTY_SALES','Muscogee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13217','NEWTON_GA_COUNTY_SALES','Newton County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13219','OCONEE_GA_COUNTY_SALES','Oconee County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13221','OGLETHORPE_GA_COUNTY_SALES','Oglethorpe County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13223','PAULDING_GA_COUNTY_SALES','Paulding County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13225','PEACH_GA_COUNTY_SALES','Peach County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13227','PICKENS_GA_COUNTY_SALES','Pickens County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13229','PIERCE_GA_COUNTY_SALES','Pierce County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13231','PIKE_GA_COUNTY_SALES','Pike County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13233','POLK_GA_COUNTY_SALES','Polk County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13235','PULASKI_GA_COUNTY_SALES','Pulaski County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13237','PUTNAM_GA_COUNTY_SALES','Putnam County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13239','QUITMAN_GA_COUNTY_SALES','Quitman County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13241','RABUN_GA_COUNTY_SALES','Rabun County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13243','RANDOLPH_GA_COUNTY_SALES','Randolph County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13245','RICHMOND_GA_COUNTY_SALES','Richmond County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13247','ROCKDALE_GA_COUNTY_SALES','Rockdale County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13249','SCHLEY_GA_COUNTY_SALES','Schley County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13251','SCREVEN_GA_COUNTY_SALES','Screven County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13253','SEMINOLE_GA_COUNTY_SALES','Seminole County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13255','SPALDING_GA_COUNTY_SALES','Spalding County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13257','STEPHENS_GA_COUNTY_SALES','Stephens County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13259','STEWART_GA_COUNTY_SALES','Stewart County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13261','SUMTER_GA_COUNTY_SALES','Sumter County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13263','TALBOT_GA_COUNTY_SALES','Talbot County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13265','TALIAFERRO_GA_COUNTY_SALES','Taliaferro County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13267','TATTNALL_GA_COUNTY_SALES','Tattnall County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13269','TAYLOR_GA_COUNTY_SALES','Taylor County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13271','TELFAIR_GA_COUNTY_SALES','Telfair County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13273','TERRELL_GA_COUNTY_SALES','Terrell County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13275','THOMAS_GA_COUNTY_SALES','Thomas County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13277','TIFT_GA_COUNTY_SALES','Tift County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13279','TOOMBS_GA_COUNTY_SALES','Toombs County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13281','TOWNS_GA_COUNTY_SALES','Towns County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13283','TREUTLEN_GA_COUNTY_SALES','Treutlen County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13285','TROUP_GA_COUNTY_SALES','Troup County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13287','TURNER_GA_COUNTY_SALES','Turner County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13289','TWIGGS_GA_COUNTY_SALES','Twiggs County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13291','UNION_GA_COUNTY_SALES','Union County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13293','UPSON_GA_COUNTY_SALES','Upson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13295','WALKER_GA_COUNTY_SALES','Walker County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13297','WALTON_GA_COUNTY_SALES','Walton County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13299','WARE_GA_COUNTY_SALES','Ware County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13301','WARREN_GA_COUNTY_SALES','Warren County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13303','WASHINGTON_GA_COUNTY_SALES','Washington County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13305','WAYNE_GA_COUNTY_SALES','Wayne County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13307','WEBSTER_GA_COUNTY_SALES','Webster County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13309','WHEELER_GA_COUNTY_SALES','Wheeler County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13311','WHITE_GA_COUNTY_SALES','White County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13313','WHITFIELD_GA_COUNTY_SALES','Whitfield County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13315','WILCOX_GA_COUNTY_SALES','Wilcox County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13317','WILKES_GA_COUNTY_SALES','Wilkes County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13319','WILKINSON_GA_COUNTY_SALES','Wilkinson County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'13321','WORTH_GA_COUNTY_SALES','Worth County GA Sales','salesTaxCalculator','SALES_COUNTY',5),
(nextval('public.hibernate_sequence'),'1304000','ATLANTA_GA_CITY_SALES','City of Atlanta GA Sales','salesTaxCalculator','SALES_CITY',5)
;

-- tax_rate_sales_GA.sql
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
(nextval('public.hibernate_sequence'),'APPLING_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'ATKINSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BACON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BAKER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BALDWIN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BANKS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BARROW_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BARTOW_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BEN HILL_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BERRIEN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BIBB_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BLECKLEY_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'BRANTLEY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BROOKS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BRYAN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BULLOCH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BURKE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'BUTTS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CALHOUN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CAMDEN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CANDLER_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'CARROLL_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CATOOSA_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CHARLTON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CHATHAM_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CHATTAHOOCHEE_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'CHATTOOGA_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CHEROKEE_GA_COUNTY_SALES', 0.06,null,null),
(nextval('public.hibernate_sequence'),'CLARKE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CLAY_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'CLAYTON_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'CLINCH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'COBB_GA_COUNTY_SALES', 0.06,null,null),
(nextval('public.hibernate_sequence'),'COFFEE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'COLQUITT_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'COLUMBIA_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'COOK_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'COWETA_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CRAWFORD_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'CRISP_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'DADE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'DAWSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'DECATUR_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'DEKALB_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'DODGE_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'DOOLY_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'DOUGHERTY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'DOUGLAS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'EARLY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'ECHOLS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'EFFINGHAM_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'ELBERT_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'EMANUEL_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'EVANS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'FANNIN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'FAYETTE_GA_COUNTY_SALES', 0.06,null,null),
(nextval('public.hibernate_sequence'),'FLOYD_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'FORSYTH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'FRANKLIN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'FULTON_GA_COUNTY_SALES', 0.0775,null,null),
(nextval('public.hibernate_sequence'),'GILMER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'GLASCOCK_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'GLYNN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'GORDON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'GRADY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'GREENE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'GWINNETT_GA_COUNTY_SALES', 0.06,null,null),
(nextval('public.hibernate_sequence'),'HABERSHAM_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HALL_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HANCOCK_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'HARALSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HARRIS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'HART_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HEARD_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HENRY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'HOUSTON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'IRWIN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'JACKSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'JASPER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'JEFF DAVIS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'JEFFERSON_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'JENKINS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'JOHNSON_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'JONES_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LAMAR_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LANIER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LAURENS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'LEE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LIBERTY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LINCOLN_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'LONG_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LOWNDES_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'LUMPKIN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MCDUFFIE_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'MCINTOSH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MACON_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'MADISON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MARION_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'MERIWETHER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MILLER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MITCHELL_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MONROE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MONTGOMERY_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'MORGAN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MURRAY_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'MUSCOGEE_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'NEWTON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'OCONEE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'OGLETHORPE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PAULDING_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PEACH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PICKENS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PIERCE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PIKE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'POLK_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PULASKI_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'PUTNAM_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'QUITMAN_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'RABUN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'RANDOLPH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'RICHMOND_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'ROCKDALE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'SCHLEY_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'SCREVEN_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'SEMINOLE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'SPALDING_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'STEPHENS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'STEWART_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'SUMTER_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TALBOT_GA_COUNTY_SALES', 0.09,null,null),
(nextval('public.hibernate_sequence'),'TALIAFERRO_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TATTNALL_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TAYLOR_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TELFAIR_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TERRELL_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'THOMAS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'TIFT_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'TOOMBS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TOWNS_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TREUTLEN_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'TROUP_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'TURNER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'TWIGGS_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'UNION_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'UPSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WALKER_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WALTON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WARE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WARREN_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WASHINGTON_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WAYNE_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WEBSTER_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WHEELER_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WHITE_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WHITFIELD_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WILCOX_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WILKES_GA_COUNTY_SALES', 0.08,null,null),
(nextval('public.hibernate_sequence'),'WILKINSON_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'WORTH_GA_COUNTY_SALES', 0.07,null,null),
(nextval('public.hibernate_sequence'),'ATLANTA_GA_CITY_SALES', 0.019,null,null)
;

-- tax_definition_fuel.sql
INSERT INTO public.tax_definition(
            id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
    VALUES
(nextval('public.hibernate_sequence'),'US','US_FEDERAL_FUEL_TAX','US Federal Fuel Tax','fuelTaxCalculator','FUEL_FEDERAL',6),
(nextval('public.hibernate_sequence'),'13','GA_STATE_FUEL_TAX','State of Georgia Fuel Tax','fuelTaxCalculator','FUEL_STATE',6)
;

-- tax_rate_fuel.sql
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    (nextval('public.hibernate_sequence'), 'US_FEDERAL_FUEL_TAX', 0.184, null, null),
    (nextval('public.hibernate_sequence'), 'GA_STATE_FUEL_TAX', 0.3159, null, null)
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
    (2, 'Categories subject to sales tax, including food at home (unprepared)', 'SALES_TAX_GROUP_WITH_UNPREPARED_FOOD')
    ;

    INSERT INTO public.expenditure_category_group_expenditure_category_key(
            expenditure_category_group_id, expenditure_category_keys)
    VALUES (1, 'FOOD_AWAY_FROM_HOME'),
    (1, 'ALCOHOL'),
    (1, 'HOUSING_SHELTER'),
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
    (2, 'HOUSING_SHELTER'),
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
    (2, 'MISC')
    ;

-- tax_definition_expenditure_category_GA.sql
INSERT INTO public.tax_definition_expenditure_category(
            id, tax_definition_key, expenditure_category_group_key)
VALUES
(nextval('public.hibernate_sequence'),'APPLING_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'ATKINSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BACON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BAKER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BALDWIN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BANKS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BARROW_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BARTOW_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BEN HILL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BERRIEN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BIBB_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BLECKLEY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BRANTLEY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BROOKS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BRYAN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BULLOCH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BURKE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'BUTTS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CALHOUN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CAMDEN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CANDLER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CARROLL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CATOOSA_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CHARLTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CHATHAM_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CHATTAHOOCHEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CHATTOOGA_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CHEROKEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CLARKE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CLAY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CLAYTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CLINCH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COBB_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COFFEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COLQUITT_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COLUMBIA_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COOK_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'COWETA_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CRAWFORD_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'CRISP_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DADE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DAWSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DECATUR_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DEKALB_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DODGE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DOOLY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DOUGHERTY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'DOUGLAS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'EARLY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'ECHOLS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'EFFINGHAM_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'ELBERT_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'EMANUEL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'EVANS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FANNIN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FAYETTE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FLOYD_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FORSYTH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FRANKLIN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'FULTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GILMER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GLASCOCK_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GLYNN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GORDON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GRADY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GREENE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'GWINNETT_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HABERSHAM_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HALL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HANCOCK_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HARALSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HARRIS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HART_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HEARD_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HENRY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'HOUSTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'IRWIN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JACKSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JASPER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JEFF DAVIS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JEFFERSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JENKINS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JOHNSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'JONES_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LAMAR_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LANIER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LAURENS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LIBERTY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LINCOLN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LONG_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LOWNDES_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'LUMPKIN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MCDUFFIE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MCINTOSH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MACON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MADISON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MARION_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MERIWETHER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MILLER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MITCHELL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MONROE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MONTGOMERY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MORGAN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MURRAY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'MUSCOGEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'NEWTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'OCONEE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'OGLETHORPE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PAULDING_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PEACH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PICKENS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PIERCE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PIKE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'POLK_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PULASKI_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'PUTNAM_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'QUITMAN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'RABUN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'RANDOLPH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'RICHMOND_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'ROCKDALE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'SCHLEY_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'SCREVEN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'SEMINOLE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'SPALDING_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'STEPHENS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'STEWART_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'SUMTER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TALBOT_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TALIAFERRO_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TATTNALL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TAYLOR_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TELFAIR_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TERRELL_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'THOMAS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TIFT_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TOOMBS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TOWNS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TREUTLEN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TROUP_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TURNER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'TWIGGS_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'UNION_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'UPSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WALKER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WALTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WARE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WARREN_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WASHINGTON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WAYNE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WEBSTER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WHEELER_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WHITE_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WHITFIELD_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WILCOX_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WILKES_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WILKINSON_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'WORTH_GA_COUNTY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD'),
(nextval('public.hibernate_sequence'),'ATLANTA_GA_CITY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD')
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
