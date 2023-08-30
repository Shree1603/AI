fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(strawberry, red).
fruit_color(blueberry, blue).

fruits_of_color(Color, Fruits) :-
    findall(Fruit, fruit_color(Fruit, Color), Fruits).

color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

all_fruits_and_colors(FruitColorList) :-
    findall((Fruit, Color), fruit_color(Fruit, Color), FruitColorList).
