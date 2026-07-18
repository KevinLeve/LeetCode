import scala.collection.mutable.HashMap
import scala.util.boundary
import scala.util.boundary.break

object Solution {
    def twoSum(nums: Array[Int], target: Int): Array[Int] =
        boundary {
            val map = HashMap[Int, Int]()

            for (i <- nums.indices) {
                val need = target - nums(i)

                map.get(need) match {
                    case Some(j) => break(Array(j, i))
                    case None    => map(nums(i)) = i
                }
            }

            Array.emptyIntArray
        }
}