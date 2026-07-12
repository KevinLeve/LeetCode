/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int* arrayRankTransform(int* arr, int arrSize, int* returnSize) {
     int cmp(const void *a, const void *b)
    {
        int x = *(int *)a;
        int y = *(int *)b;

        if (x < y) return -1;
        if (x > y) return 1;
        return 0;
    }

    *returnSize = arrSize;

    if (arrSize == 0)
        return NULL;

    int *sorted = (int *)malloc(arrSize * sizeof(int));
    int *result = (int *)malloc(arrSize * sizeof(int));

    for (int i = 0; i < arrSize; i++)
        sorted[i] = arr[i];

    qsort(sorted, arrSize, sizeof(int), cmp);

    int unique = 1;
    for (int i = 1; i < arrSize; i++) {
        if (sorted[i] != sorted[i - 1])
            sorted[unique++] = sorted[i];
    }

    for (int i = 0; i < arrSize; i++) {
        int left = 0, right = unique - 1;

        while (left <= right) {
            int mid = (left + right) / 2;

            if (sorted[mid] == arr[i]) {
                result[i] = mid + 1;
                break;
            } else if (sorted[mid] < arr[i]) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
    }

    free(sorted);
    return result;
}