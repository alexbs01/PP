(* Aunque no sea una función propia del paradigma funcional, no queda otra que 
	usarla para generar números aleatorios *)
let rec generar_lista_aleatoria n acc max =
  if n = 0 then acc
  else generar_lista_aleatoria (n - 1) (Random.int max :: acc) max

(* Este algoritmo funcionará mejor cuando la lista esté ya casi ordenada,
 por lo que si está ordenado de forma descendente o esté de forma aleatoria
 no será la mejor opción *)
let rec qsort1 ord = function
	[] -> []
	| h::t -> let after, before = List.partition (ord h) t in
	qsort1 ord before @ h :: qsort1 ord after
	
(* Este algoritmo al usar funciones terminales podrá usarse con listas más grandes *)
let rec qsort2 ord =
	let append' l1 l2 = List.rev_append (List.rev l1) l2 
		in function
			[] -> []
			| h::t -> let after, before = List.partition (ord h) t in
			append' (qsort2 ord before) (h :: qsort2 ord after)

let l1 = generar_lista_aleatoria 500000 [] 500000
(*El segundo es más lento cuando la lista está inicializada de con números aleatorios
u orenados inversamente*)