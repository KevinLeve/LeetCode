impl Solution {
    fn gcd(mut a: i32, mut b: i32) -> i32 {
        while b != 0 {
            let t = a % b;
            a = b;
            b = t;
        }
        a
    }

    pub fn gcd_sum(nums: Vec<i32>) -> i64 {
        let mut prefix = Vec::new();
        let mut mx = 0;

        for &x in nums.iter() {
            mx = mx.max(x);
            prefix.push(Self::gcd(x, mx));
        }

        prefix.sort();

        let mut ans = 0i64;
        let mut l = 0usize;
        let mut r = prefix.len() - 1;

        while l < r {
            ans += Self::gcd(prefix[l], prefix[r]) as i64;
            l += 1;
            r -= 1;
        }

        ans
    }
}