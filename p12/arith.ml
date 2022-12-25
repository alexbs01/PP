
open Context;;
open Lib;;

type arith_oper =
    Opp;;

type arith_bi_oper =
    Sum | Sub | Prod | Div | Mod | Pow;;

type arith =
    Float of float
	| Var of string
	| Arith_op of arith_oper * arith
	| Arith_bi_op of arith_bi_oper * arith * arith
	| Fun_call of string * arith;;
  
let bin_ops = [(Sum, (+.)); (Sub, (-.)); (Prod, ( *.)); (Div, (/.)); (Mod, (Float.rem)); (Pow, (Float.pow))];;

let rec eval ctx = function
    Float f ->
      f

	| Var name ->
		get_binding ctx name

	| Arith_op (op, ar) ->
		0. -. (eval ctx ar)
     
	| Arith_bi_op (bi_op, ar1, ar2) ->
		(List.assoc bi_op bin_ops) (eval ctx ar1) (eval ctx ar2)
  
	| Fun_call (f, arith) ->
		(get_function f) (eval ctx arith);;

