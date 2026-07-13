sequential_digits(Low, High) ->
    MaxLength = count_digits(High),
    
    Lengths = lists:seq(2, MaxLength),
    AllValues = lists:flatmap(fun read_length/1, Lengths),
    
    lists:filter(fun(Value) -> (Value >= Low) and (Value =< High) end, AllValues).

read_length(Length) ->
    Input = "123456789",
    MaxStartIndex = 9 - Length,
    
    case MaxStartIndex >= 0 of
        true ->
            [ list_to_integer(string:slice(Input, I, Length)) 
              || I <- lists:seq(0, MaxStartIndex) ];
        false ->
            []
    end.

count_digits(0) -> 1;
count_digits(Num) -> floor(math:log10(Num)) + 1.
