last_one([Last], Last).
last_one([_|Tail], Last) :-
    last_one(Tail, Last).


count([], 0).
count([_|Tail], TotalCount) :-
    count(Tail, Count),
    TotalCount is Count+1.

sum([], 0).
sum([H|T], TotalSum) :-
    sum(T, Sum),
    TotalSum is Sum+H.

average(List, Average) :-
    count(List, Count),
    sum(List, Sum),
    Average is Sum/Count.


concatenate([], List, List).
concatenate([H|Tail], List, [H|Tail1]) :-
    concatenate(Tail, List, Tail1).


fact(0, 1).
fact(N, R) :-
    N>0,
    N1 is N-1,
    fact(N1, R1),
    R is R1*N.

fib(0, 0).
fib(1, 1).
fib(N, R) :-
    N1 is N-1,
    N2 is N-2,
    fib(N1, R1),
    fib(N2, R2),
    R is R1+R2.

reverse_list(List, Reversed) :-
    rev_list(List, [], Reversed).

rev_list([], List, List).
rev_list([Head|Tail], List, List1) :-
    rev_list(Tail, [Head|List], List1).
