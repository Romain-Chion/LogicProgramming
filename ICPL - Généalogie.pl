homme(merlin).
homme(lancelot).
homme(galaad).
homme(arthur).
homme(uther).
homme(perceval).
homme(goloet).
homme(elaine).
femme(gwenavea).
femme(morgause).
femme(morgane).
fee(morgane).
femme(ygraine).
epee(excalibur).
parent(lancelot,galaad). /*lancelot est le parent de galaad*/
parent(uther,arthur).
parent(arthur,mordred).
parent(morgause,mordred).
parent(ygraine,morgane).
parent(ygraine,morgause).
parent(ygraine,elaine).
parent(ygraine,arthur).
parent(goloet,morgane).
parent(goloet,morgause).
parent(goloet,elaine).
roi(arthur).
roi(uther).
mari(arthur,gwenavea). /*arthur est le mari de gwenavea*/
chevalier(galaad).
chevalier(perceval).
possession(excalibur,arthur). /*excalibur est la possession d'arthur*/
fils(X,Y):-homme(X),parent(Y,X). /*X est le fils de Y*/
fille(X,Y):-femme(X),parent(Y,X). /*X est la fille de Y*/
pere(X,Y):-homme(X),parent(X,Y). /*X est le pere de Y*/
mere(X,Y):-femme(X),parent(X,Y). /*X est la mere de Y*/
grand_parent(X,Y):-parent(X,P),parent(P,Y). /*X est le grand parent de Y*/
grand_pere(X,Y):-homme(X),grand_parent(X,Y). /*X est le grand pere de Y*/
grand_mere(X,Y):-femme(X),grand_parent(X,Y). /*X est le grand mere de Y*/
enfant(A,X):-parent(X,A). /*A est l'enfant de de X*/
ancetre(A,X):-parent(A,X). /*A est l'ancetre de Y*/
ancetre(A,X):-parent(A,P),ancetre(P,X).
descendant(A,X):-ancetre(X,A). /*A est le descendant de Y*/
frere(A,X):-not(A=X),homme(A),pere(P,A),pere(P,X),mere(M,A),mere(M,X).
soeur(A,X):-not(A=X),femme(A),pere(P,A),pere(P,X),mere(M,A),mere(M,X).
demi_frere(A,X):-not(A=X),homme(A),pere(P,A),pere(P,X),not(frere(A,X)).
demi_frere(A,X):-not(A=X),homme(A),mere(P,A),mere(P,X),not(frere(A,X)).
demi_soeur(A,X):-not(A=X),femme(A),pere(P,A),pere(P,X),not(soeur(A,X)).
demi_soeur(A,X):-not(A=X),femme(A),mere(P,A),mere(P,X),not(soeur(A,X)).
beau_pere(A,X):-mari(A,P),mere(P,X).
belle_mere(A,X):-mari(P,A),pere(P,X).
cousin(X,Y):-homme(X),grand_parent(P,X),grand_parent(P,Y).
cousine(X,Y):-femme(X),grand_parent(P,X),grand_parent(P,Y).
tante(X,Y):-soeur(X,P),parent(P,Y).
oncle(X,Y):-frere(X,P),parent(P,Y).
neveu(X,Y):-homme(X),tante(Y,X).
neveu(X,Y):-homme(X),oncle(Y,X).
niece(X,Y):-femme(X),tante(Y,X).
niece(X,Y):-femme(X),oncle(Y,X).


















