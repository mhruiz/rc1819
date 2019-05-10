% profundidad(+Arbol, -H)
% es cierto si H unifica con la profundidad de Arbol

profundidad(nil, 0).

profundidad(t(_, nil, nil), 1).

profundidad(t(_, L, R), H) :- L \= nil, R \= nil,
							  profundidad(L, HL),
							  profundidad(R, HR), 
							  mayor(HL, HR, HM),
							  H is HM + 1.
							  
profundidad(t(_, L, nil), H) :- L \= nil,
							  profundidad(L, HL),
							  H is HL + 1.
							  
profundidad(t(_, nil, R), H) :- R \= nil,
							  profundidad(R, HR),
							  H is HR + 1.
							  
							  
mayor(N1, N2, N1) :- N1 >= N2.

mayor(N1, N2, N2) :- N2 > N1.



tree1(t(9, t(5, t(2, nil, nil), 
                t(6, nil, nil) ),
           t(12, t(10, nil, nil), 
		         t(14, nil, nil)) ) ).
				 
tree2(t(4, t(2, nil, nil), t(6, nil, nil) ) ).