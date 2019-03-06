-- Income Tax for cities in MI
-- tax_definition_income_city_MI.sql
INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
VALUES
(nextval('public.hibernate_sequence'),'2600980','ALBION_MI_CITY_INCOME','Albion city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2605920','BATTLE_CREEK_MI_CITY_INCOME','Battle Creek city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2608300','BIG_RAPIDS_MI_CITY_INCOME','Big Rapids city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2622000','DETROIT_MI_CITY_INCOME','Detroit city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2629000','FLINT_MI_CITY_INCOME','Flint city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2634000','GRAND_RAPIDS_MI_CITY_INCOME','Grand Rapids city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2634640','GRAYLING_MI_CITY_INCOME','Grayling city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2636280','HAMTRAMCK_MI_CITY_INCOME','Hamtramck city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2638180','HIGHLAND_PARK_MI_CITY_INCOME','Highland Park city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2639720','HUDSON_MI_CITY_INCOME','Hudson city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2640860','IONIA_MI_CITY_INCOME','Ionia city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2641420','JACKSON_MI_CITY_INCOME','Jackson city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2646000','LANSING_MI_CITY_INCOME','Lansing city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2646040','LAPEER_MI_CITY_INCOME','Lapeer city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2656320','MUSKEGON_MI_CITY_INCOME','Muskegon city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2656360','MUSKEGON_HEIGHTS_MI_CITY_INCOME','Muskegon Heights city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2665440','PONTIAC_MI_CITY_INCOME','Pontiac city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2665820','PORT_HURON_MI_CITY_INCOME','Port Huron city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2665860','PORTLAND_MI_CITY_INCOME','Portland city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2670520','SAGINAW_MI_CITY_INCOME','Saginaw city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2675700','SPRINGFIELD_MI_CITY_INCOME','Springfield city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9),
(nextval('public.hibernate_sequence'),'2682960','WALKER_MI_CITY_INCOME','Walker city MI Income','incomeTaxFlatRateCalculator','INCOME_CITY',9)
;

-- income_tax_definition_MI
INSERT INTO public.income_tax_definition(id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
VALUES
(nextval('public.hibernate_sequence'), 'ALBION_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'BATTLE_CREEK_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'BIG_RAPIDS_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'DETROIT_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'FLINT_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'GRAND_RAPIDS_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'GRAYLING_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'HAMTRAMCK_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'HIGHLAND_PARK_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'HUDSON_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'IONIA_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'JACKSON_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'LANSING_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'LAPEER_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'MUSKEGON_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'MUSKEGON_HEIGHTS_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'PONTIAC_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'PORT_HURON_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'PORTLAND_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'SAGINAW_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'SPRINGFIELD_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500),
(nextval('public.hibernate_sequence'), 'WALKER_MI_CITY_INCOME', true, true, 0, 0, 0, 0, 4400, 4400, 4400, 4400, 1500)
;

-- tax_rate_income_city_MI.sql
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
(nextval('public.hibernate_sequence'),'ALBION_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'BATTLE_CREEK_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'BIG_RAPIDS_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'DETROIT_MI_CITY_INCOME',0.0240,null,null),
(nextval('public.hibernate_sequence'),'FLINT_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'GRAND_RAPIDS_MI_CITY_INCOME',0.0150,null,null),
(nextval('public.hibernate_sequence'),'GRAYLING_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'HAMTRAMCK_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'HIGHLAND_PARK_MI_CITY_INCOME',0.0200,null,null),
(nextval('public.hibernate_sequence'),'HUDSON_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'IONIA_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'JACKSON_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'LANSING_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'LAPEER_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'MUSKEGON_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'MUSKEGON_HEIGHTS_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'PONTIAC_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'PORT_HURON_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'PORTLAND_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'SAGINAW_MI_CITY_INCOME',0.0150,null,null),
(nextval('public.hibernate_sequence'),'SPRINGFIELD_MI_CITY_INCOME',0.0100,null,null),
(nextval('public.hibernate_sequence'),'WALKER_MI_CITY_INCOME',0.0100,null,null)
;


