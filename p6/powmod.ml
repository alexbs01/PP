let rec power' x y = 
    if y = 0 then 1 
    else if (y mod 2 = 0) then power' (x * x) (y / 2)
    else x * power' (x * x) (y / 2)