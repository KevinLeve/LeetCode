class Solution {
  int maximumProduct(List<int> nums) {
    nums.sort();

    int n = nums.length;

    return [
      nums[n - 1] * nums[n - 2] * nums[n - 3],
      nums[0] * nums[1] * nums[n - 1]
    ].reduce((a, b) => a > b ? a : b);
  }
}