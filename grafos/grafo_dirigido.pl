% Grafo 1

grafo1(g([a,b,c,d], [a(a,b), a(b,c), a(c,a), a(c,d), a(d,a)])).

% conectado(Grafo, Ini, Fin)
% es cierto si el el vertice Ini esta conectado mediante una arista con el vertice Fin

conectado(g(_,A), Ini, Fin) :- member(a(Ini,Fin), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con el camino representado como vertices/aristas que va desde
% Ini hasta Fin sin repetir vertices/aristas y con coste total de Peso

% Camino como una lista de vertices y visitados como una lista de aristas

camino(_, Ini, Ini, _, [Ini], 0).

camino(G, Ini, Fin, Visitados, [Ini|Camino], PT) :-
  conectado(G, Ini, Tmp),
  \+ member(a(Ini,Tmp), Visitados),
  camino(G, Tmp, Fin, [a(Ini,Tmp) | Visitados], Camino, Peso),
  PT is Peso + 1.