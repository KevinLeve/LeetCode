class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};

    for (int i = 0; i < nums.length; i++) {
      int need = target - nums[i];

      if (map.containsKey(need)) {
        return [map[need]!, i];
      }

      map[nums[i]] = i;
    }

    return [];
  }
}