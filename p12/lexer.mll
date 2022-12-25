{
  open Parser;;
  exception Lexical_error;;
}

rule token = parse
    [' ' '\t' '\n']
               { token lexbuf }   (* ignore blanks *)
  | "quit"     { QUIT }
  | '+'        { PLUS }
  | '-'        { MINUS }
  | '*'        { TIMES }
  | '/'        { DIVIDE }
  | '%'        { REMAINDER }
  | '^'        { POWER }
  | '='        { EQUAL }
  | '('        { LPAREN }
  | ')'        { RPAREN }
  | (['+' '-'])?['0'-'9']+('.'['0'-'9']*)?(['e' 'E'](['+' '-'])?['0'-'9']+)?
               { FLOAT (float_of_string (Lexing.lexeme lexbuf)) }
  | ['a'-'z'] (['a'-'z' '0'-'9' '_'])*
               { ID (Lexing.lexeme lexbuf) }
  | eof        { EOF }
  | _          { raise Lexical_error }

