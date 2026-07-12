func arrayRankTransform(arr []int) []int {
	sorted := append([]int(nil), arr...)

	sort.Ints(sorted)

	rank := make(map[int]int)
	currentRank := 1

	for _, num := range sorted {
		if _, exists := rank[num]; !exists {
			rank[num] = currentRank
			currentRank++
		}
	}

	for i, num := range arr {
		arr[i] = rank[num]
	}

	return arr
}