parent(john, mary).
parent(john, david).
parent(mary, lisa).
parent(mary, tom).
parent(david, emily).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

infer_siblings(X, Siblings) :-
    findall(Sib, sibling(X, Sib), Siblings).

infer_grandparents(X, Grandparents) :-
    findall(Gp, grandparent(Gp, X), Grandparents).

start(X) :-
    infer_siblings(X, Siblings),
    infer_grandparents(X, Grandparents),
    write('Siblings of '), write(X), write(': '), write(Siblings), nl,
    write('Grandparents of '), write(X), write(': '), write(Grandparents), nl.
