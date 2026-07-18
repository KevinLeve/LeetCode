class Solution {

    /**
     * @param Integer[] $nums
     * @param Integer $target
     * @return Integer[]
     */
    function twoSum($nums, $target) {
        $map = [];

        foreach ($nums as $i => $num) {
            $need = $target - $num;

            if (isset($map[$need])) {
                return [$map[$need], $i];
            }

            $map[$num] = $i;
        }

        return [];
    }
}