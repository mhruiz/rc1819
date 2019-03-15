
% insertar_final(+E, +L, -R)
% es cierto si R unifica con una lista que tiene 
% los elementos de L en el mismo orden con E
% insertado al final

% caso mas sencillo, insertar Elemento en lista vacia --> lista con E
insertar_final(E, [], [E]).

insertar_final(E, [Ca|Resto], [Ca|R]) :- insertar_final(E, Resto, R).
% i_e(E, [a], X2) es cierto si i_e(E, [], X1) es cierto, para que sea cierto X1 -> [E] (es cierto por ser el caso base que es cierto por sí mismo)
% [a] -> [Ca|Resto] ; X2 -> [Ca|X1]

% ejercicio reverse(+List, -ListR) que es cierto cuando ListR unifica 
% con una lista que contiene los mismos elementos que List pero en orden inverso.

% reverse(L,R) 
% es cierto si R unifica con una lista que
% contiene los elementos de L en orden inverso

reverse([],[]).

reverse([CaL|ReL], R) :- insertar_final(CaL, R2, R), reverse(ReL, R2).