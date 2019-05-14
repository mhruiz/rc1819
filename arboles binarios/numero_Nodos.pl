% numero_Nodos(+Arbol, -Numero)
% es cierto si Numero unifica con el numero de nodos en el arbol

numero_Nodos(nil, 0).

numero_Nodos(t(_, L, R), N) :- numero_Nodos(L, NL),
							  numero_Nodos(R, NR),
							  N is NL + NR + 1.
							  
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).
