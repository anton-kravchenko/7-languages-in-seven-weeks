-module(erl_2_hw).

-export([get_value_by_key/2]).

-export([calc_total_price/1]).

% erl_2_hw:get_value_by_key([{erlang, "a functional language"}, {ruby, "an OO language"}], erlang).
get_value_by_key(Pairs, Key) ->
    case lists:keysearch(Key, 1, Pairs) of
      {_, {_, Val}} -> Val;
      _ -> "Value not found"
    end.

% erl_2_hw:calc_total_price([{itemA, 3, 10}, {itemB, 5, 6}]).
calc_total_price(Cart) ->
    [{Item, Quantity * Price}
     || {Item, Quantity, Price} <- Cart].
