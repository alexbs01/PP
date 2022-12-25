false && (2 / 0 > 0);;
(* Debería de dar false ya si evaluar la segunda expresión*)

(* true && (2 / 0 > 0);; *)
(* Evaluará la segunda expresión, dará un error porque no se puede dividir por 0 *) 

true || (2 / 0 > 0);;
(* Debería de retornar un true ya sin evaluara la segunda expresión *)

false || (2 / 0 > 0);;
(* Retornará un error porque no se puede dividir entre 0 *)

let con b1 b2 = b1 && b2;;
(* Crea una función con dos parámetros que se almacenará en la variable con, y hace el AND de los dos parámetros *)

let dis b1 b2 = b1 || b2;;
(* Crea otra función que se almacena en la variable dis, pero hace el OR de los dos parámetros*)

con (1 < 0) (2 / 0 > 0);;
(* Retornará un error porque al comprobar el segundo parámetro, no podrá dividir entre 0 *)

(1 < 0) && (2 / 0 > 0);;
(* Pensaba que retornaría un error por división entre 0, pero parece que si se ponen dos expresiones numéricas, y una no es válida, retornará false *)

dis (1 > 0) (2 / 0 > 0);;
(* Da error por división por 0 *)

(1 > 0) || (2 / 0 > 0);;
(* Devolverá un true porque ya ni evaluará la segunda expresión *)