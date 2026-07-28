#include <stdlib.h>
#include <string.h>

char* smallestPalindrome(char* s) {
    int cnt[26] = {0};
    int n = strlen(s);

    for (int i = 0; i < n; i++)
        cnt[s[i] - 'a']++;

    char* ans = (char*)malloc((n + 1) * sizeof(char));
    int left = 0;
    int right = n - 1;
    char mid = '\0';

    for (int i = 0; i < 26; i++) {
        while (cnt[i] >= 2) {
            ans[left++] = 'a' + i;
            ans[right--] = 'a' + i;
            cnt[i] -= 2;
        }

        if (cnt[i] == 1)
            mid = 'a' + i;
    }

    if (mid)
        ans[left] = mid;

    ans[n] = '\0';
    return ans;
}