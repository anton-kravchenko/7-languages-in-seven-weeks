% facts
front_end(java_script).
front_end(type_script).
front_end(flow).
front_end(elm).

back_end(java).
back_end(python).
back_end(ruby).
back_end(clojure).
back_end(java_script).

% rule
full_stack(X, Y) :-
    front_end(X),
    back_end(Y).

% query
% full_stack(java_script, java). % true