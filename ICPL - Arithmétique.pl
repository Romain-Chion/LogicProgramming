factoriel(0,1).
factoriel(N,F):-(N>0),(N1 is N-1),factoriel(N1,F1),(F is N*F1).

pair(X):-S is X mod 2, S =:= 0.
impair(X):-S is X mod 2, S =:= 1.

puissance(_,0,1).
puissance(X,P,E):-(P>0),pair(P),(P1 is P/2),puissance(X,P1,E1),(E is E1*E1).
/*E=X^P*/
puissance(X,P,E):-(P>0),impair(P),(P1 is (P-1)/2),puissance(X,P1,E1),(E is X*E1*E1).

pgcd(A,A,A):-!,A.
pgcd(A,B,P):-(A>0),(B>A),pgcd(B,A,P).
pgcd(A,B,P):-(B>0),(A>B),X is (B-A),pgcd(X,B,P).

fibonacci(0,1,1).
fibonacci(N,F1,F2):-(N>0),(N1 is N-1),fibonacci(N1,F2,F3),(F1 is F2+F3).

nonDiv(I,N):- N1 is N//2, I>N1.
nonDiv(I,N):- R is N mod I, R=\=0, J is I+1, nonDiv(J,N).

premier(1).
premier(2).
premier(3).
premier(5).
premier(7).
premier(11).
premier(N):-nonDiv(2,N).

hanoi(1,I,_,K):-write('déplacer le disque de la pile '),write(I),write(' à la pile '),write(K),nl.
hanoi(N,I,J,K):-(N>1),(I>0),(J>0),(K>0),(I+J+K)=:=6,(N1 is N-1),hanoi(N1,I,K,J),hanoi(1,I,J,K),hanoi(N1,J,I,K).




























