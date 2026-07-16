#include <stdlib.h>

int gcd(int a, int b) {
    while (b != 0) {
        int t = a % b;
        a = b;
        b = t;
    }
    return a;
}

int cmp(const void *a, const void *b) {
    return (*(int *)a) - (*(int *)b);
}

long long gcdSum(int* nums, int numsSize) {
    int *prefix = (int *)malloc(numsSize * sizeof(int));
    int mx = 0;

    for (int i = 0; i < numsSize; i++) {
        if (nums[i] > mx)
            mx = nums[i];
        prefix[i] = gcd(nums[i], mx);
    }

    qsort(prefix, numsSize, sizeof(int), cmp);

    long long ans = 0;
    int l = 0, r = numsSize - 1;

    while (l < r) {
        ans += gcd(prefix[l], prefix[r]);
        l++;
        r--;
    }

    free(prefix);
    return ans;
}