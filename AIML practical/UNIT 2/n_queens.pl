% Practical 12: N-Queens using Backtracking

% Solve the N-Queens problem
n_queens(N, Solution) :-
    numlist(1, N, Rows),
    place_queens(Rows, [], Solution).

% Place queens one by one
place_queens([], _, []).

place_queens([Row|Rows], Previous, [Column|Solution]) :-
    place_queens(Rows, [Column|Previous], Solution),
    between(1, 4, Column),
    safe(Column, Previous, 1).

% Check whether a queen is safe
safe(_, [], _).

safe(Column, [PreviousColumn|Rest], Distance) :-
    Column =\= PreviousColumn,
    abs(Column - PreviousColumn) =\= Distance,
    NextDistance is Distance + 1,
    safe(Column, Rest, NextDistance).