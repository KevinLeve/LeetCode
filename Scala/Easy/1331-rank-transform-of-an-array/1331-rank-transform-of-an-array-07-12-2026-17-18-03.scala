object Solution {
    def arrayRankTransform(arr: Array[Int]): Array[Int] = {
    // Create a sorted array of unique elements
    val sortedUnique = arr.distinct.sorted

    // Map each element to its rank (starting from 1)
    val rankMap = sortedUnique.zipWithIndex.map {
      case (num, index) => num -> (index + 1)
    }.toMap

    // Replace each element with its rank
    arr.map(rankMap)
    }
}