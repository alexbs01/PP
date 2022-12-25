
type 'a context =
  (string * 'a) list

exception No_binding of string

val empty_context : 'a context

val get_binding : 'a context -> string -> 'a

val add_binding : 'a context -> string -> 'a -> 'a context

