
type 'a g_tree =
  Gt of 'a * 'a g_tree list
;;

(* ------------------------------------- *)
let rec size = function 
	Gt (_, []) -> 1
	| Gt (r, h::t) -> size h + size (Gt (r, t))

(* ------------------------------------- *)
let size tree =
  let rec aux = function
    | Gt (_, hijo) ->
        1 + List.fold_left (fun acc t -> acc + aux t) 0 hijo
  in aux tree

(* ------------------------------------- *)
let height tree =
  let rec aux = function
    | Gt (_, hijo) ->
        if hijo = [] 
		then 1
        else 1 + List.fold_left max 0 (List.map aux hijo)
		
  in aux tree

(* ------------------------------------- *)
let leaves tree =
	let rec aux acc = function
		| Gt (x, hijo) ->
			if hijo = [] 
			then x :: acc
			else List.fold_left aux acc hijo
			
	in aux [] tree

(* ------------------------------------- *)
let mirror tree =
	let rec aux = function
		| Gt (x, hijo) ->
			Gt (x, List.rev (List.map aux hijo))
			
	in aux tree

(* ------------------------------------- *)
let preorden tree =
	let rec aux acc = function
		| Gt (x, hijo) ->
			let acc' = x :: acc 
			in List.fold_left aux acc' hijo
			
	in aux [] tree
  
let preorder tree = List.rev (preorden tree)

(* ------------------------------------- *)
let postorden tree =
	let rec aux acc = function
		| Gt (x, hijo) ->
			let acc' = List.fold_left aux acc hijo 
			in x :: acc'
			
	in aux [] tree
  
let postorder tree = List.rev (postorden tree)



