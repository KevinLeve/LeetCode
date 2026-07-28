class Solution(object):
    def smallestPalindrome(self, s):
        cnt = [0] * 26

        for c in s:
            cnt[ord(c) - ord('a')] += 1

        left = []
        mid = ""

        for i in xrange(26):
            left.extend(chr(i + ord('a')) * (cnt[i] // 2))
            if cnt[i] % 2:
                mid = chr(i + ord('a'))

        left = "".join(left)
        return left + mid + left[::-1]