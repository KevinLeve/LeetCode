-spec maximum_product(Nums :: [integer()]) -> integer().
maximum_product(Nums) ->
    Sorted = lists:sort(Nums),
    N = length(Sorted),

    A = lists:nth(N, Sorted) *
        lists:nth(N - 1, Sorted) *
        lists:nth(N - 2, Sorted),

    B = lists:nth(1, Sorted) *
        lists:nth(2, Sorted) *
        lists:nth(N, Sorted),

    erlang:max(A, B).