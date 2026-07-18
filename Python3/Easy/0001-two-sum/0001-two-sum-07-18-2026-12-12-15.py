class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        mp = {}

        for i, num in enumerate(nums):
            need = target - num
            if need in mp:
                return [mp[need], i]
            mp[num] = i