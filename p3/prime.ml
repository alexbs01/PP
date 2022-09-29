let is_prime n =
	let rec check_from i =
		i >= n ||
		(n mod i != 0 && check_from (i + 1))
	in check_from 2

let is_prime2 n = 
    let rec check_from i =
        (float_of_int i) >= (sqrt(float_of_int n)) +. 1. || (* Criba de Eratostenes*)
        (n mod i != 0 && check_from (i + 1))
    in check_from 2

let rec next_prime n = (* Calcula el próximo número primo usando la función is_prime *)
	if is_prime (n + 1) then n + 1 
	else next_prime (n + 1)
	
let rec next_prime2 n = (* Calcula el próximo número primo, pero utilizando la función is_prime2 *)
	if is_prime2 (n + 1) then n + 1
	else next_prime2 (n + 1)
	
let rec last_prime_to n = (* Calcula el anterior primo al dado con is_prime *)
	if is_prime n then n 
	else last_prime_to (n - 1)
	
let rec last_prime_to2 n = (* Calcula el anterior primer al recibido por teclado usando is_prime2 *)
	if is_prime2 n then n 
	else last_prime_to2 (n - 1)
	
let numArgumentos = Array.length Sys.argv

let main = 
    if numArgumentos != 2 then print_endline "Número de parámetros incorrecto"
    else print_endline("Siguiente primo con next_prime2\t\t" ^ string_of_int( next_prime2( int_of_string( Array.get Sys.argv(1) ) ) ) );
		 print_endline("Siguiente primo con next_prime\t\t" ^  string_of_int( next_prime( int_of_string( Array.get Sys.argv(1) ) ) ) );
		 print_endline("Anterior primo con last_prime_to2\t" ^ string_of_int( last_prime_to2( int_of_string( Array.get Sys.argv(1) ) ) ) );
		 print_endline("Anterior primo con last_prime_to\t" ^  string_of_int( last_prime_to( int_of_string( Array.get Sys.argv(1) ) ) ) )
