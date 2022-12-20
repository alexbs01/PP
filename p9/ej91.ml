(* let rec to0from n =
		if n < 0 
		then [] 
		else n :: to0from (n-1);; *)

let to0from n = 
	List.rev (List.init (n + 1) (function x -> x))



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



(* let incseg l = List.fold_right (fun x t -> x::List.map ((+) x) t) l [];; *)
  
let incseg l = 
  let rec aux l acc l2 = match l with
      [] -> []
	| [head] -> List.rev ((head + acc)::l2)
    | head::tail -> aux tail (head + acc) ((head + acc)::l2)
  in aux l 0 []
	


(* let rec remove x = function 
	[] -> [] | 
	h::t -> if x = h 
			then t 
			else h :: remove x t;;*)

let remove x l =
  let rec aux acc = function
    [] -> l | 
	head::tail -> if x = head 
			then List.rev_append acc tail
            else aux (head::acc) tail 
  in aux [] l


(* let rec compress = function
		| h1::h2::t -> if h1 = h2 
					   then compress (h2::t)
				       else h1 :: compress (h2::t)
		| l -> l;; *)

let compress l =
  let rec aux acc l = match l with
        | head1::head2::tail -> if head1=head2 then aux acc (head2::tail)
                       else aux (head1::acc) (head2::tail)
        | [head] -> aux (head::acc) []
        | []-> List.rev acc
  in (aux [] l);;