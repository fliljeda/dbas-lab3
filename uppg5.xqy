
let $continents :=
  for $x in doc('mondial.xml')/mondial/continent
  where $x/area > 9000000
  return lower-case($x/name)

(: Cities can be both directly under country or under province. Need to be done in this way to get the correct continent:)

let $cities1 :=
  for $x in doc('mondial.xml')/mondial/country/province/city
  where $x/latitude >= -35 and $x/latitude <= 35 
  and $x/../../encompassed[1]/@continent = $continents
  return <cont cont = "{data($x/../../encompassed[1]/@continent)}"/>
  
let $cities2 :=
  for $x in doc('mondial.xml')/mondial/country/city
  where $x/latitude >= -35 and $x/latitude <= 35
  and $x/../encompassed[1]/@continent = $continents
  return <cont cont = "{data($x/../encompassed[1]/@continent)}"/>

return
  for $values in $continents
  let $count1 := count($cities1[@cont = $values])
  let $count2 := count($cities2[@cont = $values])
  return concat($values," ",$count1 + $count2) 
