defmodule Solution do
  @spec smallest_palindrome(s :: String.t()) :: String.t()
  def smallest_palindrome(s) do
    cnt =
      Enum.reduce(String.to_charlist(s), %{}, fn c, acc ->
        Map.update(acc, c, 1, &(&1 + 1))
      end)

    {left, mid} =
      Enum.reduce(?a..?z, {"", ""}, fn c, {l, m} ->
        f = Map.get(cnt, c, 0)

        {
          l <> String.duplicate(<<c>>, div(f, 2)),
          if(rem(f, 2) == 1, do: <<c>>, else: m)
        }
      end)

    left <> mid <> String.reverse(left)
  end
end