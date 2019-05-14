% numero_Hojas(+Arbol, -N)
% es cierto si N unifica con el numero de hojas del arbol

numero_Hojas(nil, 0).

numero_Hojas(t(_, nil, nil), 1).

numero_Hojas(t(_, L, R), N) :- L \= nil, R \= nil,
							  numero_Hojas(L, NL),
							  numero_Hojas(R, NR),
							  N is NL + NR.
							 
numero_Hojas(t(_, L, nil), NL) :- L \= nil,
							  numero_Hojas(L, NL).
							  
numero_Hojas(t(_, nil, R), NR) :- R \= nil,
							  numero_Hojas(R, NR).
							  
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).