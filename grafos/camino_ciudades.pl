ciudades(g([madrid, cordoba, sevilla, jaen, granada,huelva, cadiz],
			[a(huelva, sevilla, a49, 94),
			a(sevilla, cadiz,ap4, 125),
			a(sevilla, granada, a92, 256),
			a(granada, jaen,a44, 97),
			a(sevilla, cordoba, a4, 138),
			a(jaen,madrid, a4, 335),
			a(cordoba, madrid, a4, 400)]
)).


% conectado(Grafo, Ini, Fin)
% es cierto si el el vertice Ini esta conectado mediante una arista con el vertice Fin

conectado(g(_,A), Ini, Fin, Nom, Dist) :- member(a(Ini,Fin,Nom,Dist), A).
conectado(g(_,A), Ini, Fin, Nom, Dist) :- member(a(Fin,Ini,Nom,Dist), A).

% camino(+Grafo, +Ini, +Fin, +Visitados, -Camino, -Peso)
% es cierto si Camino unifica con el camino representado como vertices/aristas que va desde
% Ini hasta Fin sin repetir vertices/aristas y con coste total de Peso

% Camino como una lista de aristas y visitados como una lista de vertices

camino(_, Ini, Ini, _, [], 0).

camino(G, Ini, Fin, Visitados, [a(Ini,Tmp,Nom,Dist)|Camino], PT) :-
  conectado(G, Ini, Tmp, Nom, Dist),
  \+ member(Tmp, Visitados),
  camino(G, Tmp, Fin, [Tmp | Visitados], Camino, Peso),
  PT is Peso + Dist.