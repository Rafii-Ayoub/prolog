
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%                             Automate                                         
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%========================= faits ======================================%

etat(e1).
etat(e2).
etat(e3).

initial(e1).
final(e1).

transition(e1, a, e1).
transition(e1, b, e2).
transition(e2, a, e1).
transition(e2, b, e3).
transition(e3, a, e2).
transition(e3, b, e3).

% ========================= regles ====================================== %

% le prédicat reconnu

reconnu(Mot) :- initial(EI), 
                parcours(Mot,EI,EF), 		
                final(EF).


% Le predicat parcours

parcours([],_,_):-!.
parcours([A|L],EI,EF):-transition(EI,A,EM),
                       parcours(L,EM,EF).


% Le predicat reconnu 

reconnu_ch(Mot,CH) :- initial(EI), 
                      parcours_ch(Mot,EI,EF,CH), 		      
                      final(EF).



% Le predicat parcours_ch

parcours_ch([],EI,EF,[EF]):-!.
parcours_ch([X|L1],EI,EF,[EI,C|L2]):-transition(EI,X,C),
                                     etat(C),
                                     parcours_ch(L1,C,EF,[C|L2]).

% Le predicat parcours_ch

chemin(ED, EA) :- existe_parcours(ED, EA, []).



% ECRIRE existe_parcours



% ECRIRE est_accessible



% ECRIRE permet_acces


