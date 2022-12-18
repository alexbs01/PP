
val all_queens : int -> int list list

(* 
"all_queens_sol n" da (para cada n >= 0) una lista con todas las posibles soluciones
al problema de las n reinas de ajedrez en el tablero de n x n casillas.
Cada solución se da como una lista con n enteros (de 1 a n) que indica la columna que 
ocuparía la dama de cada fila (ordenadas de la fila 1 a la n).
Así, por ejemplo, la lista [2; 4; 1; 3] representa, para el tablero 4x4, la solución 
que consiste en colocar las reinas en las casillas (1,2), (2,4), (3,1) y (4,3).
Están todas las soluciones posibles y no aparece ninguna repetida, pero no se garantiza
el orden en que apecen las distintas soluciones dentro de la lista.
*)

