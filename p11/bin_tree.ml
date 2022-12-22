
type 'a bin_tree =
    Empty
	| Node of 'a * 'a bin_tree * 'a bin_tree
;;

let map_tree f tree =
	let rec aux = function
		| Empty -> Empty
		| Node (x, l, r) -> Node (f x, aux l, aux r)
	in aux tree


let rec fold_tree f a = function
    Empty -> a
	| Node (x, l, r) -> f x (fold_tree f a l) (fold_tree f a r)

let rec sum t = 
	fold_tree(fun a b c-> a + b + c) 0 t

let rec prod t = 
	fold_tree(fun a b c-> a *. b*. c) 1. t

let rec size t = 
	fold_tree(fun a b c-> 1 + b + c) 0 t

let height tree =
	let rec aux = function
		| Empty -> 0
		| Node (_, l, r) -> 1 + max (aux l) (aux r)
	in aux tree


let rec inorder t = 
	fold_tree(fun a b c -> b @ [a] @ c) [] t

let rec mirror t = 
	fold_tree(fun a b c -> Node(a, c, b)) Empty t

