% concatenar(L1, L2, R)
% es cierto cuando R unifica con una lista que contiene los elementos de L1 seguidos de los de L2
% en el mismo orden

% concatenar(L1, [], L1).

% concatenar(L1, [Ca|Resto], ) :- concatenar(L1, Resto, R).
% no puede ser porque la cabeza de L2 se perdería en medio, no es igual concatenar L1 con L2 que L1 con el Resto de L2

concatenar([], L2, L2).

concatenar([Ca|Resto], L2, [Ca|Rr]) :- concatenar(Resto, L2, Rr).