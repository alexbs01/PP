
type 'a context =
  (string * 'a) list;;

exception No_binding of string;;

let empty_context = [];;

let get_binding ctx name =
  try List.assoc name ctx with
  Not_found -> raise (No_binding name);;

let rec add_binding ctx name v =
    (name, v) :: ctx ;;

