impl Solution {
    pub fn sequential_digits(low: i32, high: i32) -> Vec<i32> {

        let mut ans = Vec::new();

        for i in 1..10 {

            let mut n = i;
            for d in (i+1)..10 {

                n *= 10;
                n += d;
                
                if n < low {
                    continue
                }

                // if n is too big every number after in this loop will be out otside the range
                if n > high {
                    break
                }

                // if n reached this line, then it is inside the range
                ans.push(n);
            }
        }

        ans.sort();
        ans
    }
}