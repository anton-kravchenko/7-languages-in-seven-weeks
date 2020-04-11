% Recursive rules
father(zeb, john_boy_sr).
    father(john_boy_sr, john_boy_jr).

ancestor(X, Y) :-
    father(X, Y).

ancestor(X, Y) :-
    father(X, Z),
    ancestor(Z, Y).

% Lists and Tuples
% unification with lists
% (1, 2, 3)=(1, 2, 3). % true
% (A, B, 3) = (1,2,3). % A = 1, B = 2
% (A, 2, C) = (1, B, 3). % A = 1, B = 2, C = 3
% [A, 2, C] = [1, B, 3]. % same as with lists but tuple

% Head|Tail
% [1,2,3] = [Head|Tail].
% [1,2,3] = [A|[Head|Tail]]. % A = 1, Head = 2, Tail = [3].
% Grab the third element (like pattern marching)
% [1,2,3] = [_, _|[Head|_]]. % Head = 3.


% Lists and Math
count(0, []).
count(Count, [_|Tail]) :-
    count(TailCount, Tail),
    Count is TailCount+1.

sum(0, []).
sum(Total, [Head|Tail]) :-
    sum(Sum, Tail),
    Total is Head+Sum.

average(Average, List) :-
    sum(Sum, List),
    count(Count, List),
    Average is Sum/Count.

% Query
% count(TheCount, [0,1,2]). % TheCount = 3.
% sum(TheSum, [1,2,3]). % TheSum = 6.
% average(TheAverage, [1,2,3,4,5]). % TheAverage = 3.

% append
% append([one], [two], [one, two]). % true
% append([one], [two], TheList). % TheList = [one, two].
% list substruction via append
% append([one], What, [one, two, three]). % What = [two, three].

% append implementation
concatenate([], List, List).
% concatenate([Head], List, [Head|List]).
% concatenate([Head, Head1], List, [Head, Head1|List]).
% concatenate([Head, Head1, Head2], List, [Head, Head1, Head2|List]).
% OR
concatenate([Head|Tail1], List, [Head|Tail2]) :-
    concatenate(Tail1, List, Tail2).