
% Aritmetica de Peano

% 0 -- 0
% 1 -- n(0)
% 2 -- n(n(0))
% 3 -- n(n(n(0)))


% suma(?X, ?Y, ?Z)
% Es cierto si Z unifica con la suma de X e Y en aritmetica de Peano

suma(0, Y, Y).

suma(n(X), Y, n(Z)) :- suma(X, Y, Z).