object Solution {
    def smallestPalindrome(s: String): String = {
        val cnt = Array.fill(26)(0)

        s.foreach(c => cnt(c - 'a') += 1)

        val left = new StringBuilder
        var mid = ""

        for (i <- 0 until 26) {
            left.append(((i + 'a').toChar).toString * (cnt(i) / 2))

            if ((cnt(i) & 1) == 1)
                mid = ((i + 'a').toChar).toString
        }

        left.toString + mid + left.reverse.toString
    }
}