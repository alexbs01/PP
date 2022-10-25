let rec power' x y = 
    if y = 0 then 1 
    else if (y mod 2 = 0) then power' (x * x) (y / 2)
    else x * power' (x * x) (y / 2)
	
let rec powmod m b e=
    let restoMB = b mod m
	in if e > 0
	then if (e mod 2) = 0
		then powmod m (restoMB * restoMB) (e / 2) mod m
		else restoMB * powmod m (restoMB * restoMB) ((e - 1) / 2) mod m
	else 1
		