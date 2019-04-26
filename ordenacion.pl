% invertir(+Lista, -ListaR) 
% es cierto cuando ListaR unifica con una lista que contiene los mismos 
% elementos que Lista en orden inverso.

invertir([], []).

invertir([Ca | Resto], Invertida) :- invertir(Resto, R_inv), append(R_inv, [Ca], Invertida).

% -------------------------------------------------------

% concatena(+List1, +List2, -ListR).
% es cierto cuando ListaR unifica con una lista
% que contiene los elementos de la lista List1
% en el mismo orden y seguidos de los elementos
% de la lista List2 en el mismo orden.

concatena([], L2, L2).

concatena([Ca | Resto], L2, [Ca | C]) :- concatena(Resto, L2, C).

% -------------------------------------------------------

% ordenada(+Lista)
% es cierto si los elementos de Lista estan ordenados de menor a mayor

ordenada([]).

ordenada([_]).

ordenada([E1, E2 | Resto]) :- E1 =< E2, ordenada([E2 | Resto]).

% ordena_burbuja(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor

ordena_burbuja(Lista, Lista) :- ordenada(Lista).

ordena_burbuja(Lista, Ordenada) :- append(L, [E1, E2 | R], Lista),
                                   E1 > E2,
								   append(L, [E2, E1 | R], List),
								   ordena_burbuja(List, Ordenada).
								   
								 
% -------------------------------------------------------

% inserta_en_list_ord(+Elem, +Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista
% que contiene los elementos de la lista ordenada
% Lista, con el elemento Elem insertado de forma
% ordenada.

inserta_en_list_ord(Elem, [], [Elem]).

inserta_en_list_ord(E, [Ca | Resto], [E, Ca | Resto]) :- E =< Ca.

inserta_en_list_ord(E, [Ca | Resto], [Ca | R]) :- E > Ca, inserta_en_list_ord(E, Resto, R).

% ordena_insercion(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.

ordena_insercion(Lista, Lista) :- ordenada(Lista).

ordena_insercion([Ca | Resto], Ordenada) :- ordena_insercion(Resto, R), inserta_en_list_ord(Ca, R, Ordenada).

% -------------------------------------------------------

% divide(+Elem, +Lista, -Menores, -Mayores)
% es cierto cuando Menores unifica con una lista que
% contiene los elemenentos de Lista que son menores
% o iguales que Elem y Mayores unifica con una lista
% que contiene los elementos de Lista que son
% mayores que Elem.

divide(_, [], [], []).

divide(E, [Ca | Resto], Menores, [Ca | Mayores]) :- Ca > E, divide(E, Resto, Menores, Mayores).

divide(E, [Ca | Resto], [Ca | Menores], Mayores) :- Ca =< E, divide(E, Resto, Menores, Mayores).

% ordena_quick(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.

ordena_quick(L, L) :- ordenada(L).

ordena_quick([Ca | Resto], Ordenada) :- divide(Ca, Resto, Menores, Mayores),
                                        ordena_quick(Menores, MenoresOrd),
										ordena_quick(Mayores, MayoresOrd),
                                        append(MenoresOrd, [Ca | MayoresOrd], Ordenada).
										
% -------------------------------------------------------

