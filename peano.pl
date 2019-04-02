
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

p2d(n(X), R) :- nonvar(X), p2d(X, D), R is D + 1. % nonvar(X) se asegura de que no sea una variable

% decimal2peano
% d2p8(D, -P)
% Es cierto si P unifica con el numero en aritmetica de Peano equivalente a D en decimal

d2p(0, 0).

d2p(X, n(P)) :- X >= 1, X2 is X - 1, d2p(X2, P).

% division(?X, ?Y, ?Z)
% es cierto si Z es el resultado de la division entera de X entre Y

division(X, Y, 0) :- menor(X, Y).

division(X, Y, n(Z)) :- resta(X, Y, R), division(R, Y, Z).

% menor(?X, ?Y)
% es cierto si X es menor estricto que Y

% menor(0, n(_)). no es cierto siempre
menor(0, n(X)) :- peano(X).

menor(n(X), n(Y)) :- menor(X, Y).

% peano(X)
% es cierto si X es un numero válido en la representacion de la Aritmetica de Peano

peano(0).

peano(n(X)) :- peano(X).

% modulo(?X, ?Y, ?Z)
% es cierto si Z unifica con el resto de la division entera de X entre Y

% modulo(X, X, 0).
% modulo(X, Y, R) :- division(X, Y, C), producto(Y, C, P), resta(X, P, R).

modulo(X, Y, X) :- menor(X, Y).

modulo(X, Y, Z) :- mayor_o_igual(X, Y), resta(X, Y, X2), modulo(X2, Y, Z).

% mayor_o_igual(?X, ?Y)
% es cierto si X es mayor o igual que Y

mayor_o_igual(0, 0).
mayor_o_igual(n(X), 0) :- peano(X).

mayor_o_igual(n(X), n(Y)) :- mayor_o_igual(X, Y).


%% -------------------------------------------------------------------------------------------

% (Entera, Decimal)
% Representa un numero real en aritmetica de Peano siendo Entera y Decimal dos numeros validos en AP
% (0, 5)

% No se puede saber la precision maxima de Decimal ---> Mejor Lista

% (Entera, Lista de números en Peano)
% (n(n(n(0))), [ n(n(0)), n(n(n(n(n(0))))) ] ) = 3.25 --> digitos decimales son elementos en la lista

% Pues no, LISTA NO

