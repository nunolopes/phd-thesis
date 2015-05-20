declare function xsp:rdfTerm($VarName) {
  typeswitch $VarName
  case $e as literal
    let $DT := data($e/@datatype)
    let $L:= data($e/@xml:lang)
    return concat("""", $e, 
          if($L) then concat("@", $L) else "",
          if($DT) then concat("^^<", $DT,">") else "", 
        """")
  case $e as bnode  return concat("_:", $e)
  case $e as uri return concat("<", $e, ">")
  default return "" };
