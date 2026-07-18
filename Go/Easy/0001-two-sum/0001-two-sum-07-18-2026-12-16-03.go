package main

func twoSum(nums []int, target int) []int {
	mp := make(map[int]int)

	for i, num := range nums {
		if j, ok := mp[target-num]; ok {
			return []int{j, i}
		}
		mp[num] = i
	}

	return nil
}