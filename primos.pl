
% Encontrar los primos entre X e Y

% primosEntreXY(+X, +Y, -Lista)
% es cierto si Lista unifica con los primos que van desde X hasta Y
% X tiene que ser menor o igual que Y

% ir cerrando el rango
primosEntreXY(X, Y, []) :- X > Y.

primosEntreXY(X, Y, [X|R]) :- X =< Y, X2 is X + 1, primo(X), primosEntreXY(X2, Y, R).

primosEntreXY(X, Y, R) :- X =< Y, X2 is X + 1, \+ primo(X), primosEntreXY(X2, Y, R). %    \+ <---- NOT

% primo(+X)
% es cierto si X es primo

primo(X) :- divisores(X, [_, _]).

% divisores(+X, -ListaDivisores)
% es cierto si ListaDivisores unifica con la lista de números que dividen a X

divisores(X, Y) :- divisores(X, 1, Y).

% inicio, final, lista
divisores(X, X, [X]).

divisores(X, Y, [Y|L]) :- Y =< X, 0 is X mod Y, Y1 is Y + 1, divisores(X, Y1, L).

divisores(X, Y, L) :- Y =< X, Y1 is Y + 1, divisores(X, Y1, L).

