class Solution:
    def minOperations(self, nums: List[int], numsDivide: List[int]) -> int:

        def gcd(a, b):
            while b:
                a, b = b, a % b
            return a

        g = numsDivide[0]

        for x in numsDivide[1:]:
            g = gcd(g, x)

        nums.sort()

        for i in range(len(nums)):
            if g % nums[i] == 0:
                return i

        return -1