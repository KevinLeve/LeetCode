class Solution {

    /**
     * @param Integer $low
     * @param Integer $high
     * @return Integer[]
     */
    function sequentialDigits($low, $high) {
        $queue = range(1, 9);
        $jak = [];

        while (count($queue) > 0) {
            $num = array_shift($queue);
            if ($low <= $num && $num <= $high) {
                array_push($jak, $num);
            }
            $lastDigit = $num % 10;
            if ($lastDigit < 9) {
                array_push($queue, $num * 10 + $lastDigit + 1);
            }
        }

        return $jak;
    }
}