-spec smallest_palindrome(S :: unicode:unicode_binary()) ->
    unicode:unicode_binary().

smallest_palindrome(S) ->
    Counts =
        lists:foldl(
          fun(C, M) ->
              maps:update_with(C, fun(V) -> V + 1 end, 1, M)
          end,
          #{},
          binary_to_list(S)
        ),

    {Left, Mid} =
        lists:foldl(
          fun(C, {L, M}) ->
              F = maps:get(C, Counts, 0),
              {
                  L ++ lists:duplicate(F div 2, C),
                  case F rem 2 of
                      1 -> [C];
                      _ -> M
                  end
              }
          end,
          {[], []},
          lists:seq($a, $z)
        ),

    list_to_binary(Left ++ Mid ++ lists:reverse(Left)).