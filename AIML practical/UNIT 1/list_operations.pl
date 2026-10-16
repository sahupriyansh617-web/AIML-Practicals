% Practical 3: List Operations

% Append two lists
append_lists([], L, L).

append_lists([H|T], L, [H|R]) :-
    append_lists(T, L, R).

% Reverse a list
reverse_list([], []).

reverse_list([H|T], R) :-
    reverse_list(T, RT),
    append_lists(RT, [H], R).

% Search an element in a list
member_element(X, [X|_]).

member_element(X, [_|T]) :-
    member_element(X, T).

% Find the length of a list
list_length([], 0).

list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.
    