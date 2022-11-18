(* \binom{n}{k} = \frac{ n! }{ k! * (n - k)! } *)

let rec comb (n, k) =
    if (k = 0) || (n = k) then 1 (* Escribimos las situaciones en las que da 1, cuando k es 0,
		o cuando ambos números n y k sean los mismos*)
    else if (n < k) || (n = 0) || (k < 0) then 0 (* Ponemos que los resultados que dan 0, que lo que va en el denominador
		sea negativo o sea superior a lo que hay en el numerador *)
		 else comb(n - 1, k - 1) + comb(n - 1, k);; (* Aplicamos la regla del Triángulo de Pascal*)