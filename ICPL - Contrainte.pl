/*use_module(library(clpfd)).*/

test([A,B,C]):-
(A+B)#>=3,
(B+C)#=<2,
[A,B,C] ins 0..2.

smm([S,E,N,D,M,O,R,Y]):-
	all_different([S,E,N,D,M,O,R,Y]),
	[E,N,D,O,R,Y] ins 0..9,
	[S,M] ins 1..9,
	M*10000+(O-S-M)*1000+(N-O-E)*100+(E-N-R)*10+(Y-E-D)#=0.

nreines4([A,B,C,D]):-
	[A,B,C,D] ins 1..4,
	all_different([A,B,C,D]),
	abs(A-B)#\=1,
	abs(B-C)#\=1,
	abs(C-D)#\=1.

generer(L,N):-
	length(L,N),L ins 1..N,
	all_different(L).

nreines(N,L):-generer(L,N),contraindre(L),label(L).

contraindre([_]).
contraindre([D|RD]):-contraindreD(D,RD,1),contraindre(RD).
contraindreD(_,[],_).
contraindreD(D,[AD|RD],L):-
	abs(AD-D) #\= L,
	L2 is L+1,
	contraindreD(D,RD,L2).

combien(N):-
	findall(L,nreines(N,L),E), /*cherche toutes les solutions P*/
	write('Il y a '),               /*au problème chercher, dans la liste E.*/
	length(E,N1),write(N1),
	write(' solutions'),nl.

distributeur([I2,I1,I50,I20,I10],Prix,Rendu):-
	Reste is 200*I2+100*I1+50*I50+20*I20+10*I10-Prix,
	monnaie(Reste,[10,10,10,10,10],Rendu).

monnaie(Reste,[E2,E1,C50,C20,C10],[M2,M1,M50,M20,M10]):-
	M2 in 0..E2,
	M1 in 0..E1,
	M50 in 0..C50,
	M20 in 0..C20,
	M10 in 0..C10,
	Reste #= 200*M2+100*M1+50*M50+20*M20+10*M10,
	labeling([down],[M2,M1,M50,M20,M10]).

redistributeur([I2,I1,I50,I20,I10],Prix,Rendu):-
	Reste is 200*I2+100*I1+50*I50+20*I20+10*I10-Prix,
	monet(Reste,[10,10,10,10,10],Rendu).

monet(Reste,[E2,E1,C50,C20,C10],[M2,M1,M50,M20,M10]):-
	M2 in 0..E2,
	M1 in 0..E1,
	M50 in 0..C50,
	M20 in 0..C20,
	M10 in 0..C10,
	Reste #= 200*M2+100*M1+50*M50+20*M20+10*M10,
	NP#=M2+M1+M50+M20+M10,
	indomain(NP),
	label([M2,M1,M50,M20,M10]).

couleur(1,bleu).
couleur(2,rouge).
couleur(3,vert).
couleur(4,jaune).

voisin(1,[5,6,7,9,10,11,12,13]).
voisin(2,[8,12]).
voisin(3,[6,7,10,14]).
voisin(4,[9,11,14]).
voisin(5,[8,11,12]).
voisin(6,[7,13]).
voisin(7,[1,3,6,10,13]).
voisin(8,[2,5,12]).
voisin(9,[1,4,5,10,11,14]).
voisin(10,[1,3,7,9,14]).
voisin(11,[1,4,5,9,12]).
voisin(12,[1,2,5,8,11,13]).
voisin(13,[1,6,7,12,13]).
voisin(14,[3,4,9,10]).

couple(V1,V2):-voisin(V1,LV),number(V2,LV).

colorier(LP):-length(LP,14),LP ins 1..4, listercouples(CV),contraindrencouleur(LP,CV).

contraindrencouleur(_,[]).
contraindrencouleur(LP,[[V1,V2]|CV]):-





















