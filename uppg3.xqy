
let $validranges := for $x in doc('mondial.xml')/mondial/mountain
  where exists($x/mountains)
  let $y := $x/mountains
  group by $y
  where count($x) > 2
  return $y
 
for $x in doc("mondial.xml")/mondial/mountain
where exists($x/mountains)
let $range := $x/mountains
let $countries := tokenize($x/@country, " ")
for $country in $countries
group by $range
where data($range) = $validranges
return <ans><mountrange>{$range}</mountrange><country>{count(distinct-values($country))}</country></ans>
