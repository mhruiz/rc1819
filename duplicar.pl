% duplicar(+Lista, +N, -R).
% es cierto si R unifica con una lista con cada elemento de Lista repetido consecutivamente N veces
%
%
% duplicar([a,b,c], 3, X).
% X = [a,a,a,b,b,b,c,c,c]

duplicar([], _, []).

duplicar([H | T], N, R3) :- N > 0, duplicar(T, N, R),
						    length(L, N),
						    cargar(L, H, R2),
						    append(R2, R, R3).

% cargar(+Lista, +E, -R).
% es cierto si R unifica con Lista con todos sus elementos igual a E
					
cargar([], _, []).

cargar([_|T], E, [E|R]) :- cargar(T, E, R).