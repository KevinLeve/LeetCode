class Solution {
    fun smallestPalindrome(s: String): String {
        val cnt = IntArray(26)

        for (c in s)
            cnt[c - 'a']++

        val left = StringBuilder()
        var mid = ""

        for (i in 0 until 26) {
            repeat(cnt[i] / 2) {
                left.append(('a'.code + i).toChar())
            }

            if (cnt[i] % 2 == 1)
                mid = ('a'.code + i).toChar().toString()
        }

        val right = left.toString().reversed()

        return left.toString() + mid + right
    }
}