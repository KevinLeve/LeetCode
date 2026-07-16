-spec gcd_sum(Nums :: [integer()]) -> integer().
gcd_sum(Nums) ->
    Prefix = build(Nums, 0, []),
    Sorted = lists:sort(Prefix),
    Arr = array:from_list(Sorted),
    pair(Arr, 0, array:size(Arr) - 1, 0).

build([], _, Acc) ->
    lists:reverse(Acc);
build([X | T], Mx, Acc) ->
    NewMx = erlang:max(Mx, X),
    build(T, NewMx, [gcd(X, NewMx) | Acc]).

gcd(A, 0) ->
    A;
gcd(A, B) ->
    gcd(B, A rem B).

pair(_, L, R, Ans) when L >= R ->
    Ans;
pair(Arr, L, R, Ans) ->
    Left = array:get(L, Arr),
    Right = array:get(R, Arr),
    pair(Arr, L + 1, R - 1, Ans + gcd(Left, Right)).