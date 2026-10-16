% Practical 2: Arithmetic Operations, Factorial and Fibonacci

% Arithmetic Operations
add(A, B, Result) :-
    Result is A + B.

subtract(A, B, Result) :-
    Result is A - B.

multiply(A, B, Result) :-
    Result is A * B.

divide(A, B, Result) :-
    B =\= 0,
    Result is A / B.

% Factorial using Recursion
factorial(0, 1).

factorial(N, Result) :-
    N > 0,
    N1 is N - 1,
    factorial(N1, R1),
    Result is N * R1.

% Fibonacci using Recursion
fibonacci(0, 0).

fibonacci(1, 1).

fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, R1),
    fibonacci(N2, R2),
    Result is R1 + R2.