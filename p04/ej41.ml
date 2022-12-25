let rec sum_cifras n = 
	if n = 0 then 0
	else n mod 10 + sum_cifras (n / 10)
	 

let rec num_cifras n =
	if n = 0 then 0
	else 1 + num_cifras (n / 10)
	
let rec exp10 n = 
	if n = 0 then 1
	else 10 * exp10 (n - 1)

let rec reverse n =
	if n = 0 then 0
	else (n mod 10) * exp10 (num_cifras n - 1) + reverse (n / 10)

let rec palindromo s = 
	let rec counter i =
		if i >= (String.length s - i) then true
		else if s.[i] <> s.[String.length s - i - 1] then false
			else counter (i + 1)
	in counter 0
