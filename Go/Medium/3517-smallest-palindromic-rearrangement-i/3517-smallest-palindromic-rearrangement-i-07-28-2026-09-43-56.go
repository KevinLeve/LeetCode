func smallestPalindrome(s string) string {
	cnt := make([]int, 26)

	for _, c := range s {
		cnt[c-'a']++
	}

	left := make([]byte, 0)
	var mid byte

	for i := 0; i < 26; i++ {
		for j := 0; j < cnt[i]/2; j++ {
			left = append(left, byte('a'+i))
		}

		if cnt[i]%2 == 1 {
			mid = byte('a' + i)
		}
	}

	ans := make([]byte, 0, len(s))
	ans = append(ans, left...)

	if mid != 0 {
		ans = append(ans, mid)
	}

	for i := len(left) - 1; i >= 0; i-- {
		ans = append(ans, left[i])
	}

	return string(ans)
}