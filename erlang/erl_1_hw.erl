-module(erl_1_hw).

-export([count_words/1]).

-export([count_to_ten/0]).

-export([print_status/1]).

count_words(Sentence) ->
    count_elements(string:tokens(Sentence, " ")).

count_elements([]) -> 0;
count_elements([_ | T]) -> 1 + count_elements(T).

count_to_ten() -> count_from_M_to_N(0, 10).

count_from_M_to_N(M, N) ->
    io:fwrite(integer_to_list(M) ++ "~n"),
    if M > N - 1 -> done;
       true -> count_from_M_to_N(M + 1, N)
    end.

print_status({success}) -> io:fwrite("Success" ++ "~n");
print_status({error, Message}) ->
    io:fwrite("Error: " ++ Message ++ "~n").
