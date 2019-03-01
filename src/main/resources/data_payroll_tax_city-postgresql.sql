-- tax_definition AL cities payroll
INSERT INTO public.tax_definition(
            id, tax_definition_key, description, tax_calc_strategy, tax_type, political_division_key, ordinal)
    VALUES
    (nextval('public.hibernate_sequence'), 'ATTALLA_AL_PAYROLL', 'Attalla AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0103028', 1),
    (nextval('public.hibernate_sequence'), 'AUBURN_AL_PAYROLL', 'Auburn AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0103076', 1),
    (nextval('public.hibernate_sequence'), 'BEAR_CREEK_AL_PAYROLL', 'Bear Creek AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0104852', 1),
    (nextval('public.hibernate_sequence'), 'BEAVERTON_AL_PAYROLL', 'Beaverton AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0104948', 1),
    (nextval('public.hibernate_sequence'), 'BESSEMER_AL_PAYROLL', 'Bessemer AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0105980', 1),
    (nextval('public.hibernate_sequence'), 'BIRMINGHAM_AL_PAYROLL', 'Birmingham AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0107000', 1),
    (nextval('public.hibernate_sequence'), 'BRILLIANT_AL_PAYROLL', 'Brilliant AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0109424', 1),
    (nextval('public.hibernate_sequence'), 'FAIRFIELD_AL_PAYROLL', 'Fairfield AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0125120', 1),
    (nextval('public.hibernate_sequence'), 'FORT_DEPOSIT_AL_PAYROLL', 'Fort Deposit AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0127520', 1),
    (nextval('public.hibernate_sequence'), 'GADSDEN_AL_PAYROLL', 'Gadsden AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0128696', 1),
    (nextval('public.hibernate_sequence'), 'GLENCOE_AL_PAYROLL', 'Glencoe AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0129992', 1),
    (nextval('public.hibernate_sequence'), 'GOODWATER_AL_PAYROLL', 'Goodwater AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0130640', 1),
    (nextval('public.hibernate_sequence'), 'GUIN_AL_PAYROLL', 'Guin AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0132224', 1),
    (nextval('public.hibernate_sequence'), 'HACKLEBURG_AL_PAYROLL', 'Hackleburg AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0132560', 1),
    (nextval('public.hibernate_sequence'), 'HALEYVILLE_AL_PAYROLL', 'Haleyville AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0132704', 1),
    (nextval('public.hibernate_sequence'), 'HAMILTON_AL_PAYROLL', 'Hamilton AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0132848', 1),
    (nextval('public.hibernate_sequence'), 'HOBSON_AL_PAYROLL', 'Hobson AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0135152', 1),
    (nextval('public.hibernate_sequence'), 'IRONDALE_AL_PAYROLL', 'Irondale AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0137864', 1),
    (nextval('public.hibernate_sequence'), 'LEEDS_AL_PAYROLL', 'Leeds AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0141968', 1),
    (nextval('public.hibernate_sequence'), 'LYNN_AL_PAYROLL', 'Lynn AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0144800', 1),
    (nextval('public.hibernate_sequence'), 'MIDFIELD_AL_PAYROLL', 'Midfield AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0148376', 1),
    (nextval('public.hibernate_sequence'), 'MOSSES_AL_PAYROLL', 'Mosses AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0151520', 1),
    (nextval('public.hibernate_sequence'), 'OPELIKA_AL_PAYROLL', 'Opelika AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0157048', 1),
    (nextval('public.hibernate_sequence'), 'RAINBOW_CITY_AL_PAYROLL', 'Rainbow City AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0163288', 1),
    (nextval('public.hibernate_sequence'), 'RED_BAY_AL_PAYROLL', 'Red Bay AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0163576', 1),
    (nextval('public.hibernate_sequence'), 'SHORTER_AL_PAYROLL', 'Shorter AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0170128', 1),
    (nextval('public.hibernate_sequence'), 'SOUTHSIDE_AL_PAYROLL', 'Southside AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0171832', 1),
    (nextval('public.hibernate_sequence'), 'SULLIGENT_AL_PAYROLL', 'Sulligent AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0173728', 1),
    (nextval('public.hibernate_sequence'), 'TUSKEGEE_AL_PAYROLL', 'Tuskegee AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_CITY', '0177304', 1),
    (nextval('public.hibernate_sequence'), 'MACON_COUNTY_AL_PAYROLL', 'Macon County AL Occupational Payroll', 'payrollTaxFlatRateCalculator', 'PAYROLL_COUNTY', '01087', 1)
    ;

-- tax_rate AL cities payroll
INSERT INTO public.tax_rate(
            id, tax_definition_key, rate, range_low, range_high)
    VALUES
    (nextval('public.hibernate_sequence'), 'ATTALLA_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'AUBURN_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'BEAR_CREEK_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'BEAVERTON_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'BESSEMER_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'BIRMINGHAM_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'BRILLIANT_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'FAIRFIELD_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'FORT_DEPOSIT_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'GADSDEN_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'GLENCOE_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'GOODWATER_AL_PAYROLL', 0.0075, null, null),
    (nextval('public.hibernate_sequence'), 'GUIN_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'HACKLEBURG_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'HALEYVILLE_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'HAMILTON_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'HOBSON_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'IRONDALE_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'LEEDS_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'LYNN_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'MIDFIELD_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'MOSSES_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'OPELIKA_AL_PAYROLL', 0.015, null, null),
    (nextval('public.hibernate_sequence'), 'RAINBOW_CITY_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'RED_BAY_AL_PAYROLL', 0.005, null, null),
    (nextval('public.hibernate_sequence'), 'SHORTER_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'SOUTHSIDE_AL_PAYROLL', 0.02, null, null),
    (nextval('public.hibernate_sequence'), 'SULLIGENT_AL_PAYROLL', 0.01, null, null),
    (nextval('public.hibernate_sequence'), 'TUSKEGEE_AL_PAYROLL', 0.03, null, null),
    (nextval('public.hibernate_sequence'), 'MACON_COUNTY_AL_PAYROLL', 0.01, null, null)
    ;
