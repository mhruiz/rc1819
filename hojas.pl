% hojas(+Arbol, -Lista)
% es cierto si Lista unifica con las etiquetas en las hojas de Arbol

hojas(nil, []).

hojas(t(E, nil, nil), [E]).

hojas(t(_, L, R), Lista) :- L \= nil, R \= nil,
					   hojas(L, LL),
					   hojas(R, LR),
					   append(LL, LR, Lista).
					   
hojas(t(_, L, nil), LL) :- L \= nil,
					   hojas(L, LL).
					   
hojas(t(_, nil, R), LR) :- R \= nil,
					   hojas(R, LR).
					   

					   
tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).