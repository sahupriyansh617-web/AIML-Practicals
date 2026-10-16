% Practical 4: College Timetable Database

% Faculty Database
faculty(amit, computer_science).
faculty(priya, mathematics).
faculty(rahul, artificial_intelligence).
faculty(neha, physics).

% Subject Database
subject(data_structures, computer_science).
subject(discrete_mathematics, mathematics).
subject(machine_learning, artificial_intelligence).
subject(physics_lab, physics).

% Classroom Database
classroom(data_structures, room_101).
classroom(discrete_mathematics, room_102).
classroom(machine_learning, room_103).
classroom(physics_lab, lab_201).

% Timetable Database
timetable(monday, data_structures, 9, room_101).
timetable(monday, discrete_mathematics, 10, room_102).
timetable(tuesday, machine_learning, 11, room_103).
timetable(wednesday, physics_lab, 12, lab_201).

% Rules

% Find subjects taught by a faculty member
teaches(Faculty, Subject) :-
    faculty(Faculty, Department),
    subject(Subject, Department).

% Find classroom for a subject
subject_room(Subject, Room) :-
    classroom(Subject, Room).

% Find classes scheduled on a particular day
classes_on_day(Day, Subject, Time, Room) :-
    timetable(Day, Subject, Time, Room).
    