impl Solution {
    pub fn array_rank_transform(arr: Vec<i32>) -> Vec<i32> {
        let n = arr.len();
        if arr.is_empty() { return arr; }

        let mut arr: Vec<(i32, usize)> = arr.iter().enumerate().map(|(i, &x)| (x, i) ).collect();

        arr.sort();

        let mut result = vec![0; n];
        let mut f = arr[0].0; // focus element
        let mut r = 1;
        for k in 0..n {
            let (x, i) = arr[k];
            if x == f {
                // keep the current focus element 'f'
            } else {
                r += 1;
            }

            f = x;

            result[i] = r;
        }

        result
    }
}