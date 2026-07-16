class Solution {
public:
    long long gcdSum(vector<int>& nums) {
        vector<int> prefix;
        int mx = 0;

        for (int x : nums) {
            mx = max(mx, x);
            prefix.push_back(gcd(x, mx));
        }

        sort(prefix.begin(), prefix.end());

        long long ans = 0;
        int i = 0, j = prefix.size() - 1;
        while (i < j) {
            ans += gcd(prefix[i], prefix[j]);
            i++;
            j--;
        }

        return ans;
    }
};