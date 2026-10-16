% Practical 5: Student Classification

% Student Marks
marks(priyansh, 92).
marks(rahul, 75).
marks(amit, 45).
marks(neha, 30).
marks(riya, 88).

% Rule: Topper
topper(Student) :-
    marks(Student, Marks),
    Marks >= 85.

% Rule: Average
average(Student) :-
    marks(Student, Marks),
    Marks >= 50,
    Marks < 85.

% Rule: Fail
fail(Student) :-
    marks(Student, Marks),
    Marks < 50.
    