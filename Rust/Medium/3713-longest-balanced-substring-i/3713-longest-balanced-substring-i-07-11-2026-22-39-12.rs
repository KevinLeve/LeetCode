impl Solution {
    pub fn longest_balanced(s: String) -> i32 {
        let n = s.len();
        let chars: Vec<char> = s.chars().collect();
        let mut len = 0;
        for i in 0..n {
            let mut freq = vec![0; 26];
            for j in i..n {
                freq[chars[j] as usize - 97] += 1;
                let vals: Vec<i32> = freq.iter().cloned().filter(|&x| x > 0).collect();
                let (min, max) = (*vals.iter().min().unwrap(), *vals.iter().max().unwrap());
                if min == max {
                    len = len.max((j - i + 1) as i32);
                }
            }
        }
        len
    }
}