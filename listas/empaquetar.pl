% empaquetar(+Lista, -R)
% es cierto si R unifica con una lista de listas con los elementos consecutivos de Lista
%
% empaquetar([a,a,a,b,c,c,a,a,d,e,e,e,e], X).
% X = [ [a,a,a], [b], [c,c], [a,a], [d], [e,e,e,e] ]

empaquetar([], []).

empaquetar([E], [[E]]).

empaquetar([H | T], R) :- empaquetar(T, [HR | TR]),
						  member(H, HR),
						  append(HR, [H], R1),
						  append([R1], TR, R).
								  
empaquetar([H | T], R1) :- empaquetar(T, [HR | TR]),
						   \+ member(H, HR),
						   append([[H]], [HR | TR], R1).
						 
						 
% Member si es true, devuelve todos los true posibles, osea, tantos true como veces esté el elemento dentro
% Con esta modificacion, solo se comprueba que la cabeza sea igual que únicamente el primer elemento

empaquetar2([], []).

empaquetar2([E], [[E]]).

empaquetar2([H | T], R) :- empaquetar2(T, [ [H | HR] | TR]),
						   append(HR, [H, H], R1),
						   append([R1], TR, R).
								  
empaquetar2([H | T], R1) :- empaquetar2(T, [HR | TR]),
						    \+ member(H, HR),
						    append([[H]], [HR | TR], R1).
							
% -----------------------------------------------------------------------
		
empaquetar3([], []).
		
empaquetar3([E], [[E]]).

empaquetar3([H | T], R) :- empaquetar3(T, [ [H | HR] | TR]),
						   append([ [H, H | HR] ], TR, R).
								  
empaquetar3([H | T], R1) :- empaquetar3(T, [HR | TR]),
						    \+ member(H, HR),
						    append([[H]], [HR | TR], R1).
							
% -----------------------------------------------------------------------

empaquetar4([], []).

empaquetar4([E], [[E]]).

empaquetar4([H, H|T], [[H|R1] | R]) :- empaquetar4([H|T], [R1|R]).

empaquetar4([H1 , H2 |T], [[H1] | R]) :- H1 \= H2, empaquetar4([H2 | T], R).
