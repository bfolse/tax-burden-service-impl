-- Sales Tax for cities in GA
-- tax_definition_sales_GA.sql
INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
VALUES
(nextval('public.hibernate_sequence'),'1304000','ATLANTA_GA_CITY_SALES','Atlanta GA Sales','salesTaxCalculator','SALES_CITY',5)
;

-- tax_rate_sales_GA.sql
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
(nextval('public.hibernate_sequence'),'ATLANTA_GA_CITY_SALES',0.009,null,null)
;

-- tax_definition_expenditure_category_GA.sql
INSERT INTO public.tax_definition_expenditure_category(id, tax_definition_key, expenditure_category_group_key)
VALUES
(nextval('public.hibernate_sequence'),'ATLANTA_GA_CITY_SALES','SALES_TAX_GROUP_WITH_UNPREPARED_FOOD')
;
