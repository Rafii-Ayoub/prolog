/*Remplir une base de donnés des faits */ 

homme(francois1).
homme(henri2).
homme(henri3).
homme(charles_emmanuel).
homme(emmanuel_philiber).
homme(victor_amédée).
homme(charles4).
homme(froncois2).
femme(marguerite).
femme(madeleine).
femme(catherine_de_medicis).
femme(elisabeth).
femme(margot).
parent(francois1, madeleine).
parent(francois1, marguerite).
parent(francois1, henri2).
parent(marguerite, charles_emmanuel).
parent(emmanuel_philiber, charles_emmanuel).
parent(charles_emmanuel, victor_amédée).
parent(catherine_de_medicis, henri3).
parent(catherine_de_medicis, charles4).
parent(catherine_de_medicis, margot).
parent(catherine_de_medicis, froncois2).
parent(henri2, henri3).
parent(henri2, charles4).
parent(henri2, margot).
parent(henri2, froncois2).
parent(charles4, elisabeth ).
/*-------------------------------------------------------------------------*/
                 % Définir le prédicat pere 

pere(X, Y) :
    homme(X),
    parent(X,Y).
/* TEST:  ?-pere(X,margot). ==> X = henri2  */


/*-------------------------------------------------------------------------*/
                  % Définir le prédicat mere

mere(X, Y) :-
    femme(X),
    parent(X,Y).
/* TEST: ?-mere(X,margot). ==> X = henri2  */


/*-------------------------------------------------------------------------*/
                  % Définir le prédicat fille 

fille(X,Y):-
    femme(X),
    parent(Y,X).
% TEST: ?-fille(X,henri2). ==> X = margot  

/*-------------------------------------------------------------------------*/
                  % Définir le prédicat gdparent 

gdparent(X,Y):-
    parent(X,Z),
    parent(Z,Y).

% TEST: ?-gdparent(X,margot). ==> X = froncois1  
% TEST2: ?-gdparent(X,victor_amédée). ==> X = marguerite ,  X = emmanuel_philiber
/*-------------------------------------------------------------------------*/

                  % Définir le prédicat gdpere 

gdpere(X,Y):-
    homme(X),
    gdparent(X,Y).

% TEST: ?-gdpere(X,margot). ==> X = francois1

/*-------------------------------------------------------------------------*/
                     % Définir le prédicat gdmere 

gdmere(X,Y):-
    femme(X)
    gdparent(X,Y).
    
% TEST: gdmere(X,victor_amédée). ==>  X = marguerite


/*-------------------------------------------------------------------------*/
                     % Définir le prédicat procreer(X,Y)

procreer(X,Y):-
    parent(X,Z),
    parent(Y,Z).

% TEST: procreer(emmanuel_philiber,marguerite). ==>  true
% TEST: procreer(emmanuel_philiber,henri3). ==>  false


/*-------------------------------------------------------------------------*/
                     
                  % Définir le prédicat ancetre

ancetre(X,Y):- parent(X,Y).         
ancetre(X,Y):-
    parent(X,Z),
    ancetre(Z,Y).
    

% TEST: ?-ancetre(francois1,charles4). ==>  true
% TEST2: ?-ancetre(W,henri2). ==> W = francois1
% TEST3: ?-ancetre(henri2,W)==> W = henri3 , W = charles4 , W = margot , W = froncois2 , W = elisabeth

/*-------------------------------------------------------------------------*/
                 % Définir le prédicat frere

frere(X,Y):-
    homme(Y),
    parent(Z,X),
    parent(Z,Y).
    
% TEST: ?-frere(henri3,charles4). ==> true
% TEST2: ?-R = henri3 ==> R = charles4  , R = froncois2
/*-------------------------------------------------------------------------*/
                 % Définir le prédicat soeur.

soeur(X,Y):-
    femme(X)
    parent(Z,X),
    parent(Z,Y).
    
% TEST: ?-frere(henri3,margot). ==> true
% TEST2: ?-R = henri3 ==> R = margot 

/*-------------------------------------------------------------------------*/
/*-------------------------------------------------------------------------*/
               % Définir le prédicat oncle et tante

oncle(X,Y):-
    parent(Z,Y),
    frere(X,Z).


tante(X,Y):-
    soeur(Z,X),
    parent(Z,Y).
    
% TEST2: ?-tante(madeleine,X). ==> X = charles_emmanuel , X = henri3 , X = charles4 , X = margot ,X = froncois2.
