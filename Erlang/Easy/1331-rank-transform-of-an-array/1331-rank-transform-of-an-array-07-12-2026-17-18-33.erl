-spec array_rank_transform(Arr :: [integer()]) -> [integer()].
array_rank_transform(Arr) ->
    Sorted = lists:usort(Arr),
    Map = rank_hash(Sorted, 1, #{}),
    [maps:get(A, Map) || A <- Arr].

rank_hash([A | Sorted], I, Map) ->
    rank_hash(Sorted, I+1, Map#{A => maps:get(A, Map, I)});
rank_hash([], I, Map) -> Map.