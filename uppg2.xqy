
let $list := 
  for $x in doc('Desktop/mondial.xml')/mondial/desert
  order by $x/latitude descending
  return $x/name
return $list[1]
