-- Income Tax for counties in IN
-- tax_definition_income_IN.sql
INSERT INTO public.tax_definition(id, political_division_key, tax_definition_key, description, tax_calc_strategy, tax_type, ordinal)
VALUES
(nextval('public.hibernate_sequence'),'18001','ADAMS_IN_COUNTY_INCOME','Adams County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18003','ALLEN_IN_COUNTY_INCOME','Allen County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18005','BARTHOLOMEW_IN_COUNTY_INCOME','Bartholomew County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18007','BENTON_IN_COUNTY_INCOME','Benton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18009','BLACKFORD_IN_COUNTY_INCOME','Blackford County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18011','BOONE_IN_COUNTY_INCOME','Boone County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18013','BROWN_IN_COUNTY_INCOME','Brown County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18015','CARROLL_IN_COUNTY_INCOME','Carroll County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18017','CASS_IN_COUNTY_INCOME','Cass County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18019','CLARK_IN_COUNTY_INCOME','Clark County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18021','CLAY_IN_COUNTY_INCOME','Clay County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18023','CLINTON_IN_COUNTY_INCOME','Clinton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18025','CRAWFORD_IN_COUNTY_INCOME','Crawford County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18027','DAVIESS_IN_COUNTY_INCOME','Daviess County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18029','DEARBORN_IN_COUNTY_INCOME','Dearborn County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18031','DECATUR_IN_COUNTY_INCOME','Decatur County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18033','DEKALB_IN_COUNTY_INCOME','DeKalb County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18035','DELAWARE_IN_COUNTY_INCOME','Delaware County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18037','DUBOIS_IN_COUNTY_INCOME','Dubois County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18039','ELKHART_IN_COUNTY_INCOME','Elkhart County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18041','FAYETTE_IN_COUNTY_INCOME','Fayette County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18043','FLOYD_IN_COUNTY_INCOME','Floyd County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18045','FOUNTAIN_IN_COUNTY_INCOME','Fountain County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18047','FRANKLIN_IN_COUNTY_INCOME','Franklin County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18049','FULTON_IN_COUNTY_INCOME','Fulton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18051','GIBSON_IN_COUNTY_INCOME','Gibson County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18053','GRANT_IN_COUNTY_INCOME','Grant County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18055','GREENE_IN_COUNTY_INCOME','Greene County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18057','HAMILTON_IN_COUNTY_INCOME','Hamilton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18059','HANCOCK_IN_COUNTY_INCOME','Hancock County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18061','HARRISON_IN_COUNTY_INCOME','Harrison County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18063','HENDRICKS_IN_COUNTY_INCOME','Hendricks County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18065','HENRY_IN_COUNTY_INCOME','Henry County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18067','HOWARD_IN_COUNTY_INCOME','Howard County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18069','HUNTINGTON_IN_COUNTY_INCOME','Huntington County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18071','JACKSON_IN_COUNTY_INCOME','Jackson County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18073','JASPER_IN_COUNTY_INCOME','Jasper County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18075','JAY_IN_COUNTY_INCOME','Jay County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18077','JEFFERSON_IN_COUNTY_INCOME','Jefferson County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18079','JENNINGS_IN_COUNTY_INCOME','Jennings County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18081','JOHNSON_IN_COUNTY_INCOME','Johnson County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18083','KNOX_IN_COUNTY_INCOME','Knox County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18085','KOSCIUSKO_IN_COUNTY_INCOME','Kosciusko County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18087','LAGRANGE_IN_COUNTY_INCOME','LaGrange County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18089','LAKE_IN_COUNTY_INCOME','Lake County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18091','LAPORTE_IN_COUNTY_INCOME','LaPorte County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18093','LAWRENCE_IN_COUNTY_INCOME','Lawrence County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18095','MADISON_IN_COUNTY_INCOME','Madison County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18097','MARION_IN_COUNTY_INCOME','Marion County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18099','MARSHALL_IN_COUNTY_INCOME','Marshall County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18101','MARTIN_IN_COUNTY_INCOME','Martin County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18103','MIAMI_IN_COUNTY_INCOME','Miami County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18105','MONROE_IN_COUNTY_INCOME','Monroe County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18107','MONTGOMERY_IN_COUNTY_INCOME','Montgomery County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18109','MORGAN_IN_COUNTY_INCOME','Morgan County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18111','NEWTON_IN_COUNTY_INCOME','Newton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18113','NOBLE_IN_COUNTY_INCOME','Noble County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18115','OHIO_IN_COUNTY_INCOME','Ohio County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18117','ORANGE_IN_COUNTY_INCOME','Orange County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18119','OWEN_IN_COUNTY_INCOME','Owen County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18121','PARKE_IN_COUNTY_INCOME','Parke County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18123','PERRY_IN_COUNTY_INCOME','Perry County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18125','PIKE_IN_COUNTY_INCOME','Pike County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18127','PORTER_IN_COUNTY_INCOME','Porter County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18129','POSEY_IN_COUNTY_INCOME','Posey County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18131','PULASKI_IN_COUNTY_INCOME','Pulaski County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18133','PUTNAM_IN_COUNTY_INCOME','Putnam County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18135','RANDOLPH_IN_COUNTY_INCOME','Randolph County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18137','RIPLEY_IN_COUNTY_INCOME','Ripley County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18139','RUSH_IN_COUNTY_INCOME','Rush County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18143','SCOTT_IN_COUNTY_INCOME','Scott County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18145','SHELBY_IN_COUNTY_INCOME','Shelby County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18147','SPENCER_IN_COUNTY_INCOME','Spencer County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18141','ST_JOSEPH_IN_COUNTY_INCOME','St. Joseph County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18149','STARKE_IN_COUNTY_INCOME','Starke County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18151','STEUBEN_IN_COUNTY_INCOME','Steuben County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18153','SULLIVAN_IN_COUNTY_INCOME','Sullivan County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18155','SWITZERLAND_IN_COUNTY_INCOME','Switzerland County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18157','TIPPECANOE_IN_COUNTY_INCOME','Tippecanoe County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18159','TIPTON_IN_COUNTY_INCOME','Tipton County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18161','UNION_IN_COUNTY_INCOME','Union County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18163','VANDERBURGH_IN_COUNTY_INCOME','Vanderburgh County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18165','VERMILLION_IN_COUNTY_INCOME','Vermillion County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18167','VIGO_IN_COUNTY_INCOME','Vigo County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18169','WABASH_IN_COUNTY_INCOME','Wabash County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18171','WARREN_IN_COUNTY_INCOME','Warren County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18173','WARRICK_IN_COUNTY_INCOME','Warrick County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18175','WASHINGTON_IN_COUNTY_INCOME','Washington County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18177','WAYNE_IN_COUNTY_INCOME','Wayne County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18179','WELLS_IN_COUNTY_INCOME','Wells County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18181','WHITE_IN_COUNTY_INCOME','White County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9),
(nextval('public.hibernate_sequence'),'18183','WHITLEY_IN_COUNTY_INCOME','Whitley County IN Income','incomeTaxFlatRateCalculator','INCOME_COUNTY',9)
;

-- tax_rate_income_IN.sql
INSERT INTO public.tax_rate(id, tax_definition_key, rate, range_low, range_high)
VALUES
(nextval('public.hibernate_sequence'),'ADAMS_IN_COUNTY_INCOME',0.01624,null,null),
(nextval('public.hibernate_sequence'),'ALLEN_IN_COUNTY_INCOME',0.01480,null,null),
(nextval('public.hibernate_sequence'),'BARTHOLOMEW_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'BENTON_IN_COUNTY_INCOME',0.01790,null,null),
(nextval('public.hibernate_sequence'),'BLACKFORD_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'BOONE_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'BROWN_IN_COUNTY_INCOME',0.02523,null,null),
(nextval('public.hibernate_sequence'),'CARROLL_IN_COUNTY_INCOME',0.02073,null,null),
(nextval('public.hibernate_sequence'),'CASS_IN_COUNTY_INCOME',0.02500,null,null),
(nextval('public.hibernate_sequence'),'CLARK_IN_COUNTY_INCOME',0.02000,null,null),
(nextval('public.hibernate_sequence'),'CLAY_IN_COUNTY_INCOME',0.02250,null,null),
(nextval('public.hibernate_sequence'),'CLINTON_IN_COUNTY_INCOME',0.02250,null,null),
(nextval('public.hibernate_sequence'),'CRAWFORD_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'DAVIESS_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'DEARBORN_IN_COUNTY_INCOME',0.00600,null,null),
(nextval('public.hibernate_sequence'),'DECATUR_IN_COUNTY_INCOME',0.02350,null,null),
(nextval('public.hibernate_sequence'),'DEKALB_IN_COUNTY_INCOME',0.02130,null,null),
(nextval('public.hibernate_sequence'),'DELAWARE_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'DUBOIS_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'ELKHART_IN_COUNTY_INCOME',0.02000,null,null),
(nextval('public.hibernate_sequence'),'FAYETTE_IN_COUNTY_INCOME',0.02370,null,null),
(nextval('public.hibernate_sequence'),'FLOYD_IN_COUNTY_INCOME',0.01350,null,null),
(nextval('public.hibernate_sequence'),'FOUNTAIN_IN_COUNTY_INCOME',0.02100,null,null),
(nextval('public.hibernate_sequence'),'FRANKLIN_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'FULTON_IN_COUNTY_INCOME',0.02380,null,null),
(nextval('public.hibernate_sequence'),'GIBSON_IN_COUNTY_INCOME',0.00700,null,null),
(nextval('public.hibernate_sequence'),'GRANT_IN_COUNTY_INCOME',0.02250,null,null),
(nextval('public.hibernate_sequence'),'GREENE_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'HAMILTON_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'HANCOCK_IN_COUNTY_INCOME',0.01700,null,null),
(nextval('public.hibernate_sequence'),'HARRISON_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'HENDRICKS_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'HENRY_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'HOWARD_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'HUNTINGTON_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'JACKSON_IN_COUNTY_INCOME',0.02100,null,null),
(nextval('public.hibernate_sequence'),'JASPER_IN_COUNTY_INCOME',0.02864,null,null),
(nextval('public.hibernate_sequence'),'JAY_IN_COUNTY_INCOME',0.02450,null,null),
(nextval('public.hibernate_sequence'),'JEFFERSON_IN_COUNTY_INCOME',0.00350,null,null),
(nextval('public.hibernate_sequence'),'JENNINGS_IN_COUNTY_INCOME',0.02500,null,null),
(nextval('public.hibernate_sequence'),'JOHNSON_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'KNOX_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'KOSCIUSKO_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'LAGRANGE_IN_COUNTY_INCOME',0.01650,null,null),
(nextval('public.hibernate_sequence'),'LAKE_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'LAPORTE_IN_COUNTY_INCOME',0.00950,null,null),
(nextval('public.hibernate_sequence'),'LAWRENCE_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'MADISON_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'MARION_IN_COUNTY_INCOME',0.02020,null,null),
(nextval('public.hibernate_sequence'),'MARSHALL_IN_COUNTY_INCOME',0.01250,null,null),
(nextval('public.hibernate_sequence'),'MARTIN_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'MIAMI_IN_COUNTY_INCOME',0.02540,null,null),
(nextval('public.hibernate_sequence'),'MONROE_IN_COUNTY_INCOME',0.01345,null,null),
(nextval('public.hibernate_sequence'),'MONTGOMERY_IN_COUNTY_INCOME',0.02300,null,null),
(nextval('public.hibernate_sequence'),'MORGAN_IN_COUNTY_INCOME',0.02720,null,null),
(nextval('public.hibernate_sequence'),'NEWTON_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'NOBLE_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'OHIO_IN_COUNTY_INCOME',0.01250,null,null),
(nextval('public.hibernate_sequence'),'ORANGE_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'OWEN_IN_COUNTY_INCOME',0.01300,null,null),
(nextval('public.hibernate_sequence'),'PARKE_IN_COUNTY_INCOME',0.02650,null,null),
(nextval('public.hibernate_sequence'),'PERRY_IN_COUNTY_INCOME',0.01810,null,null),
(nextval('public.hibernate_sequence'),'PIKE_IN_COUNTY_INCOME',0.00750,null,null),
(nextval('public.hibernate_sequence'),'PORTER_IN_COUNTY_INCOME',0.00500,null,null),
(nextval('public.hibernate_sequence'),'POSEY_IN_COUNTY_INCOME',0.01250,null,null),
(nextval('public.hibernate_sequence'),'PULASKI_IN_COUNTY_INCOME',0.03380,null,null),
(nextval('public.hibernate_sequence'),'PUTNAM_IN_COUNTY_INCOME',0.02000,null,null),
(nextval('public.hibernate_sequence'),'RANDOLPH_IN_COUNTY_INCOME',0.02250,null,null),
(nextval('public.hibernate_sequence'),'RIPLEY_IN_COUNTY_INCOME',0.01380,null,null),
(nextval('public.hibernate_sequence'),'RUSH_IN_COUNTY_INCOME',0.02100,null,null),
(nextval('public.hibernate_sequence'),'SCOTT_IN_COUNTY_INCOME',0.02160,null,null),
(nextval('public.hibernate_sequence'),'SHELBY_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'SPENCER_IN_COUNTY_INCOME',0.00800,null,null),
(nextval('public.hibernate_sequence'),'ST_JOSEPH_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'STARKE_IN_COUNTY_INCOME',0.01710,null,null),
(nextval('public.hibernate_sequence'),'STEUBEN_IN_COUNTY_INCOME',0.01790,null,null),
(nextval('public.hibernate_sequence'),'SULLIVAN_IN_COUNTY_INCOME',0.00600,null,null),
(nextval('public.hibernate_sequence'),'SWITZERLAND_IN_COUNTY_INCOME',0.01000,null,null),
(nextval('public.hibernate_sequence'),'TIPPECANOE_IN_COUNTY_INCOME',0.01100,null,null),
(nextval('public.hibernate_sequence'),'TIPTON_IN_COUNTY_INCOME',0.02600,null,null),
(nextval('public.hibernate_sequence'),'UNION_IN_COUNTY_INCOME',0.01750,null,null),
(nextval('public.hibernate_sequence'),'VANDERBURGH_IN_COUNTY_INCOME',0.01200,null,null),
(nextval('public.hibernate_sequence'),'VERMILLION_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'VIGO_IN_COUNTY_INCOME',0.02000,null,null),
(nextval('public.hibernate_sequence'),'WABASH_IN_COUNTY_INCOME',0.02900,null,null),
(nextval('public.hibernate_sequence'),'WARREN_IN_COUNTY_INCOME',0.02120,null,null),
(nextval('public.hibernate_sequence'),'WARRICK_IN_COUNTY_INCOME',0.00500,null,null),
(nextval('public.hibernate_sequence'),'WASHINGTON_IN_COUNTY_INCOME',0.02000,null,null),
(nextval('public.hibernate_sequence'),'WAYNE_IN_COUNTY_INCOME',0.01500,null,null),
(nextval('public.hibernate_sequence'),'WELLS_IN_COUNTY_INCOME',0.02100,null,null),
(nextval('public.hibernate_sequence'),'WHITE_IN_COUNTY_INCOME',0.01320,null,null),
(nextval('public.hibernate_sequence'),'WHITLEY_IN_COUNTY_INCOME',0.01483,null,null)
;


