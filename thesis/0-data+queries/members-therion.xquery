for $member in //band[@name='Nightwish']//member
let $memberName := $member/text()
return $memberName

