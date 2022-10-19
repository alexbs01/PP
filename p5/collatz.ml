let f n =
    if n mod 2 = 0 then n / 2
    else 3 * n + 1
	
let rec orbit n =
    if n = 1 then "1"
	else string_of_int n ^ ", " ^ orbit(f n)   

let rec length n =
    if n = 1 then 0
    else 1 + length(f n)
	
let rec top n =
    if n = 1 then 0
    else max n (top(f n))
(* Con la función max podemos averiguar cual de dos números es el más grande *)
	
let rec length'n'top n =
    if n = 1  then (0,1)
    else let largo, maximo = length'n'top (f n)
    in (largo + 1, max n maximo)
	
let rec longest_in m n=
    let rec aux i=
        if i <= m then (m, length m)
        else 
			let (j, lengthJ) = aux (i - 1) in
			let lengthI = length i in
				if lengthJ >= lengthI then (j, lengthJ) else (i, lengthI)
    in (aux n)
	
let rec highest_in m n=
    let rec aux i =
        if i <= m then (m, length m)
        else 
			let (j, lengthJ) = aux (i - 1) in
			let lengthI = length i in
				if lengthJ >= lengthI then (j, lengthJ) 
				else (i, lengthI)
    in (aux n)

let rec highest_in m n =
    let rec aux i =
        if i <= m then (m, top m)
        else let (j, topJ)= aux (i - 1) in
			let topI = top i in
			if topI > topJ then (i, topI) 
			else (j, topJ)
      in (aux n)

	
	
	
	
	
	
	