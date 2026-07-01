const dirs = [[1, 0], [0, 1], [-1, 0], [0, -1]];

const maximumSafenessFactor = A => {
    if (A[0][0] || A.at(-1).at(-1)) return 0;
    const n = A.length;
    const q = A.reduce((a, r, i) =>
        (r.forEach((c, j) => c && a.enqueue([i, j])), a), new Queue());

    while (q.size()) {
        const [i, j] = q.dequeue();
        const d = A[i][j];

        for (const [dx, dy] of dirs) {
            const x = i + dx;
            const y = j + dy;

            if (A[x]?.[y] === 0) {
                A[x][y] = d + 1;
                q.enqueue([x, y]);
            }
        }
    }

    const pq = new MaxPriorityQueue({ compare: ([a], [b]) => b - a });
    pq.enqueue([A[0][0], 0, 0]);

    while (pq.size()) {
        const [sf, i, j] = pq.dequeue();

        if (i === n - 1 && j === n - 1)
            return sf - 1;

        for (const [dx, dy] of dirs) {
            const x = i + dx;
            const y = j + dy;

            if (A[x]?.[y] > 0) {
                pq.enqueue([Math.min(sf, A[x][y]), x, y]);
                A[x][y] = -A[x][y];
            }
        }
    }

    return A[n - 1][n - 1] - 1;
};