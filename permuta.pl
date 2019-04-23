% permuta(+Lista, -ListaR)
% es cierto cuando ListaR unifica con una lista que contiene los elementos de Lista en orden distinto
% genera todas las listas posibles

permuta([Ca], [Ca]).

permuta([Ca | Resto], R2) :- permuta(Resto, R), insertar_todas(Ca, R, R2).

% insertar_todas(+E, +L, -R)
% es cierto si R unifica con una lista que contiene los elementos de L con E insertado en cualquier posicion

insertar_todas(E, [Ca | Resto], [E, Ca | Resto]).

insertar_todas(E, [Ca | Resto], [Ca | R]) :- insertar_todas(E, Resto, R).

insertar_todas(E, [], [E]).