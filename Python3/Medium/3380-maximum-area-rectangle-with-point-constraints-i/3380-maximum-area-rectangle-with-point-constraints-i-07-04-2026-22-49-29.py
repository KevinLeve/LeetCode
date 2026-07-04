class Solution:
    def maxRectangleArea(self, points):
        n, max_area = len(points), float("-inf")

        if n < 4:
            return 0

        """
        [(x1,y1),(x2,y2),(x3,y3),(x4,y4)]
        """

        def function(nums):
            nums.sort(key = lambda x: (x[0],x[1]))

            x1,y1 = nums[0]
            x2,y2 = nums[1]
            x3,y3 = nums[2]
            x4,y4 = nums[3]

            if x1 != x2 or x3 != x4 or y1 != y3 or y2 != y4 or x3-x1 != x4-x2 or y2-y1 != y4-y3:
                return -1 

            for i,j in points:
                if (i,j) in [(x1,y1),(x2,y2),(x3,y3),(x4,y4)]:
                    continue 
                else:
                    if x1 <= i <= x3 and y1 <= j <= y2:
                        return -1

            return (x3-x1)*(y2-y1)

        for nums in combinations(points,4):
            max_area = max(max_area,function(list(nums)))

        return max_area 