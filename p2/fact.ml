let rec fact = function (* Calula el factorial de un número de forma recursiva *)
	0 -> 1
	| n -> n * fact (n - 1)

let numArgumentos = Array.length Sys.argv (* Contamos cuantos argumentos hay *)

let main = (* Si no son dos, retorna un error *)
    if numArgumentos != 2 then print_endline "Número de parámetros incorrecto"
    else print_endline(string_of_int( fact( int_of_string( Array.get Sys.argv(1) ) ) ) )
	(* Para imprimir pasamos el string a entero, calculamos el factorial de ese número,
		y lo pasamos a string de nuevo para imprimirlo por pantalla *)