% Problema de Estado

% Juego de Garrafas

% 1. Representación del estado
%    estado(G5, G3)
%    G5 representa el número de galones en la garrafa de 5 litros
%    G3 representa el número de galones en la garrafa de 3 litros

% estado inicial
estado(0, 0).

% estado final
estado(4, _).


% 2. Representación de los movimientos
%  2.1. Llenar garrafa de 5 litros
%  2.2. Llenar garrafa de 3 litros
%  2.3. Vaciar garrafa de 5 litros
%  2.4. Vaciar garrafa de 3 litros
%  2.5. Vaciar contenido de garrafa de 5 en garrafa de 3
%  2.6. Vaciar contenido de garrafa de 3 en garrafa de 5

% mov(+NombreMov, +EstadoAntes, +EstadoDespues)
%
%  2.1. Llenar garrafa de 5 litros
   mov(llenar5, estado(_, G3), estado(5, G3)).

%  2.2. Llenar garrafa de 3 litros
   mov(llenar3, estado(G5, _), estado(G5, 3)).
   
%  2.3. Vaciar garrafa de 5 litros
   mov(vaciar5, estado(_, G3), estado(0, G3)).
   
%  2.4. Vaciar garrafa de 3 litros
   mov(vaciar3, estado(G5, _), estado(G5, 0)).
   
%  2.5. Vaciar contenido de garrafa de 5 en garrafa de 3
%  Opcion 1
   mov(pasar5a3, estado(G5, G3), estado(0, GT)) :- GT is G5 + G3, GT =< 3.
%  Opcion 2
   mov(pasar5a3, estado(G5, G3), estado(G5N, 3)) :- GT is G5 + G3, GT > 3, 
											        G5N is GT - 3.

%  2.6. Vaciar contenido de garrafa de 3 en garrafa de 5
%  Opcion 1
   mov(pasar3a5, estado(G5, G3), estado(GT, 0)) :- GT is G5 + G3, GT =< 5.
%  Opcion 2
   mov(pasar3a5, estado(G5, G3), estado(5, G3N)) :- GT is G5 + G3, GT > 5, 
													G3N is GT - 5.


% 3. Crear el camino
% camino(+EstadoIni, +EstadoFin, +Visitados, -Camino)
% es cierto cuando Camino unifica con una lista de movimientos
% para ir desde el EstadoIni hasta EstadoFin sin repetir en la 
% lista de estados Visitados

camino(Ini, Ini, _, []).

camino(Ini, Fin, Visitados, [NombreMov | Camino]) :- mov(NombreMov, Ini, Temp), 
													 \+ member(Temp, Visitados),
													 camino(Temp, Fin, [Temp | Visitados], Camino).

