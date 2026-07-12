/**
 * @param {number[]} arr
 * @return {number[]}
 */
var arrayRankTransform = function(arr) {
    const sorted = [...arr];

    sorted.sort((a, b) => a - b);

    const rank = new Map();
    let currentRank = 1;

    for (const num of sorted) {
        if (!rank.has(num)) {
            rank.set(num, currentRank++);
        }
    }

    for (let i = 0; i < arr.length; i++) {
        arr[i] = rank.get(arr[i]);
    }

    return arr;
};