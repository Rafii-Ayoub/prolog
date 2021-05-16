/*           Remplir la base de données par les faits       */

traduction(1,un).
traduction(2,deux).
traduction(3,trois).
traduction(4,quatre).
traduction(5,cinq).
traduction(6,six).
traduction(7,sept).
traduction(8,huit).
traduction(9,neuf).

/*                       Les regles                       */


traduit([],[]):-!.
traduit([X|L],[Mot|LD]):-traduction(X,Mot),traduit(L,LD).

% ?- traduit([1,2,5], M). ==>  M = [un, deux, cinq].



plus_symb(M1, M2, R):- traduction(X,M1), traduction(Y,M2), R is X+Y.
fois_symb(M1, M2, R):- traduction(X,M1), traduction(Y,M2), R is X*Y.

% ?- plus_symb(un, deux, R). ==> R = 3.
% ?- fois_symb(un, deux, R). ==> R = 2.

