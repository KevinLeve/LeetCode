class Solution {
    fun longestBalanced(s: String): Int {
        var len = 0
        for (i in s.indices) {
            val freq = IntArray(26)
            for (j in i until s.length) {
                freq[s[j] - 'a']++
                var mini = Int.MAX_VALUE
                var maxi = 0
                for (f in freq)
                    if (f > 0) {
                        mini = minOf(mini, f)
                        maxi = maxOf(maxi, f)
                    }
                if (mini == maxi)
                    len = maxOf(len, j - i + 1)
            }
        }
        return len
    }
}