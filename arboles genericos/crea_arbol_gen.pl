% crea_arbol_gen(+ListaEtiquetas, -ArbolGen)
% es cierto cuando ArbolGen unifica con un arbol generico que contiene las etiquetas
% de ListaEtiquetas

crea_arbol_gen([E], a(E, [])).

crea_arbol_gen([H | T], a(E, [a(H,[]) | L]) ) :- T \= [], crea_arbol_gen(T, a(E, L)).