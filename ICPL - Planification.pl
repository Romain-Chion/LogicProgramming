porte(bureau,chambre).
porte(bureau,sejour).
porte(bureau,cuisine).
porte(chambre,sejour).
porte(chambre,salle_de_bains).
porte(sejour,cuisine).
porte(sejour,chambre_amis).
porte(chambre_amis,salle_de_bains).

va_vers(X,X,_,[X]).
va_vers(X,Y,P_V,[X|D]):-porte(X,Z),not(dans(Z,P_V)),va_vers(Z,Y,[Z|P_V],D).
va_vers(X,Y,P_V,[X|D]):-porte(Z,X),not(dans(Z,P_V)),va_vers(Z,Y,[Z|P_V],D).

ligne(1,[la_Défense,esplanade_de_La_Défense,pont_de_Neuilly,les_Sablons,porte_Maillot,argentine,charles_de_Gaulle-etoile,george_V,franklin_D_Roosevelt,champs-elysées-clemenceau,concorde,tuileries,palais_Royal-musée_du_Louvre,louvre-rivoli,châtelet,hôtel_de_Ville,saint-paul,bastille,gare_de_Lyon,reuilly-diderot,nation,porte_de_Vincennes,saint-mandé,bérault,château_de_Vincennes]).
ligne(2,[porte_Dauphine,victor_Hugo,charles_de_Gaulle-etoile,ternes,courcelles,monceau,villiers,rome,place_de_Clichy,blanche,pigalle,anvers,barbès-rochechouart,la_Chapelle,jaurès,colonel_Fabien,belleville,couronnes,ménilmontant,père_Lachaise,philippe_Auguste,lexandre_Dumas,avron,nation]).
ligne(3,[pont_de_Levallois-bécon,anatole_France,louise_Michel,porte_de_Champerret,pereire,wagram,malesherbes,villiers,europe,saint-lazare,havre-caumartin,opéra,quatre-septembre,bourse,sentier,réaumur-sébastopol,arts_et_Métiers,temple,république,parmentier,rue_Saint-maur,père_Lachaise,gambetta,porte_de_Bagnolet,gallieni]).
ligne(3-bis,[gambetta,pelleport,saint-fargeau,porte_des_Lilas]).
ligne(4,[porte_de_Clignancourt,simplon,marcadet-poissonniers,château_Rouge,barbès-rochechouart,gare_du_Nord,gare_de_lEst,château_dEau,strasbourg-saint-denis,réaumur-sébastopol,etinne_Marcel,les_Halles,châtelet,cité,saint-michel,odéon,saint-germain-des-prés,saint-sulpice,saint-placide,montparnasse-bienvenue,vavin,raspail,denfert-rochereau,mouton-duvernet,alésia,porte_dOrléans]).
ligne(5,[]).
ligne(6,[]).
ligne(7,[]).
ligne(8,[]).
ligne(9,[]).
ligne(10,[]).
ligne(11,[]).
ligne(12,[]).
ligne(13,[]).
ligne(14,[]).
ligne(a,[]).
ligne(b,[]).
ligne(c,[]).
ligne(d,[]).
ligne(e,[]).

dans(X,[X|_]). /*L doit être instanciée*/
dans(X,[_|R]):-dans(X,R).

nieme(T,1,[T|_]). /*L doit être instanciée*/
nieme(X,N,[_|R]):-nieme(X,N1,R),N is N1+1.

/*Départ Station Arrivée LignesVues NuméroLigne Chemin Ligne*/
chercher(D,A,LV,[[D,NL,A]],DL2):-suivreligne(D,A,NL,DL2),not(dans(NL,LV)).
chercher(D,A,LV,[[D,NL,S]|R],DL):-suivreligne(D,S,NL,DL2),not(dans(NL,LV)),chercher(S,A,[NL|LV],R,DL1), DL is DL1+DL2.

/*Distance*/
suivreligne(S1,S2,NL,D):-ligne(NL,S),
	nieme(S1,N1,S),nieme(S2,N2,S),
	D is abs(N2-N1).











