action(go_floor).
action(push_box).
action(climb_box).
action(grab_banana).

at(monkey, floor).
at(box, floor).
at(banana, ceiling).
on(box, floor).

legal(go_floor) :- at(monkey, ceiling), on(box, ceiling).
legal(push_box) :- at(monkey, floor), at(box, floor).
legal(climb_box) :- at(monkey, floor), at(box, floor).
legal(grab_banana) :- at(monkey, ceiling), at(banana, ceiling), on(box, ceiling).

result(go_floor, State, [at(monkey, floor) | State]).
result(push_box, State, [at(monkey, floor), on(box, floor) | State]).
result(climb_box, State, [at(monkey, ceiling), on(box, floor) | State]).
result(grab_banana, State, [has(banana) | State]).

goal([has(banana) | _]).

solve(State, []) :- goal(State).
solve(State, [Action | Actions]) :-
    legal(Action),
    result(Action, State, NewState),
    solve(NewState, Actions).

start(Solution) :-
    solve([at(monkey, ceiling), at(box, floor), at(banana, ceiling), on(box, floor)], Solution).
