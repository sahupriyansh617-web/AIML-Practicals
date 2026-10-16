% Practical 6: Breadth-First Search (BFS)

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(d, g).
edge(e, g).
edge(f, g).

% BFS to find shortest path
bfs(Start, Goal, Path) :-
    bfs_queue([[Start]], Goal, ReversePath),
    reverse(ReversePath, Path).

bfs_queue([[Goal|Rest]|_], Goal, [Goal|Rest]).

bfs_queue([[Current|Rest]|Queue], Goal, Path) :-
    findall(
        [Next, Current|Rest],
        (edge(Current, Next), \+ member(Next, [Current|Rest])),
        NewPaths
    ),
    append(Queue, NewPaths, UpdatedQueue),
    bfs_queue(UpdatedQueue, Goal, Path).
    