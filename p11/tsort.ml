
open Bin_tree;;

let insert_tree ord x t =
	let rec insert = function
		| Empty -> Node (x, Empty, Empty)
		| Node (y, left, right) ->
			if ord x y 
			then Node (y, insert left, right)
			else Node (y, left, insert right)
	in insert t;;

let tsort ord l =
	inorder (List.fold_left (fun a x -> insert_tree ord x a) Empty l)
