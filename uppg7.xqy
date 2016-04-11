

for $x in doc('Desktop/mondial.xml')/mondial/organization
for $y in doc('Desktop/mondial.xml')/mondial/country
where contains($x/name, 'Nuclear') and not(exists($x/established)) and $y/name = tokenize($x/@headq, '-')[2] and $y/encompassed/@continent = 'europe' return $x/name
