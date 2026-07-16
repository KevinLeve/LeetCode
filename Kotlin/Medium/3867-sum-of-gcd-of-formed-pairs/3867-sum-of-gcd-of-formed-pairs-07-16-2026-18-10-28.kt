class Solution {
    fun gcd(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val t = x % y
            x = y
            y = t
        }
        return x
    }

    fun gcdSum(nums: IntArray): Long {
        val prefix = mutableListOf<Int>()
        var mx = 0

        for (x in nums) {
            mx = maxOf(mx, x)
            prefix.add(gcd(x, mx))
        }

        prefix.sort()

        var ans = 0L
        var l = 0
        var r = prefix.size - 1

        while (l < r) {
            ans += gcd(prefix[l], prefix[r]).toLong()
            l++
            r--
        }

        return ans
    }
}