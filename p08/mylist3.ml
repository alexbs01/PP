let hd l = match l with
	| header::_ -> header
	| [] -> raise(Failure "hd")
	
let tl l = match l with
	| _::tail -> tail
	| [] -> raise(Failure "tl")

let rec append l1 l2 = 
	if l1 = []
	then l2
	else (hd l1) :: (append(tl l1) l2)

let rec rev = function
    [] -> []
    | head::tail -> append (rev tail) [head]



let rec remove a l = match l with 
    [] -> l
    | head::tail -> if (a = head) 
					  then tail
					  else head::(remove a tail)


let rec remove_all a l = match l with
	[] -> []
    | head::tail -> if (a = head) 
					then (remove_all a tail)
					else head::(remove_all a tail)



let rec ldif l1 l2 = match (l1, l2) with
    head1::tail1, head2::tail2 -> ldif (remove_all head2 l1) tail2
    | _ -> l1;;


let lprod l1 l2 =	
	let rec aux acc = function
		[], _ -> rev acc
		| _::tail1,[] -> aux acc (tail1, l2)
		| head1::tail1, head2::tail2 -> aux ((head1, head2)::acc) (head1::tail1, tail2)
	in aux [] (l1, l2)


let rec divide = function
    head1::head2::tail -> 
	let  l1, l2 = divide tail 
	in head1::l1, head2::l2
		| l -> l, []
	