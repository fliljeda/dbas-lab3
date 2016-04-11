
(: Give names of all the countries (recursively) reachable from Sweden via borders :)
declare function local:reachableFrom($countries as element(country)*, $oldreachable as element(country)*){
    let $newreachable :=
        for $allCountries in $countries
        for $countryReach in $oldreachable
        where $countryReach/border/@country = $allCountries/@car_code
        return $allCountries
 
    let $new := $newreachable union $oldreachable
    return if (count($oldreachable) = count($new)) then $new
    else local:reachableFrom($countries, $new)
};
 
let $countryData :=
  let $countries := /mondial/country
  let $country := $countries[name='Sweden']
  return local:reachableFrom($countries, $country)
 
return $countryData/name
