declare namespace ac="http://xsparql.deri.org/data/";
declare namespace foaf="http://xmlns.com/foaf/0.1/";
declare variable $rdf external;

for ($n, $m) in
  SELECT $person $name FROM $rdf
  WHERE { $person foaf:name $name . }
return 
  <person name="{$n}">{ for ($item) in
     SELECT $itemname WHERE { $ca ac:buyer $person . 
       optional { $ca ac:itemRef $itemRef . 
         $itemRef ac:locatedIn [ ac:name "europe" ] . 
         $itemRef ac:name $itemname } . 
    } return <item>{$itemname}</item>
  }</person>

