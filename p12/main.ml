
open Parsing;;
open Lexing;;

open Context;;
open Lib;;
open Arith;;
open Command;;
open Parser;;
open Lexer;;

let rec loop ctx =
  print_string ">> ";
  
	try loop (try let cmd = s token (from_string (read_line ())) in
                let new_ctx = run ctx cmd in
                print_newline ();
                new_ctx
            with No_binding s -> print_endline ("Variable " ^ s ^ " not defined\n"); ctx
                |Function_not_defined s-> print_endline ("Function " ^ s ^ " not defined\n"); ctx
                |Lexical_error -> print_endline "Lexical error\n"; ctx
                |Parse_error -> print_endline "Syntax error\n"; ctx) 
	with End_of_program -> ();;

let _ = print_endline "Floating point calculator..." in
let _ = loop empty_context in 
print_endline "... bye!!!";;

