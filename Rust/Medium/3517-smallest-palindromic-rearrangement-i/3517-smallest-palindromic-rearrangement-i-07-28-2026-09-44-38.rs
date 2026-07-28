impl Solution {
    pub fn smallest_palindrome(s: String) -> String {
        let mut cnt = vec![0; 26];

        for b in s.bytes() {
            cnt[(b - b'a') as usize] += 1;
        }

        let mut left = String::new();
        let mut mid = String::new();

        for i in 0..26 {
            for _ in 0..cnt[i] / 2 {
                left.push((b'a' + i as u8) as char);
            }

            if cnt[i] % 2 == 1 {
                mid.push((b'a' + i as u8) as char);
            }
        }

        let right: String = left.chars().rev().collect();

        format!("{}{}{}", left, mid, right)
    }
}