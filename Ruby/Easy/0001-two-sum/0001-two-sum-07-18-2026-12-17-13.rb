# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  map = {}

  nums.each_with_index do |num, i|
    need = target - num

    return [map[need], i] if map.key?(need)

    map[num] = i
  end

  []
end