% Ciclos de un grafo

% Grafo 1
grafo1(g([a,b,c,d], [a(a,b), a(b,c), a(c,a), a(c,d), a(d,a)])).

grafo3(g([a,b,c,d,e], [a(a,b),a(a,c),a(b,c),a(b,d),a(b,e),a(c,d),a(c,e),a(d,e)])).

% conectado(Grafo, Ini, Fin)
% es cierto si el el vertice Ini esta conectado mediante una arista con el vertice Fin

conectado(g(_,A), Ini, Fin) :- member(a(Ini,Fin), A).
conectado(g(_,A), Ini, Fin) :- member(a(Fin,Ini), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con el camino representado como vertices/aristas que va desde
% Ini hasta Fin sin repetir vertices/aristas y con coste total de Peso

% Camino como una lista de vertices y visitados como una lista de aristas

camino(g(_,A), Ini, Fin, _, [a(Ini,Fin)], 0) :- member(a(Ini,Fin), A).

camino(G, Ini, Fin, Visitados, [Ini|Camino], PT) :-
  conectado(G, Ini, Tmp),
  \+ member(a(Ini,Tmp), Visitados),
  camino(G, Tmp, Fin, [a(Ini,Tmp) , a(Tmp,Ini)| Visitados], Camino, Peso),
  PT is Peso + 1.
  
% Todas las soluciones las mete en una lista
ciclo(g(V,A), R) :- bagof(Ciclo, ciclos(g(V,A), Ciclo) , R).
					
ciclos(g(V,A), R) :- member(Vertice, V), camino(g(V,A), Vertice, Vertice, [], R, _).