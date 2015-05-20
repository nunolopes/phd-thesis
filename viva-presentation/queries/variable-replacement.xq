sqlQuery(
  fn:concat(
    "SELECT address from clients
    where person = ", $person)
)
