var gcdSum = function(nums) {
    const gcd = (a, b) => {
        while (b) {
            [a, b] = [b, a % b];
        }
        return a;
    };

    let mx = 0;
    const prefix = [];

    for (const x of nums) {
        mx = Math.max(mx, x);
        prefix.push(gcd(x, mx));
    }

    prefix.sort((a, b) => a - b);

    let ans = 0;
    let l = 0, r = prefix.length - 1;

    while (l < r) {
        ans += gcd(prefix[l], prefix[r]);
        l++;
        r--;
    }

    return ans;
};