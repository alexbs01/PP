(* Comprobamos si no está guardado *)
let notMem l e =
  not (List.mem e l)

(* Comprobamos si la posición es un arbol *)
let rec intTree tree (x, y) =
  match tree with
  [] -> false
  | h::t ->
    if h = (x, y)
      then true
      else intTree t (x, y)

(* Comprobamos si es un movimiento legal *)
let legalMoves visited s tree = 
	let (x, y) = List.hd visited
		in let rec all_moves t =
			if t > 0
			then [x + t,y;  x,y + t;  x - t,y;  x,y - t] @ all_moves (t - 1)
			else []
	in List.filter (notMem visited) (List.filter (intTree tree) (all_moves s))


let rec allTour m n tree visited s mem = function
	| [] -> mem
	| h::t -> allTour m n tree visited s (
		if h = (m,n)
			then List.rev (h::visited)::mem
			else mem @ (allTour m n tree (h::visited) s mem (legalMoves (h::visited) s tree))
		) t

let shortest lista = match lista with
	| [] -> raise Not_found
	| h::[] -> h
	
	| h::t ->	
		let rec aux lista a =
			match (lista) with
			| [] -> a
			
			| h::t ->	match List.compare_lengths h a with
				| 1 | 0 -> aux t a
				| _ -> aux t h
		in aux t h

let shortest_tour m n tree s =
	if notMem tree (1,1)
		then raise Not_found
		else  if (1,1) = (m,n)
						then [(1,1)]
						else shortest (allTour m n tree [(1,1)] s [] 
							(legalMoves [(1,1)] s tree));;