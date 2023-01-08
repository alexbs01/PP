(* Comprobamos si el elemento no está guardado *)
let notMem l e =
	not (List.mem e l)

(* Comprueba si una posición tiene un árbol o no *)
let rec inTree tree (x, y) =
	match tree with
	[] -> false
	| h::t ->
		if h = (x, y)
		then true
		else inTree t (x, y)

(* Comprueba si un movimiento es legal o no *)
let legalMoves visited s tree = 
	let (x, y) = 
		List.hd visited
	in let rec allMoves t =
			if t>0
			then [x + t, y; x, y + t; x - t, y; x, y - t] @ allMoves (t - 1)
			else []
in List.filter (notMem visited) (List.filter (inTree tree) (allMoves s))

let tour m n tree s =
	let rec aux visited = function
		| [] -> raise Not_found
		| h::t ->
			if h=(m, n)
			then List.rev (h::visited)
			else try aux (h::visited) (legalMoves (h::visited) s tree)
				 with Not_found -> aux visited t
	in 	if notMem tree (1, 1)
		then raise Not_found
		else if (1, 1) = (m,n)
			 then [(1, 1)]
			 else aux [(1, 1)] (legalMoves [(1, 1)] s tree)