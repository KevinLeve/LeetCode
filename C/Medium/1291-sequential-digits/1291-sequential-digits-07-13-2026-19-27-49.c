/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* sequentialDigits(int low, int high, int* returnSize) {
    char digits[] = "123456789";
    int* res = malloc(36 * sizeof(int));
    int size = 0;

    int n = 0;
    int m = 0;

    for (int x = low; x > 0; x /= 10) {
        n++;
    }

    for (int x = high; x > 0; x /= 10) {
        m++;
    }

    for (int length = n; length <= m; length++) {
        for (int start = 0; start < 10 - length; start++) {
            int num = 0;

            for (int i = start; i < start + length; i++) {
                num = num * 10 + (digits[i] - '0');
            }

            if (low <= num && num <= high) {
                res[size++] = num;
            }
        }
    }

    *returnSize = size;
    return res;
}