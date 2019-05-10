% eliminaCadaN(+N, +Lista, -ListaR)
% es cierto cuando ListaR unifica con una lista que contiene los elementos 
% de Lista eliminando los que aparecen cada N posiciones (empezando en 1, se borran las que estan en N, N*2, N*3 ...)
%
% eliminaCadaN(3, [1,2,3,4,5,6,7], R).
% R = [1,2,4,5,7] ----> 3 y 6 se van fuera

% eliminaCadaN(_, [], []).

eliminaCadaN(N, L, L) :- length(L, N2), N > N2.

eliminaCadaN(N, L, R2) :- N2 is N - 1, 
						  length(L1, N2),
                          append(L1, [_ | L2], L),
					      eliminaCadaN(N, L2, R),
						  append(L1, R, R2).