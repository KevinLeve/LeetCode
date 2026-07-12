class Solution {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        if arr.isEmpty { return [] }
        
        let sortedUnique = Array(Set(arr)).sorted()
        
        var rankMap = [Int: Int]()
        for (index, val) in sortedUnique.enumerated() {
            rankMap[val] = index + 1
        }
        
        return arr.map { rankMap[$0]! }
    }
}