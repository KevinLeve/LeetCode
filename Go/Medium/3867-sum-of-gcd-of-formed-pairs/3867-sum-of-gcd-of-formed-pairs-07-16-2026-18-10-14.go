func gcd(a, b int) int {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func gcdSum(nums []int) int64 {
	prefix := []int{}
	mx := 0

	for _, x := range nums {
		if x > mx {
			mx = x
		}
		prefix = append(prefix, gcd(x, mx))
	}

	sort.Ints(prefix)

	var ans int64
	l, r := 0, len(prefix)-1

	for l < r {
		ans += int64(gcd(prefix[l], prefix[r]))
		l++
		r--
	}

	return ans
}