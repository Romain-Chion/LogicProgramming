/*ATTENTION!!!
POUR INITIALISER LE PROBLEME, SINON LA RECHERCHE DE SOLUTION NE MARCHE PAS*/
init(_):-assert(solution([0,0,+])).

/*Partie 1*/

/*Question 1*/
:-dynamic instance/2.

/*
genInstance(Cibles,[A,B,C,D,E,F]):-
	Cibles is random(1000),
	isinside([A,B,C,D,E,F],[1,2,3,4,5,6,7,8,9,10,25,50,75,100]),
	retractall(instance(_,_)),
	assert(instance(Cibles,[A,B,C,D,E,F])).

isinside([],_):-!.
isinside([T|Q],[T|R]):-isinside(Q,R).
isinside([T|Q],[X|R]):-isinside([T|Q],R),T=\=X.
*/

genInstance2(Cible,[A,B,C,D,E,F]):- /*Génère aléatoirement une instance*/
	Cible is random(900)+100,
	genCarton(A),
	genCarton(B),
	genCarton(C),
	genCarton(D),
	genCarton(E),
	genCarton(F),
	retractall(instance(_,_)),
	assert(instance(Cible,[A,B,C,D,E,F])).

/*Extrait aléatoirement un carton dans la listes des cartons*/
genCarton(A):-extraireR(A,[1,2,3,4,5,6,7,8,9,10,25,50,75,100],_).


/*Partie 2*/
iso(*). /*Test si l'argument est un opérateur*/
iso(+).
iso(-).
iso(/).
isp(+).
ism(-).
isf(*).
isd(/).
isande(X):-integer(X). /*Test si l'argument est un opérande*/
ispiv(X):-iso(X).      /*Test si l'argument est un Piv*/
ispiv(X):-isande(X).

/*Question 2*/
pivPush(L,[O|L],O):-ispiv(O). /*Insère un Piv dans une liste*/
pivPop([O|_],O):-ispiv(O).    /*Extrait un Piv d'une liste*/

/*Question 3*/
evaluerExpression([],[X],X):-!. /*Evalue une expression en Polonaise Inverse*/
evaluerExpression([T|Q],L,R):-
	isande(T),
	evaluerExpression(Q,[T|L],R),!.
evaluerExpression([T|Q],[X|[Y|L]],R):-
	isp(T),S is (X+Y),
	evaluerExpression(Q,[S|L],R),!.
evaluerExpression([T|Q],[X|[Y|L]],R):-
	ism(T),S is (Y-X),
	evaluerExpression(Q,[S|L],R),!.
evaluerExpression([T|Q],[X|[Y|L]],R):-
	isf(T),S is (X*Y),
	evaluerExpression(Q,[S|L],R),!.
evaluerExpression([T|Q],[X|[Y|L]],R):-
	isd(T),X=\=0,Y mod X =:= 0,S is (Y/X),
	evaluerExpression(Q,[S|L],R),!.
/*Res_ok et Res_erreur superflus, car lorsque ok, cela renvoie un résultat sinon, cela renvoie false*/


/*Partie 3*/

/*Question 4*/

/*Extrait le Nème élément d'une liste et renvoie le reste*/
extraire(1,T,[T|Q],Q):-!.
extraire(N,X,[T|Q],[T|R]):-N1 is N-1,extraire(N1,X,Q,R).

/*Extrait aléatoirement un élèment d'une liste*/
extraireR(CN1,C,RC):-length(C,N),N>=1,N1 is random(N)+1,
	extraire(N1,CN1,C,RC).

/*Question 5*/
:- dynamic solution/1.

/*Cherche la meilleure solution à l'instance*/
solveur(M):-instance(Cible,_),solution(M),evaluerExpression(M,[],Cible).
solveur(Piv):-
	instance(Cible,Cartons),
	recherche(Cartons,[],Piv),
	evaluerExpression(Piv,[],R),
	solution(M),
	evaluerExpression(M,[],S),E is abs(Cible-S)-1,
	E>=abs(Cible-R),
	retractall(solution(_)),assert(solution(Piv)).

/*Recherche une expression valide*/
recherche(_,S,S):-evaluerExpression(S,[],_).
recherche(C,Piv,S):-length(C,N),length(Piv,M),M=<N-1,
	recherche(C,[+|Piv],S).
recherche(C,Piv,S):-length(C,N),length(Piv,M),M=<N-1,
	recherche(C,[-|Piv],S).
recherche(C,Piv,S):-length(C,N),length(Piv,M),M=<N-1,
	recherche(C,[*|Piv],S).
recherche(C,Piv,S):-length(C,N),length(Piv,M),M=<N-1,
	recherche(C,[/|Piv],S).
recherche(C,Piv,S):-
	extraireR(CN1,C,RC),
	recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-
	extraireR(_,C,RC),
	recherche(RC,Piv,S).
/*recherche(C,Piv,S):-extraire(1,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(1,_,C,RC),recherche(RC,Piv,S).
recherche(C,Piv,S):-extraire(2,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(2,_,C,RC),recherche(RC,Piv,S).
recherche(C,Piv,S):-extraire(3,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(3,_,C,RC),recherche(RC,Piv,S).
recherche(C,Piv,S):-extraire(4,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(4,_,C,RC),recherche(RC,Piv,S).
recherche(C,Piv,S):-extraire(5,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(5,_,C,RC),recherche(RC,Piv,S).
recherche(C,Piv,S):-extraire(6,CN1,C,RC),recherche(RC,[CN1|Piv],S).
recherche(C,Piv,S):-extraire(6,_,C,RC),recherche(RC,Piv,S).*/



/*Partie 4*/


/*Question 6*/
afficher(L):-afficherCalc(L,[]). /*Lance l'affichage sans l'accumulateur*/

/*Calcule et affiche le calcul du résultat de la polonaise*/
afficherCalc([],[_]):-!.
afficherCalc([T|Q],L):-isande(T),afficherCalc(Q,[T|L]),!.
afficherCalc([T|Q],[X|[Y|L]]):-
	isp(T),S is (X+Y),
	write(Y),write(' '),write(T),write(' '),write(X),write(' '),write('='),write(' '),write(S),nl,
	afficherCalc(Q,[S|L]),!.
afficherCalc([T|Q],[X|[Y|L]]):-
	ism(T),S is (Y-X),
	write(Y),write(' '),write(T),write(' '),write(X),write(' '),write('='),write(' '),write(S),nl,
	afficherCalc(Q,[S|L]),!.
afficherCalc([T|Q],[X|[Y|L]]):-
	isf(T),S is (X*Y),
	write(Y),write(' '),write(T),write(' '),write(X),write(' '),write('='),write(' '),write(S),nl,
	afficherCalc(Q,[S|L]),!.
afficherCalc([T|Q],[X|[Y|L]]):-
	isd(T),S is (Y/X),
	write(Y),write(' '),write(T),write(' '),write(X),write(' '),write('='),write(' '),write(S),nl,
	afficherCalc(Q,[S|L]),!.

/*Question 7*/

/*Recherche la meilleur solutin en un temps donné*/
solveurTime(S):-
	call_with_time_limit(45,solveur(S)).

/*Question 8*/

/*Résout le problème en un temps donné, affiche le calcul ainsi que la cible.*/
lecompteestbon(_):-
	time(solveurTime(S)),
	solution(S),
	afficher(S),
	instance(X,_),write('la cible attendu était '),write(X).























