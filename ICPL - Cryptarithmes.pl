d([0,1,2,3,4,5,6,7,8,9]).

testAdd1([S,E,N,D,M,O,R,Y]):-10000*M+1000*(O-S-M)+100*(N-E-O)+10*(E-N-R)+Y-D-E=:=0.

enleve_un(T,[T|R],R).
enleve_un(X,[T|R],[T|U]):-enleve_un(X,R,U).

affecter([],_).
affecter([V|R],L):-enleve_un(V,L,RC),affecter(R,RC).
reaffecter([],R,R).
reaffecter([V|RV],L,R):-enleve_un(V,L,RC),reaffecter(RV,RC,R).

generer(L):-d(D),affecter(L,D).

somme(R1,A,B,R,0):-R=:=R1+A+B.
somme(R1,A,B,R,1):-R1+A+B=:=R+10.
regenerer([S,E,N,D,M,O,R,Y]):-d(X),reaffecter([D,E,Y],X,RC1),somme(0,D,E,Y,R1),
	reaffecter([N,R],RC1,RC2),somme(R1,N,R,E,R2),
	reaffecter([O],RC2,RC3),somme(R2,E,O,N,R3),
	reaffecter([S,M],RC3,_),somme(R3,S,M,O,R4),
	R4=:=M.

chercher1(L):-generer(L),testAdd1(L).
chercher1p(L):-regenerer(L),testAdd1(L).

testAdd2([S,O,L,E,I,A,B,K,N]):-100000*(B-S)+10000*(I-O-S)+1000*(K-L-A)+100*(I-E-B)+10*(N-I-L)+I-L-E=:=0.
chercher2(L):-generer(L),testAdd2(L).

testAdd3([R,O,M,E,J,U,L,I,A]):-10000*(A-R-J)+1000*(M-O-U)+100*(O-M-L)+10*(U-E-I)+R-O-E=:=0.
chercher3(L):-generer(L),testAdd3(L).













