last_one([Last], Last).
last_one([_|Tail], Last) :-
    last_one(Tail, Last).


reverse_list([Head], [Head]).
reverse_list([Head|Tail1], [Tail2, Head]) :-
    reverse_list(Tail1, Tail2).

rev(List, Reversed) :-
    reverse_list(List, [], Reversed).

reverse_list([], List, List).
reverse_list([X|Tail], List1, List2) :-
    reverse_list(Tail, [X|List1], List2).