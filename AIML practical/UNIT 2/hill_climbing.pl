% Practical 9: Hill Climbing Algorithm

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values (lower value means closer to goal)
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 5).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 1).
heuristic(g, 0).

% Hill Climbing Algorithm
hill_climbing(Start, Goal, Path) :-
    climb(Start, Goal, [Start], ReversePath),
    reverse(ReversePath, Path).

climb(Goal, Goal, Path, Path).

climb(Current, Goal, Visited, Path) :-
    findall(
        H-Next,
        (
            edge(Current, Next),
            \+ member(Next, Visited),
            heuristic(Next, H)
        ),
        Neighbors
    ),
    keysort(Neighbors, [H-Next|_]),
    heuristic(Current, CurrentH),
    H < CurrentH,
    climb(Next, Goal, [Next|Visited], Path).
    