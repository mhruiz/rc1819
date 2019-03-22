
% ord_inser(+Lista, -R).
% es cierto si R unifica con una Lista que contiene los elementos de Lista ordenados de menor a mayor
% Lista puede contener elementos repetidos

ord_inser([], []).

% preguntar al resto, si ya esta ordenado, que le falta? (Resto, R) 

ord_inser([Ca|Resto], R2) :- ord_inser(Resto, R), insertar_ord(Ca, R, R2).

% insertar_ord(+E, +L, -R).
% es cierto cuando R unifica con una lista que contiene elementos de L con E insertado en su posicion correcta
% L puede tener elementos repetidos y L esta ordenada de menor a mayor

insertar_ord(E, [], [E]).

insertar_ord(E, [Ca|Resto], [E, Ca|Resto]) :- E =< Ca.

insertar_ord(E, [Ca|Resto], [Ca|R]) :- E > Ca, insertar_ord(E, Resto, R).