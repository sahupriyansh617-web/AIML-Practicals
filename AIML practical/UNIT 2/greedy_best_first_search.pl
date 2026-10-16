% Practical 7: Greedy Best-First Search

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 3).
heuristic(e, 2).
heuristic(f, 1).
heuristic(g, 0).

% Greedy Best-First Search
greedy_search(Start, Goal, Path) :-
    greedy_queue([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

greedy_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

greedy_queue([ [Current|Rest] | Queue], Goal, Path) :-
    findall(
        [Next, Current|Rest],
        (edge(Current, Next), \+ member(Next, [Current|Rest])),
        NewPaths
    ),
    append(Queue, NewPaths, UpdatedQueue),
    sort_paths(UpdatedQueue, SortedQueue),
    greedy_queue(SortedQueue, Goal, Path).

sort_paths(Paths, SortedPaths) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, SortedPaths).

path_heuristic([Node|_], H) :-
    heuristic(Node, H).
    