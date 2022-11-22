(* let rec to0from n =
		if n < 0 
		then [] 
		else n :: to0from (n-1);; *)

let to0from n = 
	let rec aux l i =
		if i < 0 
		then List.rev l
		else aux (i::l) (i - 1)
	in aux [] n


(* let rec fromto m n =
		if m > n 
		then [] 
		else m :: fromto (m+1) n;; *)

let fromto m n =
	let rec aux l i =
		if i < m 
		then l
		else aux (i::l) (i - 1)
	in aux [] n


(* let incseg l =
		List.fold_right (fun x t -> x::List.map ((+) x) t) l [];; *)



(* let rec remove x = function
		[] -> []
		| h::t -> if x = h 
		   		  then t 
				  else h :: remove x t;;*)



(* let rec compress = function
		| h1::h2::t -> if h1 = h2 
					   then compress (h2::t)
				       else h1 :: compress (h2::t)
		| l -> l;; *)
