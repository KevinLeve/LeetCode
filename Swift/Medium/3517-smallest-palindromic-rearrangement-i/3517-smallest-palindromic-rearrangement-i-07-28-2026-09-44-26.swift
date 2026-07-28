class Solution {
    func smallestPalindrome(_ s: String) -> String {
        var cnt = Array(repeating: 0, count: 26)

        for ch in s {
            let idx = Int(ch.asciiValue! - Character("a").asciiValue!)
            cnt[idx] += 1
        }

        var left = ""
        var mid = ""

        for i in 0..<26 {
            left += String(repeating: Character(UnicodeScalar(i + 97)!), count: cnt[i] / 2)

            if cnt[i] % 2 == 1 {
                mid = String(Character(UnicodeScalar(i + 97)!))
            }
        }

        return left + mid + String(left.reversed())
    }
}