class Solution {

    /**
     * @param String $s
     * @return String
     */
    function smallestPalindrome($s) {
        $cnt = array_fill(0, 26, 0);

        for ($i = 0; $i < strlen($s); $i++) {
            $cnt[ord($s[$i]) - ord('a')]++;
        }

        $left = "";
        $mid = "";

        for ($i = 0; $i < 26; $i++) {
            $left .= str_repeat(chr($i + ord('a')), intdiv($cnt[$i], 2));

            if ($cnt[$i] % 2 == 1) {
                $mid = chr($i + ord('a'));
            }
        }

        return $left . $mid . strrev($left);
    }
}