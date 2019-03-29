
% Aritmetica de Peano

% 0 -- 0
% 1 -- n(0)
% 2 -- n(n(0))
% 3 -- n(n(n(0)))


% suma(?X, ?Y, ?Z)
% Es cierto si Z unifica con la suma de X e Y en aritmetica de Peano

suma(0, Y, Y).

suma(n(X), Y, n(Z)) :- suma(X, Y, Z).

% resta(?X, ?Y, ?Z)
% Es cierto si Z unifica con la resta X - Y

resta(X, 0, X).

resta(X, n(Y), Z) :- resta(X, Y, n(Z)).

% producto(?X, ?Y, ?Z)
% Es cierto si Z unifica con la multiplicacion X * Y
% Sumar X veces Y

producto(0, _ , 0).

producto(n(X), Y, Z2) :- producto(X, Y, Z), suma(Z, Y, Z2).

% peano2decimal --> p2d
% p2d()+P, -D)
% Es cierto si D unifica con el numero decimal equivalente a su representacion en aritmetica de Peano

p2d(0, 0).

p2d(n(X), R) :- p2d(X, D), R is D + 1.

% decimal2peano
% d2p8(D, -P)
% Es cierto si P unifica con el numero en aritmetica de Peano equivalente a D en decimal

d2p(0, 0).

d2p(X, n(P)) :- X2 is X - 1, d2p(X2, P).