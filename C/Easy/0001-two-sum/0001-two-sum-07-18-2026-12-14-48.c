#include <stdlib.h>

typedef struct {
    int key;
    int value;
    int used;
} Entry;

#define SIZE 20011

int hash(int x) {
    unsigned int h = (unsigned int)x;
    return h % SIZE;
}

int* twoSum(int* nums, int numsSize, int target, int* returnSize) {
    Entry table[SIZE] = {0};

    for (int i = 0; i < numsSize; i++) {
        int need = target - nums[i];
        int idx = hash(need);

        while (table[idx].used) {
            if (table[idx].key == need) {
                int* ans = (int*)malloc(2 * sizeof(int));
                ans[0] = table[idx].value;
                ans[1] = i;
                *returnSize = 2;
                return ans;
            }
            idx = (idx + 1) % SIZE;
        }

        idx = hash(nums[i]);
        while (table[idx].used)
            idx = (idx + 1) % SIZE;

        table[idx].used = 1;
        table[idx].key = nums[i];
        table[idx].value = i;
    }

    *returnSize = 0;
    return NULL;
}