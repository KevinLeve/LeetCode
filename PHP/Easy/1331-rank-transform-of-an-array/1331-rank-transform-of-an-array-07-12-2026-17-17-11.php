class Solution {
    function arrayRankTransform($arr) {
        $n = count($arr);

        // Create a copy of the original array
        $tempArr = $arr;

        // Sort the original array
        sort($arr);

        // Create an associative array (hashmap) to store ranks
        $map = [];
        $index = 1;
        foreach ($arr as $num) {
            if (!array_key_exists($num, $map)) {
                $map[$num] = $index++;
            }
        }

        // Replace elements in the copied array with their rank
        $result = [];
        foreach ($tempArr as $num) {
            $result[] = $map[$num];
        }

        return $result;
    }
}