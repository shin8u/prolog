parent("Alexandr","Olya").
parent("Masha","Olya").
parent("Alexandr","Alina").
parent("Masha","Alina").
parent("Alexandr","Leha").
parent("Masha","Leha").
parent("Leha","Gleb").
parent("Dasha","Gleb").
parent("Alina","Maks").
parent("Leha","Maks").
man("Alexandr").
man("Leha").
man("Pavel").
man("Dima").
woman("Olya").
woman("Alina").
woman("Masha").

%11.11
father(X,Y):- parents(X,Y),man(x).
father(X):- parents(Y,X),man(Y),write(Y).
%11.12
sister(X,Y):- parents(Z,X),parents(Z,Y),woman(X).
sister(X):- sister(Y,X),woman(Y),write(Y),nl.
%11.13
grand_ma(X,Y):- parents(X,Z),parents(Z,Y),woman(X).
grand_ma(X):- grand_ma(Y,X),write(Y),nl.
%11.14
grand_ma_and_son(X,Y):-
parents(X,Z),parents(Z,Y),woman(X),man(Y)|
parents(Y,Z),parents(Z,X),man(X),woman(Y).
%11.15
pUp(X,X):- X<10,!.
pUp(X,P):-
X1 is X div 10,
pUp(X1,P1),
P is P1*(X mod 10).
%11.16
pDown(X,Y):- pDown(X,Y,X,1),!.
pDown(K,Y,X1,Y1):- 
	X1>0,
	!,
	Z is Y1*(X1 mod 10),
	X2 is X1 div 10,
	pDown(K,Y,X2,Z).
pDown(_,X,_,Y):- X is Y.
