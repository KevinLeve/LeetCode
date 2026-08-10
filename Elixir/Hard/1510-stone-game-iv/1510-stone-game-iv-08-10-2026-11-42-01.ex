defmodule Solution do
  @spec winner_square_game(n :: integer) :: boolean
  def winner_square_game(n) do
    dp = :array.new(n + 1, default: false)
    dp = :array.set(0, false, dp)

    dp = solve(1, n, dp)

    :array.get(n, dp)
  end

  defp solve(i, n, dp) when i > n do
    dp
  end

  defp solve(i, n, dp) do
    win = can_win?(i, 1, dp)

    dp = :array.set(i, win, dp)

    solve(i + 1, n, dp)
  end

  defp can_win?(i, j, _dp) when j * j > i do
    false
  end

  defp can_win?(i, j, dp) do
    if not :array.get(i - j * j, dp) do
      true
    else
      can_win?(i, j + 1, dp)
    end
  end
end