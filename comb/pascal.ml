let strcomb p = 
	try string_of_int (Comb.comb p) 
    with _ -> "ERROR" 
in    
let n = int_of_string (Sys.argv.(1)) 
in
for i = 0 to n do
    for j = 0 to i do
        print_string (strcomb (i,j) ^ " ")
    done;
    print_newline ()
done;;
