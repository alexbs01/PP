();;
(* - : unit = () *)
(**)

2 + 5 * 3;;
(* - : int 17*)
(*Muestra el tipo de dato y opera*)

1.0;;
(* - : float = 1.*)
(*Devuelve un 1 que es un float*)

1.0 *. 2.;;
(* Error de tipo por multiplicar un flotante con un entero*)
(*Error: This expression has type float but an expression was expected of type
         int*)

2. -. 2.0;;
(* Error de tipo por restar un entero con un flotante*)
(*Error: This expression has type float but an expression was expected of type
         int*)

3.0 +. 2.0;;
(* Error de tipo por hacer una resta de enteros con números flotantes *)
(* Error: This expression has type float but an expression was expected of type
         int*)

5 / 3;;
(* - : int = 1 *)
(* Estamos haciendo una divisíon entera*)

5 mod 3;;
(* - : int = 2 *)
(* Devolverá el resto de hacer 5 entre 2*)

3.0 *. 2.0 ** 3.0;;
(* - : float = 24*)
(* Operación de flotantes*)

3.0 = float_of_int 3;;
(* Error de tipo: Compara si 3.0 es idéntico a su entero*)
(* Error: This expression has type float but an expression was expected of type
         int*)

sqrt 4.;;
(* - : int = 2 ---- Error de tipo: Realmete no hace la operación porque sqrt necesita un flotante*)
(*Error: This expression has type int but an expression was expected of type
         float*)

int_of_float 2.1 + int_of_float (-2.9);;
(* - : int = 0 *)
(* Convierte el flotante 2.1 y -2.9 a entero y los suma*)

truncate 2.1 + truncate(-2.9);;
(* - : int = 0 *)
(* Redondea para abajo los positivos y para arriba los negativos y opera*)

floor 2.1 +. floor (-2.9);;
(* - : int = -1 *)
(* Rendondea para abajo y opera*)

ceil 2.1 +. ceil (-2.9);;
(* Error sintáctico: Dará error por no poner entre paréntesis el número negativo*)
(*Error: This expression has type float -> float
       but an expression was expected of type float*)

2.0 ** 3.0 ** 2.0;;
(* - : float = 512*)
(* Opera las potencias *)

'B';;
(* - : char = 'B'*)
(* Muestra el caracter*)

int_of_char 'A';;
(* Mostrará el código ASCII de la letra 'A'*)
(* - : int 65*)

char_of_int 66;;
(* Mostrará a que caracter se corresponde el código 66*)
(* - : char = 'B'*)

Char.code 'B';;
(* Mostrará el código del caracter 'B' *)
(* - : int = 66 *)

Char.chr 67;;
(* Mostrará el caracter del código 67*)
(*- : char = 'C'*)

'\067';;
(* Es otra forma de poner el código de un caracter *)
(*- : char = 'C'*)

Char.chr (Char.code 'a' - Char.code 'A' + Char.code 'M');;
(* Transforma las letras a código, opera con ellas y lugo lo transforma a caracter*)
(*- : char = 'm'*)

"this is a string";;
(* - : string = "this is a string" *)
(* Muestra el string*)

String.length "longitud";;
(* - : int = 8*)
(* Devuelve cuantas letras hay en la cadena*)

"1999" ^ "1";;
(* Error de tipo: No se pueden sumar strings*)
(* Error: This expression has type string but an expression was expected of type
         int*)

"1999" ^ "1";;
(* - : string = "19991"*)
(* El operador ^ sirve para concatenar strings*)

int_of_string "1999" + 1;;
(* - : int = 2000 *)
(* Pasará el "1999" a cadena y le sumará 1*)

"\064\065";;
(* Mostrará un string de dos caracteres *)
(* - : string = "@A"*)

string_of_int 010;;
(* - : string = "010" -----> - : string = "10"*)
(* Pasa el número a string, los ceros iniciales los descarta*)

not true;;
(* - : bool = false *)
(* La negación de un true es false*)

true && false;;
(* - : bool = false *)
(* Un AND es false si uno de las entradas es false*)

true || false;;
(* - : bool = true *)
(* Un OR es true si una de las entradas lo es *)

(1 < 2) = false;;
(* - : bool = false*)
(* Comprueba si 1 < 2 es falso *)

"1" < "2";;
(* Compureba si el código de "1" es menor que el de "2" *)
(* - : bool = true *)

2 < 12;;
(* - : bool = true *)
(* Comprueba si 2 es menor que 12*)

"2" < "12";;
(* - : bool = false *)
(* Comprueba pero con las cadenas *)

"uno" < "dos";;
(* Vuelve a comprobar con las cadenas *)
(**)

if 3 = 4 then 0 else 4;;
(* - : int 4*)
(* Comprueba si el 3 y el 4 son idénticos, como no lo son muestra el 4*)

if 3 = 4 then "0" else "4";;
(* - : string = "4" *)
(* Vuelve a comprobar, pero devuelve un string *)

if 3 = 4 then 0 else 4;;
(* - : string = "4" ---- Da error de tipo, deben de ser del mismo tipo *)
(* Error: This expression has type string but an expression was expected of type
         int *)

(if 3 < 5 then 8 else 10) + 4;;
(* - : int = 12*)
(* Ejecuta primero el condicional, y después le suma el número 4*)

