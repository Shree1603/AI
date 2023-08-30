planet(mercury, rocky, small, no_moons).
planet(venus, rocky, medium, no_moons).
planet(earth, rocky, medium, one_moon).
planet(mars, rocky, small, two_moons).
planet(jupiter, gas_giant, large, many_moons).
planet(saturn, gas_giant, large, many_moons).
planet(uranus, ice_giant, medium, many_moons).
planet(neptune, ice_giant, medium, many_moons).

terrestrial(Planet) :-
    planet(Planet, rocky, _, _).

gas_giant(Planet) :-
    planet(Planet, gas_giant, _, _).

ice_giant(Planet) :-
    planet(Planet, ice_giant, _, _).

has_moons(Planet) :-
    planet(Planet, _, _, Moons),
    Moons \= no_moons.

moon_count(Planet, Count) :-
    planet(Planet, _, _, Moons),
    count_moons(Moons, Count).

count_moons(no_moons, 0).
count_moons(one_moon, 1).
count_moons(two_moons, 2).
count_moons(many_moons, Many) :-
    Many > 2.
