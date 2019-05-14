% suma_nodos(+Arbol, -Suma)
% es cierto si Suma unifica con la suma de todas las etiquetas de los nodos de Arbol

suma_nodos(nil, 0).

suma_nodos(t(E, nil, nil), E).

suma_nodos(t(E, L, R), S) :- L \= nil, R \= nil,
							suma_nodos(L, SL),
							suma_nodos(R, SR),
							S is SL + SR + E.
							
suma_nodos(t(E, L, nil), S) :- L \= nil,
							  suma_nodos(L, SL),
							  S is SL + E.
							  
suma_nodos(t(E, nil, R), S) :- R \= nil,
							  suma_nodos(R, SR),
							  S is SR + E.
							  
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).