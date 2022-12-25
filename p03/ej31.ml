let f1 n = (function true -> n / 2 | false -> 2 * n) (n mod 2 = 0)

let f2 n = (function true -> "es par" | false -> "es impar") (n mod 2 = 0)

let f3 n = (function true -> "múltiplo de 2" | false -> (function true -> "múltiplo de 3" | false -> "impar") (n mod 3 = 0)) (n mod 2 = 0)