object Solution {
    def gcd(a: Int, b: Int): Int = {
        var x = a
        var y = b
        while (y != 0) {
            val t = x % y
            x = y
            y = t
        }
        x
    }

    def gcdSum(nums: Array[Int]): Long = {
        val prefix = scala.collection.mutable.ArrayBuffer[Int]()
        var mx = 0

        for (x <- nums) {
            mx = math.max(mx, x)
            prefix += gcd(x, mx)
        }

        val arr = prefix.sorted

        var ans = 0L
        var l = 0
        var r = arr.length - 1

        while (l < r) {
            ans += gcd(arr(l), arr(r))
            l += 1
            r -= 1
        }

        ans
    }
}