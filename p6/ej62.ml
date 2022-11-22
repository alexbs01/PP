(* curry : (('a * 'b) -> 'c) -> ('a -> ('b -> 'c)) *)

let curry =  function c -> function a -> function b -> c (a,b)
let curry c a b = c (a,b)

(* uncurry : (('a -> ('b -> 'c) -> ('a * 'b) -> 'c)) *)
let uncurry = function c -> function (a,b) -> c a b
let uncurry c(a,b) = c a b

(* ----- *)

(* uncurry (+); *)
(* Devolverá lo que hace uncurry *)

let sum = (uncurry (+))
(* Se almacena en sum, lo que hace uncurry *)

(* sum 1;; *)
(* Retornará un error porque necesita dos parámetros *)

(* sum (2,1); *)
(* Devolverá 3, porque en la línea de let sum, indicamos que queremos 
   hacer una suma *)

let g = curry (function p -> 2 * fst p + 3 * snd p)
(* Almacena en g, lo que queremos hacer con curry *)
(* fst retorna el primer elemento de una pareja *)
(* snd retornar el segundo elemento de una pareja *)

(* g (2,5); *)
(* Debería dar un error por no recibir el tipo de dato correcto *)

let h = g 2
(* En h, metemos la operación de g 2 *)

(* h 1, h 2, h 3;; *)
(* 	h 1 = g 2 1 = 2 * 2 + 3 * 1 = 7
	h 2 = g 2 2 = 2 * 2 + 3 * 2 = 10
	h 3 = g 2 3 = 2 * 2 + 3 * 3 = 13  *)
	
(*	h 1, h 2, h 3 = (7, 10, 13)  *)

(* ----- *)

(* comp : ('a -> 'b) -> ('c -> 'a) -> ('c -> 'b) *)
let comp = function f -> function g -> function c -> f (g c)

let f = let square x = x * x in comp square ((+) 1)

let i = function a -> a;;
let j = function (a, b) -> a;;
let k = function (a, b) -> b;;
let l = function a -> [a];;


