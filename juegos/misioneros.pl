% Problemas de Estados

% Misioneros y Canibales

% 1. Estados
% estado(MisionerosDch, CanibalesDch, SituacionBote)

% 2. Movimientos

mov(pasar(M, C, izquierda), estado(MD, CD, derecha), estado(MDN, CDN, izquierda)) :- 
  pasar(M, C),
  M =< MD, 
  C =< CD,
  MDN is MD - M,
  CDN is CD - C,
  \+ no_valido(estado(MDN, CDN, _)).
  
mov(pasar(M, C, derecha), estado(MD, CD, izquierda), estado(MDN, CDN, derecha)) :-
  pasar(M, C),
  MI is 3 - MD,
  CI is 3 - CD,
  M =< MI, 
  C =< CI, 
  MDN is MD + M,
  CDN is CD + C,
  \+ no_valido(estado(MDN, CDN, _)).

% pasar(Misioneros, Canibales)
% representa el numero de Misioneros y Canibales que pasaran de un lado al otro

pasar(2, 0).
pasar(1, 0).
pasar(0, 1).
pasar(1, 1).
pasar(0, 2).

% valido(estado(MisionerosDch, CanibalesDch, SituacionBote))

%valido(estado(3, 3, _)).
%valido(estado(3, 2, _)).
%valido(estado(3, 1, _)).
%valido(estado(3, 0, _)).
%valido(estado(2, 2, _)).

% no_valido(estado(MisionerosDch, CanibalesDch, SituacionBote))
% representa un estado no valido

no_valido(estado(2, 3, _)).
no_valido(estado(1, 3, _)).
no_valido(estado(1, 2, _)).
no_valido(estado(1, 0, _)).
no_valido(estado(2, 0, _)).
no_valido(estado(2, 1, _)).

% camino(+Inicial, +Final, +Visitados, -Camino)
% es cierto cuando camino unifica con la lista de movimientos necesarios para ir del estado Inicial
% al estado Final sin repertir los estados Visitados

camino(Ini, Ini, _, []).

camino(Ini, Final, Visitados, [pasar(M, C, Sentido) | Camino ]) :- mov(pasar(M, C, Sentido), Ini, Temp),
                                                                   \+ member(Temp, Visitados),
                                                                   camino(Temp, Final, [Temp | Visitados], Camino).