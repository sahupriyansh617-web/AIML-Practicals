% Practical 1: Student-Course Knowledge Base

% Facts
student(priyansh).
student(rahul).
student(amit).

course(python).
course(aiml).
course(java).

% Enrollment facts
enrolled(priyansh, aiml).
enrolled(rahul, python).
enrolled(amit, java).
enrolled(priyansh, python).

% Rules
studies(Student, Course) :-
    enrolled(Student, Course).

% Goals / Queries
