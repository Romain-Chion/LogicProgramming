liste([1,2,3,4,5]).
liste([]).

dans(X,[X|_]). /*L doit être instancié*/
dans(X,[_|R]):-dans(X,R).

premier(X,[X|_]).

dernier(X,[X]):-!.
dernier(X,L):-L=[_|R],dernier(X,R).

saufDernier([],[_]).
saufDernier(L,[T,R]):-saufDernier(S,R),L=[T|S].

max([X],X).
max([T|R],X):-max(R,X),X>=T.
max([T|R],X):-max(R,T),T>X.

somme([S],S).
somme([T|L],S):-somme(L,U),S is T+U.

nieme(T,1,[T|_]).
nieme(X,N,[_|R]):-N1 is N-1, nieme(X,N1,R).

longueur(0,[]).
longueur(N,[_|R]):-longueur(N1,R), N is N1+1.

generer(1,[1]).
generer(N,[N|R]):-N1 is N-1,generer(N1,R).
regenerer(0,X,X):-!.
regenerer(N,L,S):-N1 is N-1,regenerer(N1,[N|L],S).

concat(L1,[],L1).
concat([],L2,L2).
concat([T|R],L2,L3):-concat(R,L2,L4),L3=[T|L4].

inversion([],S,S).
inversion([T|R],L,S):-inversion(R,[T|L],S).

enleve_un(T,[T|R],R).
enleve_un(X,[T|R],[T|U]):-enleve_un(X,R,U).

enleve_tout(_,[],[]).
enleve_tout(T,[T|R],S):-enleve_tout(T,R,S).
enleve_tout(X,[T|R],[T|U]):-not(X=T),enleve_tout(X,R,U).

remplace_un(T,X,[T|R],[X|R]).
remplace_un(X,Y,[T|R],[T|U]):-remplace_un(X,Y,R,U).

remplace_tout(_,_,[],[]).
remplace_tout(T,X,[T|R],[X|U]):-remplace_tout(T,X,R,U).
remplace_tout(X,Y,[T|R],[T|U]):-not(X=T),remplace_tout(X,Y,R,U).

permute([],[]).
permute(L,[X|P]):-enleve_un(X,L,R),permute(R,P).

permuteall(L,EP):-findall(P,permute(L,P),EP),
	write('Il y a '),
	length(EP,N),write(N),
	write(' permutations'),nl.

not_dans(_,[]).
not_dans(X,[T|R]):-not(X=T),not_dans(X,R).


validerPermutation([_]):-!.
validerPermutation([D|RD]):-validerDame(D,RD,1),validerPermutation(RD).

validerDame(_,[],_).
validerDame(D,[P|A],Delta):-validerCouple(D,P,Delta),Delta1 is Delta+1,validerDame(D,A,Delta1).

validerCouple(D,P,Delta):-Dif is abs(D-P),Dif=\=Delta.

chercher(N,P):-regenerer(N,[],L),permute(L,P),validerPermutation(P).

construire(A,[],A).
construire(DP,DR,S):-enleve_un(D,DR,R),validerDame(D,DP,1),construire([D|DP],R,S).

chercher2(N,P):-regenerer(N,[],L),construire([],L,P).

combien(N):-findall(P,chercher(N,P),E), /*cherche toutes les solutions P*/
	write('Il y a '),               /*au problème chercher, dans la liste E.*/
	length(E,N1),write(N1),
	write(' solutions'),nl.

combien2(N):-findall(P,chercher2(N,P),E), /*cherche toutes les solutions P*/
	write('Il y a '),                 /*au problème chercher2 dans E*/
	length(E,N1),write(N1),
	write(' solutions'),nl.




















