function smallestPalindrome(s: string): string {
    const cnt = new Array(26).fill(0);

    for (const c of s)
        cnt[c.charCodeAt(0) - 97]++;

    let left = "";
    let mid = "";

    for (let i = 0; i < 26; i++) {
        left += String.fromCharCode(97 + i).repeat(Math.floor(cnt[i] / 2));

        if (cnt[i] % 2)
            mid = String.fromCharCode(97 + i);
    }

    return left + mid + left.split("").reverse().join("");
}