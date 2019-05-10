% miembro(+Arbol, +E)
% es cierto si E unifica con algún nodo perteneciente a Arbol

miembro(t(E, _, _), E).

miembro(t(E1, L, _), E) :- E < E1,
						   miembro(L, E).
						   
miembro(t(E1, _, R), E) :- E > E1, 
						   miembro(R, E).
						 
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).