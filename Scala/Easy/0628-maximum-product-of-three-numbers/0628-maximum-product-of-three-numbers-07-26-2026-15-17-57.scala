import scala.util.boundary
import scala.util.boundary.break

object Solution {
    def maximumProduct(nums: Array[Int]): Int =
        boundary {
            scala.util.Sorting.quickSort(nums)

            val n = nums.length

            break(
                math.max(
                    nums(n - 1) * nums(n - 2) * nums(n - 3),
                    nums(0) * nums(1) * nums(n - 1)
                )
            )
        }
}