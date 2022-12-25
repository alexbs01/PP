
open Context

type arith_oper =
    Opp
  
type arith_bi_oper =
    Sum | Sub | Prod | Div | Mod | Pow

type arith =
    Float of float
  | Var of string
  | Arith_op of arith_oper * arith
  | Arith_bi_op of arith_bi_oper * arith * arith
  | Fun_call of string * arith
  
val eval : float context -> arith -> float

