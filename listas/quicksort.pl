
% quicksort(+Lista, -R).
% es cierto si R unifica con una Lista que contiene los elementos de Lista ordenados de menor a mayor
% Lista puede contener elementos repetidos

quicksort([], []).

quicksort([Ca|Resto], R) :- 
	dividir(Ca, Resto, Me, Ma),
	quicksort(Me, RMe),
	quicksort(Ma, RMa),
	append(RMe, [Ca|RMa], R).

% dividir(+P, +Lista, -Menores, -Mayores)
% es cierto cuando Menores unifica con los elementos de Lista que son menores o iguales que P
% y Mayores unifica con los elementos de Lista que son mayores que P

dividir( _ , [], [], []).

dividir(P, [Ca|Resto], [Ca|Me], Ma) :- Ca =< P, dividir(P, Resto, Me, Ma).

dividir(P, [Ca|Resto], Me, [Ca|Ma]) :- Ca > P, dividir(P, Resto, Me, Ma).