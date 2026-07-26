# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
  nums.sort!

  n = nums.length

  [
    nums[n - 1] * nums[n - 2] * nums[n - 3],
    nums[0] * nums[1] * nums[n - 1]
  ].max
end