class Solution {
    func winnerSquareGame(_ n: Int) -> Bool {
        var dp = Array(repeating: false, count: n + 1)

        if n == 0 {
            return false
        }

        for i in 1...n {
            var j = 1

            while j * j <= i {
                if !dp[i - j * j] {
                    dp[i] = true
                    break
                }
                j += 1
            }
        }

        return dp[n]
    }
}