2.0 *. asin 1.0;;
(* Devolverá un flotante *)
(* Da como salida: - : float = 3.14159265358979312, es el núemro pi*)

sin (2.0 *. asin 1.0 /. 2.);;
(* Devolverá un flotante, hará primero el asín, lo dividirá entre dos y lo multiplicará
por dos, luego hará la función seno con el resultado*)
(* - : float = 1. *)

function x -> 2 * x;;
(* Crea una finción *)
(* - : int -> int = <fun> *)

(function x -> 2 * x) (2 + 1);;
(* - : int = 6 *)
(* Ejecuta la función tomando como parámetro la suma 2 + 1*)

let x = 1;;
(* Crea una variable x*)
(* val x : int = 1 *)

let y = 2;;
(* val y : int = 2 *)
(* Crea la variable y*)

x - y;;
(* - : int = -1 *)
(* Hace la resta 1 - 2 *)

let x = y in x - y;;
(* - : int = 0 *)
(**)

x - y;;
(* - : int = -1 *)
(* Da el resultado como si la anterior línea no existiese*)

let z = 0;;
(* Deberia dar un error de ejecución por llamar una variable que no se declaró*)
(* Error: Unbound value z *)

let z = x + y;;
(* val z : int = 3 *)
(* Suma x e y, y se le asigna a la variable z**)

z;;
(* - : int = 3 *)
(* Como ahora ya se declaró, devuelve el valor asignado *)

let x = 5;;
(* val x : int = 5 *)
(* Asigna un nueva valor a x*)

z;;
(* - : int = 3 *)
(* Devolverá el valor de antes porque aun no se modificó su valor*)

let y = 5 in x + y;;
(**)
(* - : int = 10 *)

x + y;;
(* - : int = 7*)
(* Hace la suma de 5 + 2 *)

let x = x + y in let y = x * y in x + y + z;;
(**)
(* - : int = 24 *)

x + y + z;;
(* - : int = 10 *)
(* Hace la suma de 5 + 2 + 3 *)

int_of_float;;
(* - : float -> int = <fun>*)
(* Es una finción que pide un flotante para sacar su entero*)

float_of_int;;
(* - : int -> float = <fun> *)
(* A partir de un entero, saca su flotante*)

int_of_char;;
(* - : char -> int = <fun> *)
(* Saca el entero de un caracter *)

char_of_int;;
(* - : int -> char = <fun> *)
(* Convierte un entero en un caracter *)

abs;;
(* - : int -> int = <fun> *)
(* Convierte un entero en el valor absoluto *)

sqrt;;
(* - : float -> float = <fun> *)
(* Calcula la raíz cuadrada de un flotante*)

truncate;;
(*  *)
(* - : float -> int = <fun> *)

ceil;;
(* - : float -> float = <fun> *)
(* Redondea hacia arriba un flotante *)

floor;;
(* - : float -> float = <fun> *)
(* Redondea hacia abajo un flotante *)

Char.code;;
(* - : char -> int = <fun> *)
(* Convierte un char en su código ASCII *)

Char.chr;;
(* - : int -> char = <fun> *)
(* Convierte un código de enteros en su caracter ASCII *)

int_of_string;;
(* - : string -> int = <fun> *)
(* Retorna el entero de un string *)

string_of_int;;
(* - : int -> string = <fun> *)
(* Convierte un string a apartier de un núemro*)

String.length;;
(* - : String -> int = <fun> *)
(* Cuenta el número de letras y retona un entero *)

let f = function x -> 2 * x;;
(* Crea un función f*)
(**)

f (2+1);;
(* - : int = 6 *)
(* Se mete como parámetro el núemro 3 y retorna el doble*)

f 2 + 1;;
(* - : int = 5 *)
(* Hace la función sobre el número 2 y luego le suma 1 *)

let n = 1;;
(* val n : int = 1 *)
(* Crea la variable n *)

let g x = x + n;;
(* val g : int -> int = <fun> *)
(* Crea la función g *)

g 3;;
(* - : int = 4*)
(* Se usa la funcion g con el parámetro 3*)

let n = 5;;
(* val n : int = 5 *)
(* Se cambia el valor de n *)

g 3;;
(* - : int = 8 ----- - : int = 4 *)
(* Da como resultado 4 porque la función g se creo cuando n valía 1 *)

let l = function r -> let pi = 2.0 *. asin 1.0 in 2.0 +. pi *. r;;
(* Hace una función r, almacenándolo en la variable l*)
(* val l : float -> float = <fun> *)

l 3.0;;
(* Devolverá un flotante dándole como entrada el 3.0 *)
(* - : float = 11.4247779607693793 l 2*)

l 2.;;
(* Dará un error porque tiene que recibir un float *)
(* Error: This expression has type int but an expression was expected of type
         float *)

let pi = 0;;
(* Dará un error poruqe aun no definimos pi *)
(* Error: Unbound value pi *)

let pi = 2.0 *. asin 1.0;;
(* Asigna el valor de pi a la variable pi *)
(* val pi : float = 3.14159265358979312 *)

pi;;
(* Retorna el valor de pi de antes *)
(* - : float = 3.14159265358979312 *)

let v = function r -> pi *. r ** 2.0;;
(* val v : float -> float <fun> *)
(* Crea una función r en la variable v*)

v 2.0;;
(* Retornará un valor flotante *)
(* - : float = 12.5663706143591725 *)
