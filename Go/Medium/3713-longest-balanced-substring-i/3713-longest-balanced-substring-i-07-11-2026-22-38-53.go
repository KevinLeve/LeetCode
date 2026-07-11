func longestBalanced(s string) int {
    n := len(s)
    res := 0
    for i := 0; i < n; i++ {
        freq := make([]int, 26)
        for j := i; j < n; j++ {
            freq[s[j]-'a']++
            mini, maxi := 1<<31-1, 0
            for _, f := range freq {
                if f > 0 {
                    if f < mini { mini = f }
                    if f > maxi { maxi = f }
                }
            }
            if mini == maxi && j-i+1 > res {
                res = j - i + 1
            }
        }
    }
    return res
}