/**
 * @param {string} s
 * @return {number}
 */
var longestBalanced = function(s) {

    const n = s.length;
    const base = "a".charCodeAt(0);
    let ans = 0;

    for (let l = 0; l < n; l++) {
        const freq = new Int16Array(26);
        // cntFreq[f] = number of letters that currently have frequency f
        // max possible frequency in a window is n, but we can cap to n-l
        const maxPossible = n - l;
        const cntFreq = new Int16Array(maxPossible + 1);
        let minF = Infinity, maxF = 0;

        for (let r = l; r < n; r++) {
            const idx = s[r].charCodeAt(0) - base;
            const old = freq[idx];
            const nw = old + 1;
            freq[idx] = nw;

            if (old > 0) cntFreq[old]--;
            cntFreq[nw]++;

            // we update maxF
            if (nw > maxF) maxF = nw;

            // we update minF
            if (old === 0) {
                // new distinct char with freq 1
                if (minF > 1) minF = 1;
            } else {
                // if old was minF and its count dropped to 0, advance minF
                if (old === minF && cntFreq[old] === 0) {
                    // we find next non-zero freq (small loop but only moves upward)
                    let f = old + 1;
                    while (f <= maxPossible && cntFreq[f] === 0) f++;
                    minF = (f <= maxPossible) ? f : Infinity;
                }
            }

            // if maxF count became zero, we move it down
            while (maxF > 0 && cntFreq[maxF] === 0) maxF--;

            if (minF === maxF) {
                const len = r - l + 1;
                if (len > ans) ans = len;
            }
        }
    }
    return ans;
};