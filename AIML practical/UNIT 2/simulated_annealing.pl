% Practical 10: Simulated Annealing

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values (lower is better)
heuristic(a, 6).
heuristic(b, 4).
heuristic(c, 5).
heuristic(d, 2).
heuristic(e, 3).
heuristic(f, 1).
heuristic(g, 0).

% Simulated Annealing
simulated_annealing(Start, Goal, Path) :-
    anneal(Start, Goal, [Start], ReversePath),
    reverse(ReversePath, Path).

anneal(Goal, Goal, Path, Path).

anneal(Current, Goal, Visited, Path) :-
    findall(
        H-Next,
        (
            edge(Current, Next),
            \+ member(Next, Visited),
            heuristic(Next, H)
        ),
        Neighbors
    ),
    Neighbors \= [],
    keysort(Neighbors, [ _-Next | _ ]),
    anneal(Next, Goal, [Next|Visited], Path).
    