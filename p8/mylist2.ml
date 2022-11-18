(* Retorna el primer elemento de la lista *)
let hd l = match l with
	| header::_ -> header
	| [] -> raise(Failure "hd")
	
(* Retorna la cola de una lista, todos los elementos menos el primero *)
let tl l = match l with
	| _::tail -> tail
	| [] -> raise(Failure "tl")

(* Cuenta los elementos de una lista *)	
let length l =
    let rec aux a = function
        [] -> a
        | head::tail -> aux (a + 1) tail
    in aux 0 l

(* Comapra que lista es más larga *)	
let rec compare_lengths l1 l2 =
	match l1, l2 with
		([],[]) -> 0
		| ([], _) -> -1
		| (_, []) -> 1
		| (_::t1, _::t2) -> compare_lengths t1 t2
		
(* Retorna el n-esimo elemento de l *)
let rec nth l n = 
	if(n = 0) 
	then hd l 
	else if(n > 0) 
		 then nth (tl l)(n-1)
		 else if(n < 0) 
			  then raise (Invalid_argument "List.nth")
			  else raise (Failure "nth")
	
(* Concatena l1 con l2 *)
let rec append l1 l2 = 
	if l1 = []
	then l2
	else (hd l1) :: (append(tl l1) l2)
	
(* Retorna el primer elemento que cumple la condición p *)
(* find (function b -> b mod 2 = 1) lista *)
(* Retornará el primer elemento impar de lista *)
let rec find p = function
    [] -> raise Not_found
    | header::tail -> if p header 
					  then header 
					  else find p tail

(* Comprueba que todos los elementos de la lista cumplen la condicón p *)
let rec for_all p = function
    [] -> true
    | header::tail -> (p header) && (for_all p tail)
	
(* Checkea que al menos uno de los elementos de la lista cumpla la fución p *)
let rec exists p = function
	[] -> false
	| header::tail -> p header || exists p tail	

(* Dice si el elemento n está o no en la lista *)		
let rec mem n = function
    [] -> false
    | header::tail -> 
		if(n = header) 
		then true
		else (mem n tail);;

(* Retorna una lista donde todos los elementos cumplen la condición p *)
let rec filter p = function
	[] -> []
	| header::tail ->
		if(p header)
			then header::(filter p tail)
			else (filter p tail)

(* Hace lo mismo que filer, pero con otro nombre *)
let find_all p = filter p

(* Retorna dos listas, una con lo elementos que satisfacen p y otra con los 
que no *)
let rec partition p = function
	[] -> ([],[])
	| header::tail -> 
	let (satisface, noSatisface) = partition p tail
	in if (p header) 
		then (header::satisface, noSatisface)
		else (satisface, header::noSatisface)
	
(* Transforma una lista de parejas, en dos listas, una con las primeras paerjas
y otra con las segundas parejas *)
let rec split = function
	[] -> ([],[])
	| (header1, header2)::tail ->
		let tail1, tail2 = split tail
		in header1::tail1, header2::tail2

(* Hace la operación inversa a la otra función, se le pasan dos listas y retorna
parejas formadas entre las dos listas *)
let rec combine l1 l2 =
	match (l1, l2) with
	[], [] -> []
	| header1::tail1, header2::tail2 -> 
		(header1, header2) :: (combine (tail1) (tail2))
		| _ -> raise (Invalid_argument "combine");;

(* Retorna una lista dada la vuelta *)
let rec rev = function
    [] -> []
    | head::tail -> append (rev tail) [head]

(* Comprueba desde 0 hasta n si cumplen la función f *)
(* init 200 (function b -> b mod 7 = 1 && b mod 5 = 0);;
   Retorna una lista de booleanos donde es True en aquellos números que son 
   divisibles por 5 y su resto de dividirlo por 7 da 1*)
let init n f = 
    if n < 0 then raise (Invalid_argument "init")
    else let rec aux acc i =
        if i = n then rev acc
        else aux (f i::acc) (i+1)
    in aux[] 0

(* Le da la vuelta a l1 y se lo concatena a l2 *)
let rev_append l1 l2 =
	if l1 = [] then l2
	else append (rev l1) l2

(* Concatena una lista de listas en el orden que son introducidas *)
(* let a = [1; 2; 3]
   let b = [4; 5; 6]
   let c = [7; 8; 9] 
   concat [b; c; a];;
   [4; 5; 6; 7; 8; 9; 1; 2; 3] *)
let rec concat = function
	[] -> []
	| head::tail -> append head (concat tail)
	
(* Hace exactamente lo mismo que concat, pero con otro nombre *)
let flatten = concat
	
(* Ejecuta una función sobre todos los elementos de una lista *)
let rec map f = function
    [] -> []
    | head::tail -> (f head) :: (map f tail)
	
(* Tiene hace rev al map calculado *)
let rev_map f l = rev (map f l)
	
(* Hace map en dos listas*)
let rec map2 f l1 l2 =
    if (length l1 != length l2)
        then raise (Invalid_argument "map2")
    else if (length l1 == 0) then []
    else (f(hd l1)(hd l2)) :: map2 f (tl l1) (tl l2)

let rec fold_left f a = function
    [] -> a
    | head::tail -> fold_left f (f a head) tail

let rec fold_right f l a = match l with
  | [] -> a
  | head::tail -> f head (fold_right f tail a)

	
	
	