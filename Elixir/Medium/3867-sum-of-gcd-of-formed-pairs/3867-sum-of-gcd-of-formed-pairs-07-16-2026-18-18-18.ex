defmodule Solution do
  @spec gcd_sum(nums :: [integer]) :: integer
  def gcd_sum(nums) do
    {prefix, _} =
      Enum.map_reduce(nums, 0, fn x, mx ->
        mx = max(mx, x)
        {gcd(x, mx), mx}
      end)

    arr = prefix |> Enum.sort() |> List.to_tuple()
    n = tuple_size(arr)

    pair(arr, 0, n - 1, 0)
  end

  defp pair(_, l, r, ans) when l >= r, do: ans

  defp pair(arr, l, r, ans) do
    pair(
      arr,
      l + 1,
      r - 1,
      ans + gcd(elem(arr, l), elem(arr, r))
    )
  end

  defp gcd(a, 0), do: a
  defp gcd(a, b), do: gcd(b, rem(a, b))
end