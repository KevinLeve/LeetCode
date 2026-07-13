defmodule Solution do
  @doc """
  Finds all sequential digits between low and high boundaries.
  """
  @spec sequential_digits(low :: integer(), high :: integer()) :: [integer()]
  def sequential_digits(low, high) do
    # Calculate digit count mathematically instead of using a while loop
    max_length = count_digits(high)

    # Replaces the outer loops using ranges and flat_map
    2..max_length
    |> Enum.flat_map(&read_length/1)
    |> Enum.filter(fn value -> value >= low and value <= high end)
  end

  # Helper to parse sliding window slices from the digits string
  defp read_length(length) do
    input = "123456789"
    max_start_index = 9 - length

    if max_start_index >= 0 do
      0..max_start_index
      |> Enum.map(fn i ->
        input
        |> String.slice(i, length)
        |> String.to_integer()
      end)
    else
      []
    end
  end

  # Mathematical alternative to your 'while (limit != 0)' digit counter
  defp count_digits(0), do: 1
  defp count_digits(num), do: floor(:math.log10(num)) + 1
end
