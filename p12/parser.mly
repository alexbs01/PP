%{
  open Arith;;
  open Command;;
%}

%token EOF
%token QUIT
%token PLUS MINUS TIMES DIVIDE REMAINDER POWER
%token EQUAL
%token LPAREN RPAREN
%token <float> FLOAT
%token <string> ID

/*
The expression precedence is as follows: (lowest to highest)
  + and - operators, left associative
  *, / and % operators, left associative
  ^ operator, right associative
  unary - operator, nonassociative
  function call, nonassociative
*/
%left PLUS MINUS
%left TIMES DIVIDE REMAINDER
%right POWER
%nonassoc UNARY_MINUS
%nonassoc FUNCTION_CALL

%start s
%type <Command.command> s

%%

s :
    arith EOF
      { Eval $1 }
  | ID EQUAL arith EOF
      { Var_def ($1, $3) }
  | QUIT EOF
      { Quit }
;

arith :
    FLOAT
      { Float $1}
  | ID
      { Var $1}
  | MINUS arith
    %prec UNARY_MINUS
      { Arith_op (Opp, $2) }
  | arith PLUS arith
      { Arith_bi_op (Sum, $1, $3) }
  | arith MINUS arith
      { Arith_bi_op (Sub, $1, $3) }
  | arith TIMES arith
      { Arith_bi_op (Prod, $1, $3) }
  | arith DIVIDE arith
      { Arith_bi_op (Div, $1, $3) }
  | arith REMAINDER arith
      { Arith_bi_op (Mod, $1, $3) }
  | arith POWER arith
      { Arith_bi_op (Pow, $1, $3) }
  | ID LPAREN arith RPAREN
    %prec FUNCTION_CALL
      { Fun_call ($1, $3) }
  | LPAREN arith RPAREN
      { $2 }
;

