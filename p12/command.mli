
open Context
open Arith

exception End_of_program

type command =
    Eval of arith
  | Var_def of string * arith
  | Quit

val run : float context -> command -> float context

