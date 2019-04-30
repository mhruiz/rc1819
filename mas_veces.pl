% mas_veces(+Lista, -Elem, -Num)
% es cierto cuando Elem unifica con el elemento que se repite más veces en la lista Lista
% y Num unifica con el número de veces que se repite dicho elemento

mas_veces([], _, 0).

mas_veces([Ca | Resto], E, N) :- mas_veces(Resto, E, N1),
                                 Ca = E,
								 N is N1 + 1.

mas_veces([Ca | Resto], E, N1) :- mas_veces(Resto, E, N1),
                                 Ca \= E,
								 repetido(Ca, Resto, N2),
								 N1 >= N2.

mas_veces([Ca | Resto], Ca, N) :- mas_veces(Resto, E, N1),
                                 Ca \= E,
								 repetido(Ca, Resto, N2),
								 N1 < N2,
								 N is N2 + 1.
								 
% mayor(N1, N2, N3) :- N1 > N2, N3 = N1.
% mayor(N1, N2, N3) :- N1 < N2, N3 = N2.


% repetido(+E, +Lista, -N)
% es cierto si N unifica con el numero de veces que aparece E en Lista

repetido(_, [], 0).

repetido(E, [Ca | Resto], N2) :- E = Ca, repetido(E, Resto, N1), N2 is N1 + 1.

repetido(E, [Ca | Resto], N1) :- repetido(E, Resto, N1), E \= Ca.

% ------------------------------------------------------------

% comprime(+Lista, -Resultado)
% es cierto cuando Resultado unifica con una lista en el siguiente formato:
% 
% comprime([1,1,1,2,2,3,4,4,4], R).
% R = [(1,3), (2,2), (3,1), (4,3)]
%
% es una lista de tuplas: (elemento, veces que apacere)
% Lista esta ordenada

comprime([], []).

comprime([E], [(E, 1)]).

comprime([Ca, Ca | Resto], [(E,N2) | R]) :- comprime([Ca | Resto], [(E,N) | R]), N2 is N + 1.

comprime([Ca, Ca2 | Resto], [(Ca,1) | R]) :- Ca \= Ca2, comprime([Ca2 | Resto], R).


% mayor(+Lista, -Tupla)
% es cierto si Tupla unifica con la tupla (E,N) de mayor N de Lista

mayor([(E,N)], (E,N)).

mayor([(_, NCa) | Resto], (E, N)) :- mayor(Resto, (E, N)), N > NCa.

mayor([(ECa, NCa) | Resto], (ECa, NCa)) :- mayor(Resto, (_, N)), N =< NCa.

masveces(L, E, N) :- msort(L, L2), comprime(L2, R), mayor(R, (E, N)).


masveces2([], []).

masveces2([E], [(E,1)]).

masveces2([H|T], (H, N2)) :- masveces2(T,R), member((H,N), R), N2 is N + 1.

masveces2([H|T], (E, N)) :- masveces2(T,R), \+ member((H,N), [(E,N) | R]).