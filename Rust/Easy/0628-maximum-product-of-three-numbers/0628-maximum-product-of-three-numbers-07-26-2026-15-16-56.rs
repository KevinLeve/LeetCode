impl Solution {
    pub fn maximum_product(mut nums: Vec<i32>) -> i32 {
        nums.sort();

        let n = nums.len();

        std::cmp::max(
            nums[n - 1] * nums[n - 2] * nums[n - 3],
            nums[0] * nums[1] * nums[n - 1],
        )
    }
}