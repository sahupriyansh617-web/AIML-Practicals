% Practical 8: A* Search Algorithm

% Graph connections with costs
edge(a, b, 1).
edge(a, c, 4).
edge(b, d, 2).
edge(b, e, 5).
edge(c, f, 2).
edge(d, g, 3).
edge(e, g, 1).
edge(f, g, 3).

% Heuristic values
heuristic(a, 6).
heuristic(b, 5).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 1).
heuristic(f, 2).
heuristic(g, 0).

% A* Search
a_star(Start, Goal, Path, Cost) :-
    a_star_search([[0, Start, [Start]]], Goal, ReversePath, Cost),
    reverse(ReversePath, Path).

a_star_search([[Cost, Goal, Path]|_], Goal, Path, Cost).

a_star_search([[G, Current, Path]|Queue], Goal, FinalPath, Cost) :-
    findall(
        [F, Next, [Next|Path]],
        (
            edge(Current, Next, StepCost),
            \+ member(Next, Path),
            NewG is G + StepCost,
            heuristic(Next, H),
            F is NewG + H
        ),
        NewPaths
    ),
    append(Queue, NewPaths, UpdatedQueue),
    sort(UpdatedQueue, SortedQueue),
    a_star_search(SortedQueue, Goal, FinalPath, Cost).

