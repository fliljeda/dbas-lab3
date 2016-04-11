
declare function local:popIn($years as xs:integer, $country as xs:string)
{
for $x in doc("database/mondial.xml")/mondial/country
where exists($x/population_growth) and $country = data($x/name)
let $pop := data($x/population[last()])
let $growth := (<int>{$x/population_growth}</int> + 100) div 100
let $estpop := xs:long($pop*(math:pow($growth,$years)))
return $estpop
};
 
for $x in doc("Database/mondial.xml")/mondial/country
order by $x/name
return
<country>
  <name>{$x/name} </name>
  <PopIn10>{local:popIn(10, $x/name)}</PopIn10>
  <PopIn25>{local:popIn(25, $x/name)}</PopIn25>
  <PopIn50>{local:popIn(50, $x/name)}</PopIn50>
  <PopIn100>{local:popIn(100, $x/name)}</PopIn100>
</country>
