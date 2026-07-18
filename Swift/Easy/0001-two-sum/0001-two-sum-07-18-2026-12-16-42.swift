class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()

        for (i, num) in nums.enumerated() {
            let need = target - num

            if let j = map[need] {
                return [j, i]
            }

            map[num] = i
        }

        return []
    }
}