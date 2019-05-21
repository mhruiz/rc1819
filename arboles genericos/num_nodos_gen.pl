% num_nodos_gen(+Arbol_gen, -Num)
% es cierto cuando Num unifica con el número de nodos de Arbol_gen

num_nodos_gen(t(_, Lista_hijos), R) :- num_nodos_lista(Lista_hijos, RL), 
									   R is RL + 1.
									  
% num_nodos_lista(+ListaArboles, -Num)
% es cierto cuando Num unifica con el número de nodos de ListaArboles

num_nodos_lista([], 0).

num_nodos_lista([Ca | Resto], N) :- num_nodos_gen(Ca, N1),
									num_nodos_lista(Resto, N2),
									N is N1 + N2.
									
% Arboles de ejemplo

tree_gen1(t(a, [ t(b, []) , 
		         t(c, []) , 
	             t(d, []) , 
	             t(e, []) ] )).
	   
