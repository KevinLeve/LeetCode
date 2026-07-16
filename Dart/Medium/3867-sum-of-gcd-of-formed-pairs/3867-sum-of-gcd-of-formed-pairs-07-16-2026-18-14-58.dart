class Solution {
  int gcd(int a, int b) {
    while (b != 0) {
      int t = a % b;
      a = b;
      b = t;
    }
    return a;
  }

  int gcdSum(List<int> nums) {
    List<int> prefix = [];
    int mx = 0;

    for (int x in nums) {
      if (x > mx) mx = x;
      prefix.add(gcd(x, mx));
    }

    prefix.sort();

    int ans = 0;
    int l = 0, r = prefix.length - 1;

    while (l < r) {
      ans += gcd(prefix[l], prefix[r]);
      l++;
      r--;
    }

    return ans;
  }
}