defmodule Solution do
  @spec maximum_product(nums :: [integer]) :: integer
  def maximum_product(nums) do
    nums = Enum.sort(nums)
    n = length(nums)

    max(
      Enum.at(nums, n - 1) * Enum.at(nums, n - 2) * Enum.at(nums, n - 3),
      Enum.at(nums, 0) * Enum.at(nums, 1) * Enum.at(nums, n - 1)
    )
  end
end