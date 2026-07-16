class Solution(object):
    def gcd(self, a, b):
        while b:
            a, b = b, a % b
        return a

    def gcdSum(self, nums):
        prefix = []
        mx = 0

        for x in nums:
            if x > mx:
                mx = x
            prefix.append(self.gcd(x, mx))

        prefix.sort()

        ans = 0
        i = 0
        j = len(prefix) - 1

        while i < j:
            ans += self.gcd(prefix[i], prefix[j])
            i += 1
            j -= 1

        return ans