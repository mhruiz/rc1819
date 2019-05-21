% Hanoi
%
%    |     |     |
%    |     |     |
%    |     |     |
%  ----- ----- -----
%    A     B     C

% hanoi(+NumDiscos, +A, +C, +B, -ListaMov)
% es cierto cuando ListaMov unifica con la lista de movimientos necesarios para pasar
% NumDiscos de la torre A hasta la torre B utilizando la torre C como auxiliar

% Mover de la torre A los n - 1 discos superiores a la torre C utilizando la torre B como auxiliar
% Mover el disco n (el mayor) de A a B
% Mover la torre de n - 1 discos (C) a B, utilizando A como auxiliar

hanoi(1, A, _, B, [pasar(1, A, B)]).

hanoi(N, A, C, B, R) :- N2 is N - 1,
                        hanoi(N2, A, C, B, M1),
					    hanoi(1, A, B, C, M2),
					    hanoi(N2, B, A, C, M3),
						append(M1, M2, R1),
						append(R1, M3, R).