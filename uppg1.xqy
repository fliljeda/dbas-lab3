for $x in doc('Desktop/mondial.xml')/mondial/country
for $y in doc('Desktop/mondial.xml')/mondial/sea
where $y/name = "Baltic Sea" and $x/@car_code = tokenize($y/@country, " ")
return tokenize($x/@capital, '-')[3] (: Vilnius is named "l" in xml doc :)
