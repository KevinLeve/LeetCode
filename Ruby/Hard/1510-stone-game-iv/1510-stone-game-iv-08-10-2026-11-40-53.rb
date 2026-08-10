# @param {Integer} n
# @return {Boolean}
def winner_square_game(n)
  dp = Array.new(n + 1, false)

  (1..n).each do |i|
    j = 1

    while j * j <= i
      if !dp[i - j * j]
        dp[i] = true
        break
      end

      j += 1
    end
  end

  dp[n]
end