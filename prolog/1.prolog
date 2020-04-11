% facts
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

% rule
friend(X, Y) :-
    \+ X=Y,
    likes(X, Z),
    likes(Y, Z).

% \+ is a logical negation
% \+(X = Y) means that X != Y
% in english friend is true if "X != Y" and "X likes Z" and "Y likes Z"
food_type(velveeta, cheese).
food_type(ritz, cracker).
food_type(spam, meat).
food_type(sausage, meat).
food_type(jolt, soda).
food_type(tweekie, desert).

flavor(sweet, desert).
flavor(savory, meat).
flavor(savory, cheese).
flavor(sweet, soda).

food_flavor(X, Y) :-
    food_type(X, Z),
    flavor(Y, Z).


% facts
different(red, green). different(red, blue).
different(green, red). different(green, blue).
different(blue, red). different(blue, green).

% rule
coloring(Alabama, Mississippi, Georgia, Tennessee, Florida) :-
    different(Mississippi, Tennessee),
    different(Mississippi, Alabama),
    different(Alabama, Tennessee),
    different(Alabama, Mississippi),
    different(Alabama, Georgia),
    different(Alabama, Florida),
    different(Georgia, Florida),
    different(Georgia, Tennessee).

% query
% coloring(Alabama, Mississippi, Georgia, Tennessee, Florida).

% facts
cat(lion).
cat(tiger).

% rules (rule is the list of goals)
dorothy(X, Y, Z) :-
    X=lion,
    Y=tiger,
    Z=bear.
twin_cats(X, Y) :-
    cat(X),
    cat(Y).

% query (unification - Prolog finds values to match both sides)
% dorothy(lion, tiger, bear). % example of unification
% dorothy(One, Two, Three). % gives: One = lion, Two = tiger, Three = bear.
% dorothy(lion, tiger, What_should_be_here). % gives What_should_be_here = bear.
