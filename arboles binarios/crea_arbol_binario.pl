% crea_arbol_binario(+ListaEtiquetas, -ArbolBinario)
% es cierto cuando ArbolBinario unifica con un arbol binario que contiene
% todas las etiquetas de ListaEtiquetas

crea_arbol_binario([], nil).

crea_arbol_binario([E], a(E, nil, nil)).

crea_arbol_binario([E | L], a(E, A1, A2)) :- length(L, NL), N1 is NL div 2, 
                                             length(L1, N1),
						                     append(L1, L2, L),
								             crea_arbol_binario(L1, A1),
								             crea_arbol_binario(L2, A2).