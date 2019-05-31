% Grafo del sobre

grafo4(g([a,b,c,d,e], [a(a,b),a(b,a),
                       a(a,c),a(c,a),
					   a(b,d),a(d,b),
					   a(b,c),a(c,b),
					   a(c,e),a(e,c),
					   a(d,e),a(e,d),
					   a(b,e),a(e,b),
					   a(c,d),a(d,c)])).

conectado(g(_,A), Ini, Fin) :- member(a(Ini,Fin), A).
conectado(g(_,A), Ini, Fin) :- member(a(Fin,Ini), A).

% Camino como una lista de aristas y visitados como una lista de aristas
% camino(Grafo, Ini, Fin, Visitados, Camino)

camino(g(V,A), I, [a(I,Tmp),a(Tmp,I) | Visitados], [a(I,Tmp) | Camino]) :-
  member(a(I,Tmp), A),
  \+ member(a(I,Tmp), Visitados),
  camino(g(V,A), Tmp, Visitados, Camino).
  

% camino_sobre(Grafo, Ini, Visitados, Camino)
% es cierto si Camino unifica con una lista de aristas que recorren el sobre

es_sobre(Camino) :- length(Camino, 8).

%camino_sobre(g(V,A), I, F, , ) :-
%  conectado(

%camino_sobre(g(V,A), I, [a(I,Tmp), a(Tmp,I) | Visitados], [a(I,Tmp) | Camino]) :-
%  member(a(I,Tmp), A),
%  \+ member(a(I,Tmp), Visitados),
%  camino_sobre(g(V,A), Tmp, Visitados, Camino).
  
% casita(+Grafo, -Caminos)
% es cierto si Caminos unifica con una lista de listas de aristas cuyo recorrido
% tendria la forma de un sobre

casita(g(V,A), C) :-
  member(I, V),
  camino_sobre(g(V,A), I, [], C),
  es_sobre(C).

  
camino_sobre(g(_, []), _, _, []).
  

camino_sobre(g(_, A), I, [a(I,Tmp), a(Tmp, I) | Visitados], [a(I, Tmp) | Camino]) :- 
  member(a(I, Tmp), A),
  \+ member(a(I, Tmp), Visitados),
  append(A1, [a(I, Tmp) | A2], A),
  append(A1, A2, AA),
  append(AA1, [a(Tmp, I) | AA2], AA),
  append(AA1, AA2, AAA),
  camino_sobre(g(_, AAA), Tmp, Visitados, Camino).
