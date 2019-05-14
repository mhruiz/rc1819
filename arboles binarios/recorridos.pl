% inorden(+Arbol, -Lista)
% es cierto cuando Lista unifica con los elementos de Arbol en el siguiente orden: izq - raiz - der

inorden(nil, []).

inorden(t(E, nil, nil), [E]).

inorden(t(E, L, R), LT) :- inorden(L, LL),
						   inorden(R, LR),
						   append(LL, [E | LR], LT).
						 
% preorden(+Arbol, -Lista)
% es cierto cuando Lista unifica con los elementos de Arbol en el siguiente orden: raiz - izq - der

preorden(nil, []).

preorden(t(E, nil, nil), [E]).

preorden(t(E, L, R), [E | LT]) :- preorden(L, LL),
						          preorden(R, LR),
						          append(LL, LR, LT).
								  
% postorden(nil, [])
% es cierto cuando Lista unifica con los elementos de Arbol en el siguiente orden: izq - der - raiz

postorden(nil, []).

postorden(t(E, nil, nil), [E]).

postorden(t(E, L, R), LTT) :- postorden(L, LL), 
						   postorden(R, LR), 
						   append(LL, LR, LT),
						   append(LT, [E], LTT).
						   
						   
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).