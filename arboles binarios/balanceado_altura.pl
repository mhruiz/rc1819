% balanceado(+ArbolBin)
% es cierto si ArbolBin es balanceado, es decir, para todo nodo, la diferencia
% de altura entre sus hijos izquierdo y derecho es como maximo 1

balanceado(nil).

balanceado(a(_, HI, HD)) :- altura(HI, AI),
                            altura(HD, AD),
							D is abs(AI - AD),
							D =< 1, 
							balanceado(HI),
							balanceado(HD).

% altura(+ArbolBin, -A)
% es cierto si A unifica con la altura de ArbolBin

altura(nil, 0).

altura(a(_, HI, HD), AT) :- altura(HI, AI), altura(HD, AD), AI => AD, AT is AI + 1.

altura(a(_, HI, HD), AT) :- altura(HI, AI), altura(HD, AD), AD > AI, AT is AD + 1.