def gcd_sum(nums)
  prefix = []
  mx = 0

  nums.each do |x|
    mx = [mx, x].max
    prefix << x.gcd(mx)
  end

  prefix.sort!

  ans = 0
  l = 0
  r = prefix.size - 1

  while l < r
    ans += prefix[l].gcd(prefix[r])
    l += 1
    r -= 1
  end

  ans
end