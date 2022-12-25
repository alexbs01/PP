let rec power x y = 
	if y = 0 then 1
	else x * power x (y - 1)
	
let rec power' x y = 
    if y = 0 then 1 
    else if (y mod 2 = 0) then power' (x * x) (y / 2)
    else x * power' (x * x) (y / 2)
(* La función power' es más eficiente que la primera, porque por cada
	iteriación que da el valor del exponente y se reduce a la mitad
	y no solo en 1 como en power *)
	
let rec powerf x y = 
    if y = 0 then 1. 
    else if (y mod 2 = 0) then powerf (x*.x) (y / 2)
    else x *. powerf (x *. x) (y / 2)
(* Solo hay que poner que las x sean valores flotantes *)