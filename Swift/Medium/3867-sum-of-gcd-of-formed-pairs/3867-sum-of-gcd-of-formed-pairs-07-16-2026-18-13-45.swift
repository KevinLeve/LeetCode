class Solution {
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let t = a % b
            a = b
            b = t
        }
        return a
    }

    func gcdSum(_ nums: [Int]) -> Int {
        var prefix = [Int]()
        var mx = 0

        for x in nums {
            mx = max(mx, x)
            prefix.append(gcd(x, mx))
        }

        prefix.sort()

        var ans = 0
        var l = 0
        var r = prefix.count - 1

        while l < r {
            ans += gcd(prefix[l], prefix[r])
            l += 1
            r -= 1
        }

        return ans
    }
}