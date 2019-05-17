% Cannibals and Missionaires Game

% 1. State Representation
% state(+MissionairesRight, +CannibalsRight, +BoatSide)

% 1. Only two people maximum in the boat and 1 person minimum
% 2. No more Cannibals than Missionaires at any side 

% Initial State
state(3,3, right).

% Final State
state(0,0, _).

% 2. Movements

mov( move(M, C, left), state(MR, CR, right), state(NMR, NCR, left)) :- 
  T is M + C, T =< 2, T >= 1, % max 2 people in boat and 1 min
  M =< MR, C =< CR, % move if we have people
  CR =< MR, % no more cannibals than missionaires in right
  ML is 3 - MR, CL is 3 - CR, % people to the left
  NML is ML + M, NCL is CL + C, % new people to the left
  NCL =< NML, % no more cannibals after movement to the left
  NMR is MR - M, NCR is CR - C, % new people to the right
  NCR =< NMR. % no more cannibals after movement to the right
  
mov( move(M, C, right), state(), state()) :-
  T is M + C, T =< 2, T >= 1, % max 2 people in boat and 1 min
  ML is 3 - MR, CL is 3 - CR, % initial people to the left 