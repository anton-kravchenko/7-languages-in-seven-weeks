-module(erl_2).

-export([pattern_match/0]).

-export([if_statement/0]).

-export([negate/0]).

-export([print_list/1]).

-export([add_one/1]).

-export([filter_positive/1]).

-export([take_till_positive/1]).

-export([drop_till_positive/1]).

-export([sum/1]).

-export([double/1]).

-export([double_1/1]).

-export([calc_taxes/0]).

pattern_match() ->
    Animal = "dog",
    case Animal of
      "dog" -> underdog;
      "cat" -> thundercat;
      _ -> something_else
    end.

if_statement() ->
    X = 0,
    % if - is a function so it must return a value
    if X > 0 -> positive;
       X < 0 -> negative;
       true -> 0
    end.

negate() -> Negate = fun (I) -> -I end, Negate.

% ~p - "pretty print"
print_list(Nums) ->
    Print = fun (Num) -> io:format("~p~n", [Num]) end,
    lists:map(Print, Nums).

% map(F, [H|T]) -> [F(H) | map(F, T)];
% map(F, []) -> [].
add_one(Nums) ->
    Plus_one = fun (Num) -> 1 + Num end,
    lists:map(Plus_one, Nums).

filter_positive(Nums) ->
    Positive = fun (Num) -> Num > 0 end,
    lists:filter(Positive, Nums).

take_till_positive(Nums) ->
    Positive = fun (Num) -> Num > 0 end,
    lists:takewhile(Positive, Nums).

drop_till_positive(Nums) ->
    Positive = fun (Num) -> Num > 0 end,
    lists:dropwhile(Positive, Nums).

sum(Nums) ->
    lists:foldl(fun (N, Acc) -> N + Acc end, 0, Nums).

double([]) -> [];
double([Head | Tail]) -> [Head * 2 | double(Tail)].

double_1(Nums) ->
    Double = fun (N) -> N * 2 end, [Double(N) || N <- Nums].

% map(F, L) -> [F(X) || X <- L].

calc_taxes() ->
    Cart = [{pencil, 4, 2.2}, {pen, 1, 1.1}, {paper, 2, 2}],
    WithoutQuantity = [{Product, Price}
		       || {Product, _, Price} <- Cart],
    WithTax = [{Product, Price, Price * 8.0e-2}
	       || {Product, Price} <- WithoutQuantity],
    WithTax.

% Generators
% [{X, Y} || X <- [1, 2, 3, 4], X < 3, X > 1, Y <- [5, 6]]

