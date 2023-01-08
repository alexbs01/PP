let rec sum_cifras n = (* sum_cifras 1234 -> 10 *)
	if n = 0 
	then 0
	else n mod 10 + sum_cifras (n / 10)
	 
let rec num_cifras n = (* num_cifras 1234 -> 4 *)
	if n = 0 
	then 0
	else 1 + num_cifras (n / 10)
	
let rec exp10 n = (* exp10 3 -> 1000 *)
	if n = 0 
	then 1
	else 10 * exp10 (n - 1)

let rec reverse n = (* reverse 1234 -> 4321 *)
	if n = 0 
	then 0
	else (n mod 10) * exp10 (num_cifras n - 1) + reverse (n / 10)

let rec palindromo s = (* palindromo vaca -> false ;; palindromo abba -> true *)
	let rec counter i =
		if i >= (String.length s - i) 
		then true
		else if s.[i] <> s.[String.length s - i - 1] 
			 then false
			 else counter (i + 1)
	in counter 0
