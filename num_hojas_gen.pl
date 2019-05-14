% num_hojas_gen(+Arbol_gen, -Num)
% es cierto cuando Num unifica con el número de hojas de Arbol_gen

num_hojas_gen(t(_, []), 1).

num_hojas_gen(t(_, ListaHijos), N) :- ListaHijos \= [], 
									  num_hojas_lista(ListaHijos, N).


% num_hojas_lista(+ListaArboles, -Num)
% es cierto cuando Num unifica con el número de hojas de ListaArboles

num_hojas_lista([], 0).

num_hojas_lista([Ca | Resto], N) :- num_hojas_gen(Ca, N1),
									num_hojas_lista(Resto, N2),
									N is N1 + N2.
									
% lista_hojas_gen(+Arbol_gen, -Lista)
% es cierto cuando Lista unifica con una lista que contiene todas las hojas de Arbol_gen

lista_hojas_gen(t(E, []), [E]).

lista_hojas_gen(t(_, ListaHijos), L) :- ListaHijos \= [], 
									    lista_hojas_lista(ListaHijos, L).
									   
% lista_hojas_lista(+ListaArboles, -ListaN)
% es cierto cuando ListaN unifica con una lista que contiene todas las hojas de los arboles de ListaArboles

lista_hojas_lista([], []).

lista_hojas_lista([Ca | Resto], L) :- lista_hojas_gen(Ca, L1),
									  lista_hojas_lista(Resto, L2),
									  append(L1, L2, L).
									  
tree_gen1(t(a, [ t(b, []) , 
		         t(c, []) , 
	             t(d, []) , 
	             t(e, []) ] )).
				 
tree_gen2(t(a, [ t(b, [ t(c, []) ,
                        t(d, []) 
					  ] ) ,
			     t(e, []) ,
				 t(f, [ t(g, []) ,
				        t(h, []) ,
						t(i, []) 
					  ] )
			   ] ) ).