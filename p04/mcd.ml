let rec mcd(x, y) =
	if x = 0 
	then y
	else mcd((y mod x), x)