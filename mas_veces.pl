% mas_veces(+Lista, -Elem, -Num)
% es cierto cuando Elem unifica con el elemento que se repite más veces en la lista Lista
% y Num unifica con el número de veces que se repite dicho elemento

mas_veces([], _, 0).

mas_veces([Ca | Resto], E, N) :- mas_veces(Resto, E, N1),
                                 Ca = E,
								 N is N1 + 1.

mas_veces([Ca | Resto], Elem, N) :- mas_veces(Resto, E, N1),
                                 Ca \= E,
								 repetido(Ca, Resto, N2),
								 N1 > N2,
								 N is N1 + 1, 
								 Elem is E.

mas_veces([Ca | Resto], Elem, N) :- mas_veces(Resto, E, N1),
                                 Ca \= E,
								 repetido(Ca, Resto, N2),
								 N1 < N2,
								 N is N2 + 1,
								 Elem is Ca.
								 
mayor(N1, N2, N3) :- N1 > N2, N3 = N1.
mayor(N1, N2, N3) :- N1 < N2, N3 = N2.


% repetido(+E, +Lista, -N)
% es cierto si N unifica con el numero de veces que aparece E en Lista

repetido(_, [], 0).

repetido(E, [Ca | Resto], N2) :- E = Ca, repetido(E, Resto, N1), N2 is N1 + 1.

repetido(E, [Ca | Resto], N1) :- repetido(E, Resto, N1), E \= Ca.