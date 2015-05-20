declare function xsp:validTriple($sub, $pred, $obj) {
  if(xsp:validSubject($sub)
     and xsp:validPredicate($pred) 
     and xsp:validObject($obj))
  then concat(xsp:rdfTerm($sub), " ",  
              xsp:rdfTerm($pred), " ", 
              xsp:rdfTerm($obj), ".")
  else "" };
