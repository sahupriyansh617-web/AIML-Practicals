% Practical 11: Map Coloring using CSP and Backtracking

% Available colors
color(red).
color(green).
color(blue).

% Adjacent regions must have different colors
different(A, B) :-
    color(A),
    color(B),
    A \= B.

% Map coloring solution
map_coloring(WA, NT, SA, Q, NSW, V) :-
    color(WA),
    color(NT),
    color(SA),
    color(Q),
    color(NSW),
    color(V),

    different(WA, NT),
    different(WA, SA),
    different(NT, SA),
    different(NT, Q),
    different(SA, Q),
    different(SA, NSW),
    different(SA, V),
    different(Q, NSW),
    different(NSW, V).
    