let $aux := sparqlQuery(
  fn:concat(
    "SELECT * from <input.rdf> 
    where { $ca :buyer $person .}" )
)
