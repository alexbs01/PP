
exception Function_not_defined of string;;


let funs = [("sqrt", sqrt); ("ln", log); ("exp", exp); ("round", Float.round)] ;;

let get_function s =
    try List.assoc s funs with
        Not_found -> raise (Function_not_defined s);; 

