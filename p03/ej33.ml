let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1

let g1 n = if n mod 2 = -1 
		   then true 
		   else (if n >= 0 
				 then n mod 2 = 0 
				 else false)

let g2 n = (function true -> true | false -> (function true -> n mod 2 = 0 | false -> false) (n >= 0)) (n mod 2 = -1)