solution :-  village(Maisons),
	     membre(maison(rouge, anglais, _, _, _), Maisons),
	     membre(maison(_, espagnol, cultivateur, _, _), Maisons),
	     membre(maison(verte, _, _, cafe, _), Maisons),
         membre(maison(_, suisse, _, the, _), Maisons), 
	     droite_de(maison(verte,_,_,_,_), maison(blanche,_,_,_,_), Maisons),
	     membre(maison(_, _, prof_russe, _, bernard), Maisons),
	     Maisons = [_, _, maison(_, _, _, lait, _), _,_],
	     membre(maison(jaune, _, _, _, paul), Maisons),
	     Maisons = [maison(_, francais, _, _, _)|_],
	     voisin_de(maison(_,_,_,_,jacques), maison(_,_,dentiste,_,_), Maisons),
	     voisin_de(maison(_,_,_,_,paul), maison(_,_,boucher,_,_), Maisons),
	     membre(maison(_, _, _, cidre, henri), Maisons),
         membre(maison(_, italien, _, _, andre), Maisons),
         voisin_de(maison(_,francais,_,_,_), maison(orange,_,_,_,_), Maisons),
	     membre(maison(_, _, fleuriste, _, _), Maisons),
	     membre(maison(_, _, _, eau, _), Maisons),
	     print_maisons(Maisons).


% ================== les regles ============================= % 


village( [ maison(_, _, _, _, _),
	   maison(_, _, _, _, _),
	   maison(_, _, _, _, _),
	   maison(_, _, _, _, _),
	   maison(_, _, _, _, _) ]).

%   définition du prédicat droite_de

droite_de(A, B, [B, A | _]).
droite_de(A, B, [_ | Y]) :- droite_de(A, B, Y).

%   définition du prédicat voisin_de  

voisin_de(A, B,L) :- droite_de(A, B, L);droite_de(B, A, L).

%   définition du prédicat membre

membre(X, [X|_]).
membre(X, [_|Y]) :- membre(X, Y).

%   définition du prédicat print_maisons   

print_maisons([]).
print_maisons([X|L]):- write(X),
                       nl, 
                       print_maisons(L).

% ?- solution .
% Le résultat est : 
/*
maison(jaune, francais, dentiste, eau, paul)
maison(orange, suisse, boucher, the, jacques)
maison(rouge, anglais, prof_russe, lait, bernard)
maison(blanche, espagnol, cultivateur, cidre, henri)
maison(verte, italien, fleuriste, cafe, andre)
*/


