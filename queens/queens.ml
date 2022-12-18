(*
./test 0 --> 1 soluciones halladas en 0. segundos
./test 1 --> 1 soluciones halladas en 0. segundos
./test 2 --> 0 soluciones halladas en 0. segundos
./test 3 --> 0 soluciones halladas en 0. segundos
./test 4 --> 2 soluciones halladas en 0. segundos
./test 5 --> 10 soluciones halladas en 0. segundos
./test 6 --> 4 soluciones halladas en 0. segundos
./test 7 --> 40 soluciones halladas en 0. segundos
./test 8 --> 92 soluciones halladas en 0. segundos
./test 9 --> 352 soluciones halladas en 0.03125 segundos
./test 10 --> 724 soluciones halladas en 0.15625 segundos
./test 11 --> 2680 soluciones halladas en 1.09375 segundos
./test 12 --> 14200 soluciones halladas en 5.203125 segundos
./test 13 --> 73712 soluciones halladas en 33.984375 segundos
./test 14 --> 365596 soluciones halladas en 290. segundos
./test 15 --> 2279184 soluciones halladas en 1562.03125 segundos

Con n = 16 ya no lo probé, pero al ser terminal debería tambian calcularlo, solo que le llevará su tiempo
*)

(* Para que sea posible no puede estar ni en las filas ni las diagonales usadas *)
let posible fila columna filasUsadas diagonalAUsadas diagonalBUsadas =
     not (List.mem fila filasUsadas || List.mem (fila + columna) diagonalAUsadas || List.mem (fila - columna) diagonalBUsadas)
      
let all_queens n =
    let rec aux fila columna filasUsadas diagonalAUsadas diagonalBUsadas =
        if columna > n
        then [List.rev filasUsadas]
        else List.rev_append (if fila < n then aux (fila + 1) columna filasUsadas diagonalAUsadas diagonalBUsadas else [])
							 (if posible fila columna filasUsadas diagonalAUsadas diagonalBUsadas
							  then aux 1 (columna + 1) (fila :: filasUsadas) (fila + columna :: diagonalAUsadas) (fila - columna :: diagonalBUsadas)
							  else [])
    in aux 1 1 [] [] [];;
	