food(carrot, low_calories, low_sugar, low_sodium).
food(apple, low_calories, low_sugar, low_sodium).
food(banana, moderate_calories, high_sugar, low_sodium).
food(spinach, low_calories, low_sugar, low_sodium).
food(fish, low_calories, low_sugar, low_sodium).
food(chicken, low_calories, low_sugar, low_sodium).
food(sweets, high_calories, high_sugar, low_sodium).
food(potato_chips, high_calories, low_sugar, high_sodium).

suggested_diet(diabetes, Diet) :-
    findall(Food, (food(Food, _, Sugar, _), Sugar = low_sugar), Diet).

suggested_diet(hypertension, Diet) :-
    findall(Food, (food(Food, _, _, Sodium), Sodium = low_sodium), Diet).
