% my_flatten(+Lista, -X).
% es cierto si X unifica con una lista con todos los elementos de Lista
% Lista es una lista formada por listas
%
% my_flatten([1,[2,[3,4],5]], X).
% X = [1,2,3,4,5]

% recomendacion: usar "is_list" y "append"

my_flatten([], []).

%my_flatten(Lista, Plana) :- append(L1, [E| L2], Lista),
%					   is_list(E),
%					   my_flatten(E, R),
%					   append(L1, R, R2),
%					   append(R2, L2, Plana).
					   
%my_flatten(Lista, Lista) :- append(_, [E| _], Lista),
%					   \+ is_list(E).

my_flatten([H|T], R3) :- is_list(H),
						 my_flatten(H, R),
						 my_flatten(T, R2),
						 append(R, R2, R3).
						 
my_flatten([H|T], [H|R]) :- \+ is_list(H),
						 my_flatten(T, R).