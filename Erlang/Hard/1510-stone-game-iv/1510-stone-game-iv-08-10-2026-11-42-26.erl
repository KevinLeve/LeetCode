-spec winner_square_game(N :: integer()) -> boolean().
winner_square_game(N) ->
    DP = array:new(N + 1, {default, false}),
    DP1 = array:set(0, false, DP),
    DP2 = solve(1, N, DP1),
    array:get(N, DP2).

solve(I, N, DP) when I > N ->
    DP;
solve(I, N, DP) ->
    Win = can_win(I, 1, DP),
    DP1 = array:set(I, Win, DP),
    solve(I + 1, N, DP1).

can_win(I, J, _DP) when J * J > I ->
    false;
can_win(I, J, DP) ->
    case array:get(I - J * J, DP) of
        false ->
            true;
        true ->
            can_win(I, J + 1, DP)
    end.