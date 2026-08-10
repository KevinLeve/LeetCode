class Solution {

    /**
     * @param Integer $n
     * @return Boolean
     */
    function winnerSquareGame($n) {
        $dp = array_fill(0, $n + 1, false);

        for ($i = 1; $i <= $n; $i++) {
            for ($j = 1; $j * $j <= $i; $j++) {
                if (!$dp[$i - $j * $j]) {
                    $dp[$i] = true;
                    break;
                }
            }
        }

        return $dp[$n];
    }
}