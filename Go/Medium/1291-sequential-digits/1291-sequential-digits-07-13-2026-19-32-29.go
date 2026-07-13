func sequentialDigits(low int, high int) []int {

	ans := []int{}

	for length := 2; length <= 9; length++ {

		for start := 1; start+length-1 <= 9; start++ {

			num := 0
			digit := start

			// Build the sequential number.
			for k := 0; k < length; k++ {
				num = num*10 + digit
				digit++
			}

			if num >= low && num <= high {
				ans = append(ans, num)
			}
		}
	}

	return ans
}