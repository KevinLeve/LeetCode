class Solution {

    function gcd($a, $b) {
        while ($b != 0) {
            $t = $a % $b;
            $a = $b;
            $b = $t;
        }
        return $a;
    }

    function gcdSum($nums) {
        $prefix = [];
        $mx = 0;

        foreach ($nums as $x) {
            $mx = max($mx, $x);
            $prefix[] = $this->gcd($x, $mx);
        }

        sort($prefix);

        $ans = 0;
        $l = 0;
        $r = count($prefix) - 1;

        while ($l < $r) {
            $ans += $this->gcd($prefix[$l], $prefix[$r]);
            $l++;
            $r--;
        }

        return $ans;
    }
}