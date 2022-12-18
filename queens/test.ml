let crono f x =
    let t = Sys.time () in
    let y = f x in
    y, Sys.time () -. t;;


let test i = 
    let sol, t = crono Queens.all_queens i in
    let i_s = string_of_int i 
    and ns = string_of_int (List.length sol) 
    and ts = string_of_float t in 
    print_endline ("TABLERO "  ^ i_s ^ " x " ^ i_s);
    print_endline (ns ^ " soluciones halladas en " ^ ts ^ " segundos");
    print_newline ();;

let v = Sys.argv in
match Array.length v with
  2 -> let n = int_of_string (v.(1)) in
       test n
| 3 -> let m = int_of_string (v.(1)) 
       and n = int_of_string (v.(2)) in
       for i = m to n do 
           test i done
| _ -> print_endline "test: Invalid number of arguments"
;;

