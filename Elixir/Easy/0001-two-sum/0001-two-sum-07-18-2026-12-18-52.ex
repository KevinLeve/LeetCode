defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> solve(target, %{})
  end

  defp solve([], _, _), do: []

  defp solve([{num, idx} | rest], target, map) do
    need = target - num

    case Map.fetch(map, need) do
      {:ok, j} ->
        [j, idx]

      :error ->
        solve(rest, target, Map.put(map, num, idx))
    end
  end
end