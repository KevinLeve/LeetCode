object Solution {
    def winnerSquareGame(n: Int): Boolean = {
        val dp = Array.fill(n + 1)(false)

        for (i <- 1 to n) {
            var j = 1
            var win = false

            while (j * j <= i && !win) {
                if (!dp(i - j * j)) {
                    win = true
                }
                j += 1
            }

            dp(i) = win
        }

        dp(n)
    }
}