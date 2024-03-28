man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.

mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.

%Инициализирован предикат brother(X,Y), который проверяет, является ли X братом Y.
brother(X,Y):-man(X), parent(Z,X), parent(Z,Y), man(Z).
%Инициализирован предикат brothers(X), который выводит всех братьев X.
brothers(X) :- brother(Y,X),print(Y), nl, fail.

%Инициализирован предикат b_s(X,Y), который проверяет, являются ли X и Y родными братом и сестрой или братьями или сестрами.
b_s(X,Y) :- parent(Z,X), parent(Z,Y), man(Z), X \= Y.
%Инициализирован предикат b_s(X), который выводит всех братьев или сестер X.
b_s(X):- b_s(Y,X),parent(Z,Y),parent(Z,X),man(Z),print(Y), nl, fail.

%Инициализирован предикат father(X, Y), который проверяет, является ли X отцом Y.
father(X,Y):-man(X), parent(X,Y).
%Инициализирован предикат father(X), который выводит отца X.
father(X):-father(Y,X),print(Y),nl,fail.

%Инициализирован предикат sister(X, Y), который проверяет, является ли X сестрой Y.
sister(X,Y):-woman(X),parent(Z,X),parent(Z,Y),man(Z), X \= Y.
%Инициализирован предикат sisters(X), который выводит всех сестер X.
sisters(X):-sister(Y,X),print(Y),nl,fail.

%Инициализирован предикат grand_so(X, Y), который проверяет, является ли X внуком Y.
grand_so(X,Y):-parent(Y,Z),parent(Z,X),man(X).
%Инициализирован предикат grand_sons(X), который выводит всех внуков X.
grand_sons(X):-grand_so(Y,X),print(Y),nl,fail.

%Инициализирован предикат grand_pa_and_son(X,Y), который проверяет, являются ли X и Y дедушкой и внуком
grand_pa_and_son(X,Y):-man(X),man(Y),parent(X,Z),parent(Z,Y).
%Инициализирован предикат grand_pa_and_son(X,Y), который проверяет, являются ли X и Y внуком и дедушкой
grand_pa_and_son(X,Y):-man(X),man(Y),parent(Z,X),parent(Y,Z).

%Инициализирован предикат nephew(X,Y), который проверяет, является ли X племянником Y.
nephew(X,Y):-parent(Z,X),(brother(Z,Y);sister(Z,Y)),man(X), \+ parent(Y,X).
%Инициализирован предикат nephew(X), который выводит всех племянников X.
nephew(X):-nephew(Y,X),print(Y),nl,fail.

max(X,Y,Z):-(
     X>=Y -> Z is X;
     Y>X -> Z is Y
    ).

fact(0,1).
fact(N,X):- N>0,
    N1 is N-1, fact(N1,X1), X is N*X1.

fact2(0,X,X).
fact2(N,A,X):- N>0,
    A1 is N*A,
    N1 is N-1,
    fact2(N1,A1,X).

call_fact2(N,X):- fact2(N,1,X).

