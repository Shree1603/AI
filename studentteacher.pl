teaches(teacher1, math).
teaches(teacher2, physics).
teaches(teacher3, chemistry).
student_subjects(john, [math, physics]).
student_subjects(susan, [chemistry]).
student_subjects(michael, [math, chemistry]).
student_subjects(emily, [physics, chemistry]).
teacher_for_subject(Subject, Teacher) :-
    teaches(Teacher, Subject).
subjects_taught_by_teacher(Teacher, Subject) :-
    teaches(Teacher, Subject).
common_subjects(Student1, Student2, CommonSubjects) :-
    student_subjects(Student1, Subjects1),
    student_subjects(Student2, Subjects2),
    intersection(Subjects1, Subjects2, CommonSubjects).
intersection([], _, []).
intersection([X|Rest], List2, [X|IntersectionRest]) :-
    member(X, List2),
    intersection(Rest, List2, IntersectionRest).
intersection([X|Rest], List2, Intersection) :-
    \+ member(X, List2),
    intersection(Rest, List2, Intersection).
