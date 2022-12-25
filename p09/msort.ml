let rec generar_lista_aleatoria n acc max =
  if n = 0 then acc
  else generar_lista_aleatoria (n - 1) (Random.int max :: acc) max


(* --------------------------------------------- *)
let rec divide l = match l with
	h1::h2::t -> let t1, t2 = divide t in (h1::t1, h2::t2)
	| _ -> l, []
	
let divide' l =
  let rec aux dvd1 dvd2 = function
      [] -> (List.rev dvd1, List.rev dvd2)
    | head::[] -> (List.rev (head::dvd1), List.rev dvd2)
    | head1::head2::tail -> aux (head1::dvd1) (head2::dvd2) tail
  in aux [] [] l;;

(* --------------------------------------------- *)
let rec merge = function
	[], l | l, [] -> l
	| h1::t1, h2::t2 -> if h1 <= h2 
						then h1 :: merge (t1, h2::t2)
						else h2 :: merge (h1::t1, t2)
						
let merge' ord (l1, l2) =
	let rec aux (a1, a2) mer = match a1, a2 with
		[], l | l, [] -> List.rev_append mer l
		| head1::tail1, head2::tail2 -> if ord head1 head2 
										then aux (tail1, head2::tail2) (head1::mer)
										else aux (head1::tail1, tail2) (head2::mer)
	in aux (l1, l2) [];;

(* --------------------------------------------- *)
let rec msort1 l = match l with
	[] | _::[] -> l
	| _ -> let l1, l2 = 
			divide l in
			merge (msort1 l1, msort1 l2)
			
let rec msort2 ord l = match l with
    [] | _::[] -> l
	| _ -> let l1, l2 = divide' l
			in merge' ord (msort2 ord l1, msort2 ord l2);;
			
(* --------------------------------------------- *)			 
let l2 = List.filter (fun x -> x mod 2 = 0) (generar_lista_aleatoria 500000 [] 500000)



