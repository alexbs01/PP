let hd l = match l with
	| first::_ -> first
	| [] -> raise (Failure "Fallo de hd")
	
let tl l = match l with
	| _::b -> b
	| [] -> raise (Failure "Fallo de tl")
	
let rec length l = function
	[] -> 0
	| _::t -> 1 + length t
	
let rec compare_length l1 l2 =
	match l1, l2 with
		| ([], _) -> -1
		| ([], []) -> 0
		| (_, []) -> 1
		| (_::t1, _::t2) -> compare_length t1 t2
		
