-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    solve(Nums, Target, #{}, 0).

solve([], _, _, _) ->
    [];
solve([Num | Rest], Target, Map, Index) ->
    Need = Target - Num,
    case maps:find(Need, Map) of
        {ok, J} ->
            [J, Index];
        error ->
            solve(Rest, Target, maps:put(Num, Index, Map), Index + 1)
    end.