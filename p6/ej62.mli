val curry : ('a * 'b -> 'c) -> 'a -> 'b -> 'c
val uncurry : ('a -> 'b -> 'c) -> 'a * 'b -> 'c
val sum : int * int -> int
val g : int -> int -> int
val h : int -> int

val comp : ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b
val f : int -> int

val i : 'a -> 'a
val j : 'a * 'b -> 'a
val k : 'a * 'b -> 'b
val l : 'a -> 'a list
