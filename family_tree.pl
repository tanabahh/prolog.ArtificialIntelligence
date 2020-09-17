parent('Герман', 'Лидия').
parent('Надежда', 'Лидия').
parent('Герман', 'Елена').
parent('Надежда', 'Елена').
parent('Елена', 'Дарья').
parent('Марат', 'Дарья').
parent('Дарья', 'Лиам').
parent('Асий', 'Лиам').
parent('Дарья', 'Илай').
parent('Асий', 'Илай').
parent('Лидия', 'Анна').
parent('Анастас', 'Анна').
parent('Евгений', 'Таисия').
parent('Анна', 'Таисия').
parent('Евгений', 'Трофим').
parent('Анна', 'Трофим').
parent('Евгений', 'Федор').
parent('Анна', 'Федор').
parent('Виктор', 'Витя').
parent('Римма', 'Витя').
parent('Витя', 'Евгений').
parent('Лида', 'Евгений').
parent('Витя', 'Ольга').
parent('Лида', 'Ольга').
parent('Ольга', 'Александра').
parent('Владимир', 'Александра').
parent('Ольга', 'Мария').
parent('Владимир', 'Мария').
parent('Ольга', 'Ульяна').
parent('Владимир', 'Ульяна').

man('Герман').
man('Марат').
man('Анастас').
man('Асий').
man('Илай').
man('Евгений').
man('Трофим').
man('Федор').
man('Владимир').
man('Виктор').
man('Витя').
woman('Римма').
woman('Лиам').
woman('Лида').
woman('Лидия').
woman('Александра').
woman('Мария').
woman('Ульяна').
woman('Ольга').
woman('Анна').
woman('Таисии').
woman('Елена').
woman('Надежда').
woman('Дарья').

child(X, Y) :- parent(Y, X).
mother(X, Y) :- woman(X), parent(X, Y).
father(X, Y) :- man(X), parent(X, Y).
son(X, Y) :- man(X), parent(Y, X).
daughter(X, Y) :- woman(X), parent(Y, X).
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).
grandmother(X, Y) :- mother(X, Z), parent(Z, Y).
grandfather(X, Y) :- father(X, Z), parent(Z, Y).
greatgrandparent(X, Y) :- parent(X, Z), grandparent(Z, Y).
greatgrandmother(X, Y) :- mother(X, Z), grandparent(Z, Y).
greatgrandfather(X, Y) :- father(X, Z), grandparent(Z, Y).
siblings(X, Y) :- mothre(Z, X), mother(Z, Y), X \= Y.
sinlings(X, Y) :- siblings(Y, X).
sister(X, Y) :- woman(X), mother(Z, X), mother(Z, Y), X\=Y.
brother(X, Y) :- man(X), mother(Z, X), mother(Z, Y), X\=Y.
uncle(X, Y) :- parent(Z, Y), brother(X, Z).
aunt(X, Y) :- parent(Z, Y), sister(X, Z).
nephew(X, Y) :- (uncle(Y, X); aunt(Y, X)), man(X).
niece(X, Y) :- (uncle(Y, X); aunt(Y, X)), woman(X).



?- writeln('Родители'),
parent(A, 'Таисия'),
writeln(A),
fail;
true.
?- writeln('Мама'),
mother(A, 'Таисия'),
writeln(A),
fail;
true.
?- writeln('Папа'),
father(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Бабушки и дедушки'),
grandparent(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Бабушки'),
grandmother(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Дедушки'),
grandfather(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Прабабушки и прадедушки'),
greatgrandparent(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Прабабушки'),
greatgrandmother(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Прадедушки'),
greatgrandfather(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Братья'),
brother(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Дяди'),
uncle(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Тети'),
aunt(A, 'Таисия'),
writeln(A),
fail;
true.

?- writeln('Дети Анны и Евгения'),
child(A, 'Анна'),
writeln(A),
fail;
true.