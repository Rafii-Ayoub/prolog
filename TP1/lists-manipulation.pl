
doubler([],[]):-!.
doubler([X|L],[X,X|LD]):-doubler(L,LD).

% ?- doubler([a,b,c], LD). ==> LD = [a,a,b,b,c,c].

const_liste(0,_, []):-!.
const_liste(N, X, [X|L]):- A is N-1 ,  const_liste(A, X, L).

% ?- const_liste(3, a, L). ==> L = [a,a,a].


concat([],L2,L2). 
concat([Head|Tail],L2,[Head|L3]) :- concat(Tail,L2,L3). 

developper(_, [], []):-!.
developper(N, [X|L], L1):- const_liste(N,X,Lx),developper(N, L, LD), concat(Lx,LD,L1).

% ?- developper(3, [a,b,a], LD). ==> LD = [a,a,a,b,b,b,a,a,a]. 
