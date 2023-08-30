hanoi(1, Source, Target, _) :-
    write('Move disk from '), write(Source),
    write(' to '), write(Target), nl.

hanoi(N, Source, Target, Temp) :-
    N > 1,
    N1 is N - 1,
    hanoi(N1, Source, Temp, Target),
    hanoi(1, Source, Target, _),
    hanoi(N1, Temp, Target, Source).

tower_of_hanoi(Disks) :-
    hanoi(Disks, 'A', 'C', 'B').
