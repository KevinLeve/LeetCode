object Solution {
  def sequentialDigits(low: Int, high: Int): List[Int] = {
    {
      for {
        length <- low.toString.length to high.toString.length
        start <- 0 to 8
      } yield {
        if (start + length <= 9) "123456789".substring(start, start + length).toInt
        else -1
      }
    }.filter(x => x <= high && x >= low).toList
  }
}