% recorrido en anchura
%
% anchura_gen(+Arbol_gen, -Lista)
% es cierto cuando Lista unifica con las etiquetas de Arbol_gen 
% recorriendo el arbol en anchura

anchura_gen(t(E, L), [E | R]) :- anchura_gen(L, R).

% para cada arbol A, coger su lista de hijos y concatenarla al final de la lista de arboles a la que pertenece A

% anchura_gen(+Lista_arboles, -Lista)
% es cierto cuando Lista unifica con las etiquetas de los arboles de Lista_arboles recorridos en anchura

anchura_gen([], []).

anchura_gen([t(E, L) | Resto], [E | RT]) :- append(Resto, L, R), 
                                            anchura_gen(R, RT).