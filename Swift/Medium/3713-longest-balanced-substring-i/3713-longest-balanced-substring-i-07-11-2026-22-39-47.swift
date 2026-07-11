class Solution {
    func longestBalanced(_ s: String) -> Int {
        let chars = Array(s)
        var len = 0
        for i in 0..<chars.count {
            var freq = Array(repeating: 0, count: 26)
            for j in i..<chars.count {
                freq[Int(chars[j].asciiValue! - 97)] += 1
                let vals = freq.filter { $0 > 0 }
                if let minv = vals.min(), let maxv = vals.max(), minv == maxv {
                    len = max(len, j - i + 1)
                }
            }
        }
        return len
    }
}