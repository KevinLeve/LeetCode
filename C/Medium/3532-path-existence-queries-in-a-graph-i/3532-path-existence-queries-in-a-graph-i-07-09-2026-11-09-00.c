#include <stdbool.h>
#include <stdlib.h>

bool* pathExistenceQueries(int n, int* nums, int numsSize, int maxDiff,
                           int** queries, int queriesSize,
                           int* queriesColSize, int* returnSize) {

    *returnSize = queriesSize;
    bool* queryResult = (bool*)calloc(queriesSize, sizeof(bool));

    int prevNum = nums[0];
    nums[0] = 0;

    for (int i = 1; i < numsSize; i++) {
        if (nums[i] - prevNum <= maxDiff) {
            prevNum = nums[i];
            nums[i] = nums[i - 1] + 1;
        } else {
            prevNum = nums[i];
            nums[i] = 0;
        }
    }

    for (int i = 0; i < queriesSize; i++) {
        int u = queries[i][0];
        int v = queries[i][1];

        int distance = abs(u - v);
        int maxIndex = (u > v) ? u : v;

        if (distance <= nums[maxIndex]) {
            queryResult[i] = true;
        }
    }

    return queryResult;
}