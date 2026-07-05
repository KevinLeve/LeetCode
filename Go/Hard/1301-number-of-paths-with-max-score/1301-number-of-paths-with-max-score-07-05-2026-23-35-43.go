func pathsWithMaxScore(board []string) []int {
	const MOD = 1000000007
	n := len(board)

	dp := make([][]int, n)
	ways := make([][]int, n)

	for i := range dp {
		dp[i] = make([]int, n)
		ways[i] = make([]int, n)
		for j := range dp[i] {
			dp[i][j] = -1
		}
	}

	dp[n-1][n-1] = 0
	ways[n-1][n-1] = 1

	dir := [][2]int{{1, 0}, {0, 1}, {1, 1}}

	for i := n - 1; i >= 0; i-- {
		for j := n - 1; j >= 0; j-- {
			if board[i][j] == 'X' || (i == n-1 && j == n-1) {
				continue
			}

			best := -1
			cnt := 0

			for _, d := range dir {
				x, y := i+d[0], j+d[1]

				if x >= n || y >= n || dp[x][y] == -1 {
					continue
				}

				if dp[x][y] > best {
					best = dp[x][y]
					cnt = ways[x][y]
				} else if dp[x][y] == best {
					cnt = (cnt + ways[x][y]) % MOD
				}
			}

			if best == -1 {
				continue
			}

			val := 0
			if board[i][j] >= '0' && board[i][j] <= '9' {
				val = int(board[i][j] - '0')
			}

			dp[i][j] = best + val
			ways[i][j] = cnt
		}
	}

	if dp[0][0] == -1 {
		return []int{0, 0}
	}

	return []int{dp[0][0], ways[0][0]}
}