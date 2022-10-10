let rec fib n =
	if n <= 1 then n
	else fib (n-1) + fib (n-2)
	
let rec calculoSiguienteNumero n =
    if n = 0
    then "0"
    else calculoSiguienteNumero(n-1) ^ "\n" ^ string_of_int(fib(n));;	

let rec mensaje = 
    if (Array.length Sys.argv) = 2
    then (calculoSiguienteNumero (int_of_string(Sys.argv.(1))))
    else ("Número de argumentos incorrecto") in
    print_endline mensaje;;