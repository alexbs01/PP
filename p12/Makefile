
all: context lib arith command parser lexer main
	ocamlc -o calc context.cmo lib.cmo arith.cmo command.cmo parser.cmo lexer.cmo main.cmo

context: context.mli context.ml
	ocamlc -c context.mli context.ml

lib: lib.mli lib.ml
	ocamlc -c lib.mli lib.ml

arith: arith.mli arith.ml
	ocamlc -c arith.mli arith.ml

command: command.mli command.ml
	ocamlc -c command.mli command.ml

parser: parser.mly
	ocamlyacc parser.mly
	ocamlc -c parser.mli parser.ml

lexer: lexer.mll
	ocamllex lexer.mll
	ocamlc -c lexer.ml

main: main.ml
	ocamlc -c main.ml

clean:
	rm -f lexer.ml parser.ml parser.mli *.cmi *.cmo

