dob(gabriel, date(1990, 5, 15)).
dob(dyson, date(1985, 10, 3)).
dob(mike, date(1995, 2, 20)).
dob(jhon, date(2000, 7, 12)).
age(Person, Age) :-
    dob(Person, date(Year, Month, Day)),
    get_date(Year, Month, Day, dob),
    get_date(YearNow, MonthNow, DayNow, _),
    Age is YearNow - Year - ( (MonthNow,DayNow) @< (Month,Day) ).
get_date(Year, Month, Day, date(Year, Month, Day)).
date_compare(date(Year1, Month1, Day1), date(Year2, Month2, Day2)) :-
    (Year1, Month1, Day1) @< (Year2, Month2, Day2).
