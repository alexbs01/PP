let rec fact = function (* Calcula el factorial *)
	0 -> 1 
  | n -> n * fact (n - 1);;
  
try (* Se intenta ejecutar este código que puede dar error *)
	print_endline (string_of_int (fact (int_of_string Sys.argv.(1))))
	
with (* Si no puede busca el error que es y ejecuta el siguiente código *)
  | Stack_overflow
  | Invalid_argument _ 
  | Failure _ -> print_endline "argumento invalido"