-- Income Tax for counties in MD
-- tax_definition_income_city_MD.sql
INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
VALUES
(nextval('public.hibernate_sequence'),'24001','ALLEGANY_MD_COUNTY_INCOME','Allegany County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24003','ANNE_ARUNDEL_MD_COUNTY_INCOME','Anne Arundel County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24005','BALTIMORE_MD_COUNTY_INCOME','Baltimore County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24009','CALVERT_MD_COUNTY_INCOME','Calvert County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24011','CAROLINE_MD_COUNTY_INCOME','Caroline County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24013','CARROLL_MD_COUNTY_INCOME','Carroll County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24015','CECIL_MD_COUNTY_INCOME','Cecil County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24017','CHARLES_MD_COUNTY_INCOME','Charles County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24019','DORCHESTER_MD_COUNTY_INCOME','Dorchester County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24021','FREDERICK_MD_COUNTY_INCOME','Frederick County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24023','GARRETT_MD_COUNTY_INCOME','Garrett County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24025','HARFORD_MD_COUNTY_INCOME','Harford County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24027','HOWARD_MD_COUNTY_INCOME','Howard County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24029','KENT_MD_COUNTY_INCOME','Kent County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24031','MONTGOMERY_MD_COUNTY_INCOME','Montgomery County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24033','PRINCE_GEORGES_MD_COUNTY_INCOME','Prince George''s County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24035','QUEEN_ANNES_MD_COUNTY_INCOME','Queen Anne''s County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24037','ST_MARYS_MD_COUNTY_INCOME','St. Mary''s County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24039','SOMERSET_MD_COUNTY_INCOME','Somerset County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24041','TALBOT_MD_COUNTY_INCOME','Talbot County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24043','WASHINGTON_MD_COUNTY_INCOME','Washington County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24045','WICOMICO_MD_COUNTY_INCOME','Wicomico County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'24047','WORCESTER_MD_COUNTY_INCOME','Worcester County MD Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9)
;

-- income_tax_definition_MD
INSERT INTO public.income_tax_definition(id, tax_definition_key, deduct_itemized, deduct_pre_tax_contributions, standard_deduction_single, standard_deduction_joint, standard_deduction_married_filing_separate, standard_deduction_head_of_household, personal_exemption_single, personal_exemption_joint, personal_exemption_married_filing_separate, personal_exemption_head_of_household, dependent_exemption)
VALUES
(nextval('public.hibernate_sequence'), 'ALLEGANY_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'ANNE_ARUNDEL_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'BALTIMORE_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'CALVERT_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'CAROLINE_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'CARROLL_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'CECIL_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'CHARLES_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'DORCHESTER_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'FREDERICK_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'GARRETT_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'HARFORD_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'HOWARD_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'KENT_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'MONTGOMERY_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'PRINCE_GEORGES_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'QUEEN_ANNES_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'ST_MARYS_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'SOMERSET_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'TALBOT_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'WASHINGTON_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'WICOMICO_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200),
(nextval('public.hibernate_sequence'), 'WORCESTER_MD_COUNTY_INCOME', true, true, 2000, 3000, 2000, 3000, 3200, 3200, 3200, 3200, 3200)
;

-- tax_rate_income_city_MD.sql
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
(nextval('public.hibernate_sequence'),'ALLEGANY_MD_COUNTY_INCOME',0.0305,null,null),
(nextval('public.hibernate_sequence'),'ANNE_ARUNDEL_MD_COUNTY_INCOME',0.0250,null,null),
(nextval('public.hibernate_sequence'),'BALTIMORE_MD_COUNTY_INCOME',0.0283,null,null),
(nextval('public.hibernate_sequence'),'CALVERT_MD_COUNTY_INCOME',0.0283,null,null),
(nextval('public.hibernate_sequence'),'CAROLINE_MD_COUNTY_INCOME',0.0273,null,null),
(nextval('public.hibernate_sequence'),'CARROLL_MD_COUNTY_INCOME',0.0303,null,null),
(nextval('public.hibernate_sequence'),'CECIL_MD_COUNTY_INCOME',0.0300,null,null),
(nextval('public.hibernate_sequence'),'CHARLES_MD_COUNTY_INCOME',0.0303,null,null),
(nextval('public.hibernate_sequence'),'DORCHESTER_MD_COUNTY_INCOME',0.0262,null,null),
(nextval('public.hibernate_sequence'),'FREDERICK_MD_COUNTY_INCOME',0.0296,null,null),
(nextval('public.hibernate_sequence'),'GARRETT_MD_COUNTY_INCOME',0.0265,null,null),
(nextval('public.hibernate_sequence'),'HARFORD_MD_COUNTY_INCOME',0.0306,null,null),
(nextval('public.hibernate_sequence'),'HOWARD_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'KENT_MD_COUNTY_INCOME',0.0285,null,null),
(nextval('public.hibernate_sequence'),'MONTGOMERY_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'PRINCE_GEORGES_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'QUEEN_ANNES_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'ST_MARYS_MD_COUNTY_INCOME',0.0300,null,null),
(nextval('public.hibernate_sequence'),'SOMERSET_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'TALBOT_MD_COUNTY_INCOME',0.0240,null,null),
(nextval('public.hibernate_sequence'),'WASHINGTON_MD_COUNTY_INCOME',0.0280,null,null),
(nextval('public.hibernate_sequence'),'WICOMICO_MD_COUNTY_INCOME',0.0320,null,null),
(nextval('public.hibernate_sequence'),'WORCESTER_MD_COUNTY_INCOME',0.0175,null,null)
;